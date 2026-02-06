# [data-form](../src/view/components/data-form.js)

## Description

The `data-form` component provides a form to submit new user data or edit existing user data. 
It includes input fields for the user's name, telephone number, and email, as well as a submit button that changes its text based on whether the form is in "add" or "edit" mode. 
When the form is submitted, it dispatches custom events to notify the parent component of the action taken.

## CSS Variables

- `--data-form-bg` (CSS color): Background color for the `<data-form>` container. Default: `#1e90ff`.
- `--data-form-fg` (CSS color): Foreground (text) color used in the form. Default: `#ffffff`.

> Note: The component uses these variables via `var(--name, <fallback>)`, so they will work whether a global stylesheet is present or not.

## Attributes

- `user` (Object | null): A User object representing the data entry to be edited.
    If this attribute is set, the form will be pre-filled with the user's data and the button text will change to "Update".
    If this attribute is null or not set, the form will be empty and the button text will be "Add".

## Data shape / example

Example User object:
```json
{
  "id": 1,
  "name": "Alice Example",
  "email": "alice@example.com",
  "phone": "+15551234567"
}
```

> Note: `id` may be omitted when creating a new user.

## Events

### (Custom)Events listened to

_none_

### (Custom)Events dispatching

- `data-added`: Triggered by the `data-form` component when a new data entry is added.
    The User object will be included as event detail.
- `data-updated`: Triggered by the `data-form` component when an existing data entry is updated.
    The User object will be included as event detail.

## Required Services

_none_

## Slots

_none_

---

[<- back to README](./README.md)