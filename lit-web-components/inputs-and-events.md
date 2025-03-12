# Inputs and Events

To have some kind of interaction with a site via different types of inputs and events is a common thing in web
development. In this article we will show you how to work with standard inputs and extract their values as well as how
to work in Lit with standard events inside of a web component.

> [!NOTE]
>
> 1. Custom events will not be covered in this article. See the
>    [communication between components](./communication-between-components.md) (even if you can also use custom events
>    to communicate within a component) article for more information.
> 2. Custom input components that you can use within a form will be covered in the
>    [Input Components](./input-components.md) article.

## StandardEvents component

Lets start by creating a new component called `LitEvents`, which holds the css for items we will add to the render
method and save it as `lit-events.js` in the `src/view/components` folder.

```javascript
/* eslint-disable max-lines-per-function */
import { LitElement, html, css } from 'lit';

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

    button[type='submit'] {
      background-color: lightgreen;
      color: black;
    }
  `;

  render() {
    return html` <h1>Lit Events</h1> `;
  }
}

customElements.define('lit-events', LitEvents);
```

> [!NOTE]
>
> As you can see in the code we disabled the eslint rule `max-lines-per-function` for this file. This is something you
> should avoid in your own code. But for this example we did it to keep the code in one file.

We also need to import the `LitEvents` component in the `home-page.js` file, that is located in the `src/view/pages`
folder.

```javascript
import '../components/lit-events';
```

And finally, we need to make use of the component in the `index.html` file.

```html
<!DOCTYPE html>
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

We will now add some buttons to our render method.

```javascript
...
  render() {
    return html`
      <h1>Lit Events</h1>

      <button>Button 1</button>
      <button>Button 2</button>
    `;
  }
  ...
```

To fetch the click event we normally would use the `addEventListener` method on the button element or add an `onclick`
attribute to the button element. But with Lit we can use the `@click` directive.

```javascript
...
  render() {
    return html`
      <h1>Lit Events</h1>

      <button @click=${this.buttonOneHandler}>Button 1</button>
      <button @click=${this.buttonTwoHandler}>Button 2</button>
    `;
  }
  ...
```

The `@click` directive is used to listen for the click event on the button element and calls the `buttonOneHandler` and
`buttonTwoHandler` methods respectively. So lets add these methods to the `LitEvents` class.

```javascript
...
  buttonOneHandler(event) {
    console.log("Button clicked");
  }

  buttonTwoHandler(event) {
    console.log("Button clicked too");
  }
...
```

Now when you click on the buttons you should see the messages in the console.

## Focus en Key events

The click event is not the only event we can listen for. We can also listen for focus and key events. And we can use
more than one event listener on an element. So lets add a div element to the render method that listens for the
`keydown` and `focus` events.

```javascript
...
  render() {
    return html`
      <h1>Lit Events</h1>

      <div
        id="keylistener"
        tabindex="0"
        @keydown=${this.keydownHandler}
        @focus=${this.focusHandler}
      >
        Use the tab key to focus on this element and then press any key.
      </div>

      <button @click=${this.buttonOneHandler}>Button 1</button>
      <button @click=${this.buttonTwoHandler}>Button 2</button>
    `;
  }
...
```

As with the click event we can use the `@keydown` and `@focus` directives to listen for the keydown and focus events on
the div element. So lets add the `keydownHandler` and `focusHandler` methods to the `LitEvents` class.

```javascript
...
  focusHandler(event) {
    console.log("Element focused");
  }

  keydownHandler(event) {
    console.log(`Key ${event.key} pressed`);
  }
...
```

Now when you focus on the div element by tabbing to it or clicking on it, the div element will be focused. When the div
element is focused the focusHandler method will be called and you should see the message in the console. As long as the
div element is focused we can listen for key events. Press a key and you should see the key pressed in the console.

Note that we used the `@keydown` directive to listen for the keydown event on the div element. We could also use the
`@keyup` directive to listen for the keyup event. You might also want to listen for the `keypress` event. But be aware
that the `keypress` event is deprecated and should not be used.

## Input change event

Lets extend our render method with a form element that listens for the `input` event on the input elements and the
`change` event on the select element.

```javascript
...
  render() {
    return html`
      <h1>Lit Events</h1>
      <form>
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
              ><input
                type="radio"
                id="male"
                name="gender"
                value="m"
                @change=${this.inputHandler}
              />Male</label
            >
            <label for="female"
              ><input
                type="radio"
                id="female"
                name="gender"
                value="f"
                @change=${this.inputHandler}
              />Female</label
            >
            <label for="non-binary"
              ><input
                type="radio"
                id="non-binary"
                name="gender"
                value="n"
                @change=${this.inputHandler}
              />Non-binary</label
            >
            <label for="other"
              ><input
                type="radio"
                id="other"
                name="gender"
                value="o"
                @change=${this.inputHandler}
              />Other</label
            >
            <label for="prefer-not-to-say"
              ><input
                type="radio"
                id="prefer-not-to-say"
                name="gender"
                value="-"
                @change=${this.inputHandler}
              />Prefer not to say</label
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

      <button @click=${this.buttonOneHandler}>Button 1</button>
      <button @click=${this.buttonTwoHandler}>Button 2</button>
    `;
  }
...
```

We can handle the input and change events with a single method. So lets add the `inputHandler` method to the `LitEvents`
class.

```javascript
...
  inputHandler(event) {
    console.log("Input value: ", event.target.value);
  }
...
```

Now when you type in the input elements or select an option in the select element you should see the value in the
console.

## Form submit event

We could use the input and change events to retrieve the values from the form elements and submit them to a server. But
we can also listen for the `submit` event on the form element and handle the form submit event with a single method. All
we have to do is add the `@submit` directive to the form element that calls a handler method.

```javascript
...
  <form @submit=${this.submitHandler}>
...
```

> [!NOTE] It is the `form` element that has to hold the `@submit` directive, not the "submit" `button` element.

The `submitHandler` method will be called when the form is submitted. So lets add the `submitHandler` method to the
`LitEvents` class.

```javascript
...
  submitHandler(event) {
    event.preventDefault();
    console.log("Form submitted");
    const formData = new FormData(event.target);
    const data = Object.fromEntries(formData);
    console.log(data);
  }
...
```

The `submitHandler` method will first prevent the default form submission. If you don't do this the form will be
submitted to the server and the page will be reloaded. Then it will retrieve the form data with the `FormData`
constructor. The `FormData` constructor takes the form element as an argument. The `FormData` constructor returns a
`FormData` object that holds the form data. We can convert the `FormData` object to a plain object (JSON) with the
`Object.fromEntries` method.

So when you submit the form you should see the message in the console and the form data as a JSON object.

## Conclusion

It's easy to work with standard events in Lit. We can use the `@event` directive to listen for standard events on
elements. There are many standard events we can listen for. We can listen for the `click`, `focus`, `keydown`, `keyup`,
`keypress`, `input`, `change`, `submit` and many more events. For a complete list of standard events see the
[MDN - Element Events](https://developer.mozilla.org/en-US/docs/Web/API/Element#events) page.

---

## Sources

- [MDN - Element Events](https://developer.mozilla.org/en-US/docs/Web/API/Element#events)
- [LIT - Event handling](https://lit.dev/docs/components/events/)

---

:house: [Home](../README.md) | :arrow_backward: [Lit Attributes](./lit-attributes.md) | :arrow_up:
[Lit Web Components](./README.md) | [Rendering](./rendering.md) :arrow_forward:
