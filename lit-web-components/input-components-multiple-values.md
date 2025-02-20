# Multiple Value Custom Components

A User Story might require to exend an existing form originated from another User Story. Organising the form in a fieldset for each story, is a good way to keep the form structured and organized.  
Adding fields and/or fieldsets to an existing form results in more line of code for the render method of the component that holds the form fields and eventually might exceed the maximum number of lines ESLint allows in a method. It also makes that logic from different User Stories is mixed up in the same component.  
Creating a custom component for each fieldset is a good way to keep the logic of each User Story separated from each other, and to keep the render method of the component that holds the form fields clean and structured.  
It might also mean that your component that holds the form field, might have to hold multiple values. This is where we run into a problem.

Adding a custom component to a form, that has a render method that holds several input elements, is not as straightforward as it might seem. Those input elements are hidden by the shadow DOM and are not included in the form data when the form is submitted. We solved this issue for a custom input component that holds a single value, but what if we want to create a custom component that holds multiple values?

In this article we will cover the problems we face when creating input components that are meant to be used within a form and how to solve them. We will demonstrate this by refactoring the `Cursist Information` fieldset the `EvaluationForm` component we created in the [Input Components](./input-components.md) article.

## The FieldsetCursistInfo component

Let's start by creating a new file `fieldset-cursist-info.js` in the `src/view/components` folder that has a render method that holds the fieldset for the `Cursist Information` and add the following code:

```javascript
import { LitElement, html, css } from "lit";

export class FieldsetCursistInfo extends LitElement {
  #internals;

  static formAssociated = true;

  static styles = css`
    :host {
      width: 100%;
      justify-items: center;
    }

    fieldset {
      border: 1px solid gray;
      display: grid;
      width: 100%;
    }

    .cursist-info {
      grid-template-columns: auto 1fr;
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

    input:required {
      background-color: lightgoldenrodyellow;
    }

    input:invalid {
      border-color: red;
      border-width: 0.1em;
    }
  `;

  static properties = {
    required: { type: Boolean },
  };

  constructor() {
    super();
    this.#internals = this.attachInternals();

    this.required = false;
  }

  setFieldValue(event) {
    const fieldElement = event.target;
    if (!fieldElement.checkValidity()) {
      fieldElement.reportValidity();
    }
  }

  render() {
    return html`
      <fieldset class="cursist-info">
        <legend>Cursist Information</legend>
        <label for="name">Name:</label>
        <input
          type="text"
          id="name"
          name="name"
          @input=${this.setFieldValue}
          ?required="${this.required}"
        />

        <label for="address">Address:</label>
        <input
          type="text"
          id="address"
          name="address"
          @input=${this.setFieldValue}
          ?required="${this.required}"
        />

        <label for="phone">Phone:</label>
        <input
          type="tel"
          id="phone"
          name="phone"
          @input=${this.setFieldValue}
          ?required="${this.required}"
        />

        <label for="email">Email:</label>
        <input
          type="email"
          id="email"
          name="email"
          @input=${this.setFieldValue}
          ?required="${this.required}"
        />
      </fieldset>
    `;
  }
}

customElements.define("fieldset-cursist-info", FieldsetCursistInfo);
```

As explained in the [single value input custom components](./input-components-single-value.md) article, we need to make sure that the custom element is form-associated and the we need to attach the element internals to the custom element. Which we already did in the code above.

We further added a `required` property to the properties object of the custom element. This property is used to set the `required` attribute of the input elements in the fieldset, in case the required attribute is set by the parent component.
And we also added an event listener to the input elements in the fieldset. This event listener currently only checks if the input element is valid and reports the validity if it is not.

Also let's change the `evaluation-form.js` file in the `src/view/components` folder to use the `FieldsetCursistInfo` component. Add the following code to the file:

```javascript
import { LitElement, html, css } from "lit";
import './fieldset-cursist-info';
import './number-range-input';

...

  render() {
    return html`
      <h1>Evaluation Form</h1>
      <form @submit=${this.submitHandler}>
        <fieldset-cursist-info name="cursistInfo" required></fieldset-cursist-info>
        <fieldset class="evaluation-topics">
          <legend>Topics</legend>
          <number-range-input name="html" label="HTML" min="0" max="10" required></number-range-input>
          <number-range-input name="css" label="CSS" min="0" max="10" required></number-range-input>
          <number-range-input name="js" label="JavaScript" min="0" max="10" required></number-range-input>
        </fieldset>
        <button type="submit">Save</button>
      </form>
    `;
  }

...
```

> [!NOTE]
> Remember to provide a name attribute to the `fieldset-cursist-info` custom element, so that the form data can be submitted correctly.

## The value of the custom component

When we submit a HTML form, the browser collects the data from the input elements in the form and if not prevented sends the data to the server. The data is collected by the browser by looking at the `name` attribute of the input elements and the data itself has to be stored in the `value` attribute of that input elements as a string.

Lit can't change the way the browser collects the data from the input elements in the form, and has to comply with the way HTML forms work.
This means that our custom input component also has to have a single `value` attribute that holds the data of the input element as a string, and that we somehow have to store the different values of the input elements in the fieldset in a single string value.

This means that we also need a `value` property in our custom component, which value is reflected, so that the parent component can access that value. We also need to make sure that that value is initialized in the constructor of our custom component.

```javascript
...
  static properties = {
    required: { type: Boolean },
    value: { type: String, reflect: true },
  };

  constructor() {
    super();
    this.#internals = this.attachInternals();

    this.required = false;
    this.value = "";
  }
...
```

To make sure that the value gets set we let our `setFieldValue` method call a `setFieldsetValue` method that sets the value of the fieldset.

```javascript
  setFieldValue(event) {
    const fieldElement = event.target;
    if (!fieldElement.checkValidity()) {
      fieldElement.reportValidity();
    }
    this.setFieldsetValue();
  }
```

This `setFieldsetValue` method needs some knowledge about the input fields within our custom component. We therefore create a new class property `fieldsetFields` that holds an array of objects with the name of the input field and the input element itself. Since those elements are not available at the `constructor` and the `connectedCallback` lifecycle callback, we initialize this array in the `firstUpdated` lifecycle callback of our custom component.

```javascript
  firstUpdated() {
    this.fieldsetFields = [
      { name: "name", element: this.shadowRoot.querySelector("#name") },
      { name: "address", element: this.shadowRoot.querySelector("#address") },
      { name: "phone", element: this.shadowRoot.querySelector("#phone") },
      { name: "email", element: this.shadowRoot.querySelector("#email") },
    ];

    this.setFieldsetValue();
  }
```

We also call the `setFieldsetValue` method within the `firstUpdated` lifecycle callback to make sure that the value of our custom input component is set when the component is first rendered.

The `setFieldsetValue` method loops over the `fieldsetFields` array and reduces the values of the input elements within our custom input component to a single object. That object then will hold another object for each input field, consisting of the name of the input field as key and the value of the input field as value.
This object is then stringified and set as the value of the custom input component.

Doing so provides that our custom input component fulfills the requirements of a form-associated custom element and that the data of the input elements in the fieldset is stored in a single string value.

```javascript
  setFieldsetValue() {
    const fieldsetObject = this.fieldsetFields.reduce((acc, field) => {
      acc[field.name] = field.element.value;
      return acc;
    }, {});

    this.value = JSON.stringify(fieldsetObject);

    this.#internals.setFormValue(this.value);
    this.setFieldsetValidity();
  }
```

But providing a single value for a custom input component, doesn't mean that the value of the input element is valid. We therefore call the `setFieldsetValidity` method in the last line of our `setFieldsetValue` method.
The task of the `setFieldsetValidity` method is to determine if the input elements within the custom input component are valid and to set the validity of the custom input component accordingly. In case that an input is not valid, the method also sets the validation message and the set the focus to the first invalid input element.

```javascript
  setFieldsetValidity() {
    const isValid = this.fieldsetFields.every((field) =>
      field.element.checkValidity(),
    );
    const firstInvalidField = this.fieldsetFields.find(
      (field) => !field.element.checkValidity(),
    );

    const message = firstInvalidField
      ? firstInvalidField.element.validationMessage
      : "";
    const focus = firstInvalidField
      ? firstInvalidField.element
      : this.shadowRoot.querySelector("fieldset");

    this.#internals.setValidity(
      isValid ? {} : { customError: true },
      message,
      focus,
    );
  }
```

## Processing the value of the custom input component

When the form is submitted, the `submitHandler` method of the `EvaluationForm` component is called.
To prevent the default behavior of the form (sending the data to the server), we call the `preventDefault` method on the event object.

Extracting the data from the form is done by creating a new `FormData` object from the `event.target` (which is the form element). This `formData` object holds key value pairs of the input elements in the form. We can extract the data from the `formData` object by calling the `entries` method on the `formData` object and converting the result to an object by calling the `Object.fromEntries` method on the result.

```javascript
  submitHandler(event) {
    event.preventDefault();
    
    const formData = new FormData(event.target);
    this.data = Object.fromEntries(formData.entries());
    console.log(this.data);
  }
```

If we take a look at console of the resulting data, we see a JSON object, that holds an object for the `cursistInfo` fieldset. The value of that object is a stringified JSON object that holds the values of the input elements in the `Cursist Information` fieldset.
To clean this up, before we proceed with processing the data, we need to parse the value of the `cursistInfo` fieldset.

```javascript
  submitHandler(event) {
    event.preventDefault();
    
    const formData = new FormData(event.target);
    this.data = Object.fromEntries(formData.entries());
    this.data.cursistInfo = JSON.parse(this.data.cursistInfo);
    console.log(this.data);
  }
```

This concludes the refactoring of the `Cursist Information` fieldset to a custom input component that holds multiple values.

---

## Sources

- MDN - [ElementInternals](https://developer.mozilla.org/en-US/docs/Web/API/ElementInternals)

---

:house: [Home](../README.md) | :arrow_backward: [Inputs and Events](./input-and-events.md) | :arrow_up: [Learning Stories](./README.md) | []() :arrow_forward:
