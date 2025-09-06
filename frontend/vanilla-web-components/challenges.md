# Challenges

## Challenge 1: Extend the `Hello World` custom element

Create a custom element that extends the `Hello World` custom element with a button that changes the message to "Hello
Universe!" when clicked.

## Challenge 2: Create a custom element that displays a message based on an attribute

Create a custom element that which expects a numeric attribute we name 'nr'. The value of `nr` determines how many times
the line `I'm a lazy developer, therefore I will write a custom element to print this line x times.` is printed, in
which you replace `x` with the value of `nr` attribute.

## Challenge 3: Create a custom element that uses the Shadow DOM

Create a custom element called `shadow-dom-card` that renders the following HTML within it's shadow-root:

```html
<section>
  <h1>Card Title</h1>
  <p>Card Content</p>
</section>
```

Let the index.html file contain the following code:

```html
<shadow-dom-card></shadow-dom-card>
<section>
  <h1>Card Title</h1>
  <p>Card Content</p>
</section>
```

Style the `section` element so that it look like a card (e.g. with a border, padding, and a shadow).

## Challenge 4: Add a stylesheet

Augment the previous challenge by using a CSS file that contains the styling for the component.

## Challenge 5: Dynamic content

- Create a web component that uses attributes like `title` and `content` and an HTML file that shows 5 of those components.
- Create a JS file that changes the values of the attributes in the HTML and import that JS file in a script tag within the HTML.

---

:house: [Home](../README.md) | :arrow_backward: [Lifecycle Callbacks](./lifecycle-callbacks.md) | :arrow_up:
[Vanilla Web Components](./README.md)
