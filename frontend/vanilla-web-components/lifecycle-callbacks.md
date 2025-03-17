# Vanilla Web Components - Lifecycle Callbacks

In this article we will learn about the lifecycle callbacks of a custom element. The lifecycle of a custom element
consists of several stages, each of which can be hooked into using lifecycle callbacks. These callbacks are methods that
are called at specific points in the lifecycle of a custom element.

## Lifecycle hooks

The custom element lifecycle consists of several stages, each of which can be hooked into using lifecycle callbacks.
These callbacks are methods that are called at specific points in the lifecycle of a custom element. We already know
some of these lifecycle hooks from the previous learning stories, such as the `constructor` and the `connectedCallback`.
Let's dive deeper into the lifecycle of a custom element and explore the other lifecycle callbacks, the order in which
they are called, and what they are used for.

To demonstrate the lifecycle callbacks, make sure that the `index.html` file imports the `/src/view/pages/home-page.js`
file. And that the html itself does not contain any custom elements.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="icon" type="image/svg+xml" href="./javascript.svg" />
    <link rel="stylesheet" href="./styles.css" />

    <script type="module" src="./src/view/pages/home-page.js"></script>

    <title>Vanilla Web Components</title>
  </head>
  <body></body>
</html>
```

Now lets create a simple custom element that logs messages to the console at each stage of the lifecycle.

```javascript
export class HelloLifecycle extends HTMLElement {
  static get observedAttributes() {
    console.log('ObservedAttributes');
    return ['lifecycle'];
  }

  constructor() {
    super();
    console.log('Constructor: Element created');
  }

  connectedCallback() {
    this.textContent = 'Hello Lifecycle';
    console.log('ConnectedCallback: Element added to DOM');
  }

  disconnectedCallback() {
    console.log('DisconnectedCallback: Element removed from DOM');
  }

  attributeChangedCallback(attribute, oldValue, newValue) {
    console.log(`AttributeChangedCallback: ${attribute} changed from ${oldValue} to ${newValue}`);
  }

  adoptedCallback() {
    console.log('AdoptedCallback: Element moved to new document');
  }
}

customElements.define('hello-lifecycle', HelloLifecycle);
```

To use the component we need to import it in the `home-page.js` file. In the previous learning stories we imported a
custom element by just specifying the path to the file. This time we need to import the class itself to demonstrate the
lifecycle callbacks better.

```javascript
import { HelloLifecycle } from '../components/hello-lifecycle';
```

### observedAttributes

Running the code above will log the following messages to the console:

```text
ObservedAttributes
```

The reason for this is that the `observedAttributes` **static** getter is called before the element is created. That it
is a static getter means that it is called on the class itself, not on an instance of the class. This is why it is
called before the element is created. This method itself should return an array of attribute names that you want to
observe for changes. When an observed attribute changes, the `attributeChangedCallback` is called.

### constructor

Let's create a new instance of the `hello-lifecycle` element by adding the following code to the `home-page.js` file.

```javascript
import { HelloLifecycle } from '../components/hello-lifecycle';

// Creating an instance of the custom element
const element = new HelloLifecycle();
```

Running the code above will log the following messages to the console:

```text
ObservedAttributes
Constructor: Element created
```

The `constructor` is called when the element is created. This is the first lifecycle callback that is called when a
custom element is created. The constructor is a good place to initialize the element, create the shadow DOM, and set up
event listeners.

### connectedCallback

Let's add the custom element to the DOM by appending it to the body of the document. The `home-page.js` file should now
look like this:

```javascript
import { HelloLifecycle } from '../components/hello-lifecycle';

// Creating an instance of the custom element
const element = new HelloLifecycle();

// Appending the element to the DOM
document.body.appendChild(element);
```

Running the code above will log the following messages to the console:

```text
ObservedAttributes
Constructor: Element created
ConnectedCallback: Element added to DOM
```

The `connectedCallback` is called when the element is added to the DOM. This is the second lifecycle callback that is
called when a custom element is created. The connectedCallback is a good place to perform tasks that require the element
to be in the DOM, such as fetching data from an API or setting up a timer.

### attributeChangedCallback

Let's change the value of the `lifecycle` attribute of the custom element by adding the following code to the
`home-page.js` file:

```javascript
import { HelloLifecycle } from '../components/hello-lifecycle';

// Creating an instance of the custom element
const element = new HelloLifecycle();

// Appending the element to the DOM
document.body.appendChild(element);

// Setting the value of the lifecycle attribute
element.setAttribute('lifecycle', 'changed');
```

Running the code above will log the following messages to the console:

```text
ObservedAttributes
Constructor: Element created
ConnectedCallback: Element added to DOM
AttributeChangedCallback: lifecycle changed from null to changed
```

And because we set the textContent of the element to `'Hello Lifecycle'` in the `connectedCallback`, the element will
now display the text `Hello Lifecycle` within the browser.

The `attributeChangedCallback` is called when an observed attribute changes. This is the third lifecycle callback that
is called when a custom element is created. The attributeChangedCallback is a good place to update the element's
internal state based on the new attribute value. Note that we changed the value of the `lifecycle` attribute after the
element was added to the DOM. This is why the `attributeChangedCallback` is called after the `connectedCallback`.
Normally you would set the attribute value before adding the element to the DOM, by passing it as an attribute within
the custom element tag in the HTML. In that case the `attributeChangedCallback` would be called before the
`connectedCallback`. Give it a try by exchaning the order of the `setAttribute` and `appendChild` calls in the
`home-page.js` file.

### disconnectedCallback

Let's remove the custom element from the DOM by removing it from the body of the document. The `home-page.js` file
should now look like this:

```javascript
import { HelloLifecycle } from '../components/hello-lifecycle';

// Creating an instance of the custom element
const element = new HelloLifecycle();

// Setting the value of the lifecycle attribute
element.setAttribute('lifecycle', 'changed');

// Appending the element to the DOM
document.body.appendChild(element);

// Removing the element from the DOM
document.body.removeChild(element);
```

Running the code above will log the following messages to the console:

```text
ObservedAttributes
Constructor: Element created
AttributeChangedCallback: lifecycle changed from null to changed
ConnectedCallback: Element added to DOM
DisconnectedCallback: Element removed from DOM
```

The `disconnectedCallback` is called when the element is removed from the DOM. This is the fourth lifecycle callback
that is called when a custom element is created. The disconnectedCallback is a good place to clean up resources, such as
removing event listeners or stopping timers.

### conclusion

Changing the `/src/view/pages/home-page.js` file to the following will demonstrate the full lifecycle of the custom
element.

```javascript
import '../components/hello-lifecycle';
```

And adding the following code to the `index.html` file will demonstrate the full lifecycle of the custom element.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="icon" type="image/svg+xml" href="./javascript.svg" />
    <link rel="stylesheet" href="./styles.css" />

    <script type="module" src="./src/view/pages/home-page.js"></script>

    <title>Vanilla Web Components</title>
  </head>
  <body>
    <hello-lifecycle lifecycle="changed"></hello-lifecycle>
  </body>
</html>
```

The only hook that is missing now is the `disconnectedCallback`. This is because the element is never removed from the
DOM. If you want to see the `disconnectedCallback` in action, you could add a button to the `index.html` file that
triggers a JavaScript function that removes the element from the DOM when clicked.

## Pitfalls

### Rendering

On pitfall to be aware of is that element is not attached to the DOM when the `constructor` is called. This means that
is bad practice to render the element in the constructor, which might lead to unexpected behavior. Instead, you should
render the element in the `connectedCallback` method, which is called when the element is added to the DOM.

For example let's change the `constructor` of the `HelloLifecycle` element to the following:

```javascript
constructor() {
  super();
  console.log('Constructor: Element created');

  // Attempting to access a child element in the constructor
  this.innerHTML = '<div class="child">Child Element</div>';
  const child = this.querySelector('.child');
  console.log('Constructor: Child element', child); // This will log the child element
  // Trying to manipulate the child element
  if (child) {
    child.textContent = 'Updated in Constructor';
  }
}
```

Running the code above will log the following messages to the console:

```text
ObservedAttributes
Constructor: Element created
Constructor: Child element <div class="child">Child Element</div>
```

Which is what we would expect. However, if we now also change to the `connectedCallback` method to the following:

```javascript
  connectedCallback() {
    this.textContent = 'Hello Lifecycle';
    console.log('ConnectedCallback: Element added to DOM');

    const child = this.querySelector('.child');
    console.log('ConnectedCallback: Child element', child); // This will log the child element
    if (child) {
      child.textContent = 'Updated in ConnectedCallback';
    }
  }
```

We would expect the child element to be updated to `'Updated in ConnectedCallback'`. However, running the code above
will log the following messages to the console:

```text
ObservedAttributes
Constructor: Element created
Constructor: Child element <div class="child">Child Element</div>
ConnectedCallback: Element added to DOM
ConnectedCallback: Child element null
```

This is because the `connectedCallback` is called after the element is added to the DOM, which means that the child
element is not yet available in the `connectedCallback` method. This is why it is best practice to render the element in
the `connectedCallback` method, which is called when the element is added to the DOM.

### Fetching data

Another pitfall to be aware of is the timing of fetching data. If you fetch data in the `constructor` method, you might
run into issues. This is because the `constructor` method is called _synchronously_ when the element is created, while
data fetching is _asynchronous_. This might lead to a situation where the constructor method is finished and the next
lifecyclehook (the `connectedCallback` is called) before the data is fetched. This might lead to unexpected behavior,
such as the element not rendering correctly or not at all.

To avoid this pitfall, you should initialize the properties that will display the fetched data in the `constructor`
method with default values, like an empty string or an empty array. In the `connectedCallback` method, you can then
fetch the data and update the properties with the fetched data and render the element with the updated properties. This
way you can be sure that the data is fetched before the element is rendered.

### Removing Event listeners and timers

Another pitfall to be aware of is that you should always remove event listeners and stop timers in the
`disconnectedCallback` method. If you don't remove event listeners and stop timers, they will keep running in the
background, which might lead to memory leaks, performance issues and unexpected behavior. Debugging these issues can be
difficult, because the event listeners and timers are still running even though the element is removed from the DOM.

---

## Sources

- [MDN Web Docs: Custom Elements v1: Custom Element Lifecycle Callbacks](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_custom_elements#custom_element_lifecycle_callbacks)

---

:house: [Home](../README.md) | :arrow_backward: [Hello ShadowDOM](./hello-shadowdom.md) | :arrow_up:
[Vanilla Web Components](./README.md) | [Challenges](./challenges.md) :arrow_forward:
