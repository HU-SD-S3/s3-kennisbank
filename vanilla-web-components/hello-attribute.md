# Vanilla Web Components - Hello Attribute

In this article we will create a simple custom element that displays a message that contains the value of an attribute. This article assumes that you have set up a boilerplate project. If you haven't, please follow the instructions in the [Project Setup](./project-setup.md) article.

## Introduction

In this learning story, we will create a simple custom element that displays a message that contains the value of an attribute (`<hello-attribute show="Developer"></hello-attribute>`). This will help us understand how to pass attributes to custom elements.

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

This tells us that the `show` attribute we have defined in the `index.html` has changed from `null` to `'Developer'`. Now we can use this information to update the `propertyValue` property of the class.

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
    if (attribute === 'show') {
      this.propertyValue = newValue;
      this.textContent = `Hello ${this.propertyValue}`;
    }
  }
}
```

> [!NOTE]
> Note that html attributes are always strings, even if you set them to a number or boolean in the html file. So if you want to use the attribute as a number or boolean you have to convert it in the `attributeChangedCallback` method.

Take for instance the following example:

```html
...
  <point-of-interest
    name="Dom Toren van Utrecht"
    longitude="52.09078"
    latitude="5.12117"
    wheelchair-accessible="false">
  </point-of-interest>
...
```

In this example the `longitude` and `latitude` attributes are set to numbers and the `wheelchair-accessible` attribute is set to a boolean. To use these attributes as numbers and a boolean we have to convert them in the `attributeChangedCallback` method.

```javascript
export class PointOfInterest extends HTMLElement {
  constructor() {
    super();
    this.name = 'Unknown';
    this.longitude = 0;
    this.latitude = 0;
    this.wheelchairAccessible = false;

    this.textContent = `${this.name} (${this.longitude}, ${this.latitude}) - Wheelchair Accessible: ${this.wheelchairAccessible}`;
  }

  static get observedAttributes() {
    return ['name', 'longitude', 'latitude', 'wheelchair-accessible'];
  }

  attributeChangedCallback(attribute, oldValue, newValue) {
    if (attribute === 'name') {
      this.name = newValue;
      this.textContent = `${this.name} (${this.longitude}, ${this.latitude})`;
    } else if (attribute === 'longitude') {
      this.longitude = Number(newValue);
      this.textContent = `${this.name} (${this.longitude}, ${this.latitude})`;
    } else if (attribute === 'latitude') {
      this.latitude = Number(newValue);
      this.textContent = `${this.name} (${this.longitude}, ${this.latitude})`;
    } else if (attribute === 'wheelchair-accessible') {
      this.wheelchairAccessible = newValue === 'true'; // Convert string to boolean
      this.textContent = `${this.name} (${this.longitude}, ${
        this.latitude
      }) - Wheelchair Accessible: ${this.wheelchairAccessible ? 'Yes' : 'No'}`;
    }
  }
}

customElements.define('point-of-interest', PointOfInterest);
```

Congratulations! You have created a custom element that displays a message that contains the value of an attribute.

---

## Sources

* MDN - [Template literals (Template strings)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals)
* MDN - [Tenary Operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_Operator)

---

:house: [Home](../README.md) | :arrow_backward: [Hello World](./hello-world.md) | :arrow_up: [Vanilla Web Components](./README.md) | [Hello ShadowDOM](./hello-shadowdom.md) :arrow_forward:
