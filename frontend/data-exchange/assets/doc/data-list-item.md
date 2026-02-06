# [data-list-item](../src/view/components/data-list-item.js)

## Description

The `data-list-item` component represents a single user data entry in the list. 
It displays the user's name, telephone number, and email, along with "Edit" and "Delete" buttons. 
When the buttons are clicked, it dispatches custom events to notify the parent component of the actions taken.

## CSS Variables

- `--data-list-item-bg` (CSS color): Background color for each list item. Default: `#ffffff`.
- `--data-list-item-alt-bg` (CSS color): Background color for even list items. Default: `#d1fae5`.

> Note: Alternate row coloring is applied using `:host(:nth-child(even))` to work with Shadow DOM.

## Attributes

- `user` (Object): A User object representing the data entry to be displayed.

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

- `data-delete-request`: Triggered by the `data-list-item` component when a data entry is deleted.
    The id of the User object will be included as event detail.
- `data-update-request`: Triggered by the `data-list-item` component when a data entry is requested to be edited.
    The id of the User object will be included as event detail.

## Required Services

- `UserService` - A service to handle the communication with the backend API for user data.

## Slots

_none_

---

[<- back to README](./README.md)