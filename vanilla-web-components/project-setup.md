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

## Addons

Your project setup is now complete and you can start with the learning stories. But before you do that, I recommend you install some addons that can help you with your project.

### Prettier

Prettier is a code formatter that can help you keep your code clean and consistent.
You can add prettier to your project by running:

```bash
npm install --save-dev prettier
```

To configure prettier create a `prettier.config.js` file in the root of your project with the following content:

```javascript
module.exports = {
  semi: false,
  singleQuote: true,
  trailingComma: 'all',
  arrowParens: 'always',
};
```

### ESLint

ESLint is a linter that can help you find and fix problems in your JavaScript code. In the beginning the number of errors and warnings might be overwhelming, but you can fix them one by one and the number of errors and warnings should decrease relatively quickly.
Not all errors and warnings are relevant, but it's a good idea to at least look at the documentation of the rule that is violated to understand why it is there and if it is relevant for your project.
You can setup a configuration file for ESLint at the root of your project by running:

```bash
npm init @eslint/config@latest
```

You will than be asked some questions to setup the configuration file. On the question "How would you like to use ESLint?" choose "To check syntax and find problems". When asked "What type of modules does your project use?" choose "JavaScript modules (import/export)". And on the question "Where does your code run?" choose "Browser". And on the question "Which framework does your project use?" choose "None of these". On the question "Does your project use TypeScript?" choose "No". And on the question "Where does your code run?" choose "Browser".
You will then be informed that this configuration requires dependencies to be installed. On the question "Would you like to install them now?" choose "Yes". And select 'npm' as the package manager.

This will install the necessary dependencies and create a `eslint.config.js` file in the root of your project. You can modify this file to fit your needs, for instance to remove rules or to change the severity of rules.

Your eslint.config.js file could than look something like this:

```javascript
import globals from 'globals';
import pluginJs from '@eslint/js';
import prettier from 'eslint-config-prettier';

export default [
  pluginJs.configs.all,
  {
    languageOptions: {
      ecmaVersion: 'latest',
      globals: globals.browser,
      sourceType: 'module',
    },
    plugins: {
      prettier,
    },
    rules: {
      "no-console": "warn",
      "sort-keys": "off",
      "sort-imports": "off",
      "one-var": "off",
      "no-ternary": "off",
      "capitalized-comments": "off",
    },
  }
];
```

To run eslint on your project **add** the following script to your `package.json` file `scripts` section:

```json
  "eslint": "eslint src/**/*.js",
```

Running this script with:
  
  ```bash
  npm run eslint
  ```

will run eslint on all JavaScript files in the `src` folder and its subfolders.

### Visual Studio Code Extensions

Visual Studio Code ([VSC](https://code.visualstudio.com)) is the recommended IDE for developers, especially for web development. VSC can be customized with extensions to fit your needs. You can install extensions by searching for them in the Extensions view (`Ctrl`+`Shift`+x | `Cmd`+`Shift`+x`).
Here are some extensions that we recommend for the vanilla web components learning stories:

- [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) - This extension will format your code according to the Prettier rules. Once installed, you can format your code by right-clicking in the editor and selecting "Format Document" or by using the shortcut `Shift`+`Alt`+`F`. You might get a popup asking you which formatter to use. Choose Prettier.
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) - Once installed, you can see the errors and warnings in your IDE. But be aware that after te installation you might need to reload the window or restart VSC to see the errors and warnings.
- [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons) - This extension will show icons for different file types in the file explorer. This can help you to quickly see what type of file you are looking at.

---
## Sources:

- Vite - [Getting Started guide](https://vite.dev/guide/)
- ESLint - [Getting Started guide](https://eslint.org/docs/user-guide/getting-started)
- Prettier - [Getting Started guide](https://prettier.io/docs/en/install.html)
- Visual Studio Code - [Visual Studio Code](https://code.visualstudio.com)

---

:house: [Home](../README.md) | :arrow_up: [Learning Stories](./README.md) | [Hello World](./hello-world.md) :arrow_forward:
