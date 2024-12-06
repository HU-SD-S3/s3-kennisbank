# Lit Web Components - Hello Lit

**Learning Story**: 

## Introduction

What is LIT? Lit is a simple small library (not a framework) for building fast, lightweight web components. It is built on top of the Web Components standard, and can be seen as syntactic sugar for Web Components, which makes it easier to write and maintain custom elements.
Unlike frameworks like React, Angular or Vue, components built with Lit are just plain JavaScript classes that extend the LitElement base class. This makes it easy to learn and use Lit, as it doesn't require learning a new syntax or API. Unlike components build with frameworks like React, Angluar or Vue, Components built with Lit can be used in any web application, regardless of the framework or library being used.

## HelloLit component

Create a new file `hello-lit.js` in the `src/view/components` folder.

```javascript
import { LitElement, html, css } from 'lit';

export class HelloLit extends LitElement {
  static styles = css`
    h1 {
      color: blue;
    }
  `;

  constructor() {
    super();
    this.message = 'Lit';
  }

  render() {
    return html`<h1>Hello ${this.message}!</h1>`;
  }
}

customElements.define('hello-lit', HelloLit);
```

This file creates a new class `HelloLit` that extends `LitElement`. The `static styles` property defines the styles for the component. The `constructor` method sets the initial value of the `message` property to 'Lit'. The `render` method returns the HTML template for the component, which includes the value of the `message` property.

To use this custom element we need to import it in the `home-page.js` file.

```javascript
import '../components/hello-lit.js';
```

This allows us to use the custom element in the `index.html` file.

```html
  ...
  <body>
    <hello-lit></hello-lit>
  </body>
  ...
```

When you open the page in your web browser, you should see the text "Hello Lit!" displayed in blue. This is because the custom element has been rendered with the message 'Lit' and the styles defined in the `static styles` property.
If you inspect the element in the browser's developer tools, you should see the `<hello-lit>` element with the rendered content as well as that a [shadow root](../vanilla-web-components/hello-shadowdom.md) has been created for the component, which is 'open' by default. This is because Lit uses Shadow DOM to encapsulate the component's styles and markup.



---
## Sources:

* Lit - [Components overview](https://lit.dev/docs/components/overview/)

---

:house: [Home](../README.md) | :arrow_backward: []() | :arrow_up: [Learning Stories](./README.md) | [Hello ShadowDOM](./hello-shadowdom.md) :arrow_forward:
