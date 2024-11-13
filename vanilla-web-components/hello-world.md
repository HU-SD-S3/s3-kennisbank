# Vanilla Web Components - Hello World

**Learning Story**: _As a developer, I want to create a simple custom element that displays "Hello World", so that I can understand the basics of custom elements._

Goal is to create a simple custom element that displays "Hello World".

Start with only a constructor and a render function, then extend the example with the connectedCallback.

## HelloWorld component

Create a new file `hello-world.js` in the `src/view/components` folder.

```javascript
export class HelloWorld extends HTMLElement {

  constructor() {
    super();
    console.log(this);
  }

}

customElements.define('hello-world', HelloWorld);
```

This file creates a new class HelloWorld that extends HTMLElement.
The constructor is called when the element is created. The super() method calls the constructor of the parent class HTMLElement.
The console.log(this) statement logs what `this` is to the console.
The customElements.define method registers the custom element with the name 'hello-world'.

To use this custom element we need to import it in the `home-page.js` file.

```javascript
import '../components/hello-world.js';
```

This allows us to use the custom element in the `index.html` file.

```html
  ...
  <body>
    <hello-world></hello-world>
  </body>
  ...
```

When you open the page in your web browser, you shouldn't see anything. This is because the custom element doesn't have any content yet.
But at the console of the browsers developer tools you should see the `hello-world` element logged.
This means that `this` refers to the new tag `<hello-world>` we created.
This allows us to manipulate the element. Change the code of your `hello-world.js` to:

```javascript
export class HelloWorld extends HTMLElement {

  constructor() {
    super();
    this.textContent = 'Hello World';
  }

}

customElements.define('hello-world', HelloWorld);
```

Now when you open the page in your web browser, you should see the text "Hello World" displayed.

---
## Sources:

MDN - [Using custom elements](https://developer.mozilla.org/en-US/docs/Web/API/Web_components/Using_custom_elements)

---

:house: [Home](../README.md) | :arrow_backward: [Project Setup](./project-setup.md) | :arrow_up: [Learning Stories](./README.md) | [Assignment 3](./assignment3.md) :arrow_forward: