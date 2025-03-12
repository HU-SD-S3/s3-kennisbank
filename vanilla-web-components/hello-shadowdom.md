# Vanilla Web Components - Hello ShadowDOM

Since web components are ment to be reusable, the styling of a custom element should not be affected by the styles of
the parent document. This can be achieved by using the Shadow DOM to encapsulate the styles of a custom element. In this
article, we will create a simple custom element that displays a message that contains the value of an attribute
(`<hello-shadowdom></hello-shadowdom>`). This will help us understand how to use the Shadow DOM to encapsulate the
styles of a custom element.

## HelloShadowDOM component

To demonstrate the use of the Shadow DOM, our component needs to contain at least one html elements that we can style.
Start by creating a new file `hello-shadowdom.js` in the `src/view/components` folder.

```javascript
export class HelloShadowDOM extends HTMLElement {
  constructor() {
    super();
    const h1Element = document.createElement('h1');
    h1Element.textContent = 'Hello Shadow DOM';
    this.appendChild(h1Element);
  }
}

customElements.define('hello-shadowdom', HelloShadowDOM);
```

Note that this code is similar to the `HelloWorld` example, but instead of setting the `textContent` of the custom
element itself, we create a new `h1` element and set its `textContent` to `'Hello Shadow DOM'`. We then append this `h1`
element to the custom element. This will allow us to style the `h1` element without affecting the styles of the parent
document. This code however does not yet make use of the Shadow DOM.

To use this custom element we need to import it in the `home-page.js` file.

```javascript
import '../components/hello-shadowdom.js';
```

Let's also add a stylesheet file `styles.css` in the root of our project with the following content:

```css
h1 {
  background-color: blue;
  color: white;
  padding: 1rem;
}
```

And finally let the `index.html` file import the stylesheet and make use of our custom element.

```html
...
<head>
  ...
  <link rel="stylesheet" href="./styles.css" />
  ...
</head>
<body>
  ...
  <hello-shadowdom></hello-shadowdom>
  ...
</body>
...
```

When you open the page in your web browser, you should see the text `Hello Shadow DOM` displayed on the page with a blue
background and white text color. This is because the `h1` element is styled by the `styles.css` file. Let's also add two
console.log statements to the `home-page.js` file to query the custom element and the `h1` element.

```javascript
import '../components/hello-shadowdom';

console.log(document.querySelector('hello-shadowdom'));
console.log(document.querySelector('h1'));
```

When you open the page in your web browser and open the developer tools, you should see the `hello-shadowdom` and the
`h1` element logged to the console.

## Applying the Shadow DOM

To apply the Shadow DOM to our custom element, we need to attach a shadow root to the custom element. We do this by
calling the `attachShadow` method in the constructor of the custom element.

```javascript
export class HelloShadowDOM extends HTMLElement {
  constructor() {
    super();
    this.shadowDOM = this.attachShadow({ mode: 'open' });
    const h1Element = document.createElement('h1');
    h1Element.textContent = 'Hello Shadow DOM';
    this.appendChild(h1Element);
  }
}

customElements.define('hello-shadowdom', HelloShadowDOM);
```

But when you now open the page in your web browser, you will see that the text `Hello Shadow DOM` is no longer
displayed. As can be seen in the developer tools of the browser, the `h1` element and the `#shadow-root` element are
siblings in the DOM tree. But when a custom element has a shadow root, the content of the custom element must be
appended to the shadow root instead of the custom element itself. To archive this, we modify the code
`this.appendChild(h1Element);` to

```javascript
this.shadowDOM.appendChild(h1Element);
```

Now when you open the page in your web browser, you should see the text `Hello Shadow DOM` displayed on the page, but
the blue background and white text color are no longer applied. In the console of the browsers developer tools you
should see the `hello-shadowdom` element logged, but not the `h1` element. This means that the `h1` element is
encapsulated in the shadow root and is not accessible from the parent document. This is also the reason why the `h1` is
no longer styled by the `styles.css` file. Adding the following log statement to the `home-page.js` file will again log
the `h1` element to the console.

```javascript
console.log(document.querySelector('hello-shadowdom').shadowRoot.querySelector('h1'));
```

> [!NOTE] This means that in JavaScript code outside of the custom element, you can still access the shadow root and its
> content.

But when we change the mode of the shadow root to `closed`, the `h1` element will no longer be accessible from the
parent document.

```javascript
this.shadowDOM = this.attachShadow({ mode: 'closed' });
```

When you now open the page in your web browser and open the developer tools, you should see that the `hello-shadowdom`
element is still logged to the console, but the `h1` element is no longer logged to the console and an error message is
displayed instead.

> [!NOTE] We can conclude that a custom element with a shadow root which has a mode of `closed` is completely
> encapsulated and its content is not accessible from the parent document. This is useful when you want to create custom
> elements that are not affected by the styles of the parent document and you want to prevent other scripts from
> accessing and/or modifying the content of the custom element.

## Styling the Shadow DOM

If we want to style the `h1` element that is encapsulated in the shadow root, we can do this by adding a `<style>`
element to the shadow root.

```javascript
export class HelloShadowDOM extends HTMLElement {
  constructor() {
    super();
    this.shadowDOM = this.attachShadow({ mode: 'closed' });

    const styleElement = document.createElement('style');
    styleElement.textContent = `
      h1 {
        background-color: green;
        color: white;
        padding: 1rem;
      }
    `;
    this.shadowDOM.appendChild(styleElement);

    const h1Element = document.createElement('h1');
    h1Element.textContent = 'Hello Shadow DOM';
    this.shadowDOM.appendChild(h1Element);
  }
}
```

When you now open the page in your web browser, you should see the text `Hello Shadow DOM` displayed on the page with a
green background and white text color. This is because the `h1` element is styled by the `<style>` element that is added
to the shadow root.

But now the JavaScript code contains a mix of HTML and CSS code. To separate the CSS code from the JavaScript code, we
could add a `<link>` element to the shadow root that links to a `styles.css` file.

```javascript
export class HelloShadowDOM extends HTMLElement {
  constructor() {
    super();
    this.shadowDOM = this.attachShadow({ mode: 'closed' });

    const linkElement = document.createElement('link');
    linkElement.setAttribute('rel', 'stylesheet');
    linkElement.setAttribute('href', './styles.css');
    this.shadowDOM.appendChild(linkElement);

    const h1Element = document.createElement('h1');
    h1Element.textContent = 'Hello Shadow DOM';
    this.shadowDOM.appendChild(h1Element);
  }
}
```

This should again show the text `Hello Shadow DOM` displayed on the page with a blue background and white text color.

An alternative- and nicer way to influence the style the shadow root from the parent document can be achieved by
using CSS variables.

When we change the `styles.css` file to

```css
h1 {
  background-color: blue;
  color: white;
  padding: 1rem;
}

:root {
  --h1-background-color: brown;
}
```

We define a CSS variable `--h1-background-color` in the `:root` selector that we can use to set the background color of
the `h1` element.

To use this variable in the shadow root, we can add a `<style>` element to the shadow root that contains the following
CSS rules.

```javascript
export class HelloShadowDOM extends HTMLElement {
  constructor() {
    super();
    this.shadowDOM = this.attachShadow({ mode: 'closed' });

    const styleElement = document.createElement('style');
    styleElement.textContent = `
      h1 {
        background-color: var(--h1-background-color, green);
        color: white;
        padding: 1rem;
      }
    `;
    this.shadowDOM.appendChild(styleElement);

    const h1Element = document.createElement('h1');
    h1Element.textContent = 'Hello Shadow DOM';
    this.shadowDOM.appendChild(h1Element);
  }
}

customElements.define('hello-shadowdom', HelloShadowDOM);
```

When you now open the page in your web browser, you should see the text `Hello Shadow DOM` displayed on the page with a
brown background and white text color. This is because the `h1` element is styled by the `<style>` element that is added
to the shadow root and the `--h1-background-color` variable is set to `brown` in the `styles.css` file. And in case that
the `--h1-background-color` variable is not set, the `h1` element will have a green background color.

---

## Sources

- MDN -
  [Template literals (Template strings)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals)
- MDN -
  [Tenary Operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_Operator)

---

:house: [Home](../README.md) | :arrow_backward: [Hello Attribute](./hello-attribute.md) | :arrow_up:
[Vanilla Web Components](./README.md) | [Lifecycle callbacks](./lifecycle-callbacks.md) :arrow_forward:
