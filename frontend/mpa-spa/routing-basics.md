# Routing basics

In this section we will transform the two pages application we created in the
[MPA project setup](./mpa-project-setup.md) section into a SPA.

We start by transforming the JavaScript code in the `/src/view/pages/` folder into web components that show the content
of their html file. So the `index-page.js` file will look like this:

```javascript
import { LitElement, html } from 'lit';
import '../components/nav-bar';

export class IndexPage extends LitElement {
  render() {
    return html`
      <nav-bar></nav-bar>
      <main>
        <h1>Home Page</h1>
        <p>Navigate to the <a href="./about.html">About Page</a></p>
      </main>
    `;
  }
}

customElements.define('index-page', IndexPage);
```

and the `about-page.js` file will look like this:

```javascript
import { LitElement, html } from 'lit';
import '../components/nav-bar';

export class AboutPage extends LitElement {
  render() {
    return html`
      <nav-bar></nav-bar>
      <main>
        <h1>About Page</h1>
        <p>Navigate to the <a href="./">Home Page</a></p>
      </main>
    `;
  }
}

customElements.define('about-page', AboutPage);
```

And since we are now using a single page application we can remove the `about.html` file. We also need to set the
`vite.config.js` file to only build the `index.html` file.

```javascript
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { defineConfig } from 'vite';

const foldername = dirname(fileURLToPath(import.meta.url));

export default defineConfig({
  base: '/',
  build: {
    outDir: 'dist',
    sourcemap: true,
    rollupOptions: {
      input: {
        main: resolve(foldername, 'index.html'),
      },
    },
  },
});
```

The body part in our `index.html` file can be cleared, since we will fill it with the content of the web component of
the page we want to show. But we no longer can use the `index-page` and `about-page` web components as starting point of
our application. We need a new file that will be the entry point of our application and that will be responsible for
loading the correct page based on the URL. Lets call this file `app.js` and place it in the `/src/view/` folder. The
resulting `index.html` file will look like this:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <base href="%BASE_URL%" />

    <link rel="icon" type="image/svg+xml" href="./vite.svg" />

    <title>Kennisbank MPA-SPA</title>

    <script type="module" src="./src/view/app.js"></script>
  </head>
  <body></body>
</html>
```

This leaves us with the `app.js` file that will be responsible for loading the correct page based on the URL. Create a
new `app.js` file in the `/src/view/` folder, and give it the following content:

```javascript
const currentLocation = window.location;
console.log(currentLocation);
```

The `window.location` statement is a built-in JavaScript object that contains information about the current URL of the
document. It provides properties and methods to manipulate the URL, such as `href`, `protocol`, `host`, `pathname`, and
more. If you run the application now by navigating to `http://localhost:5173/` and open the console, you will see that
the `currentLocation` object contains a property called `pathname` that contains the path of the current URL. Navigate
now to `http://localhost:5173/about.html` (by changing the URL in the omni bar of your browser). Because we serving the
application using the vite dev server, we will not get a 404 error when we navigate to the `/about.html` page. The vite
dev server will instead again serve the `index.html` file. If you now check the console again, you will see that the
`pathname` property of the `currentLocation` object is now set to `/about.html`.

So let's use this information to manipulate the DOM based on the pathname property of the `currentLocation` object.

```javascript
import './pages/index-page';
import './pages/about-page';

const bodyElement = document.querySelector('body');

const currentLocation = window.location;
console.log(currentLocation);

// Clear the body element before rendering a new page
bodyElement.innerHTML = '';

switch (currentLocation.pathname) {
  case '/':
  case '/index.html': {
    // Render the index page
    const indexPage = document.createElement('index-page');
    bodyElement.appendChild(indexPage);
    break;
  }
  case '/about.html': {
    // Render the about page;
    const aboutPage = document.createElement('about-page');
    bodyElement.appendChild(aboutPage);
    break;
  }
  default: {
    console.error('Page not found');
  }
}
```

> [!NOTE]
>
> Note that the code above only works if the base URL of the application is set to `/`. To make the code more robust we
> can use the `base` environment variable (`import.meta.env.BASE_URL`)in the swtich statement by either removing the
> base URL from the pathname or by adding the base URL to each case in the switch statement.

This code will now give us the same result as with the MPA project setup, but now we are using a single html file and
hence a single page application (SPA).

However this code is not bulletproof yet. If you build the application and deploy it to a web server and navigate to the
`/about.html` page, you will get a 404 error, because the web server will not be able to find the `about.html` file. To
fix this we have to change the configuration of the web server to serve the `index.html` file in case of a 404 error.

Another common issue of SPAs is the ability to bookmark a page and to navigate back and forth between pages using the
browser's back and forward buttons, since those pages should be part of the browser's history. That's something we could
take care of by using the `history` API of the browser. This API allows us to manipulate the browser's history and to
change the URL shown in the omni bar of the browser without reloading the page.

Instead of writing this code ourselve, we will use the [vaadin router](https://vaadin.com/router) library to help us
with the routing.

---

## Sources

- [MDN Web Docs - Window: location property](https://developer.mozilla.org/en-US/docs/Web/API/Window/location)
- [MDN Web Docs - History API](https://developer.mozilla.org/en-US/docs/Web/API/History_API)

---

:house: [Home](../README.md) | :arrow_backward: [SPA project setup](./spa-project-setup.md) | :arrow_up:
[Multiple- and Single-page applications](./README.md) | [Vaadin Router](./vaadin-router.md) :arrow_forward:
