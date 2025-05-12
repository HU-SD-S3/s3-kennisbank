# Vite Project Setup Basics

Before we get into the details of setting up a Vite project for MPA or SPA, let's first discuss some basic concepts that
are important to understand when working with Vite.

## Default Page

Whenever you open a URL without a specific file name, like `https://hbo-i.nl` you will not be able to see in the URL bar
or the network inspector of the dev-tools of your browser what the filename of the page is. When don't provide a
specific file name, the web server you access will lookup the default file to be shown in his settings.

Usually, this is `index.html`, but that's not always the case. And if you open the URL `https://hbo-i.nl/index.html` you
will see the same content as when you open `https://hbo-i.nl`. But that doesn't mean that this is always the case. If
you for example try to open the URL `https://hu.nl/index.html` you will get a 404 error, because the web server of that
website is not configured to show `index.html` as the default file.

The default file to open when no file is specified can be configured in the web server settings. For example, in Apache,
you can use the `DirectoryIndex` directive to specify the default file. In Tomcat, you can use the `welcome-file`
directive in the `web.xml` file.

Vite also has a configuration file. If the file is absent, Vite will use the default settings. You can create a
configuration file for vite to change the default settings, by creating a file called `vite.config.js` in the root of
your project. Vite will look for this file when it starts up and will use the settings in this file to configure the
Vite dev server. The minimum construct of the vite configuration file looks like this:

```javascript
import { defineConfig } from 'vite';

export default defineConfig({
  // Vite configuration options go here
});
```

However, Vite doens't offer a setting to change the default file to be opened when no file is specified. It only offers
a setting to redirect to a specific file when the URL is opened without a file name. This is done by setting the `open`
property in the `server` object of the configuration file.

Vite also doesn't offer a setting to change the default file to show in case of a 404 error. The vite dev server will
just show the `index.html` file in case of a 404 error.

> [!WARNING]
>
> Know that the `server` setting only work in the Vite dev server and not in the production build.

## Paths

If we take a look at the code of a simple HTML page, we can see that it normally contains a lot of links to other
resources. For example, a link to a CSS file, a link to a JavaScript file, and links to images. These links are
specified using paths. A path is a way to specify the location of a file on the web server. There are two types of
paths: absolute paths and relative paths.

An absolute path is a path that starts with a `/` and specifies the location of a file relative to the root of the web
server. For example, the path `/css/style.css` specifies the location of the `style.css` file in the `css` folder in the
root of the web server. This means that the file can be accessed using the URL `https://hbo-i.nl/css/style.css`.

A relative path is a path that does not start with a `/` and specifies the location of a file relative to the current
directory of the file that holds the link. For example, if the HTML file that is loaded is located in the
`current-directory` folder, and the link tag for the stylesheet refers to the path `css/style.css`; it specifies the
location of the `style.css` file in the `css` folder in the current directory. This means that the file can be accessed
using the URL `https://hbo-i.nl/current-directory/css/style.css`. A relative path can also be a path that starts with
`./` or `../`. The `./` means the current directory and the `../` means the parent directory. For example, the path
`./css/style.css` specifies the location of the `style.css` file in the `css` folder in the current directory. This
means that the file can be accessed using the URL `https://hbo-i.nl/current-directory/css/style.css`. The path
`../css/style.css` specifies the location of the `style.css` file in the `css` folder in the parent directory. This
means that the file can be accessed using the URL `https://hbo-i.nl/parent-directory/css/style.css`.

If we host our project for production on a web server, we need to make sure that the paths in our HTML files are
correct. This is not only because the production server will have a different domain name, but also because the
directory structure of the production server may be different from the directory structure of the development server.
For example, if we host our project on GitHub Pages, the directory structure will be different from the directory
structure of the Vite dev server. On GitHub Pages, all repositories of a GitHub Organisation that use GitHub Pages are
hosted on the same sub domain name (`https://{GitHub-organisation-name}.github.io`). To differentiate between different
repositories hosting on GitHub Pages, GitHub uses the name of the repository as the subdirectory of the domain name
(`https://{GitHub-organisation-name}.github.io/{repository-name}`). This means that if we test our project on the Vite
dev server, and our HTML files contain an absolute path to a file, the Vite dev server might load the file correctly,
but when we host our project on GitHub Pages, the absolute path will not be correct anymore. So its better to use
relative paths in our HTML files. But even then we might run into problems, especially when we use external libraries
that are located in the `node_modules` folder. To solve this problem, we can use the `base` element in the `index.html`
file. The `base` element is used to specify the base URL for all relative URLs in the document. This means that all
relative URLs in the document will be resolved relative to the base URL specified in the `base` element. The `base`
element is usually placed in the `head` section of the HTML document.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <base href="subdir" />

    ...
  </head>
  ...
</html>
```

In the example above, the `base` element specifies that all relative URLs in the document will be resolved relative to
the `subdir` subdirectory. This means that if we have a file called `style.css` in the `css` folder, we can link to it
using the following relative path:

```html
<link rel="stylesheet" href="css/style.css" />
```

With the `base` element set to `subdir`, the browser will resolve the relative path to `subdir/css/style.css`.

This will work on both the Vite dev server and the production server, as long as the `base` element is set correctly.
Setting the `base` element hardcoded in the HTML file, means that we will have to change the `base` element in all of
our HTML files if we want to host our project on a different server. A better way to use the `base` element is to use
the `base` property in the Vite configuration file.

```javascript
import { defineConfig } from 'vite';

export default defineConfig({
  base: '/subdir/',
});
```

In the example above, the `base` property is set to `/subdir/`. This means that all relative URLs in the project will be
resolved relative to the `/subdir/` subdirectory. It will also create an evironment variable called `BASE_URL` that can
be used in the project. In our HTML files, we can now set the `base` element to the value of the `BASE_URL` environment
variable:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <base href="%BASE_URL%" />

    ...
  </head>
  ...
</html>
```

And in our JavaScript files, we can use the `import.meta.env.BASE_URL` variable to get the value of the `BASE_URL`.

## Bare Module Imports

Using external libraries in our project is a common practice. In this course for example, we regularly import
'LitElement' in our js files, using the statement:

```javascript
import { LitElement, html, css } from 'lit';
```

But `lit` is not a root folder in our project. It is a package that is installed in the `node_modules` folder. If we
would host our project files like this on a normal web server, the web server would not be able to find the `lit`
package. The web server would need the full path to the `lit` package in the `node_modules` folder to be able to load
the `lit` package. So the import statement would need to look like this:

```javascript
import { LitElement, html, css } from './node_modules/lit/index.js';
```

But why does this work in the Vite dev server? The Vite dev server is a special web server that is able to resolve these
imports, who are called **Bare Module Imports**, by building an internal import map. This import map is a JSON object
that maps the bare module name to the full path of the module in the `node_modules` folder. The Vite dev server uses
this **import map** to resolve the bare module imports to the full path of the module in the `node_modules` folder. This
means that we can use bare module imports in our project without having to specify the full path to the module in the
`node_modules` folder. This feature of Vite also allows us to use short notations when importing our own JS files,
something this course regularly does. For instance by calling:

```javascript
import { dataService } from '../services/';
import '../components/hello-world';
```

in a JS file in the `src/view/pages` folder, we import the `dataService` instance from the `services/index.js` file,
since we didn't specify a file name, the `index.js` file is automatically used. And for the `hello-world` component,
vite automatically adds the `.js` file extension to the import statement.

> [!NOTE]
>
> Bare Module Imports notations are not Vite specific. They are part of the JavaScript module system and are used by all
> modern JavaScript frameworks and libraries.

## Build Process

Since we can't just copy our project files to a web server and expect it to work, we need to build our project for
production. The build process solves the problem of resolving the bare module imports, but it also does a lot more.

With Vite the build process is done using the `npm run build` command. This command will create a `dist` folder in the
root of your project. This `dist` folder will contain all the files that are needed to run your project on a web server.
You can specify the output folder in the Vite configuration file by setting the `outDir` property of the `build` object.

```javascript
import { defineConfig } from 'vite';

export default defineConfig({
  base: '/subdir/',
  build: {
    outDir: 'webserver-files',
  },
});
```

If you now run the `npm run build` command, Vite will create a `webserver-files` folder in the root of your project.
This folder will contain all the files that are needed to run your project on a web server. If we take a look at the
contents of the `dist` folder, we can see that it contains the `index.html` file, the content of the `public` folder and
a `assets` folder.

The content of the `public` folder is copied to the root of the `dist` folder without being processed by Vite. This
means that that the files in the `public` folder are not changed in any way by Vite. This is also why you can reference
the files in the `public` folder as if they are in the root of the project.

The `assets` folder contains all the files that are needed to run your project on a web server, and may hold a single js
file that contains all the JavaScript code of your project. But taking a look of the content of the javascript file, you
will see that the file is not readable anymore. This is because Vite uses a process called **tree shaking** to remove
all the unused code from your project. Vite also uses a process called **minification** to reduce the size of the
JavaScript file by removing all the whitespace and comments from the file. This makes the file smaller and faster to
load.

You can also use the `npm run preview` command to preview your build. This command will start a local server on port
4173 and will serve the files from the distribution folder. This means that you can test your build before deploying it
to a web server. But if you encounter an error, it will be hard to debug the error, because the JavaScript file is not
readable anymore. This is where source maps come in handy. Source maps are files that map the minified code back to the
original code. This means that you can use the source maps to debug your code in the browser.

To enable source maps in Vite, you can set the `sourcemap` property in the `build` object of the Vite configuration
file. This will create a source map file for each JavaScript file in the `assets` folder. The source map files will be
created in the same folder as the JavaScript files and will have the same name as the JavaScript files, but with a
`.map` extension. When you now view the JavaScript file in the dev tools of your browser, you will also see the original
code in the dev tools. And the dev tools will also allow you to set breakpoints in the original code. This means that
you can debug your code in the browser as if it was the original code. To setup source maps in Vite, you can add the
`sourcemap` property to the `build` object in the Vite configuration file.

```javascript
import { defineConfig } from 'vite';

export default defineConfig({
  base: '/subdir/',
  build: {
    outDir: 'webserver-files',
    sourcemap: true,
  },
});
```

Vite offers a lot of other options to configure the build process. But most of these options are out of the scope of
this course. There is only one option left that we will cover in this course, but that's an option that is only needed
when you build a multiple pages application, and we will cover that in the next chapter, were we will go into Multiple
Pages Applications.

---

## Sources

- [Vite Documentation](https://vitejs.dev/guide/)
- [MDN Web Docs - HTML Base Tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base)
- [MDN Web Docs - JavaScript Modules](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules)

---

:house: [Home](../README.md) | :arrow_up: [Multiple- and Single-page applications](./README.md) |
[MPA project setup](./mpa-project-setup.md) :arrow_forward:
