# Data Exchange

In this chapter we will discuss the different ways of exchanging data, when using web components.
The first article will discuss the data exchange between front- and back-end and the setup of our reference architecture for the front-end.
The other article will discuss the data exchange between different components within the front-end itself.
All articles are based on a [project setup](../lit-web-components/project-setup.md) as described in chapter about the Lit Web Components.

## Table of contents

- [Backend Communication](./backend-communication.md)
- [Attributes based communication](./attributes-based-communication.md)
- [Events based communication](./events-based-communication.md)
- [Context](./context.md)
- [Signals](./signals.md)
- [Observables](./observables.md)

To exercise the knowledge you gained from this chapter, you can try some [challenges](./challenges.md).

---

- Algemene kennis
> Wat is het probleemgebied dat we met communicatie willen oplossen?
  Communicatie tussen componenten
  Hoe herken je dat je met dit probleem te maken hebt? Je moet de pagina reloaden om wijzigingen in de data overal op de pagina te zien. We kunnen de reload weliswaar ook vanuit code triggeren om dit problem op te lossen, maar dat is een hele slechte oplossing. Er wordt dan immers weer de gehele pagina opnieuw geladen en gerenderd, wat betekend dat de gebruiker ondertussen niks op de pagina kan doen. Bovendien worden alle variabelen opnieuw geinitialiseerd, waardoor de gebruiker misschien zelfs opnieuw moet inloggen.
> Welke communicatie oplossingen zijn er?

---

:house: [Home](../README.md) | :arrow_up: [Data Exchange](./README.md) | [Backend Communication](./backend-communication.md) :arrow_forward:
