# Unit Testing

Unit testing is a software testing technique where individual components of a software application are tested in
isolation. The goal of unit testing is to validate that each unit of the software performs as expected. A unit can be a
function, method, or class, depending on the programming language and the design of the application.

For JavaScript applications, unit testing is typically done using a testing framework that provides tools for writing
and running tests. Some popular JavaScript testing frameworks include:

- [**Mocha**](https://mochajs.org/): A flexible testing framework that allows developers to choose their own assertion
  library. Mocha is often used in combination with other libraries like [Chai](https://www.chaijs.com/) for assertions
  and [Sinon](https://sinonjs.org/) for mocking. It was released in 2011 and has a large community of users.
- [**Jest**](https://jestjs.io/): A popular testing framework developed by Facebook, Jest is known for its simplicity
  and ease of use. It includes features like snapshot testing, mocking, and code coverage analysis. Unlike Mocha, Jest
  comes with a built-in assertion library and does not require additional libraries for basic testing functionality.
  Jest was released in 2014 and has gained popularity for its performance and ease of use.
- [**Jasmine**](https://jasmine.github.io/): A behavior-driven development (BDD) framework for testing JavaScript code.
  Jasmine provides a clean syntax for writing tests and includes features like spies and mocks.
- [**Vitest**](https://vitest.dev/): A modern testing framework that is designed to be fast and efficient. It is built
  on top of Vite, a build tool that focuses on speed and performance. Vitest supports features like hot module
  replacement (HMR) and is optimized for modern JavaScript applications.

Note that there are many other testing frameworks available, and the choice of framework often depends on the specific
needs of the project and the preferences of the development team. Some developers prefer to use a combination of
frameworks and libraries to achieve the desired testing functionality. In this section, we will focus on Vitest, since
it build specifically for Vite, which is a popular build tool for modern JavaScript applications and the one we are
using in this course.

## Vitest

You can add Vitest to your project by running the following command:

```bash
npm install -save-dev vitest
```

Next you need to add a script to your `package.json` file to run the tests. You can do this by adding the following
script to the `scripts` section of your `package.json` file:

```json
{
  "scripts": {
    "vitest": "vitest"
  }
}
```

This will allow you to run your tests by executing the following command in your terminal:

```bash
npm run vitest
```

But what will it test? By default, Vitest will look for will look for files in your project that match the following
patterns:

- `*.test.js`
- `*.spec.js`

> [!NOTE]
>
> Note that there are serveral approaches to organizing your tests. You can either keep your tests in a separate
> directory (e.g., `tests/`) or keep them alongside your source code. Non of them are mandatory, but it is a good idea
> to keep it consistent across your project.

## Writing Tests

In Test Driven Development (TDD), you write your tests before you write your code. This allows you to define the
expected behavior of your code before you implement it. This can help you to write better code, since you have a clear
understanding of what you want to achieve. It also allows you to catch bugs early in the development process, since you
are constantly testing your code as you write it.

The alternative is to write your tests after you write your code. This is often referred to as "after the fact" testing.
This approach can lead to a lot of bugs, since you are not testing your code as you write it. It can also lead to poorly
written tests, since you are not thinking about the expected behavior of your code before you implement it. We assume
that this is the common approach you are used to.

So let's start with a simple example to get started into unit testing with Vitest. Let's say we have a file `app.js`
which holds a simple function to calculate the area of a rectangle, which was written by someone else of our team. The
function looks like this:

```javascript
// eslint-disable-next-line func-style
function area(heightInCm, widthInCm) {
  // TODO: Have to change the function to use arrow function syntax,
  //  so that we can remove the eslint-disable-next-line
  const CM_TO_MM = 10; // 1 cm = 10 mm
  return heightInCm * CM_TO_MM * (widthInCm * CM_TO_MM);
}
```

To write a test for this function, we need to create a new file called `app.test.js`, which we do in the same directory
as `app.js`. To use Vitest, we need to import `test` and `expect` from the Vitest library. The `test` function is used
to define a test case, and the `expect` function is used to make assertions about the output of the code under test.

```javascript
test('area calculation', () => {
  const height = 7; // height
  const width = 5; // width
  const expectedArea = 35; // area = height * width

  expect(area(height, width)).toBe(expectedArea);
});
```

But if we run the test now, we will get an reference error at the expect line, stating that `area` is not defined. This
is because we need to import the `area` function from the `app.js` file. So we add an import statement at the top of the
file to import the `area` function:

```javascript
import { test, expect } from 'vitest';
import { area } from '../src/app.js';

test('area calculation', () => {
  const height = 7; // height
  const width = 5; // width
  const expectedArea = 35; // area = height * width

  expect(area(height, width)).toBe(expectedArea);
});
```

But now we get a TypeError stating that `area` is not a function. This is because we need to export the `area` function
from the `app.js` file. So we add an export statement to the `app.js` file to export the `area` function:

```javascript
// eslint-disable-next-line func-style
function area(heightInCm, widthInCm) {
  // TODO: Have to change the function to use arrow function syntax,
  //  so that we can remove the eslint-disable-next-line
  const CM_TO_MM = 10; // 1 cm = 10 mm
  return heightInCm * CM_TO_MM * (widthInCm * CM_TO_MM);
}

export { area };
```

> [!NOTE]
>
> Your test code can't test what it can't see. Make sure to export the code you want to test from the file where it is
> defined, and to import it in your test file.

Now if we run the test again, we again will get an error, but this time it's an assertion error stating that the
expected value is `35`, but the received value is `3500`.

If we look at the parameters of the `area` function, we see that it takes the height and width in centimeters, but the
function calculates the area in square millimeters. This is not what we expected, since the name of the function is
`area`, and we expected it to calculate the area in square centimeters. So looking at the code, we could change our test
to expect the area in square millimeters, but what is the point of that? The function is clearly not doing what it is
supposed to do. We can fix this by changing the function to calculate the area in square centimeters, but in case our
role is that of a tester, we should not change the code. Instead, we should report this as a bug to the developer and
ask them to fix it.

So let's assume that the developer has fixed it, by changing the parameters of the `area` function to take the height
and width in mm instead of cm, and therefore not to convert the result into minimeters. The updated function looks like
this:

```javascript
// eslint-disable-next-line func-style
function area(heightInMm, widthInMm) {
  // TODO: Have to change the function to use arrow function syntax,
  //  so that we can remove the eslint-disable-next-line
  return heightInMm * widthInMm;
}

export { area };
```

If we now run the test again, we our test will pass. So are we done? Not really. What we tested was the happy path,
which is the most common case. But we also need to test the edge cases, which are the less common cases, and the error
cases, which are the cases where the code should throw an error. So let's assume that the `app.js` might get extended in
the future and might hold more than one function we want to test. That's why we wrap our test in a `describe` block,
which allows us to group our tests together. The updated test file looks like this:

```javascript
import { area } from '../src/app.js';
import { test, describe, expect } from 'vitest';

describe('area calculation', () => {
  test('happy flow', () => {
    const height = 7; // height
    const width = 5; // width
    const expectedArea = 35; // area = height * width

    expect(area(height, width)).toBe(expectedArea);
  });

  test('edge case', () => {
    const height = 0; // height
    const width = 0; // width
    const expectedArea = 0; // area = height * width

    expect(area(height, width)).toBe(expectedArea);
  });

  test('error case', () => {
    const height = -7; // height
    const width = 5; // width

    expect(() => area(height, width)).toThrowError();
  });
});
```

> [!NOTE]
>
> Note that we are using the `toThrowError` matcher to check if the function throws an error. Vitest provides several
> matchers to check the output of the code under test. You can find a list of all matchers in the
> [Vitest expect API documentation](https://vitest.dev/api/expect.html).

Again we get an assertion error, but this time for the error case. This is because the `area` function does not throw an
error when the height is negative. But who said that the height can't be negative? We again lack a specification of the
code under test. So we need to go back to the developer and ask them to clarify the specification of the `area`
function.

## JSDoc

One way to document your code is to use [JSDoc](https://jsdoc.app/), which is a markup language used to annotate
JavaScript code. JSDoc allows you to add comments to your code that describe the purpose of the code, the parameters,
and the return value. This can help you to clarify the specification of your code and make it easier to understand for
other developers. You can add JSDoc comments to your code by using the `/** ... */` syntax. For example, you can add a
JSDoc comment to the `area` function like this:

```javascript
/**
 * Calculates the area of a rectangle.
 * @param {number} heightInMm - The height of the rectangle in mm.
 * @param {number} widthInMm - The width of the rectangle in mm.
 * @returns {number} The area of the rectangle in mm^2.
 * @throws {Error} If the height or width is negative.
 */
```

Such a comment would clarify the specification of the `area` function and make it clear that the height and width
parameters must be positive numbers. It also makes it clear that the function returns the area in square millimeters.
This way, we can also clarify the expected behavior of the function when the parameters are negative. We can then change
our test to expect the function to throw an error when the height or width is negative. The updated area function looks
like this:

```javascript
/* eslint-disable func-style */
/* eslint-disable capitalized-comments */

/**
 * Calculates the area of a rectangle.
 * @param {number} heightInMm - The height of the rectangle in mm.
 * @param {number} widthInMm - The width of the rectangle in mm.
 * @returns {number} The area of the rectangle in mm^2.
 * @throws {Error} If the height or width is negative.
 */
function area(heightInMm, widthInMm) {
  // TODO: Have to change the function to use arrow function syntax,
  //  so that we can remove the eslint-disable-next-line
  const LOWER_BOUND = 0;
  if (heightInMm < LOWER_BOUND || widthInMm < LOWER_BOUND) {
    throw new Error('Height and width must be non-negative');
  }
  return heightInMm * widthInMm;
}

export { area };
```

> [!NOTE]
>
> JSDoc is a powerful tool to document your code and clarify the specification of your code. It can also be used to
> generate documentation for your code. You can use tools like the [JSDoc App](https://github.com/jsdoc/jsdoc) to
> generate HTML documentation from your JSDoc comments. This can help you to create a clear and concise documentation
> for your code and make it easier to understand for other developers. You can also use JSDoc to generate documentation
> in other formats, such as Markdown or PDF.

If we now run the test again, we will see that all tests pass.

## ViTest UI

Until now we have been running our tests in the terminal, but Vitest also provides a UI to run your tests in the
browser. To use the UI, you need to install the `@vitest/ui` package. You can do this by running the following command:

```bash
npm install -save-dev @vitest/ui
```

Then add the following script to your `package.json` file:

```json
{
  "scripts": {
    "vitest": "vitest",
    "vitest:ui": "vitest --ui"
  }
}
```

This will allow you to run the UI by executing the following command in your terminal:

```bash
npm run vitest:ui
```

Which will open a new tab in your browser with the Vitest UI. The UI allows you to run your tests, see the results.

---

## Sources

- [Vitest](https://vitest.dev/)
- [Vitest - expect API documentation](https://vitest.dev/api/expect.html)
- [JSDoc documentation](https://jsdoc.app/)
- [JSDoc App](https://github.com/jsdoc/jsdoc)

---

:house: [Home](../README.md) | :arrow_backward: [A11Y Testing](./a11y-testing.md) | :arrow_up: [Testing](./README.md) |
[E2E Testing](./e2e-testing.md) :arrow_forward:
