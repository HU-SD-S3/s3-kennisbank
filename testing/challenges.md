# Challenges

## Challenge 1 - ESLint Challenge

Refactor the code below to remove all ESLint errors, without disabling any rules or modifying the ESLint configuration.

```javascript
function isAdult(birthdate) {
  function calcAge(birthdate) {
    let n = new Date();
    let b = new Date(birthdate);
    let a = n.getFullYear() - b.getFullYear();
    let md = n.getMonth() - b.getMonth();
    // Adjust age if the birth date hasn't occurred yet this year
    if (md < 0 || md === 0) {
      if (n.getDate() < b.getDate()) {
        a--;
      }
    }
    return a;
  }

  var a = calcAge(birthdate);
  function isAdult(a) {
    // Check if the age is 18 or older
    // Return true if the person is an adult, false otherwise
    if (a >= 18) {
      return true;
    } else {
      return false;
    }
  }

  return { message: 'isAdult(' + birthdate + ') = ' + isAdult(a), result: isAdult(a) };
}

var data = ['2000-01-01', '2005-05-05', '2010-10-10', '1995-12-31', '2021-01-01'];

function output(data) {
  var c = 0;
  for (var i = 0; i < data.length; i++) {
    var u = isAdult(data[i]);
    console.log(u.message);
    if (u.result) {
      c++;
    }
  }

  return c + ' of the ' + data.length + ' group are adults';
}

console.log(output(data));
```

Use the following `eslint.config.js` file:

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

## Challenge 2 - Unit Testing

Given the following code construct:

```javascript
const MAX_CHILD_AGE = 12;
const MIN_ELDERLY_AGE = 65;
const KM_DISTANCE_FOR_DISCOUNT = 75;
const AGE_DISCOUNT = 0.3;
const RANGE_DISCOUNT = 0.25;

/**
 * @description This function checks if a person is a child based on their age.
 *
 * @param {number} age - The age of the person (must be a positive integer)
 * @returns {boolean} - true if the person is a child, false otherwise
 * @throws {Error} - If the age is not a positive integer
 */
function isChild(age) {
  return null;
}

/**
 * @description This function checks if a person is an elderly based on their age.
 *
 * @param {number} age - The age of the person (must be a positive integer)
 * @returns {boolean} - true if the person is elderly, false otherwise
 * @throws {Error} - If the age is not a positive integer
 */
function isElderly(age) {
  return null;
}

/**
 * @description This function checks if a person is a child or an adult based on their age.
 *
 * @param {number} age - The age of the person (must be a positive integer)
 * @returns {boolean} - true if the person has the right for a discount, false otherwise
 * @throws {Error} - If the age is not a positive integer
 */
function hasRightForAgeDiscount(age) {
  return null;
}

/**
 * @description This function checks if the travel distance is greater than the defined distance for a discount.
 *
 * @param {number} travelDistance - The distance in km of the travel (must be a positive integer)
 * @returns {boolean} - true if the travel distance is greater than the defined distance for a discount, false otherwise
 * @throws {Error} - If the travel distance is not a positive integer
 */
function hasRightForRangeDiscount(travelDistance) {
  return null;
}

/**
 * @description This function calculates the price of a ticket based on the age of the person and the travel distance.
 *
 * @param {number} age - The age of the person (must be a positive integer)
 * @param {number} travelDistance - The distance in km of the travel (must be a positive integer)
 * @returns {number} - The price of the ticket after applying any applicable discounts (AGE_DISCOUNT and RANGE_DISCOUNT)
 * @throws {Error} - If the age or travel distance is not a positive integer
 */
function ticketsPrice(age, travelDistance) {
  return null;
}

export {
  isChild,
  isElderly,
  hasRightForAgeDiscount,
  hasRightForRangeDiscount,
  ticketsPrice,
};
```

1. Write unit tests for the functions `isChild`, `isElderly`, `hasRightForAgeDiscount`, `hasRightForRangeDiscount`, and `ticketsPrice` using vitest. Ensure that you not only cover the happy flow scenarios, but also all possible edge cases and scenarios.

2. Implement the functions `isChild`, `isElderly`, `hasRightForAgeDiscount`, `hasRightForRangeDiscount`, and `ticketsPrice` and validate that your implementation complies with your tests (also known as Test Driven Development [TDD]).

## Challenge 3 - E2E Testing

Implement a Lit Web Components based UI for your code of challenge 3 and write an E2E test for it using Playwright. The E2E test should cover the following scenarios:

1. The user can input their age and travel distance.
2. The user can see the calculated ticket price based on their input.
3. The user can see the applicable discounts based on their input.
4. The system should mark the input fields with a thick read border as invalid if the user inputs a negative number or a non-integer value.
5. The system should mark the input fields with a thick green border as valid if the user inputs a positive integer.
6. The ticket price should be calculated correctly based on the age and travel distance.
7. The ticket price should be displayed in the correct format (e.g., with two decimal places).
8. An age discount badge should be displayed if the user is eligible for an age discount.
9. A range discount badge should be displayed if the user is eligible for a range discount.
10. The ticket price information should not be displayed while the user is typing in the input fields. 

## Challenge 4 - A11Y Testing

Check you site of challenge 3 for accessibility issues by adding a playwright test that checks for the following scenarios:

1. The site is accessible when the price is not displayed yet.
2. The site is accessible when a wrong value / negative value has been entered and the input field is marked as invalid.
3. The site is accessible when the price is displayed.

Solve any accessibility issues that you find and then check you site of challenge 3 for accessibility issues using the AXE and/or ArcTool browser extensions.

---

:house: [Home](../README.md) | :arrow_backward: [E2E Testing](./e2e-testing.md) | :arrow_up:
[Testing](./README.md)
