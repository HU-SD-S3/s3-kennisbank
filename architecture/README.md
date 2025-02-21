# Architecture

We could make a front-end application by just writing a bunch of components and putting them together. But that would be like building a house without a blueprint. We need a plan, a structure, a way to organize our code. That's where architecture comes in.

## Why do we need architecture?

- **Separation of concerns**: We want to separate our code into different layers, so that each layer has its own responsibility. This makes our code easier to understand, easier to maintain, and easier to test.

- **Scalability**: We want to be able to add new features to our application without having to rewrite everything. We want to be able to change our application without breaking it.

- **Reusability**: We want to be able to reuse our code in different parts of our application, or in different applications.

- **Performance**: We want our application to be fast and responsive. We want to load only the code that we need, when we need it.

- **Security**: We want our application to be secure. We want to protect our data, and our users' data, from unauthorized access.

## Common architectural patterns

There are many different architectural patterns that we can use to structure our front-end application. Some of the most common patterns are:

- **MVC (Model-View-Controller)**: This is a classic pattern that separates the application into three layers: the model (data), the view (presentation), and the controller (logic). The model is responsible for managing the data, the view is responsible for displaying the data, and the controller is responsible for handling user input.

- **MVVM (Model-View-ViewModel)**: This is a variation of the MVC pattern that is often used in front-end development. The view is responsible for displaying the data, the model is responsible for managing the data, and the view-model is responsible for handling user input and updating the model.

- **MVP (Model-View-Presenter)**: This is another variation of the MVC pattern that is often used in front-end development. The model is responsible for managing the data, the view is responsible for displaying the data, and the presenter is responsible for handling user input and updating the view.

- **MVW (Model-View-Whatever)**: This is a more generic pattern that can be used to describe any architecture that separates the application into different layers. The model is responsible for managing the data, the view is responsible for displaying the data, and the "whatever" is responsible for handling user input and updating the model.

## Our front-end architecture

In our projects we will have the folders `view`, `controller` and `service`. The `view` folder contains all the components that are responsible for displaying the data. The `controller` folder contains all the components that are responsible for handling user input. The `service` folder contains all the components that are responsible for managing the data. We further divide the `view` folder into `components` and `pages`. The `components` folder contains all the reusable components that are used in multiple pages. The `pages` folder contains all the components that represent a specific page in the application.

This separation of concerns makes our code easier to understand, easier to maintain, and easier to test. It also makes our code more reusable, more scalable, and more performant.
It also puts restrictions on the javascript statements that can be used in each of the folders.
For example, JavaScript files in the `view` and `controller` folder should not access data from the `localstorage` directly, or make a `fetch` call to an API. This should be done in the `service` folder.
The JavaScript files within `service` and `controller` folders should not call any DOM API's directly (like `document.querySelector` or `document.addEventListener`). This should be done in the `view` folder.
The JavaScript files in the `service` and `view` folders should do any calculations or transformations of data.

Given our front-end architecture we can conclude that we use the MVVM pattern. The `view` folder is responsible for displaying the data, the `controller` folder is responsible for handling user input, and the `service` folder is responsible for managing the data.

:house: [Home](../README.md) | :arrow_up: [](../README.md) | [Project Setup](./project-setup.md) :arrow_forward: