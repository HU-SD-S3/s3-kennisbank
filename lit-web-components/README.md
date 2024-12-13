## Lit Web Components

Setup a new project for these learning stories. See the [project setup page](project-setup.md) for more information.

The overall learning story for this path is:

_As a developer, _

To achive this, we will cover the following topics:

### Lit Basics

- [Hello Lit](./hello-lit.md)
- [Styling](./styling.md)
- Lit Attributes/Properties

> reactive properties (property options: type, reflect, attribute, hasChanged)  
> Hoe om te gaan met boolean attributes `?attribute`  
> (... zie https://lit.dev/docs/templates/expressions/)

- CustomEvents

> Waarom CustomEvents gebruiken? => Voorbeeld webcomponent met twee buttons erin, wie heeft het event gedispatched? Hoe weet de parent component dat er op een button geklikt werd, en welke button is geklikt?  
> werken met namen van events in lit (@click, @submit, ...)  
> Herhaling algemeen structuur CustomEvent en dispatchen van een event, data via detail meegeven  
> Bron van het event (welk DOM element dispatcht het event :host of toch een element binnen de shadow DOM?)  
> namen van customevents (@custom-event-name) en reden voor het opvangen van standaard events en vertalen naar eigen event namen (is dit een pattern? Zo ja, Heeft die een naam?)  
> Event bubbling  
> Composed events  
> opruimen van event listeners in de disconnectedCallback  

- Rendering

> Hoe werkt het renderen van een lit component?  
> Wat triggerd een re-render?  
> Initialiseren van properties in de constructor en/of in de connectedCallback (Promises)  
> Werken met SLOTs  

- Inputs

> Hoe werken inputs in Lit?  
> Hoe kun je een input uitlezen?  
> Hoe kun je een eigen input component maken? (Advanced stuff)  

- Lifecycle Callbacks

> connectedCallback, disconnectedCallback, attributeChangedCallback, adoptedCallback  
> voorkomen van requestUpdate!!!
