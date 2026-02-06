# Challenges

### Task 1 - Boilerplate

Create a boilerplate project a Lit web component based applications.

## Challenge context

The goal of these challenges is to create an application that consists of the following pages:

1. **Home Page**: A simple page with a welcome message and links to the other pages.
2. **Login Page**: A mockup page of a login, that doesn't require any authentication at all. All it does is offer the user a simple dropdown menu where the user can select an account. There should be at least 3 accounts to choose from. One of the accounts should be an admin account, while the other two should be regular user accounts.
3. **User Select Page**: This page should only be accessible by an admin. Regular users should not even see an option to access this page. On this page the admin should be able to select a user from a list of users to access their profile page. The list of users should be fetched from a mock API.
4. **Profile Page**: A page that displays the user's profile information. The information should be fetched from a mock API. The page should only be accessible to logged-in users and should only display the information of the currently logged-in user. However, the admin account should be able to view the profile information of all users.


### Task 2 - Determine the sitemap

Use a simple drawing tool like [Excalidraw](https://excalidraw.com/) or [Draw.io](https://app.diagrams.net/) to create a sitemap design for the application described in the challenge context. The sitemap should include the following:

- All the pages mentioned in the challenge context as well as the navigation flow between the pages.
- Let each page be represented by a single web component on the page level. Note the name of the page level components on your sitemap near each page.
- Determine the URL structure of the application. Assign an URL to each page in your sitemap.

Save the drawing as an image and store it in the docs folder of the repository of this challenge.

> [!NOTE]
> 
> There are no standard models for sitemaps. The goal of this task is to get you thinking about the structure of your application before you start coding it.

### Task 3 - Wireframes

Create wireframes for each page in the application described in the challenge context. Take care that each wireframe respects the following general guidelines:

- A basic layout of each page, including the placement of key elements such as headers, footers, navigation menus, and content areas.
- (Nav)Links, buttons, and input fields must have a label indicating their purpose.
- Input fields must be clearly identifiable as input fields.
- Tabels must have headers indicating the content of each column.
- Make sure to wireframe contains sample data to illustrate how the final page will look like.

Mark the different components that you will need to create in the wireframe and label them each with a tag name.
Save the drawing as an image and store it in the docs folder of the repository of this challenge.

### Task 4 - Document you Web Components

For each component that you identified in the wireframe design, create a markdown file that documents how to use the component.
These documentation files should also allow you to plan the implementation of the components and separate tasks if you are working in a team.

### Task 5 - Implement the Web Components

Implement the web components that you identified in the wireframe design.

## MPA Challenge

### Task 6 - Implement the Pages

- Create the html files for the pages you determined in the sitemap design and let them use the page level web components you created in the previous tasks.
- Implement the navigation between the pages using standard anchor links.

### Task 7 - Deployment

In the project we often see that things work in the development environment, but fail in the production environment. To prevent this from happening to you, please follow the steps below to test and deploy your MPA application:

- Run the `npm run build` command to create a production build of your application (normally in the `dist` folder).
- Run the `npm run preview` command to preview and test the production build of your application.
- In case the preview works as expected, deploy the production build (the `dist` folder) at an external hosting service like the GitHub Pages and test again that everything works as expected. You can use this [bash deploy script](./assets/deploy.sh) to deploy your application to GitHub Pages. All you need to do first is uncomment and edit line 8 to set your `GIT_REPO_REMOTE` variable correctly to match your GitHub organization and repository name.
- In case the preview doesn't work as expected, read the [Vite Project Setup](./vite-project-setup-basics.md) and the [MPA Project Setup](./mpa-project-setup.md) chapters again and try to find out what went wrong.

## SPA Challenge

### Task 8 - Implement the Router

- Implement a routing script for the routing between the pages you determined in the sitemap design.
- Adapt the index.html file to use the routing script.

## Reusability Challenge

### Task 9 - Routing Links

What if you want to use the same web component on a page in multiple applications. How would you implement the routing links in a way that they work in both MPA and SPA applications? Create a solution that allows you to use the same web component in both MPA and SPA applications without changing the code of the web component you want to reuse. What are your take aways from this exercise?

---

:house: [Home](../README.md) | :arrow_backward: [Vaadin Router](./vaadin-router.md) |
:arrow_up: [Multiple- and Single-page applications](./README.md)
