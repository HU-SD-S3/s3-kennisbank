# Web Components reusability

Brad Frost has written a [book called "Atomic Design"](https://atomicdesign.bradfrost.com/) that describes a way to structure our front-end application using web components. He describes five different levels of components:

1. **Atoms**: These are the smallest components in our application. They are the building blocks of our application. Examples of atoms are buttons, input fields, and icons.
2. **Molecules**: These are groups of atoms that work together to form a more complex component. Examples of molecules are forms, cards, and lists.
3. **Organisms**: These are groups of molecules that work together to form a more complex component. Examples of organisms are headers, footers, and sidebars.
4. **Templates**: These are groups of organisms that work together to form a more complex component. Examples of templates are pages, layouts, and sections.
5. **Pages**: These are the final components that are displayed to the user. They are the result of combining all the other components together. Examples of pages are home pages, product pages, and checkout pages.

A **design system** is a collection of components that can be used to build a front-end application. We can use the atomic design principles to create a design system that is easy to use, easy to maintain, and easy to scale. We can create a library of components that can be used in different parts of our application, or in different applications.
And there are already many web component based design system libraries available like:

- [Material Design User Interface](https://www.mdui.org/en/),
- [Material Web](https://material-web.dev/) van Google,
- [Lion](https://lion.js.org/) van de ING,
- [UI5](https://sap.github.io/ui5-webcomponents/) van SAP

en many more (see [Open-WC - Component libraries](https://open-wc.org/guides/community/component-libraries/)).

We can use these libraries to build our own Organisms, Templates and Pages, instead of developing them from scratch. This will save us a lot of time and effort, and it will also make our code more consistent and easier to maintain.

Except for atoms there are also some web components libraries available that are more on the Organism level but they are harder to find and not as widely used as the libraries mentioned above. Some examples are:

- **leaflet** based components: [leaflet-map](https://prtksxna.github.io/leaflet-map-component/) a small web component library for creating Open Street Map maps,
- **chart** based components: [chartjs](https://www.chartjs.org/) a small web component library for creating charts,
- **calendar** based components: [fullcalendar](https://fullcalendar.io/) a small web component library for creating calendars,
- **table** based components: [handsontable](https://handsontable.com/) a small web component library for creating tables,

---

## Sources

- [Atomic Design](https://atomicdesign.bradfrost.com/)
- [Atomic Design - Chapter 2](https://atomicdesign.bradfrost.com/chapter-2/)