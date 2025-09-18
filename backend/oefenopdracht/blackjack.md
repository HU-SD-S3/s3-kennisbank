# Blackjack

Er staat een unit-test klaar (src/test/java/nl.hu.s3.project/blackjack.domain) voor het starten van het spel. Deze unit-test slaagt al. Uiteraard moet dat het geval blijven.

Tijdens deze opdrachten is het toegestaan (en op een gegeven moment zelfs nodig) om wijzigingen in de tests aan te brengen, al moet de intentie wel gelijk blijven.

Evt. kun je de regels nog nalezen: [https://simple.wikipedia.org/wiki/Blackjack](https://simple.wikipedia.org/wiki/Blackjack)

## Spelen

Er staan unit-tests klaar voor de meest voorkomende acties in het spel: Hit / Stand.
Schrijf code zodat deze tests (op een redelijke manier) slagen.

## Aas-logica

Blackjack heeft een regel dat een Aas als 1 of 11 punten kan tellen. Schrijf één of meerdere unit-tests voor het scenario dat de Aas zowel als waarde 1, als als waarde 11 kan tellen.

Concreet voorbeeld: 
Stel de speler heeft de kaarten Harten-5, Ruiten-Koning en Schoppen-Aas, als de Aas als 11 punten had geteld, dan zou de speler 26 punten hebben (teveel!). Dus de aas telt als 1, en met 16 punten is de speler nog in het spel.

## Vals spelen en het beschermen van invarianten

Gegeven de implementatie van Game, en gelet op de methods ```getDeck()``` en ```getPlayerHand()```, hoe zouden we nu kunnen valsspelen? (bijv. door met klassieke 'Ace up the sleeve')?

Schrijf code die dit voorkomt.

## Abstracties

Een Deck aan kaarten, en een Hand aan kaarten zijn natuurlijk uiteindelijk wel een lijst met kaarten, maar het werkt niet heel prettig. (zie bijv. het geklungel met sublists in de constructor van ```Game```, en misschien het berekenen van de waarde van een Aas in een eerdere oefening)

Introduceer twee nieuwe classes: Hand (voor de speler en dealer) en Deck (voor de stapel kaarten).
Een Deck bevat (in elk geval) een methode om makkelijker dan met substring een aantal kaarten van de stapel af te pakken. 
Een Hand bevat (in elk geval) een methode om de score van de hand te berekenen.

## Payouts

Tsja, het is het casino, we willen ook iets kunnen winnen.
Bedenk en implementeer een ontwerp zodat een potje blackjack start met een Bet (inleg). 

Vervolgens moet aan de hand van hoe het spel eindigt de volgende uitbetalingsregels geïmplementeerd worden:

* Dealer wint: speler is de inleg kwijt.
* Speler wint: speler krijgt de inleg, plus nog een keer de inleg terug.
* Speler wint met een directe Blackjack (21 punten in de starthand): speler krijgt inleg, plus 1,5 keer de inleg terug
* Gelijkspel: je krijgt de inleg terug.

Tip: Schrijf code in Game die berekent wat de payout zou moeten zijn. Ga nadat de berekening klopt pas nadenken waar/hoe je de Chips-component zou kunnen gebruiken om de inleg en uitbetaling daadwerkelijk door te voeren.

## The Rest of the Owl

Dit is een veel te grote / brede opdracht, dus puur voor de echte uitdaging. Maar mocht je echt even door willen bijten:
Strict genomen zou je nu genoeg moeten weten om voor Blackjack:
* De controller te schrijven
* De datalaag te schrijven

Zo'n hele applicatie is in principe wat de opdrachtdag gaat zijn, maar dan voor een ander spelletje.

Mocht dat ook nog niet genoeg zijn, er zijn nog allerlei andere kleine Blackjack regeltjes (zelf even opzoeken voor de details) 

* Double-Down: je kan gaan voor een dubbele-hit, dan krijg je extra uitbetaald
* Splitting: Als je twee kaarten met het zelfde nummer hebt mag je je hand splitten in 2 potjes. 
* Insurance: Als de dealer een Aas laat zien, dan mag je gokken dat de dealer Blackjack heeft, en zo ja, dan speel je gelijk (ipv. verliezen)
* Even Money: Als jij Blackjack hebt, EN de dealer heeft een Aas, dan mag je op een andere manier gokken of hij wel/niet ook Blackjack heeft, met andere uitbetalingen tot gevolg