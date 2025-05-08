# BPMN

De meest gebruikt methode voor het vormgeven van de bedrijfsprocessen is BPMN. BPMN staat voor Business Process Model
and Notation. Het primaire doel van een BPMN is het het creëren van begrijpelijkheid voor alle belanghebbenden (denk
aan: analisten, ontwikkelaars maar ook mensen uit de business)

## BPMN onderdelen

Op hoog niveau heeft het BPMN model de volgende onderdelen:
- Start- en eindevents
  - Dit spreekt relatief voor zichtzelf. Het toont aan waar een event start of eindigt
- Swimlane
    - In BPMN is het gebruikelijk om de actor die de activiteit uitvoert op te nemen in het diagram. Dit gebeurt door middel van een swimlane. Iedere actor of participant krijgt dan een eigen swimlane.
- Pool
  - De swimlanes samen vormen een zogenaamde pool. Het is gebruikelijk om elke organisatie, die een rol speelt, een eigen pool te geven.
- Sequence flow
  - Een sequence flow zijn de lijnen tussen de verschillende elementen of activiteiten. Deze laten dus de volgorde (of 'flow') zien van de activiteiten.

<img src="bpmn.png" alt="drawing" width="750"/>

## Activiteiten

De activiteiten in het bedrijfsproces wordt vormgegeven door middel van taken. Dit kunnen we opdelen in 3 verschillende 
soorten:
- Task \
  - Dit is een omschrijving in de gebiedende wijs. Deze taak wordt niet verder opgedeeld. Denk bijvoorbeeld aan: "schrijf artikel" of "verzend goederen".
- Subprocess
  - Dit is een deelproces, samengesteld uit meerdere activiteiten. Deze activiteit worden niet verder gespecificeerd omdat ze niet van toepassing zijn voor het proces dat je wilt weergeven. Denk bijvoorbeeld aan: "Order aanmaken".
- Call activity
  - Dit is een deelproces dat is geschikt voor hergebruik.

## Gateways

Als onderdeel van de flow kan je gebruik maken van een aantal gateways. De drie meest voorkomende gateways die je vaak 
tegenkomt zijn:
- Exclusive gateways \
<img src="exclusive_gateway.png" alt="drawing" width="300"/>
  - Een exclusive gateway sluit de alternatieven uit aan de hand van een conditie. Denk dus bijvoorbeeld aan een beslissing die gemaakt worden waar een ja of nee uit kan komen, maar nooit beide.
- Parallel gateways \
  <img src="parallel_gateway.png" alt="drawing" width="300"/>
  - In een parallel gateway worden beide paden in willekeurige volgorde uitgevoerd. Denk eraan dat bij deze gateway er geen voorwaarden worden geschept.
- Inclusive gateway \
  <img src="inclusive_gateway.png" alt="drawing" width="300"/>
  - Bij deze gateway kunnen er 1 of meerdere paden bewandeld worden aan de hand van een conditie. Dit wijkt dus iets af van de exclusive gateway, waar maar 1 pad wordt bewandeld.

## Samenwerking (collaboration)

Bij het vormgeven van een bedrijfsproces kan het natuurlijk voorkomen dat er wordt samengewerkt met een ander (extern) 
persoon of ander bedrijf. Dit modelleren we met verschillende pools. De interactie tussen de verschillende pools worden 
weergegeven door middel van message flows. Let er wel op dat andere pools vaak worden gezien als een black box: we hebben 
zelf geen inzicht wat er precies gebeurt. We weten alleen wat er er naartoe sturen en wat we terug krijgen. Het proces 
daartussen is dus onbekend. \
<img src="message flow.png" alt="drawing"/>

