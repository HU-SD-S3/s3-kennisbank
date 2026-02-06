# Challenges

**Objective**

To create a set of custom web components using Lit that demonstrate data exchange between them using different patterns (mediator pattern, events, and observables). The components should also use a service layer to demonstrate communication with a REST API for data persistence.

## Specifications

The specifications for this challenge are given by the documentation you should normally provide for your frontend.
The documentation can be found [here](./assets/doc/README.md).

## Challenge 1 - Data Exchange using Events and Mediator Pattern

In this challenge, you will create a set of custom web components using Lit that demonstrate data exchange between them using the mediator pattern and events. The components will also use a service layer to communicate with a simulated REST API for data persistence.

- [ ] **Task 1** Setup a boilerplate Lit project with the necessary dependencies.
- [ ] **Task 2** 
   - [ ] Install the JSON-Server package to simulate a REST API. 
   - [ ] Create a `db.json` file to serve as the database for the JSON-Server and give it an initial content like:
     ```json
      {
         "users": [
            {
               "id": "1bc8",
               "name": "Donald Duck",
               "email": "donald@duck.nl",
               "phone": "1234567890"
            }
        ]
      }
      ```
   - [ ] Add a script to start the JSON-Server to the `package.json` file. 
- [ ] **Task 3** Create a serive layer that is responsible for all communication about the User Data with the backend (JSON-Server). For now make sure that you can fetch the initial data from the JSON-Server and display it in the console.
- [ ] **Task 4** Create the skeleton for the four custom elements: `data-form`, `data-list`, `data-list-item` and `data-exchange`. They should not have any functionality yet, just the basic structure and an empty render method.
- [ ] **Task 5** Let the `data-exchange` component fetch the initial user data from the service layer and display it in the console.
- [ ] **Task 6** Let the render of the `data-exchange` component display the `data-list` component and pass the fetched user data to it as an attribute and let now the `data-list` component display the data in the console.
- [ ] **Task 7** Implement the `data-list` component to render a list of `data-list-item` components based on the user data it receives as an attribute, and let now each `data-list-item` component display the user data in the console.
- [ ] **Task 8** Implement the render method of the `data-list-item` component to display the user data in a readable format.
- [ ] **Task 9** Implement the `data-form` component to render a form with fields for name, phone number, and email address, along with a button to add the data to the list and adapt the `data-exchange` component to include the `data-form` component in its render method.
- [ ] **Task 10** Implement that the submit action in the `data-form` component triggers an event that the `data-exchange` component listens to.
- [ ] **Task 11** Implement that the `data-exchange` component handles the `data-added` event from the `data-form` component, by making the service layer add the new user data to the JSON-Server and then fetch the updated user data from the service layer and pass it to the `data-list` component to update the displayed list. NOTE: If you have implemented the reactive properties correctly, the `data-list` component should update automatically when the attribute changes. Meaning that you successfully implemented the mediator pattern for data exchange between the components.
- [ ] **Task 12** Add the delete button to the `data-list-item` component and implement that clicking the delete button triggers an event that the `data-exchange` component listens to. Causing the `data-exchange` component to make the service layer delete the user data from the JSON-Server and then fetch the updated user data from the service layer and pass it to the `data-list` component to update the displayed list.
- [ ] **Task 13** Add the edit button to the `data-list-item` component and implement that clicking the edit button will dispatch an event that the `data-exchange` component listens to. The `data-exchange` component should then provide an attribute with the user data to be edited to the `data-form` component.
- [ ] **Task 14** Let the `data-form` component have an internal state stored in a reactive boolean property that we call `editMode`. When `editMode` is true, the form should be pre-filled with the user data received from the `data-exchange` component and the submit button should update the existing user data instead of adding a new one. When `editMode` is false, the form should be empty and the submit button should add a new user data. Check the [lifecycle](https://lit.dev/docs/components/lifecycle/) documentation to find the right lifecycle method to detect changes to the attribute with the user data to be edited.
- [ ] **Task 15** Let the submit action in the `data-form` component trigger different events based on the `editMode` state: when `editMode` is true, dispatch an `data-updated` event with the updated user data, and when `editMode` is false, dispatch a `data-added` event with the new user data.
- [ ] **Task 16** Implement that the `data-exchange` component handles the `data-updated` event from the `data-form` component, by making the service layer update the user data in the JSON-Server and then fetch the updated user data from the service layer and pass it to the `data-list` component to update the displayed list. NOTE: All CRUD operations should now be implemented using events and the mediator pattern for data exchange between the components.
- [ ] **Task 17** In the documentation of the `data-form`, `data-list` and `data-list-item` components you will also see that they have a CSS Variables section. Implement these CSS Variables in the components to allow easy theming of the components and demonstrate the usage of these CSS Variables so that it is clear how they work.

> [!NOTE]
>
> Note that if you change the data in the json-server from another browser (tab) the data in your application will not update automatically, because we are using REST where the "S" stands for stateless. Meaning that the server does not keep track of any clients and their state. So when the data changes on the server, the clients are not notified about this change. To see the updated data you will have to refresh the application to fetch the data again from the server.

## Challenge 2 - Data Exchange using Observables

### Challenge 2.1 Code refactoring

Refactor the code to use observables for data exchange between the service layer and the view layer.

### Challenge 2.2 (optional) Server Sent Events

Use the forked version of JSON-Server (see [Pull Request 1614](https://github.com/typicode/json-server/pull/1614)) that supports Server Sent Events (SSE) to implement real-time updates in the application. This means that when the data in the JSON-Server changes (for example, when you add, update or delete a user from another browser tab), the changes should be automatically reflected in your application without needing to refresh the page.

---

:house: [Home](../README.md) | :arrow_backward: [Observables](./observables.md) | :arrow_up:
[Data Exchange](./README.md)
