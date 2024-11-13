# Vanilla Web Components Project Setup

**Enablerstory**: _As a developer, I want to setup a new project for learning about Vanilla Web Components, so that I can learn about the basics of custom elements, ShadowDOM, and lifecycle callbacks._

## Vite setup

Start with creating a vite project.
  
  ```bash
  npm init vite@latest
  ``` 

Choose the following options:
Project name: vanilla-web-components
Framework: vanilla
Select a variant: JavaScript

Open the new project in your code editor (in Visual Studio Code, select open Folder and open the newly created vanilla-web-components folder), in order to always have your terminal open in the project folder and not in the parent folder.

Install the dependencies:

```bash
npm install
```

Run the development server:

```bash
npm run dev
```

Open the link the dev server gives you in your web browser and you should see a page with a counter that can be increased by clicking on the button.

## Cleanup

The Vite project comes with a counter example that we don't need, so let's clean it up.

Remove files we don't need:
- styles.css
- main.js
- counter.js

and move the file javascript.svg into the public folder.

And change the content of index.html to:

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="icon" type="image/svg+xml" href="/javascript.svg" />
    
    <title>Vanilla Web Components</title>
  </head>
  <body>
  </body>
</html>
```

Start the development server, if it isn't already running, with:

```bash
npm run dev
```

Open the link the dev server gives you in your web browser. You should see a blank page with the title "Vanilla Web Components".

## Folders

Now let's create some folders to keep our project organized.

- Create a `src` folder at the root of the project.
- Create a `view` folder inside the `src` folder.
- Create a `components` folder inside the `view` folder.
- Create a `pages` folder inside the `view` folder.

## Main Script

Create a file `home-page.js` inside the `pages` folder. This will be the main script that will be loaded when the page is opened.
We therefore need to import this script in the `index.html` file.

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="icon" type="image/svg+xml" href="/javascript.svg" />

    <script type="module" src="./src/view/pages/home-page.js"></script>
    
    <title>Vanilla Web Components</title>
  </head>
  <body>
  </body>
</html>
```

To check that the script is loaded correctly, add a `console.log` statement to the script:

```javascript
console.log('Home Page loaded');
```

Open the link the dev server gives you in your web browser and open the developer tools of the browser (`Ctrl`+`Shift`+i | `Cmd`+`Shift`+i). You should see the message "Home Page loaded" in the console.
Once this works, you can remove the `console.log` statement, to keep the console and your code clean.

---
## Sources:

Vite - [Getting Started guide](https://vite.dev/guide/)

---

:house: [Home](../README.md) | :arrow_up: [Learning Stories](./README.md) | [Hello World](./hello-world.md) :arrow_forward: