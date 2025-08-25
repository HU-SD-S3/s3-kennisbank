# E2E Testing

E2E is short for end-to-end testing. It is a type of testing that verifies the entire application flow, from start to
finish, to ensure that all components work together as expected. E2E tests simulate real user scenarios and interactions
with the application, allowing developers to identify issues that may not be caught by unit or integration tests.

To get into E2E testing, we create a simple web application that calculates the area of a rectangle. The application
consists of two input fields for the width and height, a button to calculate the area, and a display area for the
result. The E2E test will simulate a user entering values into the input fields, clicking the button, and verifying that
the correct area is displayed.

The `index.html` file will look like this:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="icon" type="image/svg+xml" href="/lit.svg" />

    <title>Kennisbank - Testing</title>

    <script type="module" src="/src/view/pages/home-page.js"></script>
  </head>
  <body>
    <home-page></home-page>
  </body>
</html>
```

The `home-page.js` file will have the following code:

```javascript
import { LitElement, html } from 'lit';
import '../components/area-calc.js';

export class HomePage extends LitElement {
  render() {
    return html` <area-calc></area-calc> `;
  }
}

customElements.define('home-page', HomePage);
```

The `area-calc.js` file will have the following code:

```javascript
import { LitElement, html, css } from 'lit';
import { area } from '../../utils/utils.js';

export class AreaCalc extends LitElement {
  static properties = {
    area: { type: Number },
  };

  static styles = css`
    form {
      display: grid;
      width: 30rem;
      grid-template-columns: 1fr 1fr;
      gap: 10px;
      margin-bottom: 20px;
      align-items: center;
    }
    label {
      font-weight: bold;
    }
    input {
      padding: 1em;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    button {
      padding: 1em;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      grid-column: span 2;
    }
  `;

  constructor() {
    super();
    this.area = 0;
  }

  calcArea(event) {
    event.preventDefault();
    const height = parseFloat(event.target.height.value);
    const width = parseFloat(event.target.width.value);
    try {
      this.area = area(height, width);
    } catch (error) {
      console.error(error);
    }
  }

  render() {
    return html`
      <form @submit=${this.calcArea}>
        <label for="height">Height (mm):</label>
        <input type="number" id="height" name="height" min="0" required />

        <label for="width">Width (mm):</label>
        <input type="number" id="width" name="width" min="0" required />

        <button type="submit">Calculate Area</button>
      </form>

      <hr />
      <h2>Area: ${this.area} mm²</h2>
    `;
  }
}

customElements.define('area-calc', AreaCalc);
```

The `utils.js` file is the file we created ealier and has the following code:

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

But if we try to build a test for this application with a unit test, we will run into some problems. The unit test tests
functions in isolation, and how should we now test that the render function of the `AreaCalc` component works as
expected? And that it responds to the user input? This is where E2E testing comes in. E2E testing tests the entire
application flow, from start to finish, and simulates real user scenarios and interactions with the application.

There are many libraries for E2E testing, such as Selenium, Cypress, Puppeteer, and Playwright. In this section, we will
use Playwright to test our application. Playwright is a open-source Node.js library that allows you to automate the
testing of web applications. It supports multiple browsers, including Chromium, Firefox, and WebKit, but can also be
used headless (without a GUI, which is useful for CI/CD pipelines).

## Setting up Playwright

To set up Playwright, we need to install it in our project. We can do this by running the following command:

```bash
npm init playwright@latest
```

After installing Playwright, you can find a example test in the `tests` folder. The test will look like this:

```javascript
// @ts-check
import { test, expect } from '@playwright/test';

test('has title', async ({ page }) => {
  await page.goto('https://playwright.dev/');

  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/Playwright/);
});

test('get started link', async ({ page }) => {
  await page.goto('https://playwright.dev/');

  // Click the get started link.
  await page.getByRole('link', { name: 'Get started' }).click();

  // Expects page to have a heading with the name of Installation.
  await expect(page.getByRole('heading', { name: 'Installation' })).toBeVisible();
});
```

Let's also add a script to the `package.json` file to run the tests:

```json
{
  "scripts": {
    "test:e2e": "playwright test --ui"
  }
}
```

Now we can run the tests by running the following command:

```bash
npm run test:e2e
```

This will run all the tests in the `tests` folder. You can also run a specific test by running the following command:

> [!WARNING]
>
> If you now run your vitest unit test which we had set up in the previous section, you will see that the test fails.
> This is because the unit test is looking for `*.test.js` and `*.spec.js` files in our project and that pattern matches
> with the test file playwright created. The playwright test files however can't be executed with vitest (at least not
> without additional packages and configuration).  
> An easy way to fix this problem is to keep te unit tests and the playwright tests in seperate folders. For instance
> all playwright tests within the `/tests` folder and vitest based unit tests in the `/src` folder. And then to
> configure vitest to inlcude the `/src` folder and exclude the `/tests` folder from the test search pattern. To do
> this, we can add the following configuration to the `vitest.config.js` file:

```javascript
import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    include: ['src/**/*.test.js'], // Include all test files
    exclude: ['tests/**'], // Exclude Playwright tests
  },
});
```

## Writing Tests

Using the example code and the information we find in the Playwright documentation about
[writing tests](https://playwright.dev/docs/writing-tests), we can write a first test for our application. The test will
look like this:

```javascript
import { test, expect } from '@playwright/test';

const URL = `localhost:5173`;

test('has height input field', async ({ page }) => {
  await page.goto(URL);
  // Check if the height input field is present
  const heightInput = page.locator('input[name="height"]');
  await expect(heightInput).toBeVisible();
});

test('has width input field', async ({ page }) => {
  await page.goto(URL);
  // Check if the width input field is present
  const widthInput = page.locator('input[name="width"]');
  await expect(widthInput).toBeVisible();
});

test(' has button', async ({ page }) => {
  await page.goto(URL);
  // Check if the button is present
  const button = page.locator('button');
  await expect(button).toBeVisible();
});
```

If you now start the application with `npm run dev` and run the test from another terminal with `npm run test:e2e`, you
will see that the test will pass. The test will check if the height and width input fields and the button are present on
the page.

But that's not all we want to test. We also want to test if the application works as expected. So we want to test if the
user can enter values in the input fields and click the button to calculate the area. So with a lot of reading of the
Playwright API documentation we can do this by adding the following test:

```javascript
test('calculates area', async ({ page }) => {
  await page.goto(URL);
  // Enter values in the input fields
  const heightInput = page.locator('input[name="height"]');
  const widthInput = page.locator('input[name="width"]');
  await heightInput.fill('10');
  await widthInput.fill('20');

  // Click the button
  await page.click('button');
  // Check if the area is calculated correctly
  const area = page.locator('h2');
  await expect(area).toHaveText('Area: 200 mm²');
});
```

But Playwright also offers another alternative to write tests. You can use the
[codegen](https://playwright.dev/docs/codegen) feature to generate tests. This feature allows you to record your
interactions with the application and generate the corresponding test code. This is a great way to quickly create tests
for your application without having to write the code manually. Adding the following script to the `package.json` file
will allow you to use the codegen feature:

```json
{
  "scripts": {
    "test:e2e": "playwright test --ui",
    "test:e2e:codegen": "playwright codegen"
  }
}
```

If you now run the command `npm run test:e2e:codegen`, a new window will open with the Playwright codegen tool. You can
now enter the URL of your application and start interacting with it. The tool will generate the corresponding test code
in the right panel.

But know that the not all scenarios can be generated with the codegen tool. For instance, if we want to test that the
form doesn't accept negative values, and shows a tooltip with the error when you click the button, we have to write the
test manually. The test will look like this:

```javascript
test('does not accept negative values', async ({ page }) => {
  await page.goto(URL);

  // Enter negative values in the input fields
  const heightInput = page.locator('input[name="height"]');
  const widthInput = page.locator('input[name="width"]');
  await heightInput.fill('-10');
  await widthInput.fill('-20');

  // Trigger validation by attempting to submit the form
  await page.click('button');

  // Check the browser's validation message for the height input
  const heightValidationMessage = await heightInput.evaluate((input) => input.validationMessage);
  expect(heightValidationMessage).toBe('Value must be greater than or equal to 0.');

  // Check the browser's validation message for the width input
  const widthValidationMessage = await widthInput.evaluate((input) => input.validationMessage);
  expect(widthValidationMessage).toBe('Value must be greater than or equal to 0.');
});
```

> [!NOTE]
>
> Our tests are no based on a single test case for a given scenario. Normally you would have multiple test cases for a
> given scenario. For instance, you would have a test case for the height input field with a negative value, a test case
> for the width input field with a negative value, and a test case for both input fields with negative values. Instead
> of writing a test for each test case of a given scenario, we can also use
> [parameterized tests](https://playwright.dev/docs/test-parameterize) to run the same test with different values. This
> is a great way to reduce code duplication and make your tests more maintainable. And if you place the test data in a
> separate file, you can easily add or remove test cases without having to modify the test code.

## Accessibility Testing

Playwright also offers a way to test the accessibility of your application. This is done by using the
[axe-core](https://github.com/dequelabs/axe-core) library, which is a popular library for accessibility testing. First
we need to install the library by running the following command:

```bash
npm install --save-dev @axe-core/playwright
```

At the head of the test file we can import the library and add the following code to the test:

```javascript
import { AxeBuilder } from '@axe-core/playwright';
```

Then we can add the following code to the test:

```javascript
test.describe('accessibility', () => {
  const NONE = 0;
  test('should have no a11y violations', async ({ page }) => {
    await page.goto(URL);
    const results = await new AxeBuilder({ page }).analyze();
    if (results.violations.length > NONE) {
      console.log('Accessibility violations found:');
      console.dir(results.violations);
    }

    expect(results.violations.length).toBe(NONE);
  });
});
```

This will check the accessibility of the application and log any violations to the console. Using Playwright this way,
we can check the accessibility of the application at a predefined point in time, to make sure that dynamic changes to
the application don't break the accessibility of the application.

## Conclusion

Playwright is a powerful tool for E2E testing of web applications. It allows you to automate the testing of your
application and simulate real user scenarios and interactions. In this section we only scratched the surface of what
Playwright can do. It offers a lot of features and options to customize the testing process. Feel free to explore other
features like for instance authentication, events and Mock API testing. Note that there are also a lot of YouTube videos
available that explain the different features of Playwright in detail.

---

## Sources

- [Playwright](https://playwright.dev/)
- [Playwright - Getting Started](https://playwright.dev/docs/intro)
- [Playwright - Writing Tests](https://playwright.dev/docs/writing-tests)
- [Playwright - Codegen](https://playwright.dev/docs/codegen)
- [Playwright - Test Parameterize](https://playwright.dev/docs/test-parameterize)
- [Playwright - Accessibility Testing](https://playwright.dev/docs/accessibility-testing)

---

:house: [Home](../README.md) | :arrow_backward: [A11Y Testing](./a11y-testing.md) | :arrow_up: [Testing](./README.md) |
[Challenges](./challenges.md) :arrow_forward:
