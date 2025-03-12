# Vanilla Web Components - Hello World

In this article we will create a simple custom element that displays "Hello World". This article assumes that you have
set up a boilerplate project. If you haven't, please follow the instructions in the [Project Setup](./project-setup.md)
article.

## Introduction

You might wonder what Web Components are?  
Web Components are a set of web platform APIs that allow you to create custom, reusable HTML elements, like
`<hello-world>`, that can be used in your web applications. These custom elements can be used in your web applications
just like built-in HTML elements (e.g. `<div>`, `<p>`, `<span>`, etc.). In this article, we will create a simple custom
element that displays "Hello World".

## HelloWorld component

Create a new file `hello-world.js` in the `src/view/components` folder.

> [!TIP]
>
> Name your component files with
> [kebab-case](https://www.freecodecamp.org/news/snake-case-vs-camel-case-vs-pascal-case-vs-kebab-case-whats-the-difference/),
> e.g. `hello-world.js`, to match the custom element name.

```javascript
export class HelloWorld extends HTMLElement {
  constructor() {
    super();
    console.log(this);
  }
}

customElements.define('hello-world', HelloWorld);
```

This file creates a new class HelloWorld that extends HTMLElement. The constructor is called when the element is
created. The super() method calls the constructor of the parent class HTMLElement. The console.log(this) statement logs
what `this` is to the console. The `customElements.define` method registers the custom element with the name
'hello-world'.

> [!NOTE]
>
> The name of the custom element **must** contain at least one hyphen (-). This is a requirement of the custom elements
> specification.

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

When you open the page in your web browser, you shouldn't see anything. This is because the custom element doesn't have
any content yet. But at the console of the browsers developer tools you should see the `hello-world` element logged.
This means that `this` refers to the new tag `<hello-world>` we created. This allows us to manipulate the element.
Change the code of your `hello-world.js` to:

```javascript
export class HelloWorld extends HTMLElement {
  constructor() {
    super();
    this.textContent = 'Hello World';
  }
}

customElements.define('hello-world', HelloWorld);
```

Now when you open the page in your web browser, you should see the text "Hello World" displayed. Congratulations! You
have created your first custom element.

---

## Sources

- MDN - [Using custom elements](https://developer.mozilla.org/en-US/docs/Web/API/Web_components/Using_custom_elements)
- freeCodeCamp -
  [Snake Case VS Camel Case VS Pascal Case VS Kebab Case – What's the Difference Between Casings?](https://www.freecodecamp.org/news/snake-case-vs-camel-case-vs-pascal-case-vs-kebab-case-whats-the-difference/)

---

:house: [Home](../README.md) | :arrow_backward: [Project Setup](./project-setup.md) | :arrow_up:
[Vanilla Web Components](./README.md) | [Hello Attribute](./hello-attribute.md) :arrow_forward:
