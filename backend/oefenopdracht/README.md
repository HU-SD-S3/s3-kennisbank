# Opdrachtbeschrijving {#opdrachtbeschrijving .unnumbered}

De eindopdracht van deze cursus bestaat uit een Java-project met een
mondeling assessment.

HU-land Casino is een aanbieder van online kansspelen. Spelers kunnen
met speelgeld (*chips*) hun favoriete spelletjes spelen. Mogelijk dat
HU-land Casino in de toekomst een betaalde variant op de markt wil
zetten, maar voor nu wil het bedrijf naamsbekendheid verwerven,
advertenties aanbieden en ervaring opdoen.

Voor hun spelletjessite wil HU-land Casino een variant van het bekende
*blackjack* aanbieden. Het deel om in te loggen is overgenomen van een
bestaande component (*security*). Ook is er al enige functionaliteit om
chips toe te voegen wanneer de speler deze niet meer heeft. Omdat nog
onduidelijk is op welke technologieën wordt ingezet en met welke andere
systemen gecommuniceerd zal worden, is het van groot belang dat deze
backend onderhoudbaar en flexibel wordt opgezet. Het bedrijf heeft al
een aantal Java-applicaties draaien met behulp van het Spring Boot
framework. Daarom is gekozen om ook deze applicatie met Java en Spring
Boot op te zetten. HU-land Casino heeft aangegeven waarde te hechten aan
standardisatie. Daarom is gevraagd extra aandacht te besteden aan object
oriëntatie, design principles, design patterns en REST-principes.

Er is gekozen voor een back-end applicatie om centrale controle te
houden op het spel, terwijl met HTTP en REST compatibiliteit wordt
geboden met verschillende front-ends, waaronder desktop, mobile en web
apps.

Aan jou de taak om jouw ontwerp- en programmeervaardigheden in te zetten
om een losgekoppelde, maar geïntegreerde, backend API voor het
blackjackspel aan te bieden!

## Het spel {#het-spel .unnumbered}

Blackjack is het bekendste kaartspel dat in casino's te vinden is. Het
spel wordt gespeeld met 1 of meer decks met 52 standaard speelkaarten.

Elke speelkaart vertegenwoordigt een bepaalde waarde gebaseerd op de
rang (*rank*) die op de kaart staat. De kleur (*suit*) is niet van
belang voor de regels van het spel, maar natuurlijk wel voor het
weergeven van het spel.

De speler probeert de dealer te verslaan door met de score van de
kaarten in de hand dichter bij de 21 te komen dan de dealer, zonder
boven de 21 uit te komen.

In onze variant is er sprake van 1-speler-blackjack. Er kunnen wel
meerdere potjes tegelijk gespeeld worden door verschillende en dezelfde
speler. Spelers mogen niet aan elkaars spel meedoen.

### Het spelverloop {#het-spelverloop .unnumbered}

Laten we het spelverloop van blackjack bestuderen. Let wel voor een
web-applicatie kan het zijn dat sommige stappen anders kunnen verlopen,
bijvoorbeeld ten behoeve van de onderhoudbaarheid of efficiëntie.
Sommige stappen worden immers volledig geautomatiseerd. Om dezelfde
reden kunnen sommige stappen worden samengevoegd. Op die manier beperken
we bijvoorbeeld ook de hoeveelheid netwerkcommunicatie.

Het algemene spelverloop is als volgt:

1.  *Start game*: de speler start het spel door chips in te zetten
    (*bet*)

2.  *Shuffle deck*: de dealer pakt een of meer decks van 52 speelkaarten
    en schudt deze

3.  *Deal cards*: de dealer deelt 1 kaart uit aan de speler, dan 1 aan
    zichzelf, dan 1 aan de speler en dan 1 aan zichzelf.

    -   De speler ziet beide kaarten in diens *hand*.

    -   De speler ziet één kaart van de dealer wel (*up card*) en één
        kaart niet (*hole card*).

4.  *Check blackjack*: als de speler met twee kaarten in de hand een
    score heeft van precies 21 dan eindigt het spel en:

    -   wint de speler $1.5\times$ diens inleg als de dealer niet ook
        een handscore van 21 heeft (*blackjack*)

    -   krijgt de speler diens inleg terug als de dealer ook een
        handscore van 21 heeft (gelijkspel: *push*)

5.  *Select move*: als het spel nog niet geëindigd is, kan de speler een
    move kiezen totdat deze af (handscore \> 21: *bust*) is of het spel
    beëindigt

    -   *Hit*: nog een kaart vragen; hierna volgen dezelfde opties als
        het de speler niet over de 21 is gegaan

    -   *Stand*: met deze hand uitkomen; de dealer blijft hitten zolang
        zijn handwaarde onder de 17 is

    -   *Double down*: de inleg verdubbelen, nog een kaart vragen en
        meteen uitkomen

    -   *Surrender*: opgeven en de helft van de inleg terugvragen

### Kaart- en handscore {#kaart--en-handscore .unnumbered}

Per kaart wordt de score bepaald op basis van de rang (*rank*) van de
kaart:

-   **Getallen (2 - 10)**: de waarde die erop staat

-   **Plaatjes (Jack, Queen, King)**: de waarde 10

-   **Aas (Ace): 1 of 11**

De handscore wordt bepaald door deze scores bij elkaar op te tellen, zie
Tabel [1](#table:handscores){reference-type="ref"
reference="table:handscores"}.

::: {#table:handscores}
  **Kaarten**                                                 **Handscore**
  ----------------------------------------------------------- ---------------
  $\heartsuit 2, \clubsuit 3$                                 5
  $\clubsuit 10, \diamondsuit 5, \heartsuit 3, \spadesuit2$   20
  $\heartsuit 10, \clubsuit K$                                20
  $\spadesuit A, \diamondsuit 4$                              15 (of: 5)
  $\clubsuit A, \diamondsuit K$                               21 (of: 11)
  $\clubsuit A, \heartsuit A$                                 12

  : Voorbeelden van handscores.
:::

Merk op dat de aas ertoe leidt dat de speler kan kiezen om met de hogere
aas-score uit te komen of te hopen op betere kaarten met de lagere
aas-score. Als de hogere aas-score boven de 21 uitkomt, hoeven we alleen
nog maar te kijken naar de lagere aas-score.

### Speltoestanden {#speltoestanden .unnumbered}

Er zijn een aantal toestanden waar het spel zich in kan bevinden:

-   *Waiting*: het spel is aangemaakt, maar nog niet gestart (optioneel)

-   *Playing*: het spel is gestart en moves kunnen worden geselecteerd

-   *Bust*: speler heeft een handscore \>21 en kan niet meer verder
    spelen

-   *Lost*: speler heeft een lagere eindscore dan de dealer

-   *Surrendered*: speler heeft het opgegeven

-   *Push*: speler heeft dezelfde handscore als de dealer of beiden
    hebben een handscore van 21 in de eerste beurt

-   *Blackjack*: speler heeft een handscore van 21 in de eerste beurt en
    de dealer niet

-   *Won*: speler heeft een hogere handscore dan de dealer of de dealer
    heeft \>21

### Uitbetaling {#uitbetaling .unnumbered}

Het uitbetalen van chips is gebaseerd op de eindtoestand (rond af naar
hele chips). Het spel eindigt alleen bij de volgende speltoestanden:

-   *Bust*: speler krijgt niets terug

-   *Lost*: speler krijgt niets terug

-   *Surrendered*: speler krijgt $0.5\times$ zijn inleg terug

-   *Push*: speler krijgt $1\times$ zijn inleg terug

-   *Blackjack*: speler krijgt $1.5\times$ zijn inleg terug

-   *Won*: speler krijgt $2\times$ zijn inleg terug

## Beoordeling {#beoordeling .unnumbered}

Het gaat er bij dit vak om dat je een werkende en structureel goede
back-end kan bouwen. De snelste of kortste oplossing is voor deze cursus
(en in de praktijk) niet altijd de beste oplossing!

### Assessment {#assessment .unnumbered}

We willen ook dat je je project kunt toelichten aan de hand van de voor
de leerdoelen relevante behandelde stof. Dit wordt getoetst aan de hand
van een project met bijbehorend interview.

Het is verstandig om je project kort te presenteren met behulp van
slides. Sta daarbij alvast stil bij de theoretische onderbouwing.

#### Voorbeeldvragen {#voorbeeldvragen .unnumbered}

Vragen die je kunt verwachten zijn gebaseerd op de leerdoelen van de
cursus. Je kan denken aan de volgende soort vragen:

-   Op welke manier heb je *separation of concerns, loose coupling en
    high cohesion* bereikt?

-   Wat houdt *\<object model element, design principle, design
    pattern\>* in?

-   Op welke manier heb je *\<design principle\>* toegepast?

-   Waarom zou je *\<object model element, design principle, design
    pattern, dependency injection\>* gebruiken?

-   Hoe heb je *\<design pattern\>* in dit project uitgevoerd?

-   Welk *\<design pattern\>* zou je op *\<projectonderdeel\>* kunnen
    toepassen?

-   Op welke manier voldoe je aan *\<REST principe\>*?

-   Wat is de verantwoordelijkheid van *\<laag X\>*?

## Rubric {#rubric .unnumbered}

Zie Canvas voor de rubric van het project. Heb je alle punten gehaald,
dan haal je een 10. Mocht je wat minder scoren op bepaalde onderdelen,
dan wil dat niet zeggen dat je een onvoldoende hebt! Hier kan je
natuurlijk rekening mee houden wanneer je met een planning bezig gaat.

# Opdracht 1: Projectopzet en analyse

## Stap 1: Zet het project op

Gebruik voor het project *Java*, versie 11 of hoger.

Verder gebruiken we *Maven*, een tool waarmee je Java-projecten kan
opzetten en gemakkelijk third-party dependencies, zoals frameworks en
libraries, kunt gebruiken in je project. Zie hiervoor de pom.xml. Maven
hoef je niet per se te installeren. We kunnen hiervoor onze Integrated
Development Environment (IDE) gebruiken. Ook is er een wrapper (mvnw)
opgenomen in het project mocht je de commandline willen gebruiken
(aanrader!).

### Clone het project

Clone het GitHub-project via de link die op Canvas wordt aangeboden. We
gebruik hiervoor private repositories binnen GitHub Education. Zorg dat
je een clone krijgt binnen GitHub om je werk in te leveren en op je
machine om te werken. Open de root-directory van het project via
IntelliJ.

### Neem de opdrachtbeschrijving door

Neem de opdrachtbeschrijving en de opdracht op Canvas door. Kan je (voor
jezelf) antwoord geven op de volgende vragen?

1.  Wat moeten we precies maken?

2.  Waarom is er gekozen voor een web-applicatie?

3.  Hoe werkt blackjack ongeveer?

4.  Wat ga je ongeveer leren met deze cursus?

5.  Waar word je op beoordeeld?

6.  Waar krijg je de meeste punten voor?

7.  Wat moet je doen voor een voldoende?

In het verleden is gebleken dat veel studenten erg laat beginnen en
daarmee in de knoop komen met andere cursussen. Probeer dat te voorkomen
door regelmatig je werk in te leveren, zodat je continu feedback kunt
krijgen. Het is dus handig om voor jezelf een planning te maken. De
opdracht is om die reden opgedeeld in 6 stappen die ongeveer gelijk
lopen met de inhoudelijke invulling van de werkcolleges. Maak je je op
enig punt tijdens de cursus zorgen over de planning, geef het aan!

### Extra informatie: de projectstructuur

Studenten hebben aangegeven meer informatie te willen ontvangen over hoe
het systeem is opgezet. Daar is dit onderdeel voor bedoeld. Het is niet
erg als je nog niet alles helemaal begrijpt of dat je niet overtuigd
bent van deze opzet. Het gaat erom dat je in hoofdlijnen doorhebt waar
wat te vinden is. Tijdens deze cursus gaan we er dieper op in.

Laten we eens kijken naar hoe het project is opgezet. Onder
src/main/java zien we onze packagestructuur. Met behulp van packages
kunnen we ons systeem op een logische manier ordenen. Dit is een
belangrijke stap in het bereiken van *separation of concerns, high
cohesion en loose coupling*!

Structurele kwaliteit ziet immers op de onderhoudbaarheid van een
softwareproject. Een softwareproject heeft in algemene zin een goede
structuur als deze is opgedeeld in kleine, opzichzelf staande modules
die intern veel samenhang en met elkaar beperkt koppeling vertonen.

#### Packagestructuur in Java

In Java kunnen we modules groeperen door gebruik te maken van *packages*
(in C# en andere talen met *namespaces*). De naam van een Java-package
lijkt op een soort omgekeerd webadres en komt overeen met de
onderliggende mappenstructuur. Het is gebruikelijk om in Java-packages
eerst te beginnen met de organisatienaam, bijvoorbeeld `nl.hu.bep2`, en
vervolgens de projectnaam `casino`. Dan kunnen we het project opdelen in
componenten, zoals in het casino-project:

-   `nl.hu.bep2.casino.chips`

-   `nl.hu.bep2.casino.blackjack`

-   `nl.hu.bep2.casino.security` (later)

Binnen elk component kan met packages onderscheid gemaakt worden naar
het soort logica volgens een gelaagde aanpak. Dat leidt bij het
casino-project tot de volgende mappen- en packagestructuur onder
`src/main/java`:

Het project is dus eerst opgedeeld in verschillende componenten en
vervolgens in lagen. Voor nu is de splitsing in lagen gebaseerd op een
'application'-laag waarin we expliciet de verschillende usecases een
plekje geven, en een 'domein'-laag waar we een domeinmodel realiseren
(de ingrediënten van de usecases, zeg maar).

### Voorbeeld: Use cases van het chips-component

Het chips-component biedt al een aantal use cases aan binnen ons
systeem. Deze zijn opgesomd in de ChipsService en laten zich gemakkelijk
in een use case diagram vatten, zie:
Figuur [1.2](#fig:chips-use-cases){reference-type="ref"
reference="fig:chips-use-cases"}. Kijk in de code of je dit kunt
herkennen!

![De use cases van het
chips-component](chips-use-cases){#fig:chips-use-cases height="40%"}

Zoals je ziet, willen we onze blackjack-component straks ook gebruik
laten maken van de de chips-component!

## Stap 1: Analyseer de use cases van blackjack

We hebben de opdracht doorgenomen en weten wat de opdrachtgever van ons
verwacht.

We moeten ons voorstellen hoe blackjack precies werkt in de echte
wereld. Daarvan willen we een model maken in diagrammen en code, maar
ook in ons hoofd!

Laten we een use case diagram maken, zodat de acties die door het
systeem aangeboden moeten worden voldoende duidelijk zijn. Hiervoor kan
je het use case diagram van
Figuur [1.2](#fig:chips-use-cases){reference-type="ref"
reference="fig:chips-use-cases"} als inspiratie nemen.

![De use cases van het
chips-component](chips-use-cases){#fig:chips-use-cases height="40%"}

Neem de opdrachtbeschrijving door en denk na over de volgende zaken:

1.  Welke actors zijn er? Geautomatiseerde actors hoef je niet op te
    nemen.

2.  Wat wordt er binnen het component allemaal afgehandeld? Dit zijn
    geen use cases!

3.  Welke use cases moeten er naar buiten toe aangeboden worden om
    blackjack te kunnen spelen?

Gebruik een tool als *diagrams.net*, *software ideas modeler* of *visual
paradigm*, sla het ontwerp op en exporteer het als *.png* of *.jpg*.
Neem dit op in je projectdirectory (bijvoorbeeld onder een mapje
*diagrams*), zodat je docent er naar kan kijken en er feedback op kan
geven.

Commit je wijzigingen met een duidelijke naam, bijvoorbeeld: \"Add use
case diagram for blackjack\". Push de wijzigingen naar je remote GitHub
repository.

## Het objectmodel

Wanneer je werkt met objecten, is het goed om het objectmodel van Booch
in het achterhoofd te houden.[^1]

Het objectmodel van Booch onderscheidt vier belangrijke elementen die
een rol spelen bij het object-georiënteerd modelleren:

1.  Abstraction

2.  Encapsulation

3.  Modularity

4.  Hierarchy

Deze onderdelen noemen Booch et al. belangrijk omdat je zonder deze
elementen geen object-georiënteerde taal (OO-taal) kan hebben. Daarnaast
beschrijven zij drie minder belangrijke elementen die je bij veel
OO-talen tegen kunt komen: typing, persistence en concurrency.

Dit betekent natuurlijk niet dat je deze zaken buiten OO-talen niet
tegen zal komen! Het objectmodel van Booch onderscheid een aantal zaken
die ons helpen goed gestructureerde object-georiënteerde software te
ontwerpen.

Dit komt tijdens de colleges aan bod, maar kunnen we als volgt
samenvatten:

1.  **Abstraction**: klassen en objecten zijn onze kernabstracties
    waarin we toestand (fields) en gedrag (methods) samenbrengen die bij
    elkaar horen. Dit verhoogt *cohesion*. We kunnen met deze
    abstracties communiceren via de publieke methoden. De interne
    werking hoeven we dan niet te weten (*implementation hiding*).

2.  **Encapsulation**: hoe een abstractie zijn toestand bijhoudt en zijn
    gedrag uitvoert wordt afgeschermd van de buitenwereld. Om
    *information hiding* te bereiken wordt gebruik gemaakt van access
    modifiers (bijvoorbeeld: *private*). Dit beperkt *coupling*. Wees
    spaarzaam met getters en setters (*Tell, don't Ask*) en wees niet
    afhankelijk van de onderdelen binnen een klasse *(Law of Demeter*).

3.  **Modularity**: klassen zijn modules waarin we toestand en gedrag
    samenbrengen. Daarnaast kennen we interfaces om bepaald gedrag af te
    dwingen en enums om mogelijke waarden op te sommen. Packages kunnen
    we gebruiken om klassen en andere modules te ordenen.

4.  **Hierarchy**: we kunnen packages onderbrengen in een logische,
    overzichtelijke ordening. Dat is onderdeel van een
    softwarearchitectuur. Ook klassen en objecten kunnen in een
    hiërarchie tot elkaar staan. Er zijn namelijk verschillende
    afhankelijkheden die tussen klassen kan gelden: *dependency*,
    *association*, *aggregation*, *composition*, *inheritance* en
    *realisation*. Wat betreft inheritance en realisation zorgen
    *subtyping*, *polymorphism* en *dynamic binding* ervoor dat we een
    flexibele, uitwisselbare invulling kunnen hebben van bepaalde
    abstracties. Eén abstractie kan namelijk verschillende vormen
    aannemen tijdens runtime: een subtype kan een implementatie of
    overschrijving verzorgen van het supertype.

## Stap 2: Ontwerp een globaal domeinmodel

Zodra je hebt nagedacht over de use cases en hier een model van hebt
gemaakt, kunnen we een overzicht maken van de concepten die we nodig
hebben in ons blackjack-component.

Hiervoor kunnen we een versimpeld domeinmodel maken. Methods,
attributes, rolnamen en multipliciteiten mag je achterwege laten. Wees
niet bang om veel concepten te modelleren!

Loop nogmaals door de opdrachtbeschrijving en verwerk de volgende zaken
in je domeinmodel:

1.  Welke concepten leven er in de wereld van blackjack?

2.  Wat zijn goede kandidaten voor klassen en enums?

3.  Wat zijn de relaties tussen deze concepten? Geef dit aan met de
    juiste pijlen.

4.  Welk concept kunnen we als centraal aanspreekpunt aanmerken waar we
    andere concepten aan kunnen hangen?

Probeer hier niet teveel tijd aan te besteden. Dit is een eerste opzet
om het domein te structureren. Tijdens het programmeren leren we meer
over het domein, de functionaliteit en de structuur en gaan we dit nader
invullen en aanpassen!

Gebruik een tool als *diagrams.net*, *software ideas modeler* of *visual
paradigm*, sla het ontwerp op en exporteer het als *.png* of *.jpg*.
Neem dit op in je projectdirectory (bijvoorbeeld onder een mapje
*diagrams*), zodat je docent er naar kan kijken en er feedback op kan
geven.

Commit je wijzigingen met een duidelijke naam, bijvoorbeeld: \"Design
initial domain model for blackjack\". Push de wijzigingen naar je remote
GitHub repository.

De docent geeft algemene of specifieke feedback op basis waarvan je je
domeinmodel kunt verbeteren. Wat we alvast kunnen weggeven is dat je een
spelpotje als centrale domeinklasse kan nemen.

[^1]: In de praktijk wordt ook wel eens verwezen naar de *4 Pillars of
    Object Orientation*: abstraction, encapsulation, polymorphism en
    inheritance. Deze zijn in het objectmodel van Booch inbegrepen.
