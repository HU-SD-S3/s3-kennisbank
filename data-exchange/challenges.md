# Challenges

## Challenge 1: Data List with CRUD Operations

**Objective**

Create three custom web components using Lit that demonstrates data exchange between them. The components should
communicate using different patterns (mediator pattern, events, and observables). The components should also use a
service layer to communicate with a JSON-Server for data persistence.

**Requirements**

1. **Component Structure**:
   - Create three custom elements: `data-form`, `data-list` and `data-list-item`.
   - The `data-form` component should contain a form with fields for name, phone number, and email address, along with a
     button to add the data to a list.
   - The `data-list` component should display the list of entries added from the `data-form` component using the `data-list-item` component.
   - Each `data-list-item` should have an edit and delete button.

2. **Data Exchange**:
   - Use the mediator pattern to exchange data between the two components.
   - Refactor the code to use events for data exchange between the components.
   - Integrate JSON-Server to store the data, ensuring that only the service layer communicates with the JSON-Server.
   - Refactor the code to use observables for data exchange between the service layer and the view layer.

3. **Service Layer**:
   - Create a service layer that handles all communication with the JSON-Server.
   - The service layer should provide methods to add, edit, delete, and fetch data from the server.

**Instructions**

1. Create a new Lit project and set up the necessary files for the `data-form`, `data-list` and `data-list-item` components.
2. Implement the `data-form` component with a form that includes fields for name, phone number, and email address.
3. Implement the `data-list` component to display the list of entries added from the `data-form` component.
4. Implement the `data-list-item` component to display individual entries with edit and delete buttons.
5. Implement the mediator pattern to exchange data between the components.
6. Refactor the code to use events for data exchange between the components.
7. Integrate JSON-Server to store the data, ensuring that only the service layer communicates with the JSON-Server.
8. Refactor the code to use observables for data exchange between the service layer and the view layer.

---

:house: [Home](../README.md) | :arrow_backward: [Observables](./observables.md) | :arrow_up:
[Data Exchange](./README.md)
