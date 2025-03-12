# Lit Web Components - Styling

In the vanilla web components learning story [Hello ShadowDOM](../vanilla-web-components/hello-shadowdom.md), we learned
that the Shadow DOM encapsulates the styles of a custom element. This prevented them from affecting the styles of the
parent document, but it also made it difficult to use global styles or to style the component from the outside. Lit
provides a way to style components using CSS that is scoped to the component but can also be styled from the outside.

## HelloStyles component

Let's start with a new file `hello-styles.js` in the `src/view/components` folder, that gives us an unstyled component.

```javascript
import { LitElement, html, css } from 'lit';

export class HelloStyles extends LitElement {
  static styles = css``;

  constructor() {
    super();
  }

  render() {
    return html`
      <h1>Hello Component Styles</h1>
      <p>Let there be global styles</p>
    `;
  }
}

customElements.define('hello-styles', HelloStyles);
```

To use this custom element we need to import it in the `home-page.js` file.

```javascript
import '../components/hello-styles.js';
```

This allows us to use the custom element in the `index.html` file. Which we will give the following body.

```html
...
<body>
  <h1>Outside in the index.html</h1>
  <hello-styles></hello-styles>
</body>
...
```

Opening the `index.html` file in the browser will show two headings, one from the `index.html` file and one from the
`hello-styles` component. The component is not styled yet.

## Styling the component itself

In the previous `hello-lit` learning story, we used the `styles` property to add styles to the component. We can use the
same property to add styles to the `hello-styles` component. But now we can use the `:host` selector to style the
component itself.

```javascript
import { LitElement, html, css } from 'lit';

export class HelloStyles extends LitElement {
  static styles = css`
    :host {
      display: block;
      padding: 1rem;
      margin: 1rem;
      height: 100%;
      width: 80%;
      border: 2px solid black;
      background-color: lightgray;
      box-shadow: 0.3rem 0.3rem 0.3rem black;
    }
  `;

  constructor() {
    super();
  }

  render() {
    return html`
      <h1>Hello Component Styles</h1>
      <p>Let there be global styles</p>
    `;
  }
}

customElements.define('hello-styles', HelloStyles);
```

The `:host` selector is a pseudo-class that matches the element itself. This allows us to style the component itself.
The styles are scoped to the component, so they won't affect the parent document. Within the browser, the component will
now have a border, padding, margin, a light gray background, and a black box shadow.

## How NOT to apply globally styling

Let's add a css file `global-styles.css` in the root folder of our project with the following content.

```css
h1 {
  background-color: yellowgreen;
  color: white;
  padding: 1rem;
}
```

And import this file in the `index.html` file.

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
    <h1>Outside in the index.html</h1>
    <hello-styles></hello-styles>
  </body>
</html>
```

Running this project in the browser will show the `h1` element from the `index.html` file with a yellow-green background
and white text color. The h1 of the `hello-styles` component however will not get styled by the global styles. This is
because the styles are scoped to the component, due to the Shadow DOM.

You might think that we can somehow import the global styles in the `hello-styles` component. One way to do this is by
using the `@import` rule in the `styles` property of the component.

```javascript
import { LitElement, html, css } from 'lit';

export class HelloStyles extends LitElement {
  static styles = css`
    @import url('./global-styles.css');

    :host {
      display: block;
      padding: 1rem;
      margin: 1rem;
      height: 100%;
      width: 80%;
      border: 2px solid black;
      background-color: lightgray;
      box-shadow: 0.3rem 0.3rem 0.3rem black;
    }
  `;

  constructor() {
    super();
  }

  render() {
    return html`
      <h1>Hello Component Styles</h1>
      <p>Let there be global styles</p>
    `;
  }
}

customElements.define('hello-styles', HelloStyles);
```

But this will not work.

> [!CAUTION]
>
> The `@import` rule is not supported in the `styles` property of a Lit component, as you can see in the browser console
> (`@import rules are not allowed here.`).

Another way to trick the system is by using the `<link>` tag in the `render` method of the component.

```javascript
import { LitElement, html, css } from 'lit';

export class HelloStyles extends LitElement {
  static styles = css`
    :host {
      display: block;
      padding: 1rem;
      margin: 1rem;
      height: 100%;
      width: 80%;
      border: 2px solid black;
      background-color: lightgray;
      box-shadow: 0.3rem 0.3rem 0.3rem black;
    }
  `;

  constructor() {
    super();
  }

  render() {
    return html`
      <link rel="stylesheet" href="/global-styles.css" />
      <h1>Hello Component Styles</h1>
      <p>Let there be global styles</p>
    `;
  }
}

customElements.define('hello-styles', HelloStyles);
```

This works in the browser, but it is not the best way to import global styles.

> [!WARNING]
>
> The `<link>` tag is not a Lit element, so it is not reactive. This means that if the global styles change, the
> component will not be updated. Also, the global styles are not scoped to the component, so they will affect the parent
> document.

## Using variables for global styling

A nicer way to pass some global styles to a component is by using CSS variables. Let for instance the css in our
component use a variable for the background color of the h1 tag (in the example below we choose the variable
`--h1-background-color`).

```javascript
import { LitElement, html, css } from 'lit';

export class HelloStyles extends LitElement {
  static styles = css`
    :host {
      display: block;
      padding: 1rem;
      margin: 1rem;
      height: 100%;
      width: 80%;
      border: 2px solid black;
      background-color: lightgray;
      box-shadow: 0.3rem 0.3rem 0.3rem black;
    }

    h1 {
      color: blue;
      background-color: var(--h1-background-color, red);
      padding: 0.5rem;
      text-align: center;
    }
  `;

  constructor() {
    super();
  }

  render() {
    return html`
      <link rel="stylesheet" href="/global-styles.css" />
      <h1>Hello Component Styles</h1>
      <p>Let there be global styles</p>
    `;
  }
}

customElements.define('hello-styles', HelloStyles);
```

If we take a look at the result within the browser we see that the h1 element of the `hello-styles` component has a blue
text color and a red background color. That the background color is red is because the `--h1-background-color` variable
is not set. We can set this variable in the global styles file (`/global-styles.css`).

```css
:root {
  --h1-background-color: yellowgreen;
}

h1 {
  background-color: blue;
  color: white;
  padding: 1rem;
}
```

This will set the background color of the h1 element in the `hello-styles` component to yellow-green and that of the h1
of the `index.html` file to blue. And because we want to use a global color scheme, we can also set the background color
of the h1 elements that are not within components to the `--h1-background-color` variable.

```css
:root {
  --h1-background-color: yellowgreen;
}

h1 {
  background-color: var(--h1-background-color);
  color: white;
  padding: 1rem;
}
```

CSS variables are powerfull, but they can not be used to store all the styles of a single selector within a single
variable. We have to repeat the variable for each property we want to set. One way to avoid this is by using ::part and
::theme. But this is a more advanced topic that we will not be covered in this learning story. Another simple way to use
global styles is by using the css template literal in the `styles` property of the component itself.

## Using the css template literal

The `styles` property of a Lit component receives a lit css template literal.

```javascript
static styles = css`...`;
```

By creating a separate file `global-styles.css.js` in the `src/view/styles` folder, we can export a css template literal
that contains the global styles.

```javascript
import { css } from 'lit';

export const globalStyles = css`
  p {
    font-size: 1.2rem;
    font-family: 'Arial', sans-serif;
    color: blue;
  }
`;
```

We can import this css template literal in the `hello-styles.js` file and use it in the `styles` property of the
component.

```javascript
import { LitElement, html, css } from 'lit';
import { globalStyles } from '../styles/global-styles.css.js';
...
```

And use the `globalStyles` in the `styles` property of the component.

```javascript
import { LitElement, html, css } from 'lit';
import { globalStyles } from '../styles/global-styles.css.js';

export class HelloStyles extends LitElement {
  static styles = [
    globalStyles,
    css`
    :host {
      display: block;
      padding: 1rem;
      margin: 1rem;
      height: 100%;
      width: 80%;
      border: 2px solid black;
      background-color: lightgray;
      box-shadow: .3rem .3rem .3rem black
    }

    h1 {
      color: blue;
      background-color: var(--h1-background-color, red);
      padding: .5rem;
      text-align: center;
    }
  `
  ];
  ...
```

In doing so, we can import the global styles in multiple components and use them in the `styles` property of the
component.

---

## Sources

- Lit - [Styles](https://lit.dev/docs/components/styles/)
- MDN -
  [Using CSS custom properties (variables)](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties)
- CSS-Tricks -
  [Styling in the Shadow DOM With CSS Shadow Parts](https://css-tricks.com/styling-in-the-shadow-dom-with-css-shadow-parts/)

---

:house: [Home](../README.md) | :arrow_backward: [Hello Lit](./hello-lit.md) | :arrow_up:
[Lit Web Components](./README.md) | [Lit Attributes/Properties](./lit-attributes.md) :arrow_forward:
