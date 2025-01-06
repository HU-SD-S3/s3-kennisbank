# Working with Standard Events

## Introduction

## StandardEvents component

Lets start by creating a new component called `LitEvents`, which we save as `lit-events.js` in the `src/view/components` folder.

```javascript
/* eslint-disable max-lines-per-function */
import { LitElement, html, css } from "lit";

export class LitEvents extends LitElement {
  static styles = css`
    #keylistener {
      width: 10rem;
      height: 10rem;
      background-color: lightgray;
      margin: 1rem;
      padding: 0.5rem;
      text-align: center;
      display: grid;
      place-items: center;
    }

    form {
      display: grid;
      padding: 1rem;
      border: 1px solid #ccc;
      border-radius: 0.5rem;
      background-color: #f9f9f9;
    }

    fieldset {
      border: solid 1px #ccc;
      padding: 1rem;
      margin: 0;
    }

    label {
      display: grid;
      font-weight: bold;
    }

    input,
    select {
      border: 1px solid #ccc;
      border-radius: 0.25rem;
      margin: 0.25rem 0 1rem 0;
      padding: 0.25rem;
    }

    .phone-type {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 1rem;
    }

    .gender-options {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(100px, 1fr));
      gap: 1rem;
    }

    .gender-options label {
      display: grid;
      grid-template-columns: auto 1fr;
      align-items: center;
      padding-left: 1rem;
    }

    .gender-options input {
      margin-right: 0.5rem;
    }

    button {
      margin: 0.5rem;
      padding: 0.5rem;
      background-color: lightseagreen;
      border-radius: 0.5rem;
      color: white;
      cursor: pointer;
    }

    button[type="submit"] {
      background-color: lightgreen;
      color: black;
    }
  `;

  ButtonOneHandler(event) {
    console.log("Button clicked");
  }

  ButtonTwoHandler(event) {
    console.log("Button clicked too");
  }

  inputHandler(event) {
    console.log("Input value: ", event.target.value);
  }

  submitHandler(event) {
    event.preventDefault();
    console.log("Form submitted");
    const formData = new FormData(event.target);
    const data = Object.fromEntries(formData);
    console.log(data);
  }

  focusHandler(event) {
    console.log("Element focused");
  }

  keydownHandler(event) {
    console.log(`Key ${event.key} pressed`);
  }

  render() {
    return html`
      <h1>Lit Events</h1>
      <form @submit=${this.submitHandler}>
        <label for="student-name">Name:</label>
        <input
          type="text"
          id="student-name"
          name="student-name"
          @input=${this.inputHandler}
        />

        <div class="phone-type">
          <label for="phone">Phone:</label>
          <input
            type="tel"
            id="phone"
            name="phone"
            @input=${this.inputHandler}
          />
          <label for="phone-type">Phone Type:</label>
          <select
            id="phone-type"
            name="phone-type"
            @change=${this.inputHandler}
          >
            <option value="home">Home</option>
            <option value="work">Work</option>
          </select>
        </div>

        <fieldset>
          <legend>Gender</legend>
          <div class="gender-options">
            <label for="male"
              ><input type="radio" id="male" name="gender" value="m"/>Male</label
            >
            <label for="female"
              ><input type="radio" id="female" name="gender" value="f"/>Female</label
            >
            <label for="non-binary"
              ><input
                type="radio"
                id="non-binary"
                name="gender"
                value="n"
              />Non-binary</label
            >
            <label for="other"
              ><input type="radio" id="other" name="gender" value="o"/>Other</label
            >
            <label for="prefer-not-to-say"
              ><input type="radio" id="prefer-not-to-say" name="gender" value="-"/>Prefer
              not to say</label
            >
          </div>
        </fieldset>

        <button type="submit">Submit</button>
      </form>

      <div
        id="keylistener"
        tabindex="0"
        @keydown=${this.keydownHandler}
        @focus=${this.focusHandler}
      >
        Use the tab key to focus on this element and then press any key.
      </div>

      <button @click=${this.ButtonOneHandler}>Click me</button>
      <button @click=${this.ButtonTwoHandler}>Click me too</button>
    `;
  }
}

customElements.define("lit-events", LitEvents);
```

We also need to import the `LitEvents` component in the `home-page.js` file, that is located in the `src/view/pages` folder.

```javascript
import '../components/lit-events';
```

And finally, we need to make use of the component in the `index.html` file.

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <link rel="stylesheet" href="./global-styles.css" />
    
    <title>Lit Web Components</title>

    <script type="module" src="./src/view/pages/home-page.js"></script>
  </head>
  <body>
    <lit-events></lit-events>
  </body>
</html>
```

## Button click event

## Input change event

## Form submit event

---

## Sources

* [MDN - Element Events](https://developer.mozilla.org/en-US/docs/Web/API/Element#events)

---

:house: [Home](../README.md) | :arrow_backward: [Lit Attributes](./lit-attributes.md) | :arrow_up: [Learning Stories](./README.md) | []() :arrow_forward:
