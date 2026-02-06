# Styling & CSS variables

This page documents the CSS custom properties (variables) available for components so you can theme or override colors consistently.

> Location: `src/styles/components.css` (the file defines the global palette used in the demo). Components also use `var(--name, <fallback>)` to remain usable without the global stylesheet.

## Component variables (by component)

### data-form
- `--data-form-bg` — background color for the form. Default: `#1e90ff`.
- `--data-form-fg` — foreground (text) color used inside the form. Default: `#ffffff`.

### data-list
- `--data-list-bg` — background color for the list container. Default: `#ffdd57`.
- `--data-list-fg` — text color used for list contents and header. Default: `#111827`.
- `--data-list-header-bg` — header row background color. Default: `#ffd42a`.

### data-list-item
- `--data-list-item-bg` — background color for list items. Default: `#ffffff`.
- `--data-list-item-alt-bg` — background color for even list items. Default: `#d1fae5`.

## Examples

Override a single variable globally:

```css
:root {
  --data-form-bg: #f0f4ff;
}
```

Override for a specific component instance:

```css
data-form {
  --data-form-bg: #fff8f0;
  --data-form-fg: #111;
}
```

## Notes & accessibility
- Components include fallbacks (e.g., `var(--data-form-bg, #f8fafc)`) so they still render sensibly without the global stylesheet.
- If you change background colors, verify the contrast of text and interactive elements for accessibility (WCAG AA/AAA where possible).

---

(If you'd rather keep this information inside each component page, say so and I will instead duplicate the reference into each component doc.)