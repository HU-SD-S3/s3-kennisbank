# Vaadin Router

The Vaadin Router is a client-side router library built by [Vaadin](https://vaadin.com/), that can be used in
combination with Lit. There are other router libraries available that can be used with Lit, but most of them are not
maintained anymore. The Vaadin Router is the most popular and widely used router library for Lit applications.  
The Lit team itself also is working on a [lit-router](https://github.com/lit/lit/tree/main/packages/labs/router)
library, but that project doesn't seem to have any priority at the moment and is far from finished.

To use the Vaadin Router, you need to install the `@vaadin/router` package. You can do this by running the following
command in your terminal:

```bash
npm install --save @vaadin/router
```

This will install the Vaadin Router package and add it to your `package.json` file.

To demonstrate how to use the Vaadin Router, we will use the code from the [routing basics](./routing-basics.md) example.
All we need to change in that code, to make use of the vaadin router, is the `app.js` file.
The updated `app.js` file will look like this:

```javascript
import { Router } from "@vaadin/router";
import "./pages/index-page";
import "./pages/about-page";

const bodyElement = document.querySelector("body");

const router = new Router(bodyElement);

router.setRoutes([
  { path: `/`, component: "index-page" },
  { path: `/index.html`, component: "index-page" },
  { path: `/about.html`, component: "about-page" },
]);
```

In this code, we import the `Router` class from the `@vaadin/router` package and create a new instance of the router.
We pass the `body` element as the first argument to the `Router` constructor. This tells the router where to render the
components. The second argument is an array of routes, where each route is an object with a `path` and a `component`
property. The `path` property is the URL path that will trigger the route, and the `component` property is the name of
the component that will be rendered when the route is triggered.

---

## Sources

---

:house: [Home](../README.md) | :arrow_backward: [Single Page Application (SPA) project setup](./spa-project-setup.md) |
:arrow_up: [Multiple- and Single-page applications](./README.md)
