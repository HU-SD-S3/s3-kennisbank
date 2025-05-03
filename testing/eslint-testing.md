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

This configuration file will enable all the rules that are available in ESLint. This is a good starting point for
configuring ESLint in your project. You can then disable or change the rules that you don't want to use in your project.

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

> [!NOTE]
>
> In case you have the `ESLint` extension installed in Visual Studio Code, you might need to reload the reload the
> window (`Ctrl+Shift+P` > `Reload Window`) each time you make changes to the `eslint.config.js` file, to make sure the
> extension (re)starts the ESLint server it uses to lint your code and show the errors in the editor based on your
> `eslint.config.js` file.

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
our `eslint.config.js` file. If we look at the errors it had found in the `eslint.config.js` file, we can see that those
errors are about the alphabetical order of the imports and the order of the keys in the object.  
For our course we can state that we don't care about the order of the imports and the order of the keys in the object.
We can safely ignore those errors not only in our configuration file, but in all JavaScript files of our project. But
just ignoring them would mean that our ESLint would still mark them as errors. This would be annoying and unproductive.
We can configure ESLint to ignore certain rules. What we need for that is the keyword of the rule, which we can find in
the error message. For example, the rule for the order of the imports is called `sort-imports` and the rule for the
order of the keys in the object is called `sort-keys`. With this information we can configure ESLint to turn those rules
`off`. The resulting configuration file will look like this:

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

We now can take a look at the remaining 18 errors about our 8 lines long `app.js` file.

The first type of error (`no-var`) is about the use of `var` instead of `let` or `const`. This is a good rule to follow,
so we keep it. Changing our two `var` statements to `let` statements will fix this error, but if we run eslint again we
will get a different error about our variable declaration:

```bash
    1:5   error  'h' is never reassigned. Use 'const' instead                   prefer-const
```

An error that is also worth fixing, so we also keep this `prefer-const` rule. If we can change our `h` and `w` variable
declarations to `const` statements we are down to 16 errors.

The second type of error is about the length of the variable names. This is a bit subjective, but try to use meaningful
names for your variables. ESlint indicates that our code contains 5 names that are too short. Let's fix them by changing
`h` to `height` and `w` to `width`. This will fix 4 of the 5 errors. The last error is about the function name `a`. We
can change this to `area` to make it more meaningful. We are now down to 11 errors remaining.

The next type of error (`capitalized-comments`) is about the use of lowercase characters in comments. We can twist with
our development team about this rule, but we might agree that this rule should not result in an error, but in a warning.
We can change this by changing our `eslint.config.js` file, adding a rule that sets `capitalized-comments` to `warn`.

The same might be true for the following type of error (`no-inline-comments`). We can change this by setting the rule to
`warn` instead of `error`. Resulting now in 11 problems (7 errors, 4 warnings).

We then come across the `one-var` rule, that has the description `Combine this with the previous 'const' statement`. But
what is the meaning of this? In case you are using Visual Studio Code with the ESLint extension, you can hover over the
error and it will show you a dialog box were you can click on the rule name and it will open a browser tab and take you
to the documentation of the rule. In this case of the `one-var` rule it will open the url:
[https://eslint.org/docs/latest/rules/one-var](https://eslint.org/docs/latest/rules/one-var). In the first paragraph of
this documentation it states that there are two schools of thought about this rule:

1. There should be just one variable declaration for all variables in the function. That declaration typically appears
   at the top of the function.
2. You should use one variable declaration for each variable you want to define.

We are more in favor of the second school of thought. Reading on in the documentation we can see the options for this
rule as well as examples of code that is not allowed for each option and code that is allowed. This results in the
following configuration for the `one-var` rule:

```javascript
'one-var': ['error', 'never'],
```

Applying this rule will result in 10 problems (6 errors, 4 warnings).

The next type of error is about the function style. The `func-style` rule has the description Expected a function
expression. We can again look up the documentation for this rule and see what the alternatives are for writing
functions. They would indead result in a better readability of the code. But since we might not familiar with the arrow
function syntax, we can leave this rule as is for now in our `eslint.config.js`file. But that would leave us with an
error in our code. So instead of changing the `eslint.config.js` file, we can also disable the rule for just this
function in our`app.js` file using an ESLint directive comment. We also added a `TODO:` comment to this code, to remind
us to change this function to use the arrow notion. `TODO:` and `FIXME:` comments are not part of the ESLint rules, but
are a convention that is used in many projects. You can use them to mark code that needs to be changed or fixed in the
future. The resulting code will look like this:

```javascript
// eslint-disable-next-line func-style
function area(height, width) {
  // TODO: Have to change the function to use arrow function syntax,
  //  so that we can remove the eslint-disable-next-line
  return height * width * 10;
}
```

So we solved another error, but when we run ESLint again we get a new error about the TODO: comment.

```bash
4:1   error    Unexpected 'todo' comment: 'TODO: Have to change the function to use...'  no-warning-comments
```

Discussing this with our development team we can agree that we want to keep the `TODO:` and `FIXME:` comments, so we
turn those kind of errors off.

Before we go into the next type of error (`no-shadow`), we will first take a look at the `no-magic-numbers` rule. It
complains about the number `10` in our code. This is a magic number, which means that it is a number that is used in the
code without any explanation of what it means. This is a good rule to follow, because if you take a look at the code in
the future, you might not remember what this number means and therefore why you used it. We can fix this by creating a
constant for the number `10` with a meaningful name and using that constant in our code. The reason we multiplied the
area with `10` was because we wanted to convert the height and width from centimeters to minimeters. So we can create a
constant called `CM_TO_MM` and use that in our code. The resulting code will look like this:

```javascript
const height = 7; // height
const width = 5; // width

// eslint-disable-next-line func-style
function area(height, width) {
  // TODO: Have to change the function to use arrow function syntax,
  //  so that we can remove the eslint-disable-next-line
  const CM_TO_MM = 10; // 1 cm = 10 mm
  return height * width * CM_TO_MM;
}

console.log(height + ' * ' + width + ' = ' + area(height, width));
```

That solves the `no-magic-numbers` error, but we still have the `no-shadow` error. This error is about the fact that we
are declaring the same variable name in the function as we are using in the outer scope. This is not a good practice,
because it can lead to confusion about which variable is being used. We can fix this by changing the variable names in
the function to something else. Because we now know that we need to convert the height and width from centimeters to
millimeters, we can change the variable names in the function to `heightInCm` and `widthInCm`. The resulting code will
look like this:

```javascript
const height = 7; // height
const width = 5; // width

// eslint-disable-next-line func-style
function area(heightInCm, widthInCm) {
  // TODO: Have to change the function to use arrow function syntax,
  //  so that we can remove the eslint-disable-next-line
  const CM_TO_MM = 10; // 1 cm = 10 mm
  return heightInCm * widthInCm * CM_TO_MM;
}

console.log(height + ' * ' + width + ' = ' + area(height, width));
```

This code is much better to read and understand, and it makes finding logical errors easier. Like the logical error we
made in this function, because in this function we are only converting one of the two parameters into minimeters !!!

The eslint error `no-console` is about the use of `console.log` in our code. Again an error we can discuss whether we
want to keep it or not. In this course we want to keep it, but we will downgrade it to a warning.

The last error is about the use of string concatenation. This is a good rule to follow, because it makes the code easier
to read and understand. We can fix this by using template literals instead of string concatenation.

The final code will look like this:

```javascript
const height = 7; // height
const width = 5; // width

// eslint-disable-next-line func-style
function area(heightInCm, widthInCm) {
  // TODO: Have to change the function to use arrow function syntax,
  //  so that we can remove the eslint-disable-next-line
  const CM_TO_MM = 10; // 1 cm = 10 mm
  return heightInCm * CM_TO_MM * (widthInCm * CM_TO_MM);
}

console.log(`${height}cm * ${width}cm = ${area(height, width)}mm²`); // 1 cm = 10 mm
```

And our final `eslint.config.js` file will look like this:

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
      'capitalized-comments': 'warn',
      'no-inline-comments': 'warn',
      'one-var': ['error', 'never'],
      'no-warning-comments': 'off',
      'no-console': 'warn',
    },
  },
]);
```

> [!NOTE]
>
> Know that there are common ruleset like the populair `Airbnb` ruleset that you can use in your project. But we due to
> changes of the ESLint itself, the configuration file of the `Airbnb` ruleset is not compatible with the configuration
> file of the ESLint. We hope that this will be fixed in the future, but for now we recommend to use the configuration
> file that we provided in this course.

## Custom Rules

ESLint allows you to create custom rules to enforce specific coding standards or best practices that are not covered by
the built-in rules. Custom rules can be created as standalone plugins or as part of your ESLint configuration. We will
not go into how to create custom rules in this course, but we are working on a custom rules plugin for this course, to
enforce the rules that we discussed in this course, like for instance those about not using `fetch` or `localStorage` in
you lit components.

---

## Sources

- [ESLint](https://eslint.org/)

---

:house: [Home](../README.md) | :arrow_up: [Testing](./README.md) | [A11Y Testing](./a11y-testing.md) :arrow_forward:
