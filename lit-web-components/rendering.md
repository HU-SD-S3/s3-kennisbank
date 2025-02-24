# Rendering

De taak en verantwoordelijkheid van de render functie in een Lit component is het om de inhoud van het component te renderen, dus de DOM te manipuleren.
Het is niet de bedoeling dat dit elders in de code gebeurt, maar altijd in de render functie.

Het is niet de bedoeling dat deze functie direct door eigen code wordt aangeroepen, maar altijd via de lifecycle methoden. De render methode zelf maakt zelf ook deel uit van de lifecycle van een component. 

Voorbeeld van een simpel formulier met input en output gedeelte per item.

- Item 1: Prive Property van een klasse, deze wijzigingen van de input worden wel op de console getoond, maar niet in gerenderd. Pas met een request Update wordt de render opnieuw uitgevoerd.
- Item 2: Tag Attribute, wijzigingen van deze property worden wel direct gerenderd, dit soort properties worden ook wel reactive properties genoemd.
- Item 3: Reactive Property die niet als attribute is gedeclareerd. Ook deze is reactive en wordt direct gerenderd, maar de nieuwe inhoud ervan wordt niet in de tag weergeven.
- Item 4: Boolean reactive property die we gebruiken om een input veld wel/niet verplicht te maken. Als ook dat we de tekst op de site aanpassen ('Required' / 'Optional').
- Item 5: Een lijst van items (Array) die als reactive property wordt weergegeven. De inhoud van de array wordt in een lijst weergegeven, deze wordt echter pas opnieuw gerenderd als het array object zelf veranderd, niet de inhoud van de array.

In lifecycle gaan we verder in op connectedCallback, firstUpdated, disconnectedCallback, attributeChangedCallback, adoptedCallback en hoe we requestUpdate kunnen voorkomen.


Voorbeeld van een simpel form waarvan de inhoud eronder wordt weergegeven.
> Hoe werkt het renderen van een lit component?
> Wat triggerd een re-render?  
> verschil tussen attributes, properties en reactive properties (property options: reflect, attribute, hasChanged).
> Hoe om te gaan met boolean attributes `?attribute`  
> (... zie https://lit.dev/docs/templates/expressions/)
> Initialiseren van properties in de constructor en/of in de connectedCallback (Promises). => life cycle => voorkomen van Request Update
> Werken met SLOTs  

---

## Sources

- [LIT - Reactive properties](https://lit.dev/docs/components/properties/)

---

:house: [Home](../README.md) | :arrow_backward: [Input and Events](./inputs-and-events.md) | :arrow_up: [Learning Stories](./README.md) | [Lifecycle](./lifecycle.md) :arrow_forward:
