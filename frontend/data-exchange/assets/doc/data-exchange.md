# [data-exchange](../src/view/components/data-exchange.js)

## Description

The `data-exchange` component serves as a mediator between the `data-form` and `data-list` components. 
It manages the state of the submitted data and facilitates communication between the form and the list. 
The `data-exchange` component is also responsible for the communication with the backend API to fetch, add, update, and delete data entries, to reduce the complexity of the child components.

> [!NOTE]
>
> The `data-exchange` component is not our page component. In case you want to use a component for the data exchange page, you should create a separate page component that includes the `data-exchange` component.

## CSS Variables

_none_

## Attributes

_none_

## Data shape / example

Example User object used across components:
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

- `data-added`: Triggered by the `data-form` component when a new data entry is added.
    The User object is expected as event detail.
- `data-updated`: Triggered by the `data-form` component when an existing data entry is updated.
    The User object is expected as event detail.
- `data-delete-request`: Triggered by the `data-list-item` component when a data entry is deleted.
    The id of the User object is expected as event detail.
- `data-update-request`: Triggered by the `data-list-item` component when a data entry is requested to be edited.
    The id of the User object is expected as event detail.

### (Custom)Events dispatching

_none_

## Required Services

- `UserService` - A service to handle the communication with the backend API for user data.

## Slots

_none_

---

[<- back to README](./README.md)