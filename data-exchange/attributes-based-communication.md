## Communicatie via Attributen

- voorbeeld van het value attribuut van een input tag (in principe sluis je data door). Door nu de input tag zelf te
  bouwen in een eigen component, kun je de data die je in de input tag stopt, doorgeven aan de parent component.
- voorbeeld van twee sibling componenten die met elkaar communiceren via een attribuut. De ene component heeft een
  attribuut, de andere component heeft een event listener op dat attribuut. (mediator pattern)
- wanneer niet via attributen te communiceren?
  - als de componenten verder uit elkaar liggen dan parent-child, sibling-sibling. Dan is het beter om een event bus te
    gebruiken. Want dan moet je anders teveel componenten doorgeven en moeten de andere componenten attributen bijhouden
    die niet binnen hun eigen context liggen (responsibility principle).
  - als de data die je wilt doorgeven te groot of complex is. Je moet anders immers JSON.stringify en JSON.parse
    gebruiken om de data door te geven. Dat is niet performant.

---

:house: [Home](../README.md) | :arrow_backward: [Backend Communication](./backend-communication.md) | :arrow_up:
[Data Exchange](./README.md) | [Event based communication](./events-based-communication.md) :arrow_forward:
