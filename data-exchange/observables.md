## Observables

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
