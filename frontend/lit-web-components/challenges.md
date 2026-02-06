# Challenges

### Task 1 - Boilerplate Setup

Create the boilerplate for a Lit web component project. 

## Challenge 1: Clock Web Component

**Objective**

Create a custom web component using Lit that displays the current time and updates every second. The component should demonstrate the use of reactive properties, Shadow DOM, and styling.

### Task 2 - Clock Component

Create a clock component following the tasks below. Don't forget to test your component by adding it to an HTML file and opening it in a browser.

### Task 2.1 - Creating a Lit Clock Component

- Create a new lit web component.
- Let the component have a reactive property to hold the current time.
- Initialize the reactive property with the current time when the component is created.
- Implement a render method to display the current time in the format HH:MM:SS.
- Style the component using CSS to use a larger font size and different color.
- Use the connectedCallback lifecycle method to start a timer that updates the current time every second.
- Use the disconnectedCallback lifecycle method to clear the timer when the component is removed from the DOM.

### Task 2.2 - Documenting the Clock Component

Developers who wants to use your component or has to interact with it, don't want to read and understand the implementation of the component. They just want to know how to use it. Therefore, each markdown file should document how to use the component.
To achieve this, each web component markdown file should (for now) contain the following information:

- A header with the name of the component (i.e. the tag name). The Header should also be linked to the source code of the component.
- A short description of the purpose of the component.
- A list of the attributes that the component will need. For each attribute, provide:
  - The name of the attribute
  - The type of the attribute (e.g. string, number, boolean) and in case of a complex type (e.g. object, array) provide the structure of the type.
  - slots (and the name of the slot) that the component provides (if any)

> [!IMPORTANT]
>
> This is for now the bare minimum of documentation you should provide within this challenge. In the future, the bare minimum documentation should also include:
> - Events that the component emitss
> - (Custom)Events that the component listens to
> - REST API calls that the component makes (if any)
>
> Other information that would also be useful but is not part of the minimum documentation required by this course is:
> - Examples of how to use the component
> - Screenshots of the component
> - Styling information (e.g. CSS variables that can be used to style the component)
> - ...

### Task 2.3 - Accessibility Check

Ensure that your clock component is accessible. Check you component using accessibility tools like the axe DevTools Extension and/or the [ARC Toolkit](https://www.tpgi.com/arc-platform/arc-toolkit/) extension.

### Task 2.3 - (Optional) Enhancing the Clock Component

Enhance the clock component by adding a features that:
- allows the user to switch between 12-hour and 24-hour format.
- allows the user to set a timezone for the clock.
Update the documentation of the component to reflect the new features.

## Challenge 2: Countdown Timer Web Component

**Objective**  

Create a custom web component using Lit that functions as a countdown timer. The component should demonstrate the use of
properties, events, Shadow DOM, and styling.

### Task 3 - Countdown Timer Component

Create a countdown timer component following the tasks below. Don't forget to test your component by adding it to an HTML file and opening it in a browser.

### Task 3.1 - Designing the Countdown Timer Component

Before you start coding, give a simple wireframe design of how you want your countdown timer component to look like. Use a simple drawing tool like [Excalidraw](https://excalidraw.com/) or [Draw.io] (https://app.diagrams.net/) to create your wireframe design.
The countdown timer should consists of at least three web components:

- One responsible for the input field and start button
- One responsible for displaying the remaining time
- One for the overall countdown timer that uses the two other components

Mark the different components that you will need to create in the wireframe and label them each with a tag name.
Save the drawing as an image and store it in the docs folder of the repository of this challenge.

### Task 3.2 - Documenting each Component

For each component that you identified in the wireframe design, create a markdown file that documents how to use the component.
Follow the guidelines provided in Task 2.2 of Challenge 1 to document each component.
These documentation files should also allow you to plan the implementation of the components and separate tasks if you are working in a team.

Compare your documentation with those of your peers to see if you identified the same components and if your documentation is clear enough for others to understand how to use the components.
You might also see that not everyone has assigned the same responsibilitys to the components. Discuss with your peers the pros and cons of the different approaches and decide on the best approach for your implementation.

### Task 3.3 - Implementing the Countdown Timer Component

Implement the countdown timer component according to your design and documentation.

### Task 3.4 - Accessibility Check

Ensure that your clock component is accessible. Check you component using accessibility tools like the axe DevTools Extension and/or the [ARC Toolkit](https://www.tpgi.com/arc-platform/arc-toolkit/) extension.

### Task 3.5 - (Optional) Enhancing the Countdown Timer Component

Enhance the displaying of the remaining time by adding a circular progress bar around the time display that visually indicates the remaining time. Other options might be a sand clock animation or changing the color of the time display as time runs out.
How do those enhancements affect the design decisions you made ealier? Did you have to change the responsibilities of the components? Did you have to create new components? What are your lessons learned from this?

## Challenge 3: Weather Widget Web Component

**Objective**  

Create a custom web component using Lit that displays weather information. The component should demonstrate the use of properties, fetching data from an API, Shadow DOM, and styling.

### Task 4 - Weather Widget Component

Create a weather widget component following the tasks below. Don't forget to test your component by adding it to an HTML file and opening it in a browser.

### Task 4.1 - Researching Weather APIs

Research and choose a weather API that provides current weather information. Some popular options include OpenWeatherMap, WeatherAPI, and AccuWeather. Sign up for an API key if required.
Focus in your research first on the bare minimum functionality so that you can get the weather information for a specified city or location. You can always enhance the component later with more advanced features like forecasts, weather icons, etc.

### Task 4.2 - Designing the Weather Widget Component

Before you start coding, give a simple wireframe design of how you want your weather widget component to look like. Use a simple drawing tool like [Excalidraw](https://excalidraw.com/) or [Draw.io] (https://app.diagrams.net/) to create your wireframe design. Determine the component structure based on your design and label the component with a tag name.
Save the drawing as an image and store it in the docs folder of the repository of this challenge.

### Task 4.3 - Documenting the Weather Widget Components

Create a markdown file that documents how to use the weather widget component.
Follow the guidelines provided in Task 2.2 of Challenge 1 to document the component.

### Task 4.4 - Implementing the Weather Widget Component

Implement and style the weather widget component according to your design and documentation.

### Task 4.5 - Accessibility Check

Ensure that your weather widget component is accessible. Check you component using accessibility tools like the axe DevTools Extension and/or the [ARC Toolkit](https://www.tpgi.com/arc-platform/arc-toolkit/) extension.

### Task 4.6 - (Optional) Enhancing the Weather Widget Component

Enhance the weather widget component by adding features like:

- Displaying weather icons based on the current weather conditions.
- Allowing the user to switch between Celsius and Fahrenheit.

Determine how these enhancements affect the design decisions you made earlier. Did you have to change the responsibilities of the component? Did you have to create new components? What are your lessons learned from this?

---

:house: [Home](../README.md) | :arrow_backward:
[Multiple values input components](./input-components-multiple-values.md) | :arrow_up: [Lit Web Components](./README.md)
