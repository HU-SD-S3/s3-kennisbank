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
> directory (e.g., `tests/`) or keep them alongside your source code. Non of them are mandatory, but it is a good idea to
> keep it consistent across your project.

## Writing Tests

TODO: ViTest can't test what it can't see. (Export)

---

## Sources

- [Vitest Documentation](https://vitest.dev/)

---

:house: [Home](../README.md) | :arrow_backward: [A11Y Testing](./a11y-testing.md) | :arrow_up: [Testing](./README.md) |
[E2E Testing](./e2e-testing.md) :arrow_forward:
