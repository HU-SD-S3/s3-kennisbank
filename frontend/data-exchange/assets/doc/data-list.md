# [data-list](../src/view/components/data-list.js)

## Description

The `data-list` component displays a list of user data entries. 
It receives an array of User objects as an attribute and renders each entry using the `data-list-item` component.

In the wireframe the `data-list` is shown as a table. 
But that would mean that the `data-list-item` component would have to render a table row (`<tr>`) which is not possible with LitElements (you have to extend the class as `HTMLTableRowElement` for this and fall back to a variant of vanilla web components).
Therefore the `data-list` component will render a list (like you would use the `<ul>` tag) and each `data-list-item` will handeld as a list item (like you would do with the `<li>` tag). 
CSS can be used to style the list to look like a table if desired.

> [!NOTE]
> 
> From an Accessibility point of view it would be better to use a table for tabular data.
> So in a future version of this component we will try to solve this issue.

## CSS Variables

- `--data-list-bg` (CSS color): Background color for the `<data-list>` container. Default: `#ffdd57`.
- `--data-list-fg` (CSS color): Foreground (text) color used for list text and header. Default: `#111827`.
- `--data-list-header-bg` (CSS color): Background color for the header row. Default: `#ffd42a`.

> Tip: You can override these variables globally or on a per-component basis.

## Attributes

- `users` (Array): An array of User objects to be displayed in the list.

## Data shape / example

Each item in the `users` array should follow this shape:
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

_none_

## Required Services

_none_

## Slots

_none_

---

[<- back to README](./README.md)