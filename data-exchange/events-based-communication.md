# Event based communication

We already discussed events in the [Lit Web Components](../lit-web-components/lit-web-components.md) chapter, but that were only standard events like click, submit, etc. In this chapter we will discuss custom events and how to use them for communication between web components.

TODO:
> Waarom CustomEvents gebruiken? => Voorbeeld webcomponent met twee buttons erin, wie heeft het event gedispatched? Hoe
> weet de parent component dat er op een button geklikt werd, en welke button is geklikt?  
> werken met namen van events in lit (@click, @submit, ...)  
> Herhaling algemeen structuur CustomEvent en dispatchen van een event, data via detail meegeven  
> Bron van het event (welk DOM element dispatcht het event :host of toch een element binnen de shadow DOM?)  
> namen van customevents (@custom-event-name) en reden voor het opvangen van standaard events en vertalen naar eigen
> event namen (is dit een pattern? Zo ja, Heeft die een naam?)  
> Event bubbling  
> Composed events  
> opruimen van event listeners in de disconnectedCallback

---

:house: [Home](../README.md) | :arrow_backward: [Attribute based communication](./attributes-based-communication.md) |
:arrow_up: [Data Exchange](./README.md) | [Context](./context.md) :arrow_forward:
