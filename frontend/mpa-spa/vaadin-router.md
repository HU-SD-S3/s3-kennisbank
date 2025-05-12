# Vaadin Router

The Vaadin Router is a client-side router library built by [Vaadin](https://vaadin.com/), that can be used in
combination with Lit. There are other router libraries available that can be used with Lit, but most of them are not
maintained anymore. The Vaadin Router is the most popular and widely used router library for Lit applications.  
The Lit team itself also is working on a [lit-router](https://github.com/lit/lit/tree/main/packages/labs/router)
library, but that project doesn't seem to have any priority at the moment and is far from finished.

## Installing the Vaadin Router

To use the Vaadin Router, you need to install the `@vaadin/router` package. You can do this by running the following
command in your terminal:

```bash
npm install --save @vaadin/router
```

This will install the Vaadin Router package and add it to your `package.json` file.

To demonstrate how to use the Vaadin Router, we will use the code from the [routing basics](./routing-basics.md)
example. All we need to change in that code, to make use of the vaadin router, is the `app.js` file. The updated
`app.js` file will look like this:

## Routing setup

```javascript
import { Router } from '@vaadin/router';
import './pages/index-page';
import './pages/about-page';

const bodyElement = document.querySelector('body');

const router = new Router(bodyElement);

router.setRoutes([
  { path: `/`, component: 'index-page' },
  { path: `/index.html`, component: 'index-page' },
  { path: `/about.html`, component: 'about-page' },
]);

export { router };
```

This code will result in the same behavior as the code of the [routing basics](./routing-basics.md) example. In this
code, we import the `Router` class from the `@vaadin/router` package and create a new instance of the router. We pass
the `body` element as the first argument to the `Router` constructor. This tells the router where to render the
components. The second argument is an array of routes, where each route is an object with a `path` and a `component`
property. The `path` property is the URL path that will trigger the route, and the `component` property is the name of
the component that will be rendered when the route is triggered.

The exported `router` instance can be used in other parts of the application, for instance for parameterized routes.

## Parameterized routes

Imagine that you site contains a list of products and you want to show the details of a product on a separate page. You
can archive this by passing the product ID as an attribute to the web component, as discussed in the
[data exchange](../data-exchange/attributes-based-communication.md) section. But that would mean that the user could not
bookmark the page or share the URL, because the URL would not contain the product ID. Instead, you can use a
parameterized route. A parameterized route is a route that contains a placeholder for a value.

Lets extend our project with a product service class. Create a new file called `product-service.js` in the `src/service`
folder with the following content:

```javascript
class ProductService {
  constructor() {
    this.products = [
      {
        id: 1,
        name: 'Product 1',
        description: 'Description of Product 1',
      },
      {
        id: 2,
        name: 'Product 2',
        description: 'Description of Product 2',
      },
      {
        id: 3,
        name: 'Product 3',
        description: 'Description of Product 3',
      },
    ];
  }

  getAllProducts() {
    return new Promise((resolve) => {
      resolve([...this.products]);
    });
  }

  getProduct(id) {
    return new Promise((resolve, reject) => {
      const foundProduct = this.products.find((product) => product.id === id);
      if (!foundProduct) {
        reject(new Error(`Product with id ${id} not found`));
        return;
      }
      resolve(foundProduct);
    });
  }
}

const productService = new ProductService();

export { productService };
```

This class will provide us with a list of products and a method to get a single product by its ID.

Next we add a new web component to list the products by their name and linking them to the product details page. Create
a new file called `product-list.js` in the `src/view/components` folder with the following content:

```javascript
import { LitElement, html } from 'lit';
import { productService } from '../../service/product-service';

export class ProductList extends LitElement {
  static get properties() {
    return {
      products: { type: Array },
    };
  }

  constructor() {
    super();
    this.products = [];
  }

  connectedCallback() {
    super.connectedCallback();
    productService.getAllProducts().then((products) => {
      this.products = products;
    });
  }

  render() {
    return html`
      <h2>Product List</h2>
      <ul>
        ${this.products.map(
          (product) => html`
            <li>
              <a href="./product/${product.id}"> ${product.name} </a>
            </li>
          `
        )}
      </ul>
    `;
  }
}

customElements.define('product-list', ProductList);
```

As you can see in the `render()` method, we are linking the product name to a page with the URL
`./product/${product.id}`. This means we need to setup a parameterized route in the `app.js` file. We can do this by
adding a new route to the `setRoutes()` method:

```javascript
import { Router } from '@vaadin/router';
import './pages/index-page';
import './pages/about-page';
import './pages/product-page';

const bodyElement = document.querySelector('body');

const router = new Router(bodyElement);

router.setRoutes([
  { path: '/', component: 'index-page' },
  { path: '/index.html', component: 'index-page' },
  { path: '/about.html', component: 'about-page' },
  { path: '/product/:id', component: 'product-page' },
]);

export { router };
```

The route `path: '/product/:id'` is a parameterized route. The `:id` part is a placeholder for the product ID. All that
remains is to create a new web component that will be rendered when the user clicks on a product name. Create a new file
called `product-page.js` in the `src/view/pages` folder with the following content:

```javascript
import { LitElement, html } from 'lit';
import { router } from '../app';
import { productService } from '../../service/product-service';

export class ProductPage extends LitElement {
  static properties = {
    product: { type: Object },
  };

  constructor() {
    super();
    this.product = null;
  }

  connectedCallback() {
    super.connectedCallback();
    const productId = Number(router.location.params.id);

    productService
      .getProduct(productId)
      .then((product) => {
        this.product = product;
        console.log(product);
      })
      .catch((error) => {
        console.error(error);
        this.product = null;
      });
  }

  render() {
    console.log(this.product);
    return html`
      <nav-bar></nav-bar>
      <main>
        ${this.product
          ? html`
              <h1>${this.product?.name}</h1>
              <p>${this.product?.description}</p>
            `
          : html` <h1>Product not found</h1> `}
      </main>
    `;
  }
}

customElements.define('product-page', ProductPage);
```

If you take a closer look at the `ProductPage` class, you will see that we are using the `router` instance we exported
from the `app.js`. We use this instance to determine the product ID from the URL. We could have also used the
`window.location` object, but then we would have to use string manipulation to extract the product ID from the URL. The
`router` instance provides a more convenient way to access the URL parameters, using the `location.params` property.

> [!NOTE]
>
> The values of the `location.params` property are always strings. So if you want to use them as numbers, you need to
> convert them to numbers first.

Once we now the product ID, we can use the `productService` to get the product details. If the product is found, we
store it in the `product` property and render it in the `render()` method. If the product is not found, we set the
`product` property to `null` and render a message indicating that the product was not found.

## Fallback routes

In the previous example, we have catched the error when the product was not found and rendered a message indicating that
the product was not found. But actually we should have used a fallback route indicating that the page was not found.

Let's start by creating a new web component that will be rendered when the user tries to access a page that does not
exist. Create a new file called `not-found-page.js` in the `src/view/pages` folder with the following content:

```javascript
import { LitElement, html } from 'lit';
import '../components/nav-bar.js';

export class PageNotFound extends LitElement {
  render() {
    return html`
      <nav-bar></nav-bar>
      <main>
        <h1>Page Not Found</h1>
        <p>The page you are looking for does not exist.</p>
      </main>
    `;
  }
}

customElements.define('page-not-found', PageNotFound);
```

To show this page whenever the user tries to access a page that does not exist, we need to add a fallback route to the
`setRoutes()` method in the `app.js` file. The fallback route should be the last route in the array of routes. The
updated `app.js` file will look like this:

```javascript
import { Router } from '@vaadin/router';
import './pages/index-page';
import './pages/about-page';
import './pages/product-page';
import './pages/page-not-found';

const bodyElement = document.querySelector('body');

const router = new Router(bodyElement);

router.setRoutes([
  { path: '/', component: 'index-page' },
  { path: '/index.html', component: 'index-page' },
  { path: '/about.html', component: 'about-page' },
  { path: '/product/:id', component: 'product-page' },
  { path: '(.*)', component: 'page-not-found' },
]);

export { router };
```

The last route in the array is the fallback route. The `path` property is set to `(.*)`, which means that it will match
any URL that does not match any of the previous routes.

So if the user now tries to access a URL like `/somewhere.html`, the router will not find a matching route and will
render the `page-not-found` component.

But if the user tries to access a URL like `/product/4`, the router will find the route with the `path: '/product/:id'`
and will render the `product-page` component, so we need to redirect the user to the `page-not-found` page if the
product is not found. To do so, we need to import the `Router` class in the `product-page.js` file and add a
`Router.go()` method call in the `catch()` block of the `getProduct()` method. The updated `product-page.js` file will
look like this:

```javascript
import { LitElement, html } from 'lit';
import { Router } from '@vaadin/router';
import { router } from '../app';
import { productService } from '../../service/product-service';

export class ProductPage extends LitElement {
  static properties = {
    product: { type: Object },
  };

  constructor() {
    super();
    this.product = null;
  }

  connectedCallback() {
    super.connectedCallback();
    const productId = Number(router.location.params.id);

    productService
      .getProduct(productId)
      .then((product) => {
        this.product = product;
        console.log(product);
      })
      .catch((error) => {
        console.error(error);
        this.product = null;
        Router.go(`${import.meta.env.BASE_URL}404`);
      });
  }

  render() {
    console.log(this.product);
    return html`
      <nav-bar></nav-bar>
      <main>
        ${this.product
          ? html`
              <h1>${this.product?.name}</h1>
              <p>${this.product?.description}</p>
            `
          : html` <h1>Product not found</h1> `}
      </main>
    `;
  }
}

customElements.define('product-page', ProductPage);
```

It doesn't matter where you redirect the user to, as long as you redirect them to a page that doesn't exist. The
fallback route will then be triggered and the `page-not-found` component will be rendered.

## Lifecycle hooks

We handled the routing of a non existing product within the `product-page.js` itself, and that solved our problem. But
the that the product id was non existing was something our code discovered after the page was loaded and rendered once
(with `this.product = null`).

The Vaadin Router provides a way to handle this in a more elegant way, by using lifecycle hooks. The router provides a
`onBeforeEnter` lifecycle hook that is called before the route is entered.

We can adapt the `product-page.js` file to use the `onBeforeEnter` lifecycle hook. We remove the code that fetches the
product from the connnectedCallback and move it to the `onBeforeEnter`. On the console we can see that the
`onBeforeEnter` method is called before the page is rendered. The updated `connectedCallback` and `onBeforeEnter`
methods of the `product-page.js` will look like this:

```javascript
  ...

  connectedCallback() {
    super.connectedCallback();
    console.log("ProductPage connectedCallback");
  }

  async onBeforeEnter(location, commands) {
    console.log("onBeforeEnter", location, commands, router);
    const productId = Number(location.params.id);

    // we don't want the onBeforeEnter to finish before the product is fetched
    // so we wait for the product to be fetched
    try {
      this.product = await productService.getProduct(productId);
    } catch (error) {
      console.log("Product not found => redirecting to 404");
      return commands.redirect(`/404`); // Redirect to 404 page
    }
    return true; // Allow navigation
  }

  ...
```

As you can see from the code above, we are using the `location` and `commands` parameters to get the product ID and to
redirect Except for the `onBeforeEnter` method, the vaadin router also provides other lifecycle hooks, like
`onAfterEnter`, `onBeforeLeave` and `onAfterLeave`. You can use these hooks to perform actions when the route is entered
or left. For example, you can use the `onBeforeLeave` hook to prompt the user to confirm if they want to leave the page.
This can be useful if the user has unsaved changes on the page.

## Route guards

But how should we handle the routing if for instance the user didn't had the permission to access a page? We could add a
onBeforeEnter method with a redirect in each page, but that would be a lot of duplicate code, which is not easy to
maintain. This is were route guards come in. A route guard is a function that is called before the route is entered. You
can use this function to check if the user has the permission to access the page, but also to apply other navigation
logic, like checking what the next page should be given the currents state of the application.

Implementing a route guard is very simple. Within the `setRoutes()` method, you can add an `action` property to a route.
The `action` property is a function that is called before the route is entered. The function receives the `location` and
`commands` parameters, which are the same as the ones passed to the `onBeforeEnter` method. The function should return a
boolean value or a promise that resolves to a boolean value. If the function returns `true`, the route is entered. If it
returns `false`, the route is not entered and the user is redirected to the previous page. If the function returns a
promise, the router will wait for the promise to resolve before entering the route. If the promise resolves to `true`,
the route is entered. If it resolves to `false`, the route is not entered and the user is redirected to the previous
page. We can however also use the `commands` parameter to redirect the user to a different page.

If we want to set a route guard for the `/product/:id` route, so that the route will only be entered if the product
exists, our `app.js` file will look like this:

```javascript
import { Router } from '@vaadin/router';
import './pages/index-page';
import './pages/about-page';
import './pages/product-page';
import './pages/page-not-found';

import { productService } from '../service/product-service';

const bodyElement = document.querySelector('body');

const router = new Router(bodyElement);

// eslint-disable-next-line max-statements
async function isValidProductId(context, commands) {
  console.log('isValidProductId', context, commands);
  const productId = Number(context.params.id);
  if (isNaN(productId)) {
    console.log('Invalid product ID => redirecting to 404');
    return commands.redirect(`/404-NaN`);
  }
  try {
    const product = await productService.getProduct(productId);
    if (!product) {
      console.log('Product not found => redirecting to 404');
      return commands.redirect(`/404-Product-Not-Found`);
    }
  } catch (error) {
    console.error('Error fetching product:', error);
    return commands.redirect(`/404-Product-Not-Found`);
  }
  return true;
}

router.setRoutes([
  { path: '/', component: 'index-page' },
  { path: '/index.html', component: 'index-page' },
  { path: '/about.html', component: 'about-page' },
  { path: '/product/:id', component: 'product-page', action: isValidProductId },
  { path: '(.*)', component: 'page-not-found' },
]);

export { router };
```

In the console you can see that the `isValidProductId` function is called before the route is entered, which can also be
seen if you enter a non existing product ID in the URL. The `isValidProductId` function will redirect the user to the
`page-not-found` page using a different URL, than the one we used in the `product-page.js` file.

However if you are using ESLint, you will get a warning that the `isValidProductId` function is too long, which can be solved by removing the console.logs statements.
But you will also get a error that ESLint expected a function expression instead of a function declaration.
This can be solved easyly by exchanging the line:

```javascript
async function isValidProductId(context, commands) {
```

with:

```javascript
const isValidProductId = async (context, commands) => {
```

## Final remarks

It took the Vaadin team a while to get the router library to the point where it is now. The library just recently reached version 2.0.0.
However, we discovered that the library has impact on the dev server. The dev server no longer always reloads the page when you change a file.
We also saw strange behavior like duplicated web components on a page.
All this could be solved by stopping the dev server and starting it again, as well as opening the site in a new tab.
But this is not something you want to do every time you change a file. Hopefully these issues will be solved soon.

---

## Sources

- [GitHub - Vaadin Router](https://github.com/vaadin/router)
- [Vaadin Router - Documentation](https://vaadin.github.io/router/)

---

:house: [Home](../README.md) | :arrow_backward: [Single Page Application (SPA) project setup](./spa-project-setup.md) |
:arrow_up: [Multiple- and Single-page applications](./README.md) | [Challenges](./challenges.md) :arrow_forward:
