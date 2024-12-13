# State Management

What is een State?

- Een state is een vaste toeestand van een applicatie, beter van de objecten in de applicatie, op een bepaald moment in de tijd. Neem bijvoorbeeld een webshop. Hierin kunnen we het object winkelmandje onderkennen. De state van het winkelmandje kan zijn dat deze leeg is, of dat er een aantal producten in zitten. Pas als er minimaal 1 product in het winkelmandje zit, mag de gebruiker producten uit het winkelmandje verwijderen, de hoeveelheid van een product aanpassen of overgaan tot betalen. De state van het winkelmandje bepaalt dus welke acties de gebruiker kan uitvoeren.

Waarom is State Management nodig?

Als we de opties voor een gebruiker zonder statemanagement willen bepalen, moeten we de state van alle objecten in de applicatie in de gaten houden. Dit is niet alleen heel veel werk, maar ook foutgevoelig. Als we bijvoorbeeld vergeten om de state van een object aan te passen, kan het zijn dat de gebruiker acties kan uitvoeren die niet gewenst zijn. Dit kan leiden tot een onveilige applicatie, of een applicatie die niet doet wat de gebruiker verwacht.
Statemanagement is een manier om dit probleem op te lossen.

Hoe bepalen we de state van een object?

De state van een object wordt bepaald door de data die in het object zit. In het geval van het winkelmandje is de state van het winkelmandje bijvoorbeeld leeg als er geen producten in zitten. De state van het winkelmandje is niet leeg als er wel producten in zitten. De state van het winkelmandje is vol als er zoveel producten in zitten dat de gebruiker niet meer producten kan toevoegen. De state van het winkelmandje is niet vol als er nog producten toegevoegd kunnen worden.
Wat voorkomen moet worden is om de state zelf in een variabele bij te houden. Dit is foutgevoelig omdat de state dan niet meer afhankelijk is van de data in het object. Als de data in het object veranderd, maar de state niet, dan is de state niet meer correct. Dit kan leiden tot onverwacht gedrag van de applicatie.
Elk object in de applicatie zou derhalve een methode moeten hebben die de state van het object bepaald op basis van de data in het object. Deze methode zou dan ook de enige methode moeten zijn die de state van het object kan veranderen.

Welke rol speelt de controller in het bepalen van de state?

De controller is de enige die de state van een object mag veranderen. De controller doet dit door de data in het object te veranderen. De controller roept vervolgens de methode aan die de state van het object bepaald. Deze methode bepaald de state van het object op basis van de data in het object. De controller kan dan de state van het object gebruiken om te bepalen welke acties de gebruiker mag uitvoeren.

Welke rol speelt de view in het bepalen van de state?

De view is de enige die de state van een object mag tonen. De view doet dit door de state van het object te tonen. De view kan de state van het object gebruiken om te bepalen welke acties de gebruiker mag uitvoeren. De view kan de state van het object ook gebruiken om de gebruiker te informeren over de huidige state van het object.

Zijn er tools die ons helpen met statemanagement?

Ja, er zijn verschillende tools die ons helpen met statemanagement. De meest bekende zijn Redux en MobX. Deze tools helpen ons met het bepalen van de state van een object, en het tonen van de state van een object. Redux en MobX zijn echter niet de enige tools die ons helpen met statemanagement. Er zijn ook andere tools die ons helpen met statemanagement, zoals Vuex en NgRx.
