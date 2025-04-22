# Observables

In the previous chapters we discussed different ways of exchanging data between web components. What most of them had in common was that the communication was triggered by something the user did. For example clicking a button or changing the value of an input field. And for such cases where the data is exclusiefly exchange within the view layer, events are a good solution.

But for the scenario when the data or changes of the data needs to be stored by the service layer and other components are interested in this data, events originated from the view layer are not the best solution. This is because the view layer is not responsible for the data. The view layer is only responsible for the view (separation of concerns principle). The service layer is responsible for the data. So if you want to inform other components about changes in the stored data, you should use a different approach.

Another scenario occurs when the service layer fetches some new data from the server, based on active polling (regularly checking for new data) or a push notification (the server informs the client that there is new data). In this case, the service layer needs to inform the view layer that there is new data.

In both scenarios events originated from the service layer are not the best solution. This is because the service layer should not invoke DOM API calls and therefore could not trigger an event. So we need a different approach. This is where observables come into play. They can be compared to push notifications, which will be send to everyone who is subscribed to specific data. They are based on the observer pattern, which is a design pattern that allows an object (the observable) to notify other objects (the observers) about changes in its state. The observer pattern is a common pattern in programming and is used in many libraries and frameworks, including RxJS.

## Vanilla JS Observable

## RxJS

TODO:

- In principe is de reactive property een voorbeeld van een observable. De property wordt geobserveerd en als deze veranderd triggerd dit een re-render.
- Wat is het verschil tussen een observable en een event? 
    Een event is een momentopname, een observable is een stream van data.
    Ander verschil is dat een event gekoppeld is aan een DOM element, een observable niet.
    => bij een goede architectuur van de front-end code waarin we lagen onderscheiden is er vanuit het separation of concerns principe is het reageren op wijzigingen in data met een observable beter dan met een event.
- Hoe werkt een observable?
  - Je neemt een abonnement op een observable. Dit abonnement wordt een subscription genoemd. Als de observable een nieuwe waarde heeft, wordt deze waarde naar de subscription gestuurd. De subscription kan dan acties uitvoeren op basis van deze nieuwe waarde.
- Hoe kun je een observable maken?
  - Je kunt hem weliswaar zelf maken, maar het is beter om een library te gebruiken die dit voor je doet. Zoals bijvoorbeeld RxJS.
- Gebruik van Observable in RxJS => voorbeeld van een observable die een waarde doorgeeft aan een subscription. De subscription logt de waarde op de console. Probleem als er meer dan een subscription is. Kunnen we oplossen door zelf een lijst van subscriptions bij te houden en de waarde naar alle subscriptions te sturen. Maar dat is niet performant.
- Gebruik van Subject. Een subject kan meerdere subscriptions hebben en stuurt de waarde naar alle subscriptions. Dit is een betere oplossing dan zelf een lijst van subscriptions bijhouden.
- Gebruik van BehaviorSubject. Een BehaviorSubject heeft een default waarde. Als je een subscription neemt op een BehaviorSubject, krijg je altijd de laatste waarde die de BehaviorSubject heeft. Dit is handig als je wilt dat een component altijd de laatste waarde heeft, ook als deze pas later geabonneerd wordt.

---

:house: [Home](../README.md) | :arrow_backward: [Signals](./signals.md) |
:arrow_up: [Data Exchange](./README.md) | [Vanilla JS Observables](./observables-vanilla-js.md) :arrow_forward:
