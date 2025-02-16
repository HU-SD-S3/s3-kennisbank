# Opdracht 6: Design principles en design patterns

Begin aan deze opdracht zodra je wat verder bent met je domein, je
applicatieservice, je controller en je opslag. Vergeet niet je werk te
committen en te pushen.

We gaan nu namelijk kijken hoe we ons project kunnen verbeteren aan de
hand van een aantal ontwerpprincipes (design principles) en
standaardoplossingen (design patterns). Design principles en design
patterns worden in de praktijk ingezet om de structuur van software meer
onderhoudbaar te maken. Vaak kan met een aantal kleine aanwijzingen
ervoor gezorgd worden dat de samenhang wordt vergroot (*high cohesion*)
of dat modules meer losgekoppeld worden (*loose coupling*).

## Design principles

Hier volgt een samenvatting van de belangrijkste ontwerpprincipes die je
in de praktijk zult tegenkomen en waar je in deze cursus vragen over
kunt verwachten.

### Gang of Four-principles: ICE

De Gang of Four (Gamma e.a, 1996) haalt een aantal principes aan in hun
invloedrijke werk 'Design Patterns' die volgens hen tot onderhoudbare
software leiden. Deze principes zijn leidend geweest voor het bedenken
van een aantal design patterns: standaardpatronen die een oplossing
bieden voor bepaalde onderhoudsproblemen.

Deze design principles worden meer uitgebreid behandeld tijdens de
colleges, maar hier hebben we een samenvatting opgenomen. Voor meer
informatie zou je het boek Design Patterns kunnen raadplegen.

#### Program to an Interface

Bij het object-georiënteerd programmeren werken we met abstracties (zie:
Objectmodel van Booch). We proberen de wereld te modelleren in termen
klassen, interfaces, enums en packages. Een klasse staat dan voor een
bepaald concept waar we toestand en gedrag aan willen toekennen. Denk
bijvoorbeeld aan een blackjack-potje, een hand met kaarten of een deck.

Het gedrag dat we naar buiten toe kenbaar maken wordt ook wel de
application programming interface (API) van die klasse genoemd. In Java
kunnen we deze afdwingen door een `interface` te implementeren. Het
mooie aan het werken met abstracties is dat je als gebruiker niet bekend
hoeft te zijn met de interne werking wanneer je er gebruik van wil
maken. Het principe *Program to an Interface* ziet erop dat je als
gebruiker van een object of klasse zoveel mogelijk afhankelijk wil zijn
van diens API of interface en niet van de details van de
daarachtergelegen implementatie.

Wanneer een service bijvoorbeeld een domeinactie wil uitvoeren op een
blackjack-potje, zoals het verwerken van een *start game* of een *hit*,
hoeft de service geen weet te hebben welke gevolgen dat heeft voor de
deck, de hand, de status van het spel of de bet. Dat weet het
blackjack-potje zelf af te handelen!

#### Favor Composition over Inheritance

In veel object-georiënteerde systemen wordt implementation inheritance
gebruikt als belangrijkste mechanisme voor hergebruik. Dit heeft echter
twee belangrijke nadelen: je introduceert coupling tussen parents en
children (en indirect tussen siblings) en je moet al vroegtijdig
rekening houden met generieke abstracties. Dit laatste is vaak lastig,
omdat je nog niet bekend bent met wat je domein allemaal doet. Dit leidt
vaak tot grote klassen met een hoop if-statements.

Een handigere manier om hergebruik te realiseren is door klassen te
maken die zich enkel richten op één kernfunctionaliteit. Wanneer je die
functionaliteit wil hergebruiken in een bepaalde andere klasse, dan kan
je deze samenstellen uit onder andere de klasse die de her te gebruiken
functionaliteit bevat. Dat is de kern van *Favor Composition over
Inheritance*. Vaak gebruik je hiervoor dependency injection: we geven de
benodigde functionaliteit mee aan de constructor of een setter van de
samengestelde klasse.

Overigens betekent dit niet dat je nóóit implementation inheritance mag
gebruiken. Zodra je meer weet over de abstracties in je project, weet je
welke zaken je met inheritance kunt inrichten. Probeer dan wel de
voorkeur te geven aan abstract base classes en beperk de grote van de
overervingsboom. Dit komt loose coupling ten goede.

#### Encapsulate what Varies

Je kan alleen composities maken als de code voldoende is opgebroken in
klassen die zich richten op één doel. In een aantal gevallen is het
duidelijk wat in één klasse hoort te zitten, bijvoorbeeld wanneer het
gaat om een sluitende abstractie uit de echte wereld. Denk bijvoorbeeld
aan een speelkaart of een deck.

Vaak is het echter lastig te bepalen hoe je de rest van de code
opbreekt. Een vuistregel om te bepalen welke stukken code in een
bepaalde module gaan is door te kijken op welke punten variatie mogelijk
moet zijn. Die dingen kan je samenvoegen: *Encapsulate what Varies*. Om
die variatie te realiseren zou je er ook een *interface* tussen kunnen
plaatsen, zodat de implementatie dankzij polymorfisme kan variëren.

### SOLID-principles

De SOLID-principles zijn object-georiënteerde ontwerpprincipes die door
verschillende belangrijke software engineers zijn beschreven. Ze zijn
over de jaren heen verzameld door Robert C. Martin, welke ze heeft
beschreven in boeken als 'Agile Principles, Practices and Patterns'
(2006), 'Clean Code' (2008) en 'Clean Architecture' (2017).

Deze principes komen vaak ter sprake tijdens het dagelijkse werk van een
software developer. Daarom zie je discussies hierover vaak ook
terugkomen tijdens sollicitatiegesprekken.

Hier volgt een korte samenvatting van deze principes. Deze worden
uitgebreid tijdens de colleges behandeld, maar meer informatie is te
vinden in bovenstaande boeken of door te zoeken op YouTube of via
Google.

#### Single Responsibility Principle (SRP)

Een module moet zich richten op één verantwoordelijkheid. Dit principe
wordt vaak anders geformuleerd als 'een module moet slechts een reden
hebben om te wijzigen'.

Dit principe volgt eigenlijk al uit de *separation of concerns* en het
vereisen van *high cohesion*. Ook sluit het naadloos aan op *Encapsulate
what Varies*. Toch wordt het ontzettend veel aangehaald.

Let wel dat het lastig kan zijn om te bepalen wat één
verantwoordelijkheid precies is. Het is aan software engineers om daar
een goede balans in te vinden tussen handige abstracties en veel losse
stukjes. Vaak kom je al een heel eind door methoden op te breken in
verschillende (private) methoden met een duidelijke naam.

#### Open Closed Principle (OCP)

Dit principe, geformuleerd door Bertrand Meyer, is een van de meest
onbegrepen principes in de softwareindustrie. Het luidt als volgt:
"Modules should be **open for extension, but closed for modification**".

Dit houdt in dat je een klasse op zo'n manier moet ontwerpen dat deze
niet of nauwelijks intern gewijzigd hoeft te worden als je
functionaliteit wil toevoegen. Dit doe je door het mogelijk te maken
functionaliteit uit te wisselen door samenstellingen te maken van andere
klassen.

Het lijkt dus op een combinatie van de ICE-principes! Wees afhankelijk
van abstracties zodat je gedrag van klassen kunt uitbreiden door dit van
buitenaf mee te geven. Dit leidt tot flexibiliteit dankzij compositie en
polymorfisme.

#### Liskov Substitution Principle (LSP)

Barbara Liskov heeft dit principe geformuleerd in de context van het
overerven van klassen. "Subtypes moeten kunnen worden vervangen door hun
supertypes." Vaak wordt dit ook uitgelegd als dat child-klassen elkaar
zouden moeten kunnen vervangen als ze dezelfde parent hebben.

De eisen die gesteld kunnen worden aan een methode, bijvoorbeeld ten
aanzien van diens argumenten en return-waardes moeten voor elke
subklasse vergelijkbaar zijn. Wanneer een klasse immers afhankelijk is
van een supertype, moet het geen aannames of checks hoeven doen op het
specifieke subtype dat eraan wordt meegegeven.

#### Interface Segregation Principle (ISP)

'Clients should not be forced to depend on methods that they do not
use.'

Het moet niet zo zijn dat implementerende klassen gedwongen worden om
bepaalde methodes aan te bieden alleen maar om aan een interface of
abstracte klasse te voldoen.

Denk bijvoorbeeld aan een *BookStorage-interface* die een methode
vereist *connectToDatabase*. Wat moet een
*FileBookStorage-implementatie* dan aanbieden als implementatie voor die
methode? In zo'n geval heb je te maken met een *leaky abstraction*: het
connecten met een database is immers alleen van toepassing op
*BookStorages* die met een database werken! In de praktijk zou je dan
een DatabaseConnection-klasse maken en die meegeven aan bijvoorbeeld de
constructor van de *PostgresqlBookStorage*.

#### Dependency Inversion Principle (DIP)

Modules moeten zoveel mogelijk afhankelijk zijn van abstracties en niet
van concrete implementatiedetails.

Binnen een architectuur wordt dit ook wel uitgelegd als volgt. Je
kernabstracties (je domein) moeten zo min mogelijk afhankelijk zijn van
technische implementatiedetails (je opslag- of presentatiemechanisme).
Andersom is vaak geen probleem. Dit bereik je door een abstractielaag
tussen de concrete afhankelijkheid en de gebruiker ervan te stoppen.
Vaak los je dit op met een abstracte klasse of interface. Dit principe
heeft dus veel weg van *Program to an Interface*. Dit zie je terug in
patterns als *facade*, *gateway*, *strategy* en *adapter*.

## Stap 1: Evalueer en verbeter je project met design principles

Omdat je wordt beoordeeld op de netheid en structuur van je software, is
het de moeite waard om voor jezelf je code te beoordelen aan de hand van
design principles. Je kan hier ook vragen over verwachten tijdens het
assessment.

Wil je hier op voorbereid zijn? Vat voor jezelf samen in een
markdown-bestand (bijvoorbeeld: 'design-principles.md') of presentatie
samen per design principle in hoeverre dat van toepassing is op je
project en op welke manier je de toepassing ervan terugziet. Denk na
over mogelijke verbeteringen en pas deze toe. Probeer te kijken naar de
design principles binnen je code en leg de relatie met separation of
concerns, high cohesion en loose coupling. Hoe helpt het object model
hierin?

Ook kan je denken aan een aantal standaardverbeteringen: naamgeving,
code style en het verminderen van herhaling (bijvoorbeeld door een
klasse of (private) method te introduceren). Een andere veelvoorkomende
verbetering is het verminderen van static calls. Wanneer een object
voldoet aan ICE en SOLID (en high cohesion) zit in het object al de
informatie die nodig is om een actie uit te voeren.

Heb je code verbeterd? Vergeet dan niet te committen en te pushen.
Gebruik een beschrijvende message, zoals: 'Refactor code according to
design principles'.

## Design patterns

Waar libraries en frameworks concrete standaardoplossingen zijn die als
*third-party dependencies* in je project kunnen worden opgenomen, zijn
design patterns meer conceptuele standaardoplossingen. Het gaat om een
soort standaardstructuur of -aanpak die gehanteerd kan worden bij
veelvoorkomende problemen binnen een bepaalde context, gelet op bepaalde
vereisten.

Hoe kan je bijvoorbeeld het creëren van instanties van verschillende
implementaties van een interface netjes variëren op één plek? Dat kan
door een *creational pattern* te gebruiken, zoals een *Factory* of een
*Builder*.

### Een globaal overzicht van design patterns

Hier volgt een globaal overzicht van de design patterns die in deze
cursus aan bod komen. Dit is een selectie van bekende
standaardoplossingen. Neem voor inspiratie en onderbouwing de slides
door en eventueel het materiaal van
[refactoring.guru](refactoring.guru){.uri} en
[sourcemaking.com](sourcemaking.com){.uri}. De meeste patterns komen uit
het Gang of Four-boek genaamd 'Design Patterns', een aantal anderen
komen uit het boek 'Patterns of Enterprise Application Architecture' van
Martin Fowler. Alle patterns worden in meer of mindere mate toegepast in
de praktijk.

Let op dat elke pattern een bepaalde structuur verwacht. **Zorg er dus
voor dat je zelf op basis van de slides en de materialen hierboven weet
hoe elke pattern er ongeveer werkt en in elkaar zit!**

#### Creational patterns

Inrichten creatie en levensduur van objecten gelet op cohesion en
coupling.

-   **Factory**: (Sub)klassen of implementaties instantiëren tijdens
    runtime, waarbij de klassen en parameters kunnen variëren

-   **Builder**: Stapje voor stapje een complex object bouwen, waarbij
    de stapjes en het eindproduct kunnen variëren

-   **Singleton**: Een klasse die slechts één globale instantie aanbiedt
    (gebruik spaarzaam)

#### Structural patterns

Structureren van objecten en deelsystemen gelet op cohesion en coupling.

-   **Facade**: Maak een deelsysteem op eenduidige wijze benaderbaar
    door een tussenliggende service (met versimpelde interface) in te
    richten

-   **Gateway (incl. DAO, Repository)**: Maak een extern systeem op
    eenduidige wijze benaderbaar door een tussenliggende (abstracte)
    service in te richten

-   **Adapter**: Laat een klasse die imcompatibel is met een interface
    toch deze invullen door deze te verpakken in een klasse die wel
    compatibel is met deze interface

-   **Decorator**: Voegt nieuw gedrag toe aan een klasse door deze in te
    pakken in een klasse met dezelfde interface

-   **Data Transfer Object (DTO)**: Groepeer data in één object zonder
    gedrag. Vaak gebruikt om een bericht te modelleren tussen
    (deel)systemen.

#### Behavioral patterns

Efficiënt inrichten samenwerking tussen objecten gelet op cohesion en
coupling.

-   **Template Method**: Bied een abstract algoritme aan, waarbij de
    volgorde van stappen vastligt maar de implementatie van stappen kan
    worden ingevuld door subklassen.

-   **Strategy**: Encapsuleer runtime variatie van gedrag waarvan een
    client afhankelijk is.

-   **State**: Encapsuleer runtime variatie van toestanden met complexe
    beslissingen.

-   **Observer**: Wanneer één object verandert, worden geïnteresseerden
    van deze wijziging op de hoogte gebracht en geüpdatet.

## Stap 2: Herken toegepaste design patterns

We zijn een heel eind gekomen met dit project. Onderweg hebben we
stiekem al een aantal design patterns ingezet! Je kan tijdens het
assessment de vraag verwachten welke design patterns je hebt ingezet en
waar.

Schrijf daarom in een markdown-bestand (bijvoorbeeld
'design-patterns.md') of in een presentatie waar je welke design
patterns hebt opgenomen in de blackjack-component. Neem hiervoor de
slides door en eventueel het materiaal van
[refactoring.guru](refactoring.guru){.uri} en
[sourcemaking.com](sourcemaking.com){.uri}.

## Stap 3: Voeg een of meer extra design pattern(s) toe

Het herkennen van een design pattern is natuurlijk handig, maar je leert
veel meer als je zelf een design pattern kunt realiseren binnen de
blackjack-component! Dat is de bedoeling van deze laatste stap voor het
assessment.

Kies een of meer van de opties uit die hieronder zijn opgenomen en voeg
de betreffende functionaliteit toe door een design pattern te gebruiken.
Voeg deze patterns toe aan je markdown-bestand of presentatie. Neem voor
inspiratie en onderbouwing de slides door en eventueel het materiaal van
[refactoring.guru](refactoring.guru){.uri} en
[sourcemaking.com](sourcemaking.com){.uri}.

Om een of meer patterns te implementeren kan je kiezen uit de volgende
opties. Je mag zelf bedenken hoe je dit precies uitwerkt en wat de
randvoorwaarden zijn, mits het voldoet aan de architectuur, design
principles en design patterns. Zo kan je ervoor kiezen om te werken met
voorgeconfigureerde waarden waar de speler op een of andere manier uit
kan kiezen. Denk ook goed na over wat de speler (client) door moet geven
via de controller, op welke plek dat moet gebeuren en of en met welke
informatie de use case(s) uitgebreid moeten worden.

-   Optie A: Speler kan het aantal decks kiezen om mee te spelen

-   Optie B: Speler kan zelf de kaarten binnen een decks samenstellen

-   Optie C: Speler kan de uitbetalingsregels kiezen

-   Optie D: Speler kan de scoreregels kiezen voor speelkaarten of
    handen

-   Optie E: De spelregels kunnen verschillen op basis van spelernaam

-   Optie F: Bijhouden van uitbetalingen op een losgekoppelde en
    vervangbare wijze

-   Optie H: Het spel modelleren als een reeks toestandsovergangen

-   Optie I: Het aanbieden van insuranceregels

-   Optie X: Een zelfbedachte spelwijziging met behulp van een design
    pattern

Vergeet niet ergens op te schrijven (bijvoorbeeld in
'design-patterns.md') welke pattern(s) je hebt gekozen.

## Klaar? Voorbereiden voor het assessment

Neem het opdrachtdocument nogmaals door, bekijk de rubric op Canvas en
doorloop alle deelopdrachten om te zien of je overal aan voldoet.
Probeer de laatste feedback/les te gebruiken om te kijken of je begrijpt
hoe het project in elkaar zit en op welke manier de theorie daarin terug
komt.

Tijdens het assessment zal je met je docent over je project praten. Het
wordt afgesloten met een interview over de theorie achter je project op
basis van de leerdoelen. Het is handig om een korte presentatie voor te
bereiden.

Zorg dat je een assessmentdatum inplant met je docent en bereid je voor
door een presentatie of een document te maken waarin de theorie en de
praktijk van deze cursus samenkomen.

Bedankt voor het volgen van deze cursus en veel succes met het
assessment!
