# User Stories, acceotatiecriteria en Use Cases

In de softwareontwikkeling zijn zowel user stories als use cases belangrijke technieken om de wensen en eisen van 
gebruikers te beschrijven. Beide methoden helpen om inzicht te krijgen in wat een systeem moet doen, maar ze verschillen 
in detailniveau, structuur en toepassing. 

## Wat zijn User Stories?

Een user story is een korte, eenvoudige beschrijving van een functionaliteit vanuit het perspectief van de eindgebruiker 
of klant. User stories worden veel gebruikt binnen agile methodieken zoals Scrum en vormen de basis voor het plannen en 
ontwikkelen van software.

Een typische user story heeft de volgende vorm:

> Als [gebruiker] wil ik [doel/wens] zodat [reden].

**Voorbeeld:**
> Als klant wil ik mijn bestelling kunnen volgen zodat ik weet wanneer mijn pakket wordt bezorgd.

## Acceptatiecriteria bij User Stories

Acceptatiecriteria zijn voorwaarden waaraan een User Story of Backlog Item moet voldoen om als klaar te worden gezien. 
Ze zorgen voor gedeelde verwachtingen tussen het team en de Product Owner, maken werk toetsbaar en voorkomen 
misverstanden. Acceptatiecriteria brengen duidelijkheid over wanneer iets voldoet aan de gestelde eisen.

### User Stories en acceptatiecriteria hebben elkaar nodig

Neem de volgende User Story:

> “Als huiseigenaar met een grote tuin wil ik mijn gazon op een snelle en makkelijke manier kunnen maaien zodat ik daar 
weinig tijd mee kwijt ben.”

Welke oplossing komt als eerste in je hoofd op? Wellicht een grasmaaier die je in het stopcontact moet doen? Een 
robotgrasmaaier? Of zo’n ouderwetse grasmaaier waarbij je achteraf nog alle blaadjes bij elkaar moet vegen (uit eigen 
ervaring zou ik die laatste afraden).

Eén ding is zeker. Met deze User Story krijg je het idee dat er een grasmaaier moet komen, maar de invulling hoe de 
grasmaaier eruit moet zien staat nog open. Als een Product Owner deze User Story aan zijn Developers laat zien, dan is 
het mogelijk dat de ene Developer de User Story heel anders zal interpreteren dan de ander. Dat is fijn, want diverse 
perspectieven op een probleem verhogen de kans op de beste oplossing. Echter wil je wel dat de ideeën aan de eisen van 
de opdrachtgever voldoen. Daarom moeten we de User Story nog afbakenen. Hoe doen we dat? Met acceptatiecriteria!

Zie hier vijf bijbehorende acceptatiecriteria voor de bovenstaande User Story:

- Het product heeft een benzinemotor
- Het product heeft 4 wielen
- Elk wiel heeft een rubberband
- Het product heeft een stuur
- Het product heeft een stalen carrosserie

Zoals je gelijk kunt zien waren de drie interpretaties van onze mogelijke grasmaaier allemaal verkeerd. De tuin is 
namelijk erg groot en de huiseigenaar is niet begaan met technologie en vindt alles wat digitaal is maar niks. Kortom 
een zitmaaier met een benzinemotor moet de klus klaren.

### Wat zijn de voordelen van acceptatiecriteria?

1. Acceptatiecriteria definiëren de kaders waar de User Story aan moet voldoen

Acceptatiecriteria geven de Developers kaders en richtlijnen hoe complex de oplossing voor het probleem mag zijn. Doe je 
dit niet en je hebt een paar enthousiaste Developers in je team, dan kan het zomaar zijn dat ze een robotgrasmaaierdrone 
maken die over het gras vliegt en met lasers het gazon tot op de milimeter nauwkeurig bijwerkt. Leuke gadget, maar voor 
de meeste eindgebruikers onbetaalbaar.

2. Acceptatiecriteria helpen het team om een gezamenlijk begrip te vormen van de User Story

Doordat er tijdens Sprint Planning de User Stories inclusief acceptatiecriteria worden besproken zullen de Developers 
vragen stellen aan de Product Owner over de acceptatiecriteria. Dit geeft een diepere laag aan het gesprek waardoor 
belangrijke details niet vergeten worden, die anders tijdens de sprint voor problemen kunnen zorgen.

3. Acceptatiecriteria maken het gemakkelijk om te testen

Elke User Story is pas ‘sprintklaar’ als die voldoet aan de Definition of Ready. Door het toevoegen van 
acceptatiecriteria kun je heel eenvoudig testen wanneer een User Story klaar is. Alleen wanneer aan alle 
acceptatiecriteria volledig is voldaan, kun je een User story opleveren. Let er wel op dat de User Story pas deel wordt 
van het increment als die voldoet aan de Definition of Done. Wat precies het verschil is tussen de acceptatiecriteria en 
de Definition of Done kun je in het artikel van de Definition of Done lezen.

### Hoe schrijf je acceptatiecriteria: do’s & don’ts?

Soms kan het best lastig zijn om goede acceptatiecriteria te bedenken. Mocht je hiermee problemen hebben dan kun je 
jezelf altijd het volgende afvragen: ‘Hoe weten we wanneer we klaar zijn?’. Door jezelf deze vraag te stellen kun je 
makkelijker acceptatiecriteria identificeren. Dan rest ons alleen nog de vraag hoe je ze schrijft.

Het schrijven van goede acceptatiecriteria is een kunst die je pas echt gaat beheersen door het veel te doen. Maar wat 
als je het altijd op de verkeerde manier doet? Dan doe je het na een jaar nog steeds verkeerd. De beste 
acceptatiecriteria voldoen aan het volgende:
Blijf bij de “wat” en vermijd de “hoe”

Misschien nog wel het lastigste van acceptatiecriteria is dat je de balans moet vinden tussen te gedetailleerd, precies 
goed en te onduidelijk. Dat is ook gelijk de #1 fout die sommige Product Owners maken. Wij zien te vaak dat de Product 
Owner te veel detail toevoegt waardoor de Developers helemaal geen ruimte hebben om hun creativiteit naar boven te 
brengen. Om een voorbeeld te geven:

User Story: “Als gamer wil ik digitaal mijn emotie kunnen uitdrukken, zodat andere gamers kunnen zien hoe gelukkig ik 
vandaag ben”

Acceptatiecriteria die bij deze user story kunnen horen:

- Te gedetailleerd: de gebruiker kan een computerkarakter kiezen door op een afbeelding te klikken van het hoofd van het computerkarakter.

- Precies goed: de gebruiker kan een computerkarakter kiezen.

- Te onduidelijk: de gebruiker heeft een computerkarakter.

De richtlijn is dat je de acceptatiecriteria zo wil formuleren dat het niet de oplossing definieert waardoor de 
creativiteit van de Developers wordt afgenomen om wellicht een betere oplossing te bedenken waaraan de Product Owner in 
eerste instantie niet had gedacht.

### Hoeveel acceptatiecriteria per User Story?

Elk acceptatiecriterium staat op zichzelf. Mocht dit niet het geval zijn dan wil je de acceptatiecriteria opsplitsen. 
Als vuistregel kun je aanhouden dat een User Story tussen de vier en acht acceptatiecriteria heeft. Met minder dan vier 
heeft de User Story waarschijnlijk te weinig detail en met meer dan acht kan de User Story waarschijnlijk beter gesplitst 
worden in twee kleinere User Stories.

### Vermijd subjectief en dubbelzinnig taalgebruik

“De marketingcampagne verloopt vlotter, beter, juister.” Waarschijnlijk roept de vorige zin veel vragen bij je op. Je 
bent niet de enige. Probeer acceptatiecriteria zo specifiek en SMART mogelijk te benaderen. Zoals eerder genoemd helpen 
acceptatiecriteria je om te testen en daarom moeten ze meetbaar zijn. In andere woorden: ze moeten zo helder 
geformuleerd worden dat ze niet voor verschillende interpretaties vatbaar zijn, maar niet zo gedetailleerd dat ze de 
oplossing beschrijven.

### Wat is het verschil tussen Acceptatiecriteria, Definition of Ready en Definition of Done?

Het verschil tussen acceptatiecriteria, de Definition of Ready en de Definition of Done zit in het moment waarop ze van 
toepassing zijn en waarvoor ze gebruikt worden. Acceptatiecriteria beschrijven de voorwaarden waaraan een specifieke 
user story of taak moet voldoen om door de Product Owner geaccepteerd te worden. Ze zijn per item verschillend en helpen 
bij het testen en controleren van de oplevering.

De Definition of Ready is een vaste checklist die het team gebruikt om te bepalen of een item klaar is om opgepakt te 
worden in een sprint. Denk aan zaken zoals duidelijke beschrijving, geschatte omvang en beschikbaarheid van 
afhankelijkheden.

De Definition of Done is een teamafspraak die beschrijft wanneer een item echt af is. Dit geldt voor alle werkitems en 
bevat vaak punten zoals getest, gedocumenteerd en gedeployed. Samen zorgen deze drie begrippen voor duidelijkheid, 
voorspelbaarheid en kwaliteit in het ontwikkelproces.

### Waarom zijn acceptatiecriteria belangrijk?

We hebben zojuist de voordelen van acceptatiecriteria besproken, maar nog niet stilgestaan bij wat er gebeurt als je ze 
weglaat. Daarom kijken we nu naar vier situaties waarin het ontbreken van acceptatiecriteria voor problemen zorgt.

#### Belang acceptatiecriteria tijdens refinement en planning

Tijdens refinement en sprintplanning helpen acceptatiecriteria om werk te verduidelijken. Ze maken zichtbaar wat er 
precies verwacht wordt. Als er tijdens refinement en planning geen duidelijke acceptatiecriteria zijn, blijft geeft 
iedereen vaak zijn eigen invulling aan wat er precies moet worden gebouwd of wanneer het af is. Dit leidt tot verkeerde 
aannames en foutieve inschattingen. Taken lijken kleiner of eenvoudiger dan ze zijn, of de beoogde waarde wordt niet 
geleverd. Gevolg: extra werk tijdens de sprint, onnodige discussies en het risico op een ontevreden klant of eindgebruiker.

#### Acceptatiecriteria en feedback

Zonder vooraf afgesproken criteria is het lastig om achteraf te beoordelen of iets goed is uitgevoerd. Feedback blijft 
vaag of subjectief. Teams leren daardoor minder van hun werk, omdat het onduidelijk is wat er wel of niet goed ging. 
Het verbeterproces stagneert en dezelfde fouten worden herhaald.

#### Geen basis voor testen zonder acceptatiecriteria

Wanneer acceptatiecriteria ontbreken, is het lastig om tests op te stellen. Automatisering wordt ingewikkeld of zelfs 
onmogelijk, omdat niet duidelijk is wat er precies getest moet worden. Daardoor moeten er meer handmatige tests worden 
gedaan, wat tijd kost en foutgevoeliger is. Daarnaast kan het voorkomen dat een product als succesvol word getest, maar 
in de praktijk niet de benodigde functies uitvoerd, de tester kan dit dan gemakkelijk over het hoofd zien doordat de 
acceptatiecriteria niet goed zijn vastgelegd.

#### Belemmering betrokkenheid van stakeholders

Zonder heldere afspraken over wat er geleverd wordt, weten stakeholders niet goed waar ze op moeten letten. Ze krijgen 
geen grip op het proces en geven vaak pas feedback als het te laat is. Dit zorgt voor frustratie en wantrouwen. De 
samenwerking verslechtert en doelen worden gemist.

## Wat zijn Use Cases?

Een use case is een gedetailleerde beschrijving van hoe een gebruiker (of ander systeem) interactie heeft met het 
systeem om een bepaald doel te bereiken. Use cases worden vaak gebruikt in meer traditionele, gestructureerde 
ontwikkelmethoden, maar zijn ook waardevol in agile omgevingen voor complexe processen.

Een use case bestaat meestal uit:
- Een titel (naam van de use case)
- Actoren (wie gebruikt het systeem)
- Doel (wat wil de gebruiker bereiken)
- Hoofdscenario (stapsgewijze beschrijving van het normale verloop)
- Alternatieve scenario's (wat als er iets misgaat of anders loopt)
- Voorwaarden (wat moet er gelden voordat de use case start)
- Resultaat (wat is het eindresultaat)

**Voorbeeld use case:**
- Titel: Bestelling volgen
- Actor: Klant
- Doel: Inzien van de status van een bestelling
- Hoofdscenario: 1. Klant logt in. 2. Klant kiest 'Mijn bestellingen'. 3. Klant selecteert een bestelling. 4. Systeem toont de status en track & trace code.
- Alternatief: Bestelling is nog niet verzonden → status is 'In behandeling'.

### Wanneer gebruik je Use Cases?
Use cases zijn vooral nuttig wanneer je te maken hebt met complexe interacties, meerdere actoren of wanneer je een 
gedetailleerd overzicht nodig hebt van hoe het systeem moet functioneren. Ze helpen om de functionaliteit vanuit het 
perspectief van de gebruiker te begrijpen en kunnen dienen als basis voor testen en documentatie.

## Verschillen tussen User Stories en Use Cases

| Aspect              | User Story                                 | Use Case                                      |
|---------------------|--------------------------------------------|-----------------------------------------------|
| Detailniveau        | Kort, globaal                              | Uitgebreid, gedetailleerd                     |
| Structuur           | Vrij, één zin + acceptatiecriteria         | Vaste onderdelen (scenario's, actoren, etc.)   |
| Doel                | Wensen en waarde voor de gebruiker         | Gedetailleerde interactie tussen mens en systeem |
| Testbaarheid        | Door acceptatiecriteria                    | Door scenario's en voorwaarden                 |
| Focus               | Wat de gebruiker wil bereiken              | Hoe de gebruiker het systeem gebruikt          |


