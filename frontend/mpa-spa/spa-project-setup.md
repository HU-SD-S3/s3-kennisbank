# Single Page Application (SPA) project setup

Single Page Applications (SPAs) are web applications that load a single HTML page and dynamically update the content as the user interacts with the app. This approach allows for a more fluid user experience, similar to that of a desktop application.

Unlike traditional Multi-Page Applications (MPAs), SPAs do not require a full page reload for each interaction, which can lead to faster navigation and a more seamless experience.  
However, SPAs also come with their own set of challenges, such as managing browser history, handling deep linking, and ensuring that the application is SEO-friendly. A common problem with SPAs is the performance hit that can occur during the initial load, as the entire application needs to be downloaded before it can be rendered.

In this section, we will discuss how to set up a SPA project using Lit.
To archive this, we need a some code to determine what page to show and to manipulate the DOM to show that page. This is called routing. Routing is a common concept that you will find in most web frameworks.

We start by first setting up a simple SPA project to understand the [basics of routing](./routing-basics.md), and then will use the [vaadin router](./vaadin-router.md) library to help us with the routing.

---

## Sources

---

:house: [Home](../README.md) | :arrow_backward: [MPA project setup](./mpa-project-setup.md) | :arrow_up: [Multiple- and Single-page applications](./README.md) | [Routing Basics](./routing-basics.md) :arrow_forward:
