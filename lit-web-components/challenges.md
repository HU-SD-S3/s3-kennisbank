# Challenges

## Challenge 1: Create a Countdown Timer Web Component

**Objective**  

Create a custom web component using Lit that functions as a countdown timer. The component should demonstrate the use of
properties, events, Shadow DOM, and styling.

**Requirements**  

1. **Component Structure**:

   - Create a custom element called `countdown-timer`.
   - The component should display an input field to set the countdown time in seconds and a button to start the
     countdown.
   - Display the remaining time below the input field.

2. **Countdown Functionality**:

   - When the button is clicked, start the countdown from the specified time.
   - Update the displayed time every second.
   - When the countdown reaches zero, display a message "Time's up!".

3. **Styling**:

   - Use the Shadow DOM to encapsulate the styles of the component.
   - Apply styles to the component to make it visually appealing (e.g., padding, margins, background color).

4. **Lifecycle Callbacks**:
   - Implement the `connectedCallback` and `disconnectedCallback` lifecycle methods.
   - Log messages to the console when these methods are called.

**Instructions**  

1. Create a new file for your countdown-timer component.
1. Implement the component according to the requirements.
1. Test your component by adding it to an HTML file and opening it in a browser.
1. Ensure that the component works as expected and that the styles are correctly applied.

## Challenge 2: Create a Weather Widget Web Component

**Objective**  

Create a custom web component using Lit that displays weather information. The component should demonstrate the use of properties, fetching data from an API, Shadow DOM, and styling.

**Requirements**  

1. **Component Structure**:

   - Create a custom element called `weather-widget`.
   - The component should display an input field to enter a city name and a button to fetch the weather information.
   - Display the weather information (e.g., temperature, weather description) below the input field.

2. **Fetching Data**:

   - When the button is clicked, fetch the weather information for the specified city using a weather API (e.g., OpenWeatherMap API).
   - Display the fetched weather information in the component.

3. **Styling**:

   - Use the Shadow DOM to encapsulate the styles of the component.
   - Apply styles to the component to make it visually appealing (e.g., padding, margins, background color).

4. **Lifecycle Callbacks**:
   - Implement the `connectedCallback` and `disconnectedCallback` lifecycle methods.
   - Log messages to the console when these methods are called.

**Instructions**  

1. Create a new file for your weather-widget component.
1. Implement the component according to the requirements.
1. Test your component by adding it to an HTML file and opening it in a browser.
1. Ensure that the component works as expected and that the styles are correctly applied.

---

:house: [Home](../README.md) | :arrow_backward:
[Multiple values input components](./input-components-multiple-values.md) | :arrow_up: [Lit Web Components](./README.md)
