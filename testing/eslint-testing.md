# ESLint Testing

ESLint is a static code analysis tool for identifying problematic patterns in JavaScript code. It helps developers
maintain a consistent coding style and catch potential errors before they become issues in production. ESLint can be
integrated into the development workflow to enforce coding standards and improve code quality. ESLint is not regarded as
a testing tool in the same way that unit tests or end-to-end tests are, but it can be used to ensure that the code
adheres to certain standards and best practices, which can also be considered a form of testing.

## Installation

Can can install ESLint in a project with the following command:

```bash
npm init @eslint/config@latest
```

This command will prompt you to answer a few questions about your project and then create an ESLint configuration file
`eslint.config.js` in the root of your project. You can also create this file manually and add your configuration
options.

The configuration file will look something like this:

```javascript
import js from '@eslint/js';
import globals from 'globals';
import { defineConfig } from 'eslint/config';

export default defineConfig([
  {
    files: ['**/*.{js,mjs,cjs}'],
    plugins: { js },
    extends: ['js/recommended'],
  },
  {
    files: ['**/*.{js,mjs,cjs}'],
    languageOptions: {
      globals: globals.browser,
    },
  },
]);
```

> [!NOTE]
>
> The default configuration file is a bit strange. For once it contains two objects that are targetting the same files.
> It doesn't support the latest JavaScript features by default and it doesn't apply any rules to the code. The result of
> this configuration is that ESLint will not give you any warnings or errors when you run it on your code.

Due to the issues with the default configuration file, we recommend to use the following configuration file instead:

```javascript
import js from '@eslint/js';
import globals from 'globals';
import { defineConfig } from 'eslint/config';

export default defineConfig([
  {
    files: ['**/*.{js,mjs,cjs}'],
    languageOptions: {
      globals: globals.browser,
      ecmaVersion: 'latest',
    },
    plugins: { js },
    rules: js.configs.all.rules,
  },
]);
```

To run ESLint on your project, we advise to add a script to your `package.json` file:

```json
{
  "scripts": {
    "eslint": "eslint **/*.js"
  }
}
```

This script will run ESLint on all JavaScript files in your project. To run the ESLint script use the following command:

```bash
npm run eslint
```

## Configuration

Let's add a JavaScript file to our project to get started with the ESLint configuration. Create a file called `app.js`
in the `src` folder of you project and add the following code:

```javascript
var h = 7; // height
var w = 5; // width

function a(h, w) {
  return h * w * 10;
}

console.log(h + ' * ' + w + ' = ' + a(h, w));
```

If we now run ESLint with `npm run eslint`, we will get the following output:

```bash
C:\kennisbank-testing\eslint.config.js
   2:1  error  Imports should be sorted alphabetically                                                  sort-imports
   3:1  error  Imports should be sorted alphabetically                                                  sort-imports
  10:7  error  Expected object keys to be in ascending order. 'ecmaVersion' should be before 'globals'  sort-keys

C:\kennisbank-testing\src\app.js
  1:1   error  Unexpected var, use let or const instead                       no-var
  1:5   error  Identifier name 'h' is too short (< 2)                         id-length
  1:12  error  Comments should not begin with a lowercase character           capitalized-comments
  1:12  error  Unexpected comment inline with code                            no-inline-comments
  2:1   error  Combine this with the previous 'var' statement                 one-var
  2:1   error  Unexpected var, use let or const instead                       no-var
  2:5   error  Identifier name 'w' is too short (< 2)                         id-length
  2:12  error  Comments should not begin with a lowercase character           capitalized-comments
  2:12  error  Unexpected comment inline with code                            no-inline-comments
  4:1   error  Expected a function expression                                 func-style
  4:10  error  Identifier name 'a' is too short (< 2)                         id-length
  4:12  error  Identifier name 'h' is too short (< 2)                         id-length
  4:12  error  'h' is already declared in the upper scope on line 1 column 5  no-shadow
  4:15  error  Identifier name 'w' is too short (< 2)                         id-length
  4:15  error  'w' is already declared in the upper scope on line 2 column 5  no-shadow
  5:16  error  No magic number: 10                                            no-magic-numbers
  8:1   error  Unexpected console statement                                   no-console
  8:13  error  Unexpected string concatenation                                prefer-template

✖ 21 problems (21 errors, 0 warnings)
  6 errors and 0 warnings potentially fixable with the `--fix` option.
```

As you can see, ESLint has found a lot of errors. Not only has found it found errors in our `app.js` file, but also in
our `eslint.config.js` file. But The same might be true for the fourth error about inline comments. We can change this
by setting the rule to `warn` instead of `error`. if we look at the errors it had found in the `eslint.config.js` file,
we can see that those errors are less relevant to us, since they are about the alphabetical order of the imports and the
order of the keys in the object. We can safely configure ESLint to ignore those kinds of errors in all js files of our
project, by destructuring the `rules` object using the `...` (spread) operator and then setting the specific rules to a
different value. Turning the rules for `sort-keys` and `sort-imports` off, will result in the following configuration:

```javascript
import js from '@eslint/js';
import globals from 'globals';
import { defineConfig } from 'eslint/config';

export default defineConfig([
  {
    files: ['**/*.{js,mjs,cjs}'],
    languageOptions: {
      globals: globals.browser,
      ecmaVersion: 'latest',
    },
    plugins: { js },
    rules: {
      ...js.configs.all.rules,
      'sort-keys': 'off',
      'sort-imports': 'off',
    },
  },
]);
```

We now can take a look at the remaining 18 errors about our 8 lines long `app.js` file. The first error is about the use
of `var` instead of `let` or `const`. This is a good rule to follow.  
The second error is about the length of the variable names. This is a bit subjective, but try to use meaningful names
for your variables.  
The third error is about the use of lowercase characters in comments. We can twist with our development team about this
rule, but we might agree that this rule should not result in an error, but a warning. We can change this by setting the
rule to `warn` instead of `error`.  
The same might be true for the fourth error about inline comments. We can change this by setting the rule to `warn`
instead of `error`.

TODO: Give a brief overview of ESLint and its purpose in the context of testing.  
TODO: Explain how to set up ESLint in a project, including installation and configuration steps.  
TODO: Provide examples of common ESLint rules and how they can be used to enforce coding standards.  
TODO: Go into creating custom ESLint rules and plugins for specific project needs / our own ESLint rules for this
course.

---

## Sources

- [ESLint](https://eslint.org/)

---

:house: [Home](../README.md) | :arrow_up: [Testing](./README.md) | [A11Y Testing](./a11y-testing.md) :arrow_forward:

```

```
