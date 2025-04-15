# Observables

In the previous chapters we discussed different ways of exchanging data between web components. What most of them had in common was that the communication was triggered by something the user did. For example clicking a button or changing the value of an input field.
In case the user action resulted in a change of the data, we had to inform other components about this change. We did so by using some kind of DOM related events (with the exception of the context and signals API's). So it's a view layer bounded solution.
But that might violate the separation of concerns principle. The view layer should not be responsible for the data layer. The data layer should be responsible for the data and the view layer should be responsible for the view.
But how can you solve this problem without using the DOM API? This is where observables come in. Observables are a way to decouple the data layer from the view layer. They are a way to create a stream of data that can be observed by other components. This allows you to create a more reactive architecture, where the data layer is responsible for the data and the view layer is responsible for the view.

TODO:
- Wat is een observable?
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
:arrow_up: [Data Exchange](./README.md) | [Challenges](./challenges.md) :arrow_forward:
