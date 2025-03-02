# Communication

In this chapter we will discuss the different ways of data communication, when using web components.
The first article will discuss the communication with a back-end and the setup of our reference architecture for the front-end.
The other article will discuss the communication between different components in the front-end.

## [Backend Communication](./backend-communication.md)



- Algemene kennis
> Wat is het probleemgebied dat we met communicatie willen oplossen?
  Communicatie tussen componenten
  Hoe herken je dat je met dit probleem te maken hebt? Je moet de pagina reloaden om wijzigingen in de data overal op de pagina te zien. We kunnen de reload weliswaar ook vanuit code triggeren om dit problem op te lossen, maar dat is een hele slechte oplossing. Er wordt dan immers weer de gehele pagina opnieuw geloden en gerenderd, wat betekend dat de gebruiker ondertussen niks op de pagina kan doen. Bovendien worden alle variabelen opnieuw geinitialiseerd, waardoor de gebruiker misschien zelfs opnieuw moet inloggen.
> Welke communicatie oplossingen zijn er?

## Communicatie via Attributen

- voorbeeld van het value attribuut van een input tag (in principe sluis je data door). Door nu de input tag zelf te bouwen in een eigen component, kun je de data die je in de input tag stopt, doorgeven aan de parent component.
- voorbeeld van twee sibling componenten die met elkaar communiceren via een attribuut. De ene component heeft een attribuut, de andere component heeft een event listener op dat attribuut. (mediator pattern)
- wanneer niet via attributen te communiceren?
  - als de componenten verder uit elkaar liggen dan parent-child, sibling-sibling. Dan is het beter om een event bus te gebruiken. Want dan moet je anders teveel componenten doorgeven en moeten de andere componenten attributen bijhouden die niet binnen hun eigen context liggen (responsibility principle).
  - als de data die je wilt doorgeven te groot of complex is. Je moet anders immers JSON.stringify en JSON.parse gebruiken om de data door te geven. Dat is niet performant.

## Communicatie via Events

> Waarom CustomEvents gebruiken? => Voorbeeld webcomponent met twee buttons erin, wie heeft het event gedispatched? Hoe weet de parent component dat er op een button geklikt werd, en welke button is geklikt?  
> werken met namen van events in lit (@click, @submit, ...)  
> Herhaling algemeen structuur CustomEvent en dispatchen van een event, data via detail meegeven  
> Bron van het event (welk DOM element dispatcht het event :host of toch een element binnen de shadow DOM?)  
> namen van customevents (@custom-event-name) en reden voor het opvangen van standaard events en vertalen naar eigen event namen (is dit een pattern? Zo ja, Heeft die een naam?)  
> Event bubbling  
> Composed events  
> opruimen van event listeners in de disconnectedCallback  

## Signals

- Wat is een signal?
- Hoe werkt een signal?
- Hoe kun je een signal maken?
- Signals zijn op dit moment nog geen standaard in de browser, maar elk framework heeft zijn eigen implementatie van signals. In lit kun je bijvoorbeeld werken met lit-signals.

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

:house: [Home](../README.md) | :arrow_up: [](../README.md) | [Project Setup](./project-setup.md) :arrow_forward:
