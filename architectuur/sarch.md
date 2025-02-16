# Inleiding [_inleiding]

Dit zijn de gedachten en ideeën die ik heb voorbereid om aan de
Hogeschool Utrecht de cursus Software Architecture te geven. De slides
van dat vak zijn nog steeds het primaire materiaal, maar hopelijk helpt
dit als je bijv. een les hebt gemist. De hoop en intentie is dat dit een
volwaardige reader kan worden, en dat het de slidedecks als primaire
bron kan vervangen. Maar daar zijn we dus nog niet.

De diagrammen in dit document zijn gemaakt met PlantUML. Dat levert niet
de mooiste plaatjes op, maar is één van de snellere tools. Zelf zou ik
je als student altijd aanraden om dit soort diagrammen 'een beetje
slordig' met pen en papier, of op een whiteboard te maken. Dat is echter
niet zo handig qua updates en tweaks.

De rest van het document is ASCIIDoc, een Markdown-cloon met net iets
meer support voor 'boekige' dingen (zoals inhoudsopgave en referenties).

De broncode is uiteraard beschikbaar op
[Github](https://github.com/tomkempernl/hu-sarch-reader). Pull-requests
voor spelfouten zijn hartstikke welkom, evenals issues wbt. ontbrekende
stof of onduidelijke alineas.

# Wat is Software Architecture [_wat_is_software_architecture]

Meestal beginnen we een vak met een droge definitie waar het allemaal om
zal gaan.

Laten we dat nu ook doen, volgens <span class="citation">([Clements et
al., 2010](#documenting_software_architectures))</span>:

> "The software architecture of a computing system is the set of
> structures needed to reason about the system, which comprise software
> elements, relations among them, and properties of both."
>
> —  Documenting Software Architectures (2010)

Een definitie als deze is technisch gezien waar. Maar het is niet geheel
duidelijk waar we nu moeten beginnen met leren over Software
Architecture[^1].

Het is goed om te weten dat we niet alleen zijn, in "Who needs an
Architect" <span class="citation">([Fowler, 2003
](#who_needs_an_architect))</span> vertelt een de jaren 90/00 beroemde
architect Martin Fowler over een discussie met Ralph Jonson, één van de
Gang of Four die Design Patterns (<span class="citation">([Gamma et al.,
1994](#gof_design_patterns))</span>) zo beroemd hebben gemaakt:

> “Architecture is the decisions that you wish you could get right early
> in a project. . . . Architecture is about the important stuff.
> Whatever that is."
>
> —  Ralph Johnson

Kortom, in tegenstelling tot bijv. Object Oriented Programming, waar we
direct een redelijke definitie konden geven, zitten we hier met een
probleem[^2].

Wat we uit deze definities, zowel de formele, als de gekscherende kunnen
opmaken is dat Software Architecture gaat over het *design* van
software, dat het belangrijk is, en dat het gaat over 'het grote
plaatje', de grove blokken en hoe die zich tot elkaar verhouden. Verder
zien we dat het iets is dat vaak aan het begin van het project
belangrijk is: iets waar we aan het begin in willen *investeren* zodat
we er later profijt van hebben (meer profijt dan de initiele moeite
kostte).

Een laatste perspectief om mee te nemen:

> The alternative to Good Design is always Bad Design. There is no such
> thing as No Design.
>
> —  Adam Judge of Martin Douglas onduidelijk

Als we geen Software Architecture-werkzaamheden uitvoeren betekent dat
niet dat ons eindproduct geen architectuur zal hebben.

## Wat doet een Software Architect? [_wat_doet_een_software_architect]

De rol van Software Architect is vaak een vrij seniore rol in het team.
Om een succesvolle architect te zijn moet je goed op de hoogte zijn van
de technische werking van het systeem waar je aan werkt, maar ook de
bedrijfscontext waarin het ingezet wordt.

Kortom de Software Architect is van vele markten thuis. Dit is de
oorzaak (of juist het gevolg?) van het feit dat de Software Architect
veel tijd spendeert aan het communiceren met de verschillende
stakeholders. Het idee (<span class="citation">([Hohpe,
2020](#hophe_elevator))</span>) is dat de Software Architect kan
taakswitchen tussen op hoog niveau praten over de strategische doelen
van de organisatie, wat wil het management bereiken, maar ook even
nuttige gesprekken kan voeren met de individuele projectmanagers over
wat haalbaar is in welke sprint, en tot slot ook nog even naast een
developer op een stoel kan gaan zitten om even te pair-programmen.

Dit is een ervaring die veel developers delen wanneer ze van
junior-niveau opklimmen naar senior. Op een gegeven moment kom je bijna
niet meer aan programmeren toe! (TODO: mooie citatie hiervoor)

Tot slot, als communiceren zo’n belangrijk onderdeel is van je taak. Dan
moet je ook kunnen communiceren als je niet beschikbaar bent: oftewel je
moet alles goed kunnen documenteren.

## Software Architectuur Producten [_software_architectuur_producten]

Het primaire product dat we ontwikkelen als Software Architect zijn
modellen van de applicatie. Het is verleidelijk om bij het woord "model"
gelijk aan plaatjes te denken, en in de praktijk noemen we de vele
plaatjes in software-architecture documenten ook wel "modellen", maar
strict genomen is dat ietwat misleidend. Een model is een mentaal
construct. Het is een manier van denken over de applicatie. Een model
leeft dus in je hoofd.

Onze eerste verantwoordelijkheid als architect is dus om goede manieren
van denken over de applicatie te hebben. We dienen dus een zekere
expertise te bezitten over het systeem in kwestie. Uiteraard is dat niet
voldoende, want daar hebben onze teamleden en andere stakeholders niet
zoveel aan, ze kunnen immers niet in ons hoofd kijken.

Het volgende probleem is dus hoe we onze gedachten over onze modellen
communiceren met anderen. En het is heel moeilijk om met veel
verschillende mensen, met verschillende achtergronden, interesses, en
doelen, te communiceren. Omdat dit zo moeilijk is zijn er over de jaren
heen vele verschillende standaarden bedacht.

De exacte standaarden zijn niet essentieel (die komen en gaan), maar de
gedachten achter de standaarden zijn vrij constant.

Een groot risico is dat we de relatie tussen de documenten en de
expertise omdraaien. Het is relatief eenvoudig om op basis van genoeg
voorbeelden allerhande diagrammen uit te draaien die 'lijken op wat
andere architecten doen', en aangezien helaas Software Architecture de
bredere reputatie heeft om onbegrijpelijk te zijn is het goed te doen om
op die manier jaren onopgemerkt in een organisatie te leven. Dit wordt
wel gekscherend de "Armchair Architect" genoemd
<span class="citation">([Richards & Ford,
2020](#richards_ford_fundamentals))</span>.

Zorg er dus eerst voor dat je iets te zeggen hebt, en maak je daarna pas
zorgen over hoe je dat in code, tekst, UML, of andere wijze uitdrukt.
Maar om niet geheel het wiel opnieuw uit te vinden is het wel handig om
een paar 'wijze lessen uit het verleden' mee te pikken…​

## UML [_uml]

UML is niet het meest populaire stuk gereedschap voor programmeurs.
Tegenwoordig wordt meestal een per-bedrijf-net-anders informeel dialect
van vierkantjes en pijltjes gebruikt om design-beslissingen toe te
lichten, of bij een whiteboard te overleggen.

Daar is op zich niet zoveel mis mee, maar het is niet handig om dat op
een school te leren. Daarom kiezen we *een standaard*.

We maken gebruik van een subset van de diagrammen:

-   Class Diagrams

-   Sequence Diagrams

-   Package Diagrams (evt. met classes)

-   Component Diagrams

(TODO: korte herhaling)

## Architectural Notebook [_architectural_notebook]

Een gouwe ouwe in het inrichten van een Software Development proces is
de (Rational) Unified Proces[^3].

Voor Software Architecture is het relevantste onderdeel het
Architectural Notebook. Dat is een (hopelijk kort) document met daarin
grofweg:

1.  Architectural Goals

2.  Architecturally Significant Requirements

    -   Functional

    -   Non-Functional

3.  Decisions & Justifications

4.  Key Abstractions / Domain Model

5.  Software Partioning

6.  Deployment Model

De Architectural Goals zijn een korte introductie waarom het document
überhaupt nodig is. Zelfs als je besluit alles compleet *Vanilla*
volgens allerhande *Best Practices* te doen is het goed om hier toe te
lichten welke standaarden je volgt. Maar meestal is er (buiten
schoolprojecten) wel 'iets geks' in je project, of in je systeem te
benoemen wat hier nadere toelichting vereist.

De volgende stap zijn de *architecturally significant* requirements.
Klassiek gezien delen we die in tweeën: de eerste categorie zijn de
Functional requirements, dat zijn eisen aan je product die vooral over
de uiteindelijke werking gaan.

Functional Requirements vertellen je wat het systeem moet gaan doen?
Welk probleem lost het op?
[Nginx](https://aosabook.org/en/v2/nginx.html) is bijv. primair een
web-server, het serveert web-paginas en applicaties.
[Minecraft](https://www.minecraft.net/en-us) is een soort virtuele LEGO.
[Discord](https://discord.com/) is een Chat-programma, op een bijzondere
manier.

In de functional requirements duik je dieper op deze algemene doelen in
en probeer je specifiek te verwoorden wat je product moet doen. In het
geval van nginx zullen dat HTTP-gerelateerde requirements zijn.
Minecraft zal requirements hebben over hoe er precies gebouwd mag
worden, dat er een 1st en een 3rd person perspectief is, etc. Discord
zal iets zeggen over hoe hun Servers en hun Nitro exact werkt[^4].

Functional Requirements zijn vaak uniek aan je project (concurrenten
buiten beschouwing gelaten). En hoewel Functional Requirements *super
belangrijk* zijn voor je architectuur is het vaak in de literatuur niet
veel besproken. Ze zijn immers vrij uniek, dus het is lastig advies
erover te geven[^5]. Men gaat er vanuit dat je de wijsheid van de
**andere** categorie ook automatisch op deze kan toepassen.

Non-Functional Requirements gaan dus …​niet…​ over de uiteindelijke
functie van de applicatie. Ze gaan over *hoe* die functionaliteit
bereikt wordt. Je moet hier denken aan bijv. [ISO
25010](https://iso25000.com/index.php/en/iso-25000-standards/iso-25010)
zaken, zoals Performance, Security, Maintainability, Usability, etc.
Deze zaken zijn relevant voor elke applicatie, en zodoende zijn er ook
makkelijker algemene adviezen over te geven.

Let echter wel op, we hebben het hier over Architecturally
**Significant** requirements. Neem bijv. Performance, iedereen wil dat
z’n systeem een beetje performt. Niemand accepteert een website die per
request vijf minuten staat te ratelen. Maar stel je hebt je applicatie
gewoon via een standaard Java-Spring-Heroku/Render/XYZ opzet online
gezet, dan is waarschijnlijk Performance niet Architecturally
Significant geweest. Je hebt gewoon algemene best-practices gevolgd, en
het eindresultaat was prima. Het feit dat je performance 'best
belangrijk' vindt betekent niet automatisch dat het Architecturally
Significant is. Iets wordt pas Significant als je er in je ontwerp
expliciet rekening mee moet houden. Dus stel je hebt overal er voor
gezorgd dat 1 HTTP request van de client max. 1 Database-query kan
opleveren, dan zul je daar waarschijnlijk grote offers voor hebben
moeten brengen qua structuur (bijv. qua modulariteit; het is lastig,
doch niet onmogelijk, losse modules apart te houden als ze allemaal al
hun data uit die ene query moeten krijgen).

Kortom Architecturally Significant betekent dat het aanwijsbaar invloed
op je ontwerpkeuzes heeft gehad. Niet alleen maar dat je 'het belangrijk
vond'. Als je nog niet zo ver in je project/systeem bent is het dus 'ok'
(niet ideaal, maar ok) om nog te moeten ontdekken wat dedaadwerkelijk
significante requirements zijn.

De gevolgen van de gekozen significante requirements en best-practices
zijn natuurlijk de moeite waard om te documenteren. En dat brengt ons
bij het derde standaard onderdeel van zo’n notebook, de Decisions en
Justifications. Hier komt de rol als communicator weer tevoorschijn. De
rechtvaardiging van je beslissingen is belangrijker dan de
daadwerkelijke beslissing.

Je mag, en zal het vaak mis hebben als architect (maar hopelijk heb je
het nog vaker bij het rechte eind!). Het is daarom essentieel om te
documenteren *waarom* je een bepaalde beslissing (meestal een beperking)
hebt opgelegd. Idealiter accepteren de andere stakeholders je
beslissing, maar zo niet, dan ligt het initatief om jou te weerleggen
bij hen. En met goede argumenten overtuigd worden tot een betere
oplossing is niet een vorm van verliezen. Dat is winst voor het hele
team. Je bent als architect de bewaker van de structuur, niet
noodzakelijk de bedenker.

Het vierde standaard-element is een overzicht van het domein-model, ook
wel bekend als de 'key-abstractions'. Elke class (aangenomen een
Object-Oriented taal als Java) in ons model is noodzakelijk een
versimpeling van de werkelijkheid, en is zodoende al een 'abstractie'.
Stel we hebben een class "Product" voor stripboeken, dan modelleren we
waarschijnlijk de staat als "Zo-goed-als-nieuw", in plaats van 'dat ene
minieme vouwtje op pagina 33'. We laten details weg, dus het is een
abstractie. We hebben het hier dus niet noodzakelijk over complexere OOP
zaken zoals Interfaces of Abstract Classes. Je kunt hier volstaan met
een nette beschrijving in woorden, of (vaak iets korter) een UML
class-diagram.

Let er op dat we hier niet *volledig* willen zijn. Volledig is misschien
wel *correct*, maar meestal zal een domein-model in een echt systeem
zoveel details bevatten dat je elke lezer totaal zou overrompelen.
Bedenk welk verhaal je wil vertellen, en hou rekening met de bedoelde
lezer van je notebook[^6].

Het vijfde onderdeel is de algemene partionering van het systeem. Dat is
een belangrijk onderdeel. Zo belangrijk dat we er twee aparte
hoofdstukken voor inruimen: [Components](#_components) en
[Layers](#_layers). Dus daar laten we het hier even bij.

Tot slot is het belangrijk om stil te staan bij het Deployment Model,
oftewel, wat zijn je gedachten over hoe het uiteindelijk *live* komt te
staan. Dat is belangrijk, want software bouwen op je developer-laptop is
niet de baan van een Software Developer. Software moet de wereld in.

Dit is stiekem echt belangrijk. Het is heel verleidelijk om er vanuit te
gaan dat 'als het op mijn laptop draait, hoe moeilijk kan het dan nog
zijn?!'. En het praktische antwoord is helaas vaak 'heel moeilijk'.

Gelukkig is er vaak in elk project ook een ideaal moment om deze
problemen aan te pakken, namelijk helemaal aan het begin. Helemaal aan
het begin is vaak nog niet helemaal duidelijk *wat* er precies moet
gebeuren, maar de algemene eisen zijn vaak wel helder (het wordt een
website, of een mobiele app, of een game op de Nintendo Switch, etc.),
en de algemene randvoorwaarden ook (we gaan een database nodig hebben,
of een barcode scanner, of een VR bril, etc.).

Meestal zit er in deze fase van ontwikkeling een boel 'dode tijd'. Je
kunt nog niet echt lekker beginnen, omdat je nog niet precies weet welke
kant op. Dit helder krijgen vereist vaak een boel praten, vergaderen,
mailen en …​wachten. Tijdens dat wachten kun je vaak werken aan een
eerste 'hello world'-achtige applicatie proberen live te zetten. Dit
noemt men ook wel een "Walking Skeleton"
<span class="citation">([Monson-Haefel, 2009](#things))</span>.

Tijd voor een bekentenis. Ik heb nog **nooit** een Architectural
Notebook zoals hierboven beschreven daadwerkelijk uitgeschreven. Het
voelt altijd als iets waar je 'eigenlijk geen tijd voor hebt'.

Wel heb ik al het denkwerk wat in zo’n Notebook zit gedaan. Het
**model** was er dus en ik had het kunnen (moeten?) opschrijven. In
plaats daarvan zat ik in een klein team, dus kon deze gedachten vaak
redelijk overbrengen op informele wijze. In discussies, of
gefragmenteerd in allerlei comments, en JIRA-tickets.

De vragen die zo’n Notebook stelt kun je niet ontwijken. En zeker als je
in een groter team, of bij een formeler bedrijf werkt, is het echt de
moeite waard om deze gedachten netjes op te schrijven. Het UP-Notebook
is maar één standaard tussen velen. Zorg dat je weet wat je zou moeten
schrijven, dan is de methode waarop slechts een detail. Kijk dus vooral
naar deze formele methodes en standaarden als hulpmiddelen om aan zaken
te denken waar je normaal gesproken niet aan zou denken.

-Tom

## 4+1 Views [_41_views]

Een klassieker in deze hoek is het 4+1 model
<span class="citation">([Kruchten, 1995](#kruchten_41))</span>. We
hebben net gezien hoe belangrijk en moeilijk communicatie is. Dus hoe
kunnen we het ons (ietsje) makkelijker maken?

Door niet één ontwerp/document/model te hanteren voor ieder mogelijk
scenario! Als we accepteren dat we op verschillende manieren over een
systeem kunnen nadenken, en als we accepteren dat we die gedachten (dat
model!) moeten uitleggen aan verschillende mensen, dan is het hartstikke
logisch dat we niet één document moeten schrijven, maar meerdere.

Dat klinkt als nog meer werk, maar meestal is het makkelijker vier
modellen te construeren dan om er één te maken (en te falen) die
geschikt is voor iedereen. En niet elk model heeft noodzakelijkerwijs
z’n eigen document nodig. Deze verschillende zienswijzen noemt Kruchten
(niet geheel verrassend) *views*, en hij heeft er …​4+1…​ (tromgeroffel)…​
5 van!

Stel we nemen als doorlopend voorbeeld het werken van het menselijk
hart[^7]. Niet een ICT systeem, maar vergelijkbaar.

1.  Process View

2.  Development View

3.  Logical view

4.  Deployment View \*. Usecase View

De eerste is de Process View. Hier bekijken we belangrijke onderdelen
van het proces en hoe die zich temporeel verhouden. Dus eerst pompt het
hart het bloed rond, dan geeft het bloed zuurstof af aan organen, en dan
pas wordt het weer ge-oxygeneerd. Voor een software project kun je hier
denken aan Sequence Diagrammen, BPMN modellen, of (indien duidelijk
genoeg) een tekstuele beschrijving. Idealiter kunnen de business-experts
aan de hand van deze informatie kritisch kijken naar de geplande (of
gerealiseerde) werking van het systeem, zonder verdwaald te raken in
technisch detail.

De Development View is er op gericht hoe developers met het systeem
dienen te interacteren. In ons voorbeeld zou dit een uitgebreide
beschrijving zijn waar welk onderdeel van het hart zit, hoe een incisie
gemaakt dient te worden, en hoe je 'in het algemeen' een
hart-transplantatie uitvoert (aangenomen dat de chirurg hier de rol van
developer vervult). Voor een software project zijn dit je
component/class diagrammen, een duidelijke proof-of-concept, of een
goede README in de root van je repo. Wat de developers nodig hebben om
het project te begrijpen.

De Logical View zoomt juist een beetje uit, om vooral te focussen op de
functionaliteit. In een software project zijn dit bijv. package
diagrammen, of informele 'boxes & arrows'. Dit is handig zodat je bijv.
kan inschatten wat er wel/niet blijft werken als er problemen zijn, of
hoe werk verdeeld moet worden. In ons harten-voorbeeld zou je bijv.
beschrijven hoe het hart als een pomp werkt, en een overzicht van de rol
van de verschillende aderen. Handig als je als dokter moet beslissen
waar je *eerst* aan het werk gaat. Liever de slagader eerst dicht, en
daarna pas die bij je pink.

De Deployment View gaat dan juist in op hoe het systeem gedeployed moet
worden. In ons voorbeeld zou dat het medische dossier van mevrouw de
Vries zijn, met belangrijke informatie zoals haar anatomie, bloedgroep,
etc. In een software project is het een beschrijving waar en hoe de
software in productie gaat draaien. Dus in het geval van een website op
wat voor servers het gaat draaien (bijv. in een cloud), of wat voor
mobiele devices, of dat het misschien via Steam op directe client-pcs
gaat draaien. In complexe gevallen kan een UML Deployment Diagram
uitkomst bieden.

## Logisch vs. Fysiek [_logisch_vs_fysiek]

Een veel terugkomend onderscheid in deze cursus is het onderscheid
tussen een Logisch niveau van modelleren, en een Fysiek niveau. Dit
correspondeert grofweg met het Logische en het Development perspectief
in Kruchten, maar is toch weer net ietsje anders.

In plaats van een perspectief is dit onderscheid bedoeld als schaal van
detail, niet noodzakelijk gebonden aan doel-publiek. Op Logisch niveau
zijn we vooral geïnteresseerd in de algemene concepten: wat moet waar
gebeuren. Naarmate we 'Fysieker' worden voegen we steeds meer technische
details toe. Meestal is het meest Fysieke niveau dat we beschrijven een
niveau waarmee een gemiddelde developer zonder al te veel extra nadenken
de code zou kunnen uitwerken.

Dus als je als developer je soms afvraagt 'waar is dat logische niveau
eigenlijk voor?', dat kan best. Meestal ben je niet de doelgroep voor
die stijl van denken, maar stel je bent bijv. net nieuw bij een bedrijf,
dan is het prettig om eerst een algemeen plaatje te vormen. Op
Logisch-componenten niveau (zie [Components](#_components), maar in een
notendop: uit welke grove delen bestaat dit systeem) willen we bijv. met
business expert dubbelchecken of we alle verwachte functionaliteit in
zicht hebben, of met een hoge-level manager nadenken hoe de
verschillende teams van developers überhaupt ingezet dienen te worden op
een project. Als we daar diagrammen gaan maken met allerhande fancy
interfaces en inheritance-hierarchieën dan worden die expert en die
manager alleen maar gefrustreerd. Niet relevant voor hun doeleinden.

Op het standaard Fysieke niveau voelen we ons als developer thuis, want
daar praten we over classes, interfaces, en allemaal ander leuk spul.
Dat kan je in UML doen (middels bijv. een Component Diagram), of in
tekst, of met stukjes voorbeeldcode in Java. Het model leeft in je
gedachte, en je kiest de beste vorm om die gedachte over te brengen naar
de andere developers.

Logisch naar Fysiek is echter een schaal, en we kunnen 'Fysieker' worden
dan normaal. Nog meer Fysiek is bijv. niet de broncode van je
applicatie, maar een proces van die applicatie dat draait op een
specifieke server. Dat zijn de klassieke 'waarom doet ie het op de ene
pc wel, en op de andere niet??'-problemen. Nog fysieker dan dat is als
bijv. een stuk hardware kapot is, dan krijg je echt raar
applicatie-gedrag voor je kiezen. Dan ben je aan het nadenken over hoe
jouw broncode zich gedraagt op die ene server, met dat ene kapotte
RAM-simmetje, en of die misschien verantwoordelijk zou zijn voor dat ene
gekke geval…​

Op die momenten ben je aan het nadenken over verschillende aspecten van
je code. Om überhaupt te kunnen nadenken moet je in staat zijn om
gedachten over je code te vormen. En die gedachten zijn modellen[^8].

## Architecture Decision Records [_architecture_decision_records]

(TODO: uitwerken, voorbeeld)

ADRs zijn een wat modernere standaard om architecturele beslissingen
vast te leggen en bij te houden. Het is een vrij light-weight standaard,
wat fijn is omdat er dus niet ineens een heel groot document getyped
hoeft te worden, maar ook een beetje lastig, omdat er dus ook niet echt
een leidraad is wat je er nou mee moet.

De simpelste lezing is dat het plain-text documenten (bijv. Markdown)
documenten zijn in je repository, met een bepaalde structuur, die op een
bepaalde manier naar elkaar linken.

Zie bijv [ADR Tools](https://github.com/npryce/adr-tools) voor een vrij
breed gebruikte standaard om ze aan te maken.

# Packages & Dependencies [dependencies]

Het is misschien onverwacht, maar een heel groot gedeelte van het werk
van een Software Architect zit in het bijhouden en managen van
dependencies. Een dependency is letterlijk iets waar je afhankelijk van
bent: een ander stukje code dat je nodig hebt om je werk te doen.

De terminologie is een beetje slordig, we kunnen zowel zeggen dat we een
dependency op dat stuk code hebben, maar ook dat dat stuk code een
dependency is. De formele definitie van Software Architecture (zie
[blockquote_title](#definition)) praat over de "Software Elements,
Relations among them, and properties of both". Met het praten over
dependencies praten we dus zowel over de 'elements', en over die
'relations'. Als we het daarnaast ook nog over de 'properties' hebben,
dan hebben we het allemaal wel gehad. Kortom het moge duidelijk zijn hoe
centraal de notie van dependencies zijn binnen het denken over Software
Architecture.

## Waarom Dependencies [_waarom_dependencies]

Je hebt 't nodig. Het is zeer ongebruikelijk om een modern programma
helemaal op eigen kracht te schrijven. Zelfs de String class is strict
genomen onderdeel van de Standard Library in Java, je zou dan alleen de
primitive (kleine letter) classes kunnen gebruiken, en alle andere zelf
moeten maken. Als Software Developers staan we elke dag op de schouders
van reuzen.

Maar naast Strings er zijn zat andere dingen waar je aan kan denken:

-   Zonder een library als JavaFX is het een enorm werk om een knop op
    het scherm te tekenen. Dan zou je zelf alle OS-calls moeten
    schrijven om de juiste pixels te tekenen, click-functionaliteit te
    implementeren, etc.

-   Datum/tijd berekeningen kunnen erg tricky worden met schrikkeljaren,
    zomer/wintertijd etc. Dan is het fijn dat dingen als LocalDate en
    LocalDateTime bestaan.

-   Denk aan al je netwerkprotocollen, HTTP, TCP, IP, Ethernet, etc. Zou
    je allemaal zelf moeten uitschrijven. Uiteraard moet je ook de
    Stream class die binary kan praten dan eerst ook nog 'even' maken.

-   Je kunt het zo gek niet bedenken, of er is wel een library voor.

## Risicos van Dependencies [_risicos_van_dependencies]

Het gebruiken van dependencies is echter niet zonder risicos. Neem bijv.
het updaten van je dependencies, meestal gaat dat goed, maar soms maken
de makers van een library ook een foutje (of gaan ze bewust een andere
kant op), en zit jij als applicatie-ontwikkelaar ineens met een
probleem. Een probleem waar je totaal geen tijd voor ingeplant had.

Een aantal voorbeelden:

-   Leftpad. Er was eens een klein functietje (7 regels javascript…​),
    het ging ongeveer zo: *leftpad('hallo', 7, '-') ⇒ '--hallo'*. Een
    functietje die elke developer ook eigenlijk wel zelf had kunnen
    schrijven, maar ach, 'npm install leftpad' is minder typewerk. En
    dit functietje werd gebruikt in een heleboel verschillende
    Javascript libraries, met name eentje genaamd 'Babel'. Babel is een
    (nog steeds) prachtige library die er voor zorgt dat je de meest
    moderne javascript kan typen, maar het gewoon in een oude crappy
    browser kan draaien. Mooi spul, en bijna elk groot front-end
    framework werkte samen met Babel. Op een mooie dag besloot echter de
    developer van Leftpad z’n package van NPM af te halen! Gevolg: 'npm
    install leftpad' deed het niet meer. Maar 'npm install babel' ook
    niet meer, en 'npm install angular/vue/react/etc' ook allemaal niet
    meer! Kortom bijna elke CI-server van bijna elk bedrijf had een hele
    slechte dag ineens. Launches gingen mis, updates werden uitgesteld,
    en natuurlijk heel veel verwarrende rode lampjes op allerlei
    normaal-zo-rustige CI-servers. <span class="citation">([Collins,
    2016 ](#leftpad))</span>

-   Log4Shell. In 2021 werd ontdekt dat je met een héle populaire
    Logging library voor Java (Log4J), een hele gevaarlijke truc kon
    uithalen. Door een bepaald soort regel te laten loggen, kon je de
    server een JAR op een URL naar jouw keuze laten downloaden en
    uitvoeren. Kortom, arbitraire remote-code executie op een server.
    Het wordt niet heel veel linker dan dat. Details wat voor impact dit
    heeft gehad op bijv. de Nederlandse Overheid kun je lezen [op
    Github](https://github.com/NCSC-NL/log4shell).

## Packages [_packages]

Het woord package is nogal overloaded. Een Java package is net iets
anders dan een NPM package, en woorden als project of module hebben ook
per programmeertaal een andere bijklank.

Gelukkig zitten Java-packages en UML packages redelijk dicht bij elkaar.
Een package in deze zin is louter een groepje classes (en andere 'inner'
packages). Het is vaak heel veel gedoe om op een te-precies niveau over
Dependencies te praten (dan moet je elke link tussen twee classes
noemen). Zodoende is het vaak voldoende om iets grover over
afhankelijkheden te praten. Strict genomen zeggen we dat een package A
afhankelijk van B is, als er minstens één class uit A, afhankelijk is op
minstens één class uit B.

Dependencies zijn zeg maar 'besmettelijk'.

## Dependencies & Coupling [coupling]

Met Coupling bedoelen we een verbinding tussen verschillende groepen
code (zoals classes). Als een wijziging in stukje code B tot een
mogelijke wijziging in code A zou kunnen leiden (genoeg dat je het even
moet dubbelchecken of het wel goed gaat), dan is A gekoppeld aan B.

In de meeste gevallen impliceert een Dependency automatisch dat er
Coupling tussen stukken code is (want als de dependency stuk gaat, dan
moet je aan het werk). De vergelijking is echter net-niet één-op-één. Je
kunt bijv. een class schrijven die al je data netjes naar een bestand
schrijft met de java.nio.file.Files class. Je applicatie is dan nog wel
Dependent java.nio.file.Files, en is nog wel een beetje gecoupled aan
java.nio.file.Files, maar een heel stuk minder als wanneer je in twintig
verschillende classes in je code-base met het handje met
java.nio.file.Files aan het manipuleren bent.

Coupling is dus een schaal, je kunt 'een beetje' gecoupled zijn, of heel
erg. Afhankelijk hoe groot evt. problemen in je applicatie door de rest
van je code verspreiden. Er zijn veel soorten coupling, in deze cursus
focussen we vooral op Type-level-coupling (dus als we code B wijzigen,
kunnen we code A ineens niet meer compilen), maar er zijn vele soorten
(bijv. qua timing, als we er vanuit gaan dat een bepaalde methode 'vast
wel binnen een seconde klaar is' en daar met een Thread.sleep omheen
werken). Zie voor meer bijv. de website
[Connasence.io](https://connascence.io/)[^9]

### Law of Demeter [_law_of_demeter]

Een mooi voorbeeld van hoe je in moderne IDEs vrij snel een rommeltje
kan maken van je dependencies zie je in onderstaande regel code:

<div class="formalpara-title" markdown="1">

**Een zogeheten train-wreck, doe dit niet.**

</div>

``` java
//In een class 'Checkout':
double vatRateForCustomer = order.getCustomers().getPrimaryAddress().getCity().getLaws().getVATRate();
```

Het grote probleem is dat deze regel code echt heel leuk voelt om te
typen! Je 'dot' van het ene object naar het volgende, en eindigt exact
met de informatie die je nodig hebt. Voelt goed, als een soort moderne
code-cowboy. Het probleem is dat deze regel enorm veel coupling
introduceert: de class Checkout gaat kapot als er op elke plek in die
keten iets verandert. Als Order mogelijk z’n customer anders returnt kan
checkout stuk, als Customer z’n adressen anders gaat opslaan, als
Address z’n city anders gaat behandelen, als City niet meer een
collectie Laws heeft, en als die Laws niet meer van VAT (BTW)
percentages weten…​ Kortom, allemaal coupling, voor zeer weinig practisch
nut. Wat we willen zien is:

<div class="formalpara-title" markdown="1">

**Demeter, Griekse graangodin, kan weer lachen.**

</div>

``` java
//In een class 'Checkout':
double vatRateForCustomer = order.getVATRate();
```

Heel flauw gezegd is dat we op één regel vaak maar één (of soms twee…​)
'dots' willen zien. We waarderen en respecteren de objecten waarmee we
moeten samenwerken teveel om de hele tijd in hun ingewanden te gaan
zitten wroeten. Vind niemand leuk, ook objecten niet.

Deze regel noemt men de 'Law of Demeter', naar de Griekse graan godin.
Het verhaal er achter is dat deze wet bedacht werd tijdens het
ontwikkelen van een support-tooltje voor een project genaamd Zeus
(Griekse oppergod), en dat support-tooltje heeft men met een knipoog
Demeter genoemd. Tijdens het maken van dat project kwam men erachter dat
deze regel wel een goed idee was <span class="citation">([Holland, 1987
](#demeter))</span>.

## Tot slot [_tot_slot]

Dependencies (en de daaruit voortvloeiende coupling) zijn de oorzaak van
een overvloed van onze problemen. Gelukkig is er een duidelijke
oplossing, de "Fundamental theorem of software engineering":

> "We can solve any problem by introducing an extra level of
> indirection."
>
> —  David Wheeler (????)

En de komende hoofdstukken kijken we naar verschillende vormen die zo’n
level of indirection kan aannemen.

# Components [_components]

Component-based development is een oude techniek in Software
Architectuur. In de basis kennen we de techniek al uit Object-Oriented
Programming: onze code-base wordt makkelijker te begrijpen, en te
onderhouden, als we er voor zorgen dat je niet ten aller tijden alle
details in de gaten hoeft te houden. In OOP regelen we dit door een
duidelijk onderscheid te maken tussen de public en private members
(attributen en methoden) in een class. Zo kunnen we er voor zorgen dat
een object van buitenaf 'lekker makkelijk' in het gebruik is, ongeacht
hoe ingewikkeld het aan de binnenkant blijkt te zijn[^10].

Componenten passen precies ditzelfde idee toe, maar dan een leveltje
hoger. Een component is een groep classes (en interfaces, en enums,
etc.), waarvan sommige classes bedoeld zijn voor publiek gebruik, die je
van buiten de component kan aanroepen, maar ook dat er classes zijn
waarbij dat niet de bedoeling is, de private binnenkant. De classes die
bedoeld zijn voor publieke consumptie worden (nogal verwarrend) ook wel
de 'interface' of het 'contract' van de component genoemd. Deze notie
van een interface bestaat ook in UML, dus we hebben de vreemde situatie
dat een UML-interface uit Java-interfaces en classes kan bestaan, en een
java-interface bestaat dan juist weer alleen uit methods. Uiteindelijk
gaat het dus om de betekenis van het woord 'interface' als 'buitenste
laagje'.

Deze truuk van information-hiding kan je uiteraard ook op hoger liggende
niveaus toepassen; publieke en private componenten binnen een service,
publieke en private services binnen een systeem, publieke en private
systemen binnen een landschap, etc. (al lopen we wel tegen de grenzen
van de standaard-terminologie aan).

Kortom het gaat om goede encapsulatie, en dat geeft componenten een
aantal prettige architecturele eigenschappen:

-   Een goede component is autonoom. Een component kan in z’n eentje kan
    iets nuttigs, of voegt in elk geval iets wezenlijks toe aan het
    grotere geheel.

-   Een goede component is modulair. Ze hebben een duidelijk contract,
    en kunnen gecombineerd en hergebruikt worden om grotere problemen op
    te lossen.

-   Een goede component is vervangbaar. Omdat de buitenkant (de
    interface) van de component helder gedefiniëerd is, kan iemand
    anders relatief makkelijk een eigen versie maken.

Een hele eenvoudige manier om die encapsulatie te bewerkstelligen is om
als de functionaliteit van de component af is, één class aan te maken
die als aanspreekpunt voor de hele component dient. Die class noemen we
dan een Facade (Faccia is Italiaans voor gezicht, façade is Frans voor
voorhoofd). Uiteraard hebben we bij [Packages &
Dependencies](#dependencies) geleerd dat je in dit soort gevallen even
moet oppassen, want als iemand een Dependency neemt op de Facade, dan
neem je ook een Dependency op alle parameters en return-types in
publieke methodes. Mocht daar iets tussen zitten dat je liever niet
blootstelt, dan is het een goed idee om een speciaal 'alleen-lezen'
versie van dat objectje te maken, puur ter uitwisseling van gegevens:
een DTO (Data-Transfer-Object).

De aanwezigheid van een Facade is niet verplicht voor een component, de
essentie is de duidelijke scheiding tussen binnen, en buitenkant. In
Java kun je dat bewerkstelligen door de classes in de 'interface' public
te maken, en de overige classes package-private (door niets, ook geen
private of protected, voor de class te zetten). Een andere, modernere
manier om components in Java te maken vind je in het Java Module System
(wat ook een verwarrende naam is, omdat module zoveel verschillende
dingen kan betekenen). Met het Java Module System (ook wel Jigsaw)
genoemd, kan je per Java .jar aangeven welke classes van buitenaf
gebruikt mogen worden, en welke niet. JavaFX maakt hier vrij enthousiast
gebruik van.

## Logisch vs. Fysiek [_logisch_vs_fysiek_2]

Een logisch componenten model is één van de meest intuïtieve manieren om
je applicatie onder te verdelen. Op logisch niveau laten we veel detail
weg, en focussen we puur op welke grove groepen functionaliteit we in de
applicatie willen realiseren. Een simpel winkelvoorbeeld kan bijv.
bestaan uit:

<figure>
<img src="logical-components.svg" alt="logical components" />
<figcaption>Voorbeeld logisch componentenmodel</figcaption>
</figure>

Met een diagram als dit kun je dan bijv. dubbelchecken of je alle
belangrijke functionaliteit onderverdeeld hebt, of kun je beginnen met
het werk verdelen tussen projectleden op school, of teams van developers
in een bedrijf. Het is prettig als je geen circulaire dependencies
tussen je componenten hebt, dat geeft rust in je ontwerp. Als er geen
cirkels zijn, dan is er ergens een stabiel punt (in dit voorbeeld
'assortiment') wat op een gegeven moment echt 'af genoeg' kan zijn; en
dat plant een stuk makkelijker.

Helaas is dit niet altijd mogelijk, stel het is bijv. heel erg
belangrijk dat afhankelijk van de bezorgingen extra producten in
bepaalde regios in de aanbieding komen ("want we gingen toch al met een
vrachtwagen vol die kant op…​"), dan is er waarschijnlijk plotseling een
Dependency van aanbieding naar bezorging. De aanbiedingen component moet
immers aan de bezorging component kunnen vragen waar er allemaal bezorgd
gaat worden. Dan zullen de teams van die twee onderdelen constant bij
elkaar een vinger aan de pols moeten houden of ze elkaar niet per
ongeluk in de weg zitten. Het kan immers voorkomen dat één van de teams
denkt alles op orde te hebben, maar helaas, een last-minute change van
de ander gooit roet in het eten, en een iteratie later vice-versa. Een
alternatieve optie is om te gaan uitzoeken of de hele
'aanbiedingen'-module niet beter thuis hoort in 'verkoop' voor deze
applicatie. Puur op basis van intuïtie zou zo’n module zowel in
assortiment of in verkoop prima thuis horen, maar op basis van de
componenten-structuur hebben we nu een mogelijke concrete reden om 'm te
verplaatsen. Een reden om dat niet te doen zou bijv. zijn als het teveel
werk wordt om bij te houden voor het team van 'Verkoop', of omdat de
business-expertise over aanbiedingen allemaal in dit specifieke bedrijf
aanwezig zijn bij de mensen van 'assortiment'.

Kortom, er is niet een objectief goed of fout voor 'het algemene geval'.
Er zijn principes, zoals het idealiter vermijden van circulaire
component-dependencies, en die zorgen er voor dat je bepaalde opties als
architect wel, of juist niet, overweegt.

Een logisch model is natuurlijk niet puur een paar 'boxes & lines', die
vormen alleen maar een diagram. Het model is een mentaal construct, en
in dat mentale construct horen dus ook de *dingen* (classes, functies,
verantwoordelijkheden etc.) die je in die boxes zou willen stoppen! Dus
een model is pas volledig als je niet alleen de structuur helder hebt,
maar ook **wat** je met die structuur wil bereiken.

Afhankelijk van je doelpubliek dien je dit duidelijk te documenteren.
Sommige lezers (bijv. collega architecten of programmeurs) zullen erg
geholpen zijn met een illustratie van het soort domein-classes of
methods dat je in de component wilt beleggen. Anderen (minder technische
lezers) zullen juist een alinea tekst waarderen waarin je uitlegt wat
voor usecases en data er in een component thuis horen. In weer andere
situaties (kleine teams, ervaren programmeurs, ICTers als managers, of
echt super-super-duidelijke namen en domeinen) kunnen zelfs puur de
'boxes & lines' voldoende zijn. Het gaat erom dat je het model in je
hoofd zo goed mogelijk kan overbrengen op de lezer.

Op fysiek niveau schakelen we over van planning naar daadwerkelijke
implementatie in code. Dan moeten we explicieter zijn wat exact onze
interface is en daar willen we preciezer zijn over exact welke classes
er private zijn in de component. Aangezien we dan toch al in detail aan
het treden zijn is het vaak ook een prima moment om bepaalde
code-structuren of design-patterns in te zetten.

<figure>
<img src="physical-components.svg" alt="physical components" />
<figcaption>Voorbeeld fysiek componentenmodel</figcaption>
</figure>

In dit fysieke model zie je dat er

Persoonlijk heb ik in m’n werkzame leven nooit gedetaileerde 'fysieke'
modellen getekend. Als we met het team op dat niveau aan het nadenken
waren was het meestal sneller om het gelijk ook in code uit te werken
(of het was ietsje langzamer, maar dan had je daarna tenminste ook echt
het product). Als je dit interessant vindt dan moet je eens naar
[Mob-Programming](https://www.agilealliance.org/resources/experience-reports/mob-programming-agile2014/)
kijken.

Grappig genoeg ben ik pas fysieke, gedetaileerde modellen gaan gebruiken
als docent! Dit gebeurde vooral als ik een idee wou uitleggen aan een
team studenten die werkten in een programmeertaal die ik zelf (nog) niet
sprak (C, C++ en Rust staan allemaal nog op de 'todo'-list, maar die ken
ik nog niet).

Kortom, toen viel voor mij het kwartje waarom sommige architecten de
voorkeur geven aan gedetailleerde modellen. De modellen zijn tricky te
schrijven (want geen compiler, geen unit-tests, geen goede IDE), maar ze
zijn behoorlijk intuïtief, zonder veel training, te lezen voor bijna
alle programmeurs. En als architecten zijn we communicators first: als
wij een beetje extra moeite moeten doen, om het voor onze lezers
makkelijk te maken…​ dan doen we dat maar.

-Tom

## Coupling en Cohesion [_coupling_en_cohesion]

Een ander perspectief op het bouwen van classes, en wederom gaat die
theorie 1-1 mee naar components, is om te kijken naar de Coupling en
Cohesion eigenschappen. Coupling hebben we al enigszins besproken in
[Dependencies & Coupling](#coupling). Binnen de context van componenten
is één van de belangrijkste punten om op te letten is dat je heel erg
oppast met coupling aangaan met andere componenten. Hoe meer de classes
in jouw component een andere component nodig hebben, hoe moeilijker het
gaat worden om jouw component te hergebruiken. Helemaal opvallend is als
onderdelen van jouw component *meer* dependencies buiten de component
dan binnen de component hebben, dan zit die class waarschijnlijk op de
verkeerde plek.

Een ander onderdeel is 'cohesie'. Als er classes in je component zitten
die niet gebruikt worden door de rest, dan is dat vreemd. Waarom zitten
ze dan in je component? Dan is het beter om ze eruit te halen, want dan
hebben evt. dependencies op die class niet direct een dependency op de
hele component! Vanuit dezelfde gedachte is het ook goed om te kijken of
je geen 'eilandjes' in je componenten hebt zitten. Groepjes classes die
elkaar wel nodig hebben, maar tussen de groepjes is geen samenwerking.
In dat soort gevallen (en dat gebeurt regelmatig) heb je per ongeluk
gewoon meerdere componenten in één gepropt. Het nadeel is wederom dat
wanneer iemand van buiten één van die groepjes nodig heeft, dat je
direct een koppeling op de hele component hebt.

Kort door de bocht zegt Cohesion dus dat je classes (en interfaces, en
abstract classes etc.) elkaar 'voldoende' nodig moeten hebben. Want
anders gaan ze maar mooi in hun eigen component wonen.

## Trucs met componentenontwerp [_trucs_met_componentenontwerp]

# Layers [_layers]

Één van de oudste verdeling in software is die in lagen. Al vanaf het
begin leren we dat het goed is om onze software netjes in lagen in te
delen, en dus doen we dat maar. Maar waarom eigenlijk?

<figure id="klassiek2">
<img src="first-layers.svg" alt="first layers" />
<figcaption>Eerste concept van lagen</figcaption>
</figure>

Voordat het overgrote deel van 'doorsnee' software development opgeslokt
is door Web Development waren we vooral bezig met programmas die
volledig op één pc draaiden (denk aan bijv. Word, je browser zelf, of
een game).

Programma’s waren kleiner en simpeler (verwachtingen waren veel minder
hoog), en het was niet ongebruikelijk dat professionele producten door
slechts één of twee developers werden gemaakt. We hadden dus niet echt
behoefte aan extra hulp om onze code begrijpelijk te houden, dat was
allemaal best te doen met duidelijke naamgeving en andere basale trucs.

Ook onder deze omstandigheden kwamen we er al snel achter dat het
belangrijk was om minstens één heldere scheiding aan te brengen: hoe het
programma eruit ziet vs. wat het nou eigenlijk doet. UI code is veel
friemeliger ('knopje tikkie naar rechts, nog eentje, nu weer ietsje
terug…​ Ja daar!'), en trekt ook veel meer feedback in iteraties aan
('kunnen we niet gewoon…​') dan de kernfunctionaliteit.

Je wilt dus snel kunnen itereren op UI, terwijl de rest zo stabiel
mogelijk blijft. Kortom, we willen dependencies van UI naar 'de rest',
maar niet andersom. En met dat éénrichtingsverkeer hebben we de
kerngedachte van lagen te pakken!

## Regels voor lagen [_regels_voor_lagen]

Lagen stapelen we per definitie op elkaar. Met die stapeling suggereren
we dat er slechts éénrichtingverkeer mogelijk is qua dependencies.
Verder suggereren we ook dat je één-voor-één door de lagen heen gaat.

Het terugroepen naar een bovenliggende laag noemt men een back-call, en
de regel dat dit niet mag dus een back-call-ban. Dit is een erg
belangrijke regel in gelaagde archutecturen waar zelden-tot-nooit
uitzonderingen op worden toegestaan.

Het overslaan van een laag noemen we een skip-call, en het bijbehorende
verbod dus een skip-call-ban. Deze regel is niet zo alom gevolgd. In de
meeste gevallen is het overslaan van een laag niet zo erg. Het creëert
iets meer coupling, maar het alternatief is vaak dat je overal puur
doorgeefluiken gaat inbouwen, en dat creëert veel meer coupling!

Als je belangrijke verantwoordelijkheden in een laag belegd, bijv. als
een applicatie-laag zoals in [Standaard 4-lagen](#standaard4)
verantwoordelijk is voor het checken van security, of het implementeren
van auditing, dan is het uiteraard niet zo’n slim idee die laag te
skippen.

## Het standaard 4-lagen model [_het_standaard_4_lagen_model]

<figure id="standaard4">
<img src="cisq-4-layers.svg" alt="cisq 4 layers" />
<figcaption>Standaard 4-lagen</figcaption>
</figure>

Het vier-lagen model dat we bij andere vakken gezien hebben is bijna
helemaal zonder verrassingen. Het enige opvallende is dat de pijl van
data naar domain omhoog in plaats van naar beneden gaat. Wat zou daar
aan de hand zijn? Merk in elk geval op dat er geen vervelende cyclische
afhankelijkheden zijn, dus qua structuur is het in elk geval stabiel.

## Non-standaard lagenmodellen [_non_standaard_lagenmodellen]

In de inleding spraken we van een klassiek 2-lagenmodel ([Eerste concept
van lagen](#klassiek2))

Het is goed om ook nog even het ouderwetse 3-lagenmodel te bespreken:

<figure id="klassiek3">
<img src="3-layers.svg" alt="3 layers" />
<figcaption>Standaard 3-lagen</figcaption>
</figure>

## Logisch vs. Fysiek [_logisch_vs_fysiek_3]

## Trucs met lagenontwerp [_trucs_met_lagenontwerp]

# Architecture Reconstruction [_architecture_reconstruction]

Zoals eerder besproken werken we als Software Architect vaak met
modellen van code: oftewel, een mentaal plaatje waarin we op een
bepaalde manier naar de code kijken. De Software Architectuur is
vervolgens een overzicht hoe de 'grote delen' en de 'pijltjes ertussen'
samenhangen (zie [blockquote_title](#definition)), zodat we makkelijk
die verschillende perspectieven kunnen construeren. Software
Architecture Reconstruction is de subdiscipline waarin we proberen uit
te vinden wat de bedoelde architectuur van een bepaald stuk bestaande
code geweest zal zijn.

In een ideale wereld is de code die je als Architect aantreft in een
project van uitmuntende kwaliteit en duidelijkheid, en is deze code
voorzien van uitstekende documentatie die de slimme gedachten,
toekomstplannen en wijze lessen die in de code verscholen zitten
duidelijk aangeeft en toelicht. Deze ideale wereld is uiteraard niet de
onze. In werkelijkheid is er vaak ooit een mooi begin gemaakt, is er
vervolgens met veel haast een paar jaar duct-tape op de codebase
geplakt, en was de documentatie ook voor de eerste versie al
out-of-date, en daarmee eerder misleidend dan behulpzaam. Software
Development is vaak ook een lerend proces, dus je zult in de code ook
vaak verschillende fases van het ontwikkelteam terugvinden, delen waarin
ze nog echt aan het uitvinden waren hoe het domein werkte, hoe ze als
team moesten samenwerken, en hoe de programmeertaal/frameworks in
kwestie werken, maar ook latere delen waar zaken al wat meer
uitgeklonken zijn.

De eerste indruk van elke Architect of Developer in deze situatie is:
"WTF, dit moet allemaal opnieuw."

![Programmeurs die code van hun voorgangers vervloeken. Slechte code
krijgt veel WTFs, maar zelfs goede code krijgt er
enkele.](images/5-reconstruction-wtfm.jpg)

Dus waarom zouden we überhaupt de moeite doen om ons met reconstructie
bezig te houden?

## Gevaarlijk alternatief: De grote Rewrite [_gevaarlijk_alternatief_de_grote_rewrite]

Één van de meest voorkomende fouten in strategische (min-of-meer: lange
termijn) beslissingen op software systemen is de enorme verleiding om in
situaties zoals bovenstaande aan 'de grote rewrite' te beginnen
<span class="citation">([Spolsky, 2000 ](#spolsky_rewrite))</span>. Het
oude systeem is een rommeltje, dat vindt iedereen, dus het idee dat dit
overnieuw moet, maar dan *zonder al die fouten*, is heel verleidelijk.
Vaak plakken we er dan een vrolijk '2.0' labeltje op, en alles voelt
fris, fruitig, en nieuw. We tuigen een nieuw team op, met één of twee
van de beste developers van het oude product (maar de meeste niet,
natuurlijk, zij hebben immers die rommel gemaakt!), en die zijn maar wat
blij daar weg te zijn. Dit keer gaat alles vast beter en meestal gaan de
eerste paar releases van dit 2.0 systeem ook heel soepel, en is het
optimisme hoog.

Het is makkelijk om nu te vergeten dat versie 1.0 nog in productie
staat, en geld voor je bedrijf aan het verdienen is (als het geen geld
verdiende zou het ook de moeite van het herschrijven niet waard zijn).
Dit product staat natuurlijk niet stil, er worden nieuwe functionele
requirements in verwerkt, en de allerergste problemen worden wel
degelijk aangepakt. Dus enkele maanden later is het 2.0 systeem op de
plek waar het 1.0 systeem **was**. Dit is een probleem waar de Griekse
filosoof Zeno al 500 v.Chr. mee bezig was[^11]!

Nu begint vaak de ellende, want de grote, duidelijke features voor het
2.0 systeem zijn geïmplementeerd, maar nu moeten de details geregeld
worden. Die vreemde, rare gevallen waar je klanten ondertussen aan
gewend zijn geraakt, en zelfs op rekenen. En uiteraard zijn de extra
features in de tussentijd heel redelijk te implementeren op 1.0, maar
waarschijnlijk een groot probleem om ook netjes in 2.0 uit te voeren. En
al die data in het 1.0 systeem? Tsja, die is best waardevol. Zou zonde
zijn om weg te gooien, dus kun je dat niet migreren? En elke, steeds
moeilijker wordende, release van het 2.0 systeem gaat ietsje langzamer,
terwijl het 1.0 systeem gewoon doorkachelt en nieuwe features en
problemen aantrekt.

Er zijn uiteraard oplossingen te bedenken voor al deze problemen, maar
dit verhaal zal voor veel oudere developers herkenbaar zijn, dus de
moeite waard om voor een nieuwe generatie als waarschuwing neer te
zetten.

    Software Architecture Reconstruction, oftewel het uitvinden wat de bedoeling was achter de (meestal enorme rommel van) code die je nu voor je neus hebt, is een eerste (en belangrijk) onderdeel van wat men noemt 'Brownfield Software Engineering'. Dit houdt in dat we ons vak uitoefenen in een situatie waar al een hele boel bestaande software (van meestal 'bruine' kwaliteit...) aanwezig is. Het tegenovergestelde noemt met een 'Greenfield', dan is er nog geen bestaande software om rekening mee te houden, en mag je de allereerste regels code zelf schrijven.

    De meeste developers willen liever een 'Greenfield' dan een 'Brownfield'. Persoonlijk vind ik 'Brownfield' vele malen leuker en interessanter. Bij Greenfield ben je vooral technisch bezig, maar bij Brownfield ga je als ontdekkingsreiziger een oude codebase in. Je leert langzaam verschillende 'personages' (de oude developers) kennen, en je leert en-passant wat over hoe het bedrijf toen functioneerde (dat zie je altijd terug in de code...). Je bent bezig met techniek, taal, sociale verhoudingen, en ondertussen interessante puzzels aan het oplossen.

    Het enige is dat het eindresultaat waarschijnlijk minder spectaculair zal zijn. Als Brownfield developer moet je gericht zijn op je eigen acties, en je eigen kleine effecten. Je bent geen supergaaf product aan het maken, maar je bent hoge-kwaliteit acties aan het ondernemen in een bredere context. Je bent vooral bezig met je eigen professionaliteit. Als je adem lang genoeg is komen daar mooie dingen uit, maar je moet de voldoening echt uit andere dingen zoeken dan bij een Greenfield.

    Probeer die andere blik eens uit, misschien ligt het vakgebied jou ook wel?
    -Tom

## Code Analyse [_code_analyse]

Een wenselijk alternatief is dus om de controle over het bestaande
systeem te herpakken. Een eerste stap voor dit proces is om een
overzicht te krijgen van wat er is. Het reconstrueren van een
architectuur uit bestaande code is echter niet heel vanzelfsprekend:

-   De architectuur is vaak niet (of out-of-date) gedocumenteerd.

-   Architectuur heeft de neiging te *driften*. Over tijd stapelen
    kleine foutjes zich nagenoeg ongezien op.

-   Architectuur is vaak niet expliciet te zien in code. Soms geeft een
    class of package-naam een hele goede hint (een XYZController in een
    Presentation package zal wel UI-layer zijn), maar er is niets in de
    programmeertaal die dit verplicht.

Let op dat in grotere systemen het vaak niet redelijk is om 'de hele
architectuur' eerst te begrijpen (dus een nieuw model te vormen), en
vervolgens beter te documenteren. Vaak zul je tevreden moeten zijn om
stukje bij beetje het oudere systeem te leren kennen, en oude conclusies
te herzien. Welk stuk je kiest is uiteraard afhankelijk van wat je met
het oude systeem wil bereiken.

Er zijn grofweg drie manieren om deze structuren te reconstrueren
<span class="citation">([Cerny et al.,
2022](#microservices_reconstruction))</span>:

-   Statische analyse: vanuit de broncode gebruiken we automatische
    analyse om (delen van) de structuur te reconstrueren

-   Dynamisch: terwijl het systeem draait nemen we allerlei gegevens op
    (via bijv. logging, of complexere agents als debuggers), en uit die
    gegevens reconstrueren we vervolgens de structuur van de applicatie

-   Handmatig: hoge-kwaliteit automatische architectuur analyse is nog
    steeds grotendeels een droom. Grote stukken zullen we dus moeten
    reconstrueren door zelf de code te lezen, of door resultaten van
    automatische tools kritisch verder te verwerken.

Statische analyse is de tak waar het meeste onderzoek naar gedaan is, en
waar dit vak zich het meest mee bezig houdt. Dynamische analyse valt
tegenwoordig vaak onder de bredere vlag van *Observability*, specifiek
gezien *tracing* [^12].

De eerste stap in statische analyse is om de broncode goed genoeg te
kunnen begrijpen (parsen) om er verdere uitspraken over te doen. In het
kader van [HUSACCT](https://husacct.github.io/HUSACCT/) betekent dat dat
we uit de broncode een structuur creeëren voor verdere analyse: het
[Famix Model](https://modularmoose.org/moose-wiki/). Dit klinkt
ingewikkeld (en alle randgevallen maken het dat ook), maar in de basis
betekent dit dat we een regel Java als "class Koe extends Dier" kunnen
vertalen naar een object "new Association(Koe.class, Dier.class,
AssociationType.Inheritance)". Op die manier vertalen we allerlei
verschillende constructen uit Java naar een object-structuur: Imports,
Declaraties van variabelen, of parameters, het Call’en van methods, het
Access’en van public fields, of het plaatsen van mooie @Annotaties boven
een class of method (zoals @Override). Tot slot is er nog de overige
'Referentie' categorie voor als we bijv. een Cast willen uitvoeren in
Java.

De tweede stap is dat we gegeven zo’n object-model van de code, dat we
proberen hier een menselijk leesbaar model van te maken. HUSACCT geeft
bijv. al die verschillende types weer in een UML-package-diagram als een
simpele standaard dependency-stippellijn. En niet alleen de directe
dependencies worden weergegeven, ook de gevolgen daarvan: Als class Koe
in package Kinderboerderij een dependency heeft op de baseclass Dier in
package Natuur, dan heeft het package Kinderboerderij als geheel een
dependency op Natuur. Het eindresultaat is dus dat je op verschillende
niveaus inzicht kan krijgen in de flow van dependencies. Dit is niet
100% sluitend, de huidige versie van HUSACCT herkent bijv. geen
'lambdas' in Java, en zal dus evt. dependencies die daarin verschuilen
missen. Die zou je dan theoretisch handmatig moeten toevoegen (hier
heeft HUSACCT geen ondersteuning voor overigens). Op dit punt noemen we
al deze 'blokjes' (of het nou classes, packages, of
packages-met-packages zijn) gewoon 'modules'.

De derde stap is dat we gaan redeneren over dat die
dependency-structuren tussen deze modules betekenen. Is een bepaalde
module misschien onderdeel van een laag? Of beschermt het andere modules
als een component? In de meeste gevallen zal het herkennen van deze
opvallende verdelingen uit zo’n UML-package-diagram vooral handwerk
zijn, maar HUSACCT kan bijv. best aardig proberen om lagen te
reconstrueren <span class="citation">([Pruijt & Wiersema,
2016](#pruijt_layers))</span>. Zodoende is een tool als HUSACCT vooral
nog steeds een hulpmiddel om je eigen modellen te vormen, en daar
duidelijke diagrammen van te tekenen. Hier zijn de algemene
eigenschappen die we besproken hebben van lagen en componenten heel
belangrijk.

Als we bijv. tussen een module Presentation 63 dependencies naar
Application, maar slechts 2 dependencies de andere kant op vinden, dan
is het natuurlijk direct interessant om te kijken wat die twee
dependencies de andere kant op voorstellen. Als die er niet geweest
waren zou ons systeem direct eenvoudiger te begrijpen zijn, en zouden we
misschien kunnen spreken van een duidelijke Presentatie-laag bovenop een
Taakspecifieke-laag. Op diezelfde manier is het interessant om te zien
dat als er in een Blackjack module 21 verschillende classes zitten, en
er van buitenaf slechts verwijzingen zijn naar 4 van die classes, of we
met een beetje tweaken (introduceren van een Facade bijv.) er voor
kunnen zorgen dat er een zo strict mogelijke scheiding tussen binnen- en
buitenkant ontstaat (oftewel een component).

Kortom, een helder package-diagram kan ons inzicht geven in de Coupling
& Cohesion binnen onze applicatie, en die kunnen ons weer verder sturen
richting het aanmerken van componenten of lagen.

## Intended Architecture & Hypotheses [_intended_architecture_hypotheses]

Het is handig om even vooruit te lopen op [Compliance](#_compliance).
Naast het analyseren van de Implemented Architecture heeft HUSACCT ook
functionaliteit voor het vastleggen van de Intended Architecture. Deze
was primair bedoeld om preventief te werken, en architecturele drift
tegen te gaan (en dit perspectief zullen we nog uitwerken in dat
hoofdstuk). Daarnaast is het echter ook zeer geschikt voor het
analyseren van bestaande code.

De analyse van de 'Implemented Architecture' in HUSACCT volgt bijv.
altijd de daadwerkelijk gerealiseerde package-structuur zoals deze in de
broncode aanwezig is. Stel je hebt bijv. een Presentatie-laag met een
Controller, die alles doorstuurt naar een Applicatie-laag, en die
applicatielaag encapsuleert alles zeer strict met DTOs, en die DTOs zijn
letterlijk de DTOs die we teruggeven in onze Controller:

<figure>
<img src="default-pattern.svg" alt="default pattern" />
<figcaption>Waar laat je DTOs?</figcaption>
</figure>

Strict genomen hebben we hier geen lagenstructuur, want de
applicatielaag heeft in dit soort situaties zeer veel back-calls naar de
presentatie-laag. Maar met de menselijke kennis wat een DTO is, en wat
de beoogde taakverdelingen tussen deze lagen is kunnen we redelijk
stellen dat 'lagentechnisch gezien' er niet zo heel veel spannends mis
is. Dan kun je bijv. zeggen dat in de verdeling van packages we de DTOs
architectureel behandelen alsof ze in de application-laag zitten (want
zowel application als presentation mogen erbij), maar dat ze conceptueel
vooral in de presentation-laag zitten, omdat de *functie* die ze
vervullen veel belangrijker is in de presentation-laag, dan in de
applicationlaag.

    Persoonlijk zou ik nog steeds het mapje de application-laag in verplaatsen, maar ik zou er prima mee kunnen leven als dit niet gebeurd, zonder me zorgen te maken over de integriteit van m'n lagenmodel.
    -Tom

Er zijn meer oplossingen mogelijk uiteraard (bijv. minder strict
encapsuleren in de applciation laag), maar het belangrijke punt hier is
dat we met onderscheid tussen de Intended Architecture en de Implemented
Architecture een klein beetje soepel kunnen zijn ten opzichte van dit
soort problemen. Het gevolg is dan dat we dit soort
'eigenlijk-niet-echt-een-architectureel-probleem'-gevallen kunnen
verbergen, en ons kunnen concentreren op belangrijkere zaken.

De laatste manier waarop je in de analyse-fase al goed gebruik kunt
maken van een 'Intended Architecture' is als hypothese. Als jij het
vermoeden hebt dat een aantal modules (dus een combinatie van packages
en classes) bijv. samen zeer veel cohesie hebben, en weinig coupling
daarbuiten, dan kun je ze in de intended architecture op één hoop
gooien, en zien of het resultaat inderdaad veel duidelijker oogt dan de
exacte package verdeling. Vroeger zat bijv. de Java GUI logica
versplintert tussen java.swing & java.util.awt, terwijl je ze eigenlijk
altijd samen als één geheel wou beschouwen[^13].

# Compliance [_compliance]

# Bibliography [_bibliography]

<span id="microservices_reconstruction"></span>Cerny, T., Abdelfattah,
A. S., Bushong, V., Maruf, A. A., & Taibi, D. (2022). *Microservice
Architecture Reconstruction and Visualization Techniques: A Review*.
<https://arxiv.org/pdf/2207.02988.pdf>

<span id="documenting_software_architectures"></span>Clements, P.,
Bachmann, F., Bass, L., Garlan, D., Ivers, J., Little, R., Merson, P.,
Nord, R., & Stafford, J. (2010). *Documenting Software Architectures:
Views and Beyond*. Addison-Wesley.
<https://www.safaribooksonline.com/library/view/documenting-software-architectures/9780132488617/>

<span id="leftpad"></span>Collins, K. ( 2016 ). \_ How one programmer
broke the internet by deleting a tiny piece of code \_.
<https://qz.com/646467/how-one-programmer-broke-the-internet-by-deleting-a-tiny-piece-of-code>

<span id="who_needs_an_architect"></span>Fowler, M. ( 2003 ). \_ Who
needs an architect? \_.
<https://martinfowler.com/ieeeSoftware/whoNeedsArchitect.pdf>

<span id="gof_design_patterns"></span>Gamma, E., Helm, R., Johnson, R.,
& Vlissides, J. M. (1994). *Design Patterns: Elements of Reusable
Object-Oriented Software* (1st ed.). Addison-Wesley Professional.
<http://www.amazon.com/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612/ref=ntt_at_ep_dpi_1>

<span id="hophe_elevator"></span>Hohpe, G. (2020). *The Software
Architect Elevator: Redefining the Architect’s Role in the Digital
Enterprise*. O’Reilly Media.
<https://books.google.nl/books?id=X-_bDwAAQBAJ>

<span id="demeter"></span>Holland, I. ( 1987 ). \_ What is Demeter? \_.
<https://www.khoury.northeastern.edu/home/lieber/what-is-demeter.html>

<span id="kruchten_41"></span>Kruchten, P. (1995). The 4+1 View Model of
Architecture. *IEEE Software*, *12*(6), 42–50.
<http://dblp.uni-trier.de/db/journals/software/software12.html#Kruchten95>

<span id="things"></span>Monson-Haefel, R. (Ed.). (2009). *97 Things
Every Software Architect Should Know: Collective Wisdom from Experts*.
O’Reilly.
<https://www.safaribooksonline.com/library/view/97-things-every/9780596800611/>

<span id="pruijt_layers"></span>Pruijt, L., & Wiersema, W. (2016).
Dependency related parameters in the reconstruction of a layered
software architecture. *Proccedings of the 10th European Conference on
Software Architecture Workshops*.
<https://doi.org/10.1145/2993412.3003394>

<span id="richards_ford_fundamentals"></span>Richards, M., & Ford, N.
(2020). *Fundamentals of Software Architecture: An Engineering
Approach*. O’Reilly Media, Incorporated.
<https://books.google.nl/books?id=_pNdwgEACAAJ>

<span id="spolsky_rewrite"></span>Spolsky, J. ( 2000 ). \_ Things you
should never do (Part 1) \_.
<https://www.joelonsoftware.com/2000/04/06/things-you-should-never-do-part-i/>

[^1]: Termen en yargon zijn voornamelijk in het Engels gelaten. Als je
    het niet vertaalt klinkt het raar, als je het wel vertaalt ook. En
    als je het soms-wel/soms-niet vertaalt wordt het niet beter…​

[^2]: Nouja, strict gezien is de definitie van OOP ook een heet
    hangijzer, maar dan moet je wat verder terug in de tijd. Zie bijv.
    [Deze discussie op C2 wiki, een soort oude internet boomhut van
    programmeurs.](https://wiki.c2.com/?NobodyAgreesOnWhatOoIs)

[^3]: Strict genomen hebben we het hier over het later afgesplitste Open
    Unified Proces, maar dat is ondertussen alweer een zachte dood
    gestorven, terwijl het product van het bedrijf Rational nog bestaat

[^4]: De vaagheid van Nitro doet me zo oud voelen…​

[^5]: In jaar 3 gaan we dieper in op [Domain-Driven
    Design](https://martinfowler.com/bliki/DomainDrivenDesign.html), die
    hier juist wel op in gaat, maar dat is dan, en dit is nu.

[^6]: Standaard zou ik zeggen dat je notebook voor 'een nieuw teamlid'
    is. Dat kan een developer, een tester, een project-manager, of
    wat-dan-ook zijn. In aparte gevallen kan het doelpubliek van je
    notebook misschien iets anders zijn, zoals bijv. een geldschieter
    die wil kijken welk team budget krijgt? Dan krijg je een héél ander
    document.

[^7]: Een bioloog zou ons uitlachen, maar dat is nu even niet het punt

[^8]: En Software Architecture wil je helpen handige modellen te maken.
    In plaats van onhandige.

[^9]: Coupling & Connascence zijn nagenoeg synoniemen. Connascence is
    een iets nieuwere term die probeert 'Coupling en meer' te zijn, maar
    het is me niet helemaal duidelijk waarom al dat meer niet ook gewoon
    coupling is…​

[^10]: Blader bijv. eens door de sourcecode van de
    java.util.ArrayList\<\> class. In IntelliJ kun je gewoon
    rechtsklikken op de class en 'Go to Implementation' aanklikken.

[^11]: Achilles en de schildpad. Het is schijnbaar onmogelijk voor
    Achilles om ooit de schildpad in te halen, want hij arriveert elke
    keer waar de schildpad een moment eerder *was*. Dit is één van vele
    van Zenos paradoxen

[^12]: Zie bijv. [OpenTelemetry over
    Tracing](https://opentelemetry.io/docs/concepts/observability-primer/)

[^13]: hier schuiven we een hoop nuance onder het tapijt, maar dit vak
    gaat niet over de geschiedenis van Java…​
