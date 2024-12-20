# Lit Attributes

## Introduction

## LitAttributes component

Create a new file `lit-attributes.js` in the `src/view/components` folder.

```javascript
import { LitElement, html, css } from 'lit';

export class LitAttributes extends LitElement {

  static styles = css`
    :host {
      display: block;
      padding: 1rem;
      border: 1px solid #ccc;
      border-radius: 4px;
      margin-top: 1rem;
    }
    `;

  render() {
    return html`
      <h1>Lit Attributes</h1>
      <p>Below you see a list of attributes that were passed to this component:</p>
      <ul>
      </ul>
    `;
  }
}

customElements.define('lit-attributes', LitAttributes);
```

To use this custom element we need to import it in the `home-page.js` file.

```javascript
import '../components/lit-attributes.js';
```

And finally we can use the custom element in the `index.html` file. Because we want to investigate how attributes are passed to the custom element, we will add some attributes to the custom element.
We will add two instances of the custom element, one without the online attribute and one with the online attribute.

```html
  ...
  <body>
    <lit-attributes name="Jan" customer-id=123 date-of-birth="2004-03-04"></lit-attributes>
    <lit-attributes name="Nadia" customer-id=321 date-of-birth="2005-02-28" online></lit-attributes>
  </body>
  ...
```

When you open the page in your web browser, you should see two boxes with the heading Lit Attributes. Non of the attributes are currently displayed in the boxes. We will add them one by one.

## String attributes

Let's start with the name attribute that is of type string. We will add a property to the LitAttributes class to store the name attribute.

```javascript
import { LitElement, html, css } from 'lit';

export class LitAttributes extends LitElement {

  static styles = css`
    :host {
      display: block;
      padding: 1rem;
      border: 1px solid #ccc;
      border-radius: 4px;
      margin-top: 1rem;
    }
    `;

  static properties = {
    name: { type: String },
  };

  render() {
    return html`
      <h1>Lit Attributes</h1>
      <p>Below you see a list of attributes that were passed to this component:</p>
      <ul>
        <li>${this.name} - ${typeof this.name}</li>
      </ul>
    `;
  }
}

customElements.define('lit-attributes', LitAttributes);
```

As you can see from the code, we have added a property `name` to the `LitAttributes` class. The type of the property is set to `String`. In the render method, we have added a list item that displays the value of the `name` property and the type of the `name` property.
When you refresh the page in your web browser, you should see the name attribute displayed in the boxes.

## Number attributes

Next, we will add the `customer-id` attribute that is of type number. If we try to use `customer-id` as the property name in our web component, we will get an error because the `-` character is not allowed in the property name.
We will therefore use `customerId` as the property name and use the `attribute` property option to specify the name of the attribute. Using the camelCase naming convention for the property name is a good practice when working with web components.

Other alternatives would be to use `customer_id` as the property name, but this is not a good practice since the `_` character also is not allowed in web components as property name, resulting in the same error as using `-` in the property name.
The other alternative would be to use `customerId` itself as the property name, but since html is case-insensitive that would be the same as using `customerid` as attribute name, and than separating the words in the attribute name would become difficult.

> [!NOTE]
> The naming convention for attributes in html is lowercase and hyphens. The naming convention for properties in javascript is camelCase. To map an attribute to a property in a web component, you can use the `attribute` property option to specify the name of the attribute.

```javascript
...
  static properties = {
    name: { type: String },
    customerId: { 
      type: Number,
      attribute: 'customer-id'
     },
  };

  render() {
    return html`
      <h1>Lit Attributes</h1>
      <p>Below you see a list of attributes that were passed to this component:</p>
      <ul>
        <li>${this.name} - ${typeof this.name}</li>
        <li>${this.customerId} - ${typeof this.customerId}</li>
      </ul>
    `;
  }
  ...
```

As you can see from the code, we have added a property `customerId` to the `LitAttributes` class. The type of the property is set to `Number`. In the render method, we have added a list item that displays the value of the `customerId` property and the type of the `customerId` property.
When you refresh the page in your web browser, you should see the `customerId` attribute displayed in the boxes.

At first glance, this seems to be nothing special, since we defined the property as a number and in the we passed a number as an attribute within the html. However, if you inspect the html in the browser you will see that the browser has added quotes around the number. This is because the browser always passes the attribute as a string.
By specifying the type of the property as a number, Lit will automatically convert the string to a number.

> [!IMPORTANT]
> When you pass an attribute to a web component, the browser will always pass the attribute as a **string**.

## Date attributes

The `date-of-birth` attribute is of type date. We will add a property to the LitAttributes class to store the date-of-birth attribute.

```javascript
...
  static properties = {
    name: { type: String },
    customerId: { 
      type: Number,
      attribute: 'customer-id'
     },
    dateOfBirth: { 
      type: Date, 
      attribute: 'date-of-birth',
    },
  };

  render() {
    return html`
      <h1>Lit Attributes</h1>
      <p>Below you see a list of attributes that were passed to this component:</p>
      <ul>
        <li>${this.name} - ${typeof this.name}</li>
        <li>${this.customerId} - ${typeof this.customerId}</li>
        <li>${this.dateOfBirth} - ${typeof this.dateOfBirth}</li>
      </ul>
    `;
  }
...
```

However when you refresh the page in your web browser, you will see that the date-of-birth attribute is not converted to a date. This is because Lit does not have a built-in converter for the date type. We will have to create a converter ourselves.

```javascript
...
  static properties = {
    name: { type: String },
    customerId: { 
      type: Number,
      attribute: 'customer-id'
     },
    dateOfBirth: { 
      type: Date, 
      attribute: 'date-of-birth',
      converter: {
        fromAttribute(value) {
          return new Date(value);
        }
      }
    },
  };
...
```

When we now take a look at the page in the browser, we will see that the dateOfBirth property is no longer a string, but the `typeof` now returns `object`. This is correct since the dateOfBirth property is now a Date **object**. If we want to check that the dateOfBirth property is indeed a **Date object**, we can use the `instanceof` operator.

```javascript
...
  render() {
    return html`
      <h1>Lit Attributes</h1>
      <p>Below you see a list of attributes that were passed to this component:</p>
      <ul>
        <li>${this.name} - ${typeof this.name}</li>
        <li>${this.customerId} - ${typeof this.customerId}</li>
        <li>${this.dateOfBirth} - ${this.dateOfBirth instanceof Date}</li>
      </ul>
    `;
  }
...
```

> [!NOTE]
> Note that the [TC39](https://tc39.es/) is working on [Temporal](https://tc39.es/proposal-temporal/docs/index.html), a new Date/Time API for JavaScript. This new API will make working with dates and times in JavaScript much easier.

## Boolean attributes

Boolean attributes are normally not passed with a value. If the attribute is present, the value is `true`, otherwise the value is `false`.
The `online` attribute is a boolean attribute. We will add a property to the LitAttributes class to store the online attribute.

```javascript
...
  static properties = {
    name: { type: String },
    customerId: { 
      type: Number,
      attribute: 'customer-id'
     },
    dateOfBirth: { 
      type: Date, 
      attribute: 'date-of-birth',
      converter: {
        fromAttribute(value) {
          return new Date(value);
        }
      }
    },
    online: { type: Boolean },
  };

  render() {
    return html`
      <h1>Lit Attributes</h1>
      <p>Below you see a list of attributes that were passed to this component:</p>
      <ul>
        <li>${this.name} - ${typeof this.name}</li>
        <li>${this.customerId} - ${typeof this.customerId}</li>
        <li>${this.dateOfBirth} - ${this.dateOfBirth instanceof Date}</li>
        <li>${this.online} - ${typeof this.online}</li>
      </ul>
    `;
  }
...
```

When you refresh the page in your web browser, you will see that for the tag where the online attribute is present it is displayed as a boolean with the value `true`. However, for the tag where the online attribute is not present, no value is displayed and the type is `undefined`. This is because the browser only passes the attribute if it is present.

To fix this we have to initialize the online property with a default value. We can do this by adding a `constructor` to the LitAttributes class.

```javascript
...
  constructor() {
    super();
    this.online = false;
  }
...
```

When you refresh the page in your web browser, you will see that for the tag where the online attribute is not present it is displayed as a boolean with the value `false`.

---

## Sources

* [Lit.dev - Properties](https://lit.dev/docs/components/properties/)
* [MDN - Boolean attributes](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes#boolean_attributes)

---

:house: [Home](../README.md) | :arrow_backward: [Styling](./styling.md) | :arrow_up: [Learning Stories](./README.md) | []() :arrow_forward:
