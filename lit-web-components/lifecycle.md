# Lifecycle

---
TODO:

- Constructor
- connectedCallback
- render
- firstUpdated
- render
- attributeChangedCallback
- requestUpdate
- disconnectedCallback

Met concole.log laten zien wie wanneer wordt aangeroepen.  
Duidelijk maken dat constructor een eerste de initialisatie van de properties (zonder dat er data elders wordt opgehaald) doet, zodat er gerenderd kan worden.  
Duidelijk maken dat de connectedCallback de initialisatie van properties doet die data van elders ophaalt, maar dat bij de connectedCallback de render nog niet aan is geroepen, waardoor er nog niks over de DOM van het component bekend is. Belangrijk is om te weten dat het eerste statement in de connectedCallback de super.connectedCallback() moet zijn.  
Duidelijk maken dat de firstUpdated pas wordt aangeroepen als de render is uitgevoerd en de DOM van het component bekend is. Dit maakt dat we nu DOM elementen kunnen raadplegen.  
Checken wanneer de attributeChangedCallback wordt aangeroepen.  
Idle time waarop de render opnieuw getriggerd kan worden.  
DisconnetedCallback wordt aangeroepen als het component uit de DOM wordt verwijderd. Belangrijk om hier eventuele listeners te verwijderen. Belangrijk om te weten dat het laatste statement in de disconnectedCallback de super.disconnectedCallback() moet zijn.  

In de tijd dat het component in de DOM zit (idle is), kunnen events ervoor zorgen dat er lifecycle methoden worden aangeroepen.

- wijzigingen van attributen
- binnenkomende events, trigger van render bij reactive properties, handmatige trigger van render door requestUpdate

---

---

## Sources

- [LIT - Lifecycle](https://lit.dev/docs/components/lifecycle/)

---

:house: [Home](../README.md) | :arrow_backward: [Rendering](./rendering.md) | :arrow_up: [Learning Stories](./README.md) | [Input Components](./input-components.md) :arrow_forward:
