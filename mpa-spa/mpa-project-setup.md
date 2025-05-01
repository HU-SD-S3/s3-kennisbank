# Multiple Pages Application (MPA) Project Setup

As the name suggests, a multiple-page application (MPA) is a web application that consists of multiple pages. Each page
is a separate HTML document, and when the user navigates to a different page, the browser loads a new HTML document from
the server.

For each page load, the browser requests a new HTML document from the server, which means that the entire page is
reloaded. This makes it necessary that each page has a base tag in the head section of the HTML document. But is also
means that the JavaScript variables are reset with each page load. This might require the application to fetch data from
the server again, which can be inefficient and slow. Also note that a user will notice the rerendering of the page and
will not be able to use the page while the page is loading, which can lead to a poor user experience.

The advantage of an MPA is that it is easier to implement and maintain than its alternatieve, a single-page application
(SPA). An MPA is also more Search Engine Optimization (SEO) friendly, as each page can be indexed by search engines.
This makes it easier for users to find the application through search engines. An MPA is also easier to implement for
smaller applications, as it does not require a complex JavaScript framework or library. This makes it easier to get
started with web development.

Imagine that we are building a very simple MPA with two pages: a home page and a about page, who share a common web
component for the navigation bar. The code for the `index.html` file might than be as follows:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <base href="%BASE_URL%" />

    <link rel="icon" type="image/svg+xml" href="./vite.svg" />

    <title>Kennisbank MPA-SPA</title>

    <script type="module" src="./src/view/pages/index-page.js"></script>
  </head>
  <body>
    <nav-bar></nav-bar>
    <main>
      <h1>Home Page</h1>
      <p>Navigate to the <a href="about.html">About Page</a>.</p>
    </main>
  </body>
</html>
```

While the code for the `about.html` file might look like this:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <base href="%BASE_URL%" />
    <title>Kennisbank MPA-SPA</title>
    <script type="module" src="./src/view/pages/about-page.js"></script>
  </head>
  <body>
    <nav-bar></nav-bar>
    <main>
      <h1>About Page</h1>
      <p>Navigate to the <a href="./">Home Page</a></p>
    </main>
  </body>
</html>
```

The content of the `index-page.js` and that of the `about-page.js` file are in this case the identical, since they are
both only importing the `nav-bar.js` file.

```javascript
import '../components/nav-bar';
```

And the `nav-bar.js` file is a web component that is used to display the navigation bar. The code for the `nav-bar.js`
is:

```javascript
import { LitElement, html, css } from 'lit';

export class NavBar extends LitElement {
  static styles = css`
    :host {
      display: block;
      background-color: var(--nav-bar-background-color, #3e1de2);
      color: var(--nav-bar-text-color, #fff);
      padding: 1em;
    }

    nav {
      display: flex;
      justify-content: space-between;
    }

    a {
      color: inherit;
      text-decoration: none;
      padding: 1em;
    }

    a:hover {
      background-color: var(--nav-bar-link-hover-background-color, #3e1de2);
    }
  `;

  render() {
    return html`
      <nav>
        <a href="./">Home</a>
        <a href="./about.html">About</a>
      </nav>
    `;
  }
}

customElements.define('nav-bar', NavBar);
```

When we run the application using the `npm run dev` command, we can see that the navigation bar is displayed on both pages, and that the links are working as expected.
But when we build the application using the `npm run build` command, and then start the preview server with `npm run preview` you will notice that the links are not working as expected.
If you click on the `About Page` link on the home page, nothing happens. This is the view preview server can't find the `about.html` file and therefore will serve you the `index.html` file instead.
And if we that a look at the distribution folder, we can see that the `about.html` file is indeed missing. This is because the `vite` build command only builds the files that are imported in the `index.html` file. And since you cannot import html files within an html file, it is not included in the build.

To fix this we need to add a rollup build rule for each html file of our project to the `vite.config.js` file.
This requires to add a `rollupOptions` object to the `build` object in the `vite.config.js` file and to import some functions from the `node:path` and `node:url` modules. The `rollupOptions` object contains an `input` object that specifies the entry points for the build. The entry points are the html files of the project. The `resolve` function is used to resolve the path to the html files, and the `dirname` and `fileURLToPath` functions are used to get the current directory of the vite.config.js file.
This can be done by adding the following code to the `vite.config.js` file:

```javascript
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { defineConfig } from 'vite';

const foldername = dirname(fileURLToPath(import.meta.url))

export default defineConfig({
  base: '/',
  build: {
    outDir: 'dist',
    sourcemap: true,
    rollupOptions: {
      input: {
        main: resolve(foldername, 'index.html'),
        about: resolve(foldername, 'about.html'),
      }
    }
  }
});
```

The `input` object now contains two properties: `main` and `about`. The names of these properties can be freely chosen, but it is recommended to use the name of the html file without the extension.

> [!NOTE]
>
> The vite documentation uses a variable `__dirname`. To solve the ESLint errors with that variable name we renamed the variable to `foldername`.

---

## Sources

- [Vite documentation](https://vite.dev/guide/build.html#multi-page-app)
---

:house: [Home](../README.md) | :arrow_backward: [Vite project setup basics](./vite-project-setup-basics.md) | :arrow_up:
[Multiple- and Single-page applications](./README.md) | [SPA project setup](./spa-project-setup.md) :arrow_forward:
```
