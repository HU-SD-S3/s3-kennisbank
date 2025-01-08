# Lit Web Components

Setup a new project for these learning stories. See the [project setup page](project-setup.md) for more information.

The overall learning story for this path is:

_As a developer, _

To achive this, we will cover the following topics:

## Lit Basics

- [Hello Lit](./hello-lit.md)
- [Styling](./styling.md)
- [Lit Attributes/Properties](./lit-attributes.md)

## Inputs and Events

- [Inputs and Events](./input-and-events.md)

> Werken met standard events (click, submit, ...) in lit (=> @click, @submit, ...).
Simple voorbeeld van een button met een click event, een voorbeeld van een input veld met een change event en een form met een submit event. Events triggeren alleen een eventHandler, maar laten alleen op de console iets zien.

## Inputs

Simple formulier veld (text, radiobutton, ...) met een change event handler. Laten zien hoe je de waarde uit kunt lezen. Uitgelezen data wordt op de console getoond, nog niet op de pagina.
Uitlezen van een enkel veld, als ook werken met forms en het uitlezen van alle velden in een form.
> Hoe werken inputs in Lit?  
> Hoe kun je een input uitlezen?  
> Hoe kun je een eigen input component maken? (Advanced stuff)

## Rendering

Voorbeeld van een simpel form waarvan de inhoud eronder wordt weergegeven.
> Hoe werkt het renderen van een lit component?
> Wat triggerd een re-render?  
> verschil tussen attributes, properties en reactive properties (property options: reflect, attribute, hasChanged).
> Hoe om te gaan met boolean attributes `?attribute`  
> (... zie https://lit.dev/docs/templates/expressions/)
> Initialiseren van properties in de constructor en/of in de connectedCallback (Promises).
> Werken met SLOTs  

## Lifecycle Callbacks

> connectedCallback, disconnectedCallback, attributeChangedCallback, adoptedCallback  
> voorkomen van requestUpdate!!!

:house: [Home](../README.md) | :arrow_up: [](../README.md) | [Project Setup](./project-setup.md) :arrow_forward: