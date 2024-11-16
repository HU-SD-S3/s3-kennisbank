# Vanilla Web Components - Hello Attribute

**Learning Story**: _As a developer, I want to create a simple custom element that displays a message that contains the value of an attribute, so that I can understand how to pass attributes to custom elements._

## HelloAttribute component

Start by creating a new file `hello-attribute.js` in the `src/view/components` folder.

```javascript
export class HelloAttribute extends HTMLElement {
  constructor() {
    super();
    this.propertyValue = 'World';
    this.textContent = `Hello ${this.propertyValue}`;
  }
}

customElements.define('hello-attribute', HelloAttribute);
```

This file creates a new class `HelloAttribute` that extends `HTMLElement`.
The constructor is called when the element is created.
The `super()` method calls the constructor of the parent class `HTMLElement`.
The line `this.propertyValue = 'World'` creates a property `propertyValue` for the class and set it's value to `'World'`.
The `this.textContent` is set to a template string that contains the value of `this.propertyValue`.

To use this custom element we need to import it in the `home-page.js` file.

```javascript
import '../components/hello-attribute.js';
```

And finally to use the the custom element in the `index.html` file.

```html
  ...
  <body>
    <hello-attribute show="Developer"></hello-attribute>
  </body>
  ...
```

When you open the page in your web browser, you should see the text `Hello World` displayed on the page.
So far this is similar to the `HelloWorld` component. The difference is now make use of a property `propertyValue` that is set to `'World'`.
And that we have added an attribute `show` to the custom element in the `index.html` file.
Our goal is that the custom element displays the value of the `show` attribute instead of `'World'` and only displays 'World' if no attribute is set.

To achieve this we first need to tell the `HelloAttribute` class which attributes it should look for. We do this by adding a static method `observedAttributes` to the class. The array returned by this method contains the names of the attributes the class should observe.

```javascript
export class HelloAttribute extends HTMLElement {
  constructor() {
    super();
    this.propertyValue = 'World';
    this.textContent = `Hello ${this.propertyValue}`;
  }

  static get observedAttributes() {
    return [
      'show'
    ]
  }
}

customElements.define('hello-attribute', HelloAttribute);
```

Next we have to implement the `attributeChangedCallback` method. This method is called whenever one of the attributes listed in the `observedAttributes` array changes.
Lets first take a look at the properties of the `attributeChangedCallback` method we receive.

```javascript
export class HelloAttribute extends HTMLElement {
  constructor() {
    super();
    this.propertyValue = 'World';
    this.textContent = `Hello ${this.propertyValue}`;
  }

  static get observedAttributes() {
    return [
      'show'
    ]
  }

  attributeChangedCallback(attribute, oldValue, newValue) {
    console.log(`attribute: ${attribute}, oldValue=${oldValue}, newValue=${newValue}`);
  }
}

customElements.define('hello-attribute', HelloAttribute);
```

When you open the page in your web browser and inspect the console you should see the following output:

```text
attribute: show, oldValue=null, newValue=Developer
```


---
## Sources:

* MDN - [Template literals (Template strings)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals)

---

:house: [Home](../README.md) | :arrow_backward: [Hello World](./hello-world.md) | :arrow_up: [Learning Stories](./README.md) | [](./) :arrow_forward:
