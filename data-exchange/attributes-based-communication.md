# Attributes based communication

Attributes based communication is one of the most common ways to communicate data between web components. You might use
it without realizing it. Take for example the following html snippet:

```html
<img src="https://example.com/image.png" alt="Example image" />
```

This is a simple image tag with two attributes. The src and alt attributes. The src attribute is used to specify the URL
of the image, while the alt attribute is used to provide a text description of the image. This is a common pattern in
web development, where you use attributes to pass data to HTML elements.

## One-way vs Two-way data binding

To explain data binding and the difference between one-way and two-way data binding, we will use the input tag as an
example. The input tag is a common HTML element that is used to get user input. It has a value attribute that is used to
specify the initial value of the input tag.

```html
<input type="text" id="name" name="name" value="Wally" />
```

We can use the value attribute to pass data to the input tag. The input tag will see this data as its initial value. If
we change the value of the input tag, the content of the value attribute will change as well.

So if we want to use the input tag in the render method of our web compoent, we have to use a property variable to store
the value of the input tag. This is called data binding. In LIT our code would than look like this:

```javascript
import { LitElement, html } from 'lit';

export class MyComponent extends LitElement {
  static get properties() {
    return {
      value: { type: String },
    };
  }

  constructor() {
    super();
    this.value = 'Suske';
  }

  render() {
    return html`
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" value="${this.value}" />

      <p>current value: ${this.value}</p>
    `;
  }
}

customElements.define('my-component', MyComponent);
```

Running this code will show an input tag with the value "Suske" and a paragraph tag with the text "current value:
Suske".  
However if we change the value of the input tag form "Suske" to "Wiske", the paragraph tag will not update. This is
called **one-way data binding**. The data flows from the component to the input tag, but not the other way around.

If we want to update the content of the value property variable when the user changes the value of the input tag, we
have to add an event listener to the input tag, that listens to changes on the input tag. So our code would then look
like this:

```javascript
import { LitElement, html } from 'lit';

export class MyComponent extends LitElement {
  static get properties() {
    return {
      value: { type: String },
    };
  }

  constructor() {
    super();
    this.value = 'Suske';
  }

  _onInput(event) {
    this.value = event.target.value;
  }

  render() {
    return html`
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" value="${this.value}" @input="${this._onInput}" />

      <p>current value: ${this.value}</p>
    `;
  }
}

customElements.define('my-component', MyComponent);
```

If we would have used the `Polymer` library (an anchestor of `Lit` and `LitElement`), we could have used the **two-way
data binding** feature of Polymer. This would have allowed us to use the value property variable directly in the input
tag, without having to add an event listener to the input tag. The Polymer library would have taken care of the data
binding for us.

```javascript
import { PolymerElement, html } from '@polymer/polymer/polymer-element.js';

class MyComponent extends PolymerElement {
  static get properties() {
    return {
      value: {
        type: String,
        value: 'Suske',
        notify: true, // Enables two-way data binding
      },
    };
  }

  static get template() {
    return html`
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" value="{{value::input}}" <!-- Two-way binding -- />
      />

      <p>current value: [[value]]</p>
      <!-- One-way binding for display -->
    `;
  }
}

customElements.define('my-component', MyComponent);
```

The two-way data binding feature however didn't make it into the `Lit` library, because it was a performance issue. That
was a design decision of the `Lit` team. Other front-end frameworks like `Angular` and `Vue` do support two-way data
binding, but their web components are not based on the web components standard and are therefor not interoperable with
other web components from other libraries and/or frameworks.

## Mediator pattern

In the previous section we discussed the one- and two-way data binding. In both cases we their was a parent-child
relationship between the two components.

```mermaid
block-beta
columns 1
B["child-component"]
space
A["parent-component"]
A --> B
B --> A
```

But what if components who are not in a parent-child relationship need to exchange data with each other?

```mermaid
block-beta
columns 3
A["left-sibling-component"]
space
B["right-sibling-component"]

A --> B
```

Because they can't exchange attribute values with each other directly, we need to use a third component to act as a
mediator between the two components. This is called the **mediator pattern**. The parent component acts as a mediator
between the two sibling components. The parent component listens to attribute change events from one sibling component
and passes the data to the other sibling component.

```mermaid
block-beta
columns 1

block:C["child-components"]
  columns 3
    A["left-sibling-component"]
    space
    B["right-sibling-component"]
  end
space
P["parent-component"]

A --> P
P --> B
```

Because we now have reduced the problem to two parent-child relationships, we can implement the mediator pattern using
the same one-way data binding as we did in the previous section. The parent component listens to attribute change events
from one sibling component and passes the data to the other sibling component.

> [!WARNING]
>
> If the two components are cousins, then their grandparent would be the common component that could act as a mediator.
> But then you first have to pass the data up to the parent component and then down to the grandparent before it can be
> passed up to the other sibling component and then further up to their child component. This is called `prop drilling`
> and it's a lot of overhead and an example of a bad design, because it violates the single responsibility principle.
> The parent component should not be responsible for passing data between its children.

## Passing object attribute data with Lit

Attributes of a HTML element are always passed as a string. In [Lit Attributes](../lit-web-components/lit-attributes.md) we discussed how to pass data of different types to a lit component. We discussed that there are standard data types like strings, numbers and booleans, that Lit can typecast automatically. But we also discussed that complex data types like objects and arrays need to be passed as a string. This is done by using the `JSON.stringify()` method to convert the object or array to a string before passing it to the component. The component can then use the `JSON.parse()` method to convert the string back to an object or array.

But Lit provides a simpler way to pass complex data types like objects and arrays to a component without having to stringify them first. This is called [**property expressions**](https://lit.dev/docs/templates/expressions/#property-expressions). Property expressions are a more advanced way of passing data to a component, but it is not part of the web components specification. It is a Lit specific feature that allows you to pass complex data types like objects and arrays to a component without having to stringify them first.

Let's demonstrate this with an example. We will create a simple data producer and consumer component. The data producer component will produce some data object and pass it to the data consumer component. The data consumer component will then display the data.

> [!NOTE]
>
> Note the '.' before the data property in the data-consumer component. This is a Lit specific feature that allows you to pass complex data types like objects and arrays to a component without having to stringify them first.

Data Producer component:

```javascript
import { LitElement, html } from "lit";
import "./data-consumer";

export class DataProducer extends LitElement {
  static get properties() {
    return {
      data: { type: Object },
    };
  }

  constructor() {
    super();
    this.data = {};
  }

  produceData() {
    this.data = {
      message: "Hello from Data Producer!",
      timestamp: new Date(),
      author: "Producer",
    };
  }

  render() {
    return html`
      <section>
        <h2>Data Producer</h2>
        <button @click="${this.produceData}">Produce Data</button>
        <p>
          Current Data:
          ${JSON.stringify(this.data) === "{}"
            ? "No data produced yet."
            : JSON.stringify(this.data)}
        </p>
        <data-consumer .data="${this.data}"></data-consumer>
      </section>
    `;
  }
}

customElements.define("data-producer", DataProducer);
```

Data Consumer component:

```javascript
import { LitElement, html } from "lit";

export default class DataConsumer extends LitElement {
  static get properties() {
    return {
      data: { type: Object },
    };
  }

  constructor() {
    super();
    this.data = {};
  }

  changeData() {
    this.data = {
      message: "Data changed from Data Consumer!",
      timestamp: new Date(),
      author: "Consumer",
    };
  }

  render() {
    console.log(JSON.stringify(this.data));
    return html`
      <section>
        <h2>Data Consumer</h2>
        ${JSON.stringify(this.data) === "{}"
          ? html`<p>No data received yet.</p>`
          : html`
            <p>Received Data:
              <p>Message: ${this.data.message}</p>
              <p>Timestamp (
                type: ${typeof this.data.timestamp}, 
                Date Object: ${this.data.timestamp instanceof Date}):
                ${this.data.timestamp.toLocaleDateString("nl-NL")}
              </p>
              <p>Author: ${this.data.author}</p>
            </p>
            `}
        <button @click=${this.changeData}>Change Data</button>
      </section>
    `;
  }
}

customElements.define("data-consumer", DataConsumer);
```

As you can see in this example we also passed a date object within the data object and our consumer component was able to see it as a date object without having to convert it back from a string.
This makes that the property expressions are a powerful feature of Lit.

> [!WARNING]
>
> The property expressions are a Lit specific feature and are not part of the web components specification. This means that if you use property expressions in your component, it will not be interoperable with other web components from other libraries and/or frameworks. So be careful when using this feature, because it can lead to compatibility issues in the future.

---

## Sources

- [Lit.dev - Property expressions](https://lit.dev/docs/templates/expressions/#property-expressions)
- [Patterns.dev - Mediator pattern](https://www.patterns.dev/vanilla/mediator-pattern/)

---

:house: [Home](../README.md) | :arrow_backward: [Backend Communication](./backend-communication.md) | :arrow_up:
[Data Exchange](./README.md) | [Event based communication](./events-based-communication.md) :arrow_forward:
