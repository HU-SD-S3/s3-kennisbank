# Cursusopzet

Tijdens de cursus **Backend Programming 2 (BEP2)** leren we een
structureel kwalitatief hoogstaande back-end op te zetten aan de hand
van bestaande oplossingen en standaarden. Hoewel we een boel zullen
herhalen, bouwt dit voort op de kennis en vaardigheden die we bij
**Object-Oriented Analysis (OOAD)**, **Object-Oriented Programming
(OOP)** en **Backend Programming 1 (BEP1)** hebben opgedaan.

Daarnaast is er samenhang met **Data en Persistency (DNP)**: we maken
gebruik van een relationele database om langdurige opslag te
verwezenlijken. Bij DnP wordt meer stilgestaan bij de onderliggende
techniek, terwijl we bij BEP2 dankbaar gebruik maken van library en
frameworks die een hoop werk uit handen halen.

Deze cursus bereidt je voor op projecten en andere cursussen, zoals
**Continuous Integration and Software Quality (CISQ)** en **Software
Architecture (SARCH)**, maar ook op je stages en je carrière. Hoewel we
Java als taal gebruiken en Spring Boot als framework, zijn de ideeën
namelijk toepasbaar op heel veel andere programmeertalen en frameworks!
Let dus goed op als je binnenkort al wil starten als software developer.

De vraag die in deze cursus centraal staat is als volgt:

::: defbox
Centrale vraag Hoe kunnen we een flexibele, onderhoudbare webapplicatie
opzetten, waarin we bestaand werk kunnen hergebruiken?
:::

## Kennisbasis

Om deze centrale vraag te beantwoorden ontwikkelen we een web-applicatie
met *Spring Boot*, een veelgebruikt en modern Java-framework voor web
development. Voor de persistentie gebruiken we *PostgreSQL* tezamen met
*Spring JPA* dat onderwater *Hibernate* gebruikt als object-relational
mapper.

We werken aan flexibele software door te letten op een separation of
concerns, loose coupling en high cohesion. Daar kan een modulaire,
gelaagde applicatiearchitectuur aan bijdragen.

Voor het ontwerp en de realisatie van onze software benutten we het
objectmodel: object oriëntatie zoals het bedoeld is! Dit wordt aangevuld
door een aantal design principles om tot een beter ontwerp te komen. We
zetten polymorfisme en compositie in om via dependency injection de
onderdelen binnen onze applicatie op flexibele wijze los te koppelen van
elkaar.

In de realisatie van het project implementeren we een aantal design
patterns, een aantal standaardoplossingen voor veelvoorkomende
problemen.

## Leerdoelen

Na deze cursus kan de student:

-   de structurele kwaliteit van software beoordelen aan de hand van de
    begrippen **separation of concerns**, **cohesion**, **coupling**

-   de eigenschappen van object-orientatie, in de zin van het
    **objectmodel**, toepassen om onderhoudbare, object-georiënteerde
    software te ontwerpen en te realiseren

-   **dependency injection** toepassen om flexibele, losgekoppelde
    software te verwezenlijken, waarvan de onderdelen te vervangen zijn

-   **design principles** toepassen, zoals SOLID, om
    object-georiënteerde software te ontwerpen en realiseren

-   **design patterns** herkennen en realiseren, zoals die van de Gang
    of Four, als abstracte standaardoplossingen om software te ontwerpen
    en te realiseren

-   de **REST-principes** op de juiste wijze toepassen op een web
    applicatie

-   een **web framework**, zoals Spring Boot, inzetten om een REST API
    te realiseren

-   een **object-relational mapper**, zoals Hibernate, inzetten om
    object-geörienteerde persistentie vorm te geven

-   werken binnen een **gelaagde architectuur**, waarbij elke laag ziet
    op één abstractieniveau en één soort logica

## Toetsing

De leerdoelen worden getoetst aan de hand van een **individuele opdracht
met interview**. De criteria hiervoor zijn opgenomen op Canvas.

Dit betekent dat de student gedurende de cursus een softwareproject
realiseert. Aan het eind van de cursus wordt een assessmentmoment
ingepland. De student presenteert zijn of haar werk en beantwoordt aan
de hand van het project vragen over de theorie. Ter voorbereiding is het
verstandig om de theorie al een beetje in de presentatie op te nemen,
bijvoorbeeld middels een korte PowerPoint-presentatie.

Studenten hebben laten zien dat het goed mogelijk is om een mooi cijfer
te halen door naar deze criteria te kijken, de colleges bij te wonen en
tijdens de cursus feedback te vragen en te verwerken. Het loont om daar
de tijd voor te nemen.

### Studiebelasting

Voor deze cursus staat een studie belasting van 5 ECs (European
Credits). In Nederland wordt dit gelijkgesteld met 140 uur inclusief
colleges. De opdracht is echter zo ontworpen dat er voldoende ruimte is.
Zo kan je weggezakte kennis ophalen, zaken opzoeken en uitproberen en
feedback verwerken.

Het loont om een weekplanning te maken om regelmatig aan de opdracht te
werken. Tijdens het programmeren zelf kan je een stuk sneller werken
door gebruik te maken van alle shortcuts en functionaliteiten die je IDE
(bij voorkeur IntelliJ IDEA) biedt!

### Plagiaat

Het is soms nuttig om even met een medestudent te overleggen, maar pas
op dat je niet hele stukken code van elkaar overneemt. Daar leer je
weinig van. Bovendien kan je je schuldig maken aan plagiaat. Dit houdt
in dat je teveel van andermans werk overneemt of werk aanhaalt zonder
bronaanduiding. Het kan gaan om het kopiëren van werk van een
medestudent, maar ook om andere bronnen zoals die op internet te vinden
zijn. Mocht je toch code overnemen van internet zet de vindplaats er dan
bij. Een URL met een comment is voldoende.

Vermoedens van plagiaat worden gemeld bij de examencommissie. Als na
onderzoek blijkt dat er dat er sprake is van plagiaat, kan er een
(zware!) maatregel opgelegd worden. Zie voor details het onderwijs- en
examenreglement (OER) en de studiegids.

## Begeleiding en ondersteuning

Tijdens de cursus leggen docenten de lesstof uit en geven zij
voorbeelden. Ook is er ruimte voor extra toelichting en om samen te
programmeren.

Docenten geven individuele of groepsgebaseerde feedback op basis van het
ingeleverde werk. Commit en push je werk dus regelmatig op GitHub.
Feedback helpt om efficiënt te leren, maar het is natuurlijk nog
effectiever om ook zelf vragen voor te bereiden!

Trek zo snel mogelijk aan de bel als je ergens niet uitkomt of je qua
tijdsplanning in de problemen komt. Software development is af en toe
overweldigend en soms kan een klein zetje al genoeg zijn om verder te
komen. Het is ook niet erg als je wat meer toelichting of instructie zou
willen. Geef dit aan. Docenten en medestudenten willen je graag verder
helpen! Samen maken we er een mooie cursus van.
