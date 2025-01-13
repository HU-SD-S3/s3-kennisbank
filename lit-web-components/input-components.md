# Input Components

## Introduction


## The Problem

Let's first build a simple component that gives us an Evaluation form to demonstrate the problem.
Create a new file `evaluation-form.js` in the `src/view/components` folder and add the following code:

```javascript
import { LitElement, html, css } from "lit";

export class EvaluationForm extends LitElement {
  constructor() {
    super();
    this.data = {};
  }

  static styles = css`
    form {
      display: grid;
      grid-template-columns: 1fr;
      gap: 1rem;
      margin: 1rem;
      justify-items: center;
      align-items: center;
    }

    fieldset {
      border: 1px solid gray;
      display: grid;
      width: 100%;
    }

    .cursist-info {
      grid-template-columns: auto 1fr;
    }

    .evaluation-topics {
      grid-template-columns: auto auto 1fr;
      align-items: center;
    }

    legend {
      font-weight: bold;
    }

    label {
      display: block;
      margin: 0.5rem;
      padding: 0.5rem;
    }

    input {
      margin: 0.5rem;
      padding: 0.5rem;
    }

    input[type="number"] {
      width: 2rem;
      font-size: 1.5rem;
    }

    input[type="range"] {
      width: 50%;
    }

    datalist {
      display: flex;
      margin: 0 0.5rem;
      padding: 0 0.5rem;
      justify-content: space-between;
      width: 50%;
    }

    button {
      margin: 0rem 1rem;
      padding: 0.5rem 2rem;
      background-color: green;
      color: white;
      border: none;
      border-radius: 0.5rem;
      font-size: 1.5rem;
    }
  `;

  submitHandler(event) {
    event.preventDefault();
    const formData = new FormData(event.target);
    this.data = Object.fromEntries(formData.entries());
    console.log(this.data);
  }

  render() {
    return html`
      <h1>Evaluation Form</h1>
      <form @submit=${this.submitHandler}>
        <fieldset class="cursist-info">
          <legend>Cursist Information</legend>
          <label for="name">Name:</label>
          <input type="text" id="name" name="name" required />

          <label for="address">Address:</label>
          <input type="text" id="address" name="address" required />

          <label for="phone">Phone:</label>
          <input type="tel" id="phone" name="phone" required />

          <label for="email">Email:</label>
          <input type="email" id="email" name="email" required />
        </fieldset>

        <fieldset class="evaluation-topics">
          <legend>Topics</legend>
          <label for="html-value">HTML:</label>
          <input
            type="number"
            id="html-value"
            name="html"
            min="0"
            max="10"
            required
          />
          <div>
            <input
              type="range"
              id="html-slider"
              name="html"
              list="values"
              aria-label="html-slider"
              min="0"
              max="10"
              required
            />
            <datalist id="values">
              <option value="0" label="0"></option>
              <option value="1" label="1"></option>
              <option value="2" label="2"></option>
              <option value="3" label="3"></option>
              <option value="4" label="4"></option>
              <option value="5" label="5"></option>
              <option value="6" label="6"></option>
              <option value="7" label="7"></option>
              <option value="8" label="8"></option>
              <option value="9" label="9"></option>
              <option value="10" label="10"></option>
            </datalist>
          </div>

          <label for="css-value">CSS:</label>
          <input
            type="number"
            id="css-value"
            name="css"
            min="0"
            max="10"
            required
          />
          <div>
            <input
              type="range"
              id="css-slider"
              name="css"
              list="values"
              aria-label="css-slider"
              min="0"
              max="10"
              required
            />
            <datalist id="values">
              <option value="0" label="0"></option>
              <option value="1" label="1"></option>
              <option value="2" label="2"></option>
              <option value="3" label="3"></option>
              <option value="4" label="4"></option>
              <option value="5" label="5"></option>
              <option value="6" label="6"></option>
              <option value="7" label="7"></option>
              <option value="8" label="8"></option>
              <option value="9" label="9"></option>
              <option value="10" label="10"></option>
            </datalist>
          </div>

          <label for="js-value">JavaScript:</label>
          <input
            type="number"
            id="js-value"
            name="js"
            min="0"
            max="10"
            required
          />
          <div>
            <input
              type="range"
              id="js-slider"
              name="js"
              list="values"
              aria-label="js-slider"
              min="0"
              max="10"
              required
            />
            <datalist id="values">
              <option value="0" label="0"></option>
              <option value="1" label="1"></option>
              <option value="2" label="2"></option>
              <option value="3" label="3"></option>
              <option value="4" label="4"></option>
              <option value="5" label="5"></option>
              <option value="6" label="6"></option>
              <option value="7" label="7"></option>
              <option value="8" label="8"></option>
              <option value="9" label="9"></option>
              <option value="10" label="10"></option>
            </datalist>
          </div>

        </fieldset>

        <button type="submit">Save</button>
      </form>
    `;
  }
}

customElements.define("evaluation-form", EvaluationForm);
```

Import the component in the `home-page.js` file of the `src/view/pages` folder.

```javascript
import '../components/evaluation-form';
```

And adapt the `index.html` file to use the `evaluation-form` component.

```html
...
  <body>
    <main>
      <evaluation-form></evaluation-form>
    </main>
  </body>
...
```

If you run the application you should get a form that asks for some information of the cursist (to keep the evaluation private :wink") and some topics to evaluate. That the form is not working correctly is something we will fix later.
But for now, we see that the topics are rated using either a number input or a range input. The range input is a bit more user-friendly, but the number input is more precise. But the inputs are not related yet, meaning we can rate the HTML topic with a 4 using the number input and a 7 using the range input. This is not what we want. We want the inputs to be related, so if we change the number input, the range input should change accordingly and vice versa.

Another issue we face is that HTML code for those inputs is basically the same for each topic and takes up a lot of space, causing ESLint to complain about the number of lines in our method.

![number-range-input](./assets/number-range-input.png)

By creating a component that combines the number and range input, we can solve both issues.

## The Number-Range-Input Component

From the `render` method of the `EvaluationForm` component, we can derive that our new component should have the following attributes:

- `label`: The label for the input.
- `name`: The name of the input.
- `min`: The minimum value of the input.
- `max`: The maximum value of the input.
- `required`: Whether the input is required or not.
- `value`: The value of the input.

Let's create a new file `number-range-input.js` in the `src/view/components` folder and add the following code:

```javascript
import { LitElement, html, css } from "lit";

export class NumberRangeInput extends LitElement {
  constructor() {
    super();
    this.value = 0;
  }

  static styles = css`
    :host {
      display: grid;
      grid-template-columns: auto auto 1fr;
      align-items: center;
      width: 100%;
    }

    label {
      display: block;
      margin: 0.5rem;
      padding: 0.5rem;
    }

    input {
      margin: 0.5rem;
      padding: 0.5rem;
    }

    input[type="number"] {
      width: 2rem;
      font-size: 1.5rem;
    }

    input[type="range"] {
      width: 50%;
    }

    datalist {
      display: flex;
      margin: 0 0.5rem;
      padding: 0 0.5rem;
      justify-content: space-between;
      width: 50%;
    }
  `;

  static properties = {
    label: { type: String },
    min: { type: Number },
    max: { type: Number },
    required: { type: Boolean },
    value: { type: Number },
  };

  render() {
    return html`
      <label for="">${this.label}:</label>
      <input type="number" id="" name="" min="${this.min}" max="{this.max}" />
      <div>
        <input
          type="range"
          id=""
          name=""
          list="values"
          aria-label=""
          min="${this.min}"
          max="${this.max}"
          required
        />
        <datalist id="values">
          <option value="0" label="0"></option>
          <option value="1" label="1"></option>
          <option value="2" label="2"></option>
          <option value="3" label="3"></option>
          <option value="4" label="4"></option>
          <option value="5" label="5"></option>
          <option value="6" label="6"></option>
          <option value="7" label="7"></option>
          <option value="8" label="8"></option>
          <option value="9" label="9"></option>
          <option value="10" label="10"></option>
        </datalist>
      </div>
    `;
  }
}

customElements.define("number-range-input", NumberRangeInput);
```


---

## Sources

---

:house: [Home](../README.md) | :arrow_backward: [Inputs and Events](./input-and-events.md) | :arrow_up: [Learning Stories](./README.md) | []() :arrow_forward:
