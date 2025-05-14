# Architecture

We could make a front-end application by just writing a bunch of components and putting them together. But that would be
like building a house without a blueprint, which will work if the house is a shack, but not if it's a mansion or a
skyscraper.

To build a solid web application we need a plan, a structure, a way to organize our code.  
That's where architecture comes in. The basic principles of architecture apply to all layers of the application.
But since this section is about the front-end, we will only focus on the architecture of the front-end application.


- **Separation of concerns**: We want to separate our code into different layers, so that each layer has its own
  responsibility. This makes our code easier to understand, easier to maintain, and easier to test.

- **Scalability**: We want to be able to add new features to our application without having to rewrite everything. We
  want to be able to change our application without breaking it.

- **Reusability**: We want to be able to reuse our code in different parts of our application, or in different
  applications.

- **Performance**: We want our application to be fast and responsive. We want to load only the code that we need, when
  we need it.

- **Security**: We want our application to be secure. We want to protect our data, and our users' data, from
  unauthorized access.

What makes it a little bit more complicated is that there are many different points of view for this topic.
In this section we will regard this topic from three differnt perspectives:

- [**Global high-level architecture**](./global-architecture.md): This is the architecture of the whole application.
- [**Web Components architecture**](./web-components-architecture.md): This section covers the setup choices for individual web components.
- [**Front-end architecture patterns**](./architectual-patterns.md): This section covers the verious architecture patterns that can be used to
  build a front-end application like MVC, MVP, MVVM and other.

---

:house: [Home](../README.md) | :arrow_up: [](../README.md) | [High Level Architecture](./global-architecture.md) :arrow_forward:
