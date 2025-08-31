# Opdracht 3: Domeinmodel

## Stap 1: Realiseer eerste domeinconcepten

Het kan handig zijn om met deze stap te beginnen als je al wat feedback
hebt gehad op je domeinmodel, maar je kan natuurlijk alvast beginnen en
het na de feedback verbeteren.

We gaan de basis van ons domein leggen door alvast wat klassen aan te
maken. De methodes kunnen we nu al toevoegen, maar dit kunnen we ook
later doen. Alvast een tip: probeer nog geen getters of setters te
maken. Setters heb je meestal niet nodig en getters maken we pas aan
wanneer we de data daadwerkelijk uit een object moeten halen. Dit is
eigenlijk alleen het geval wanneer je een soort vertaalslag moet
uitvoeren, bijvoorbeeld tussen lagen of tussen ons systeem en de
buitenwereld.

Laten we eerst weer de IDE induiken en beginnen met packages aan te
maken! Deze packages hebben een betekenisvolle rol in onze architectuur:
we willen separation of concerns, high cohesion en loose coupling.

### Maak packages

In IntelliJ kan je packages aanmaken door met de rechtermuisknop op de
package in het projectoverzicht (links) te klikken waar je iets nieuws
wil toevoegen en dan naar `New > Package` te gaan (je kan ook 'package'
typen of de pijltjestoetsen gebruiken). Als alternatief kan je ook de
parent-package selecteren en dan het generate-scherm openen met
`ALT + INSERT` (MacOS: `COMMAND + N`).

Maak een nieuwe package aan: `nl.hu.bep2.casino.blackjack`. Dit is de
package voor ons component, ons deelgebied, dat over blackjack zal gaan.
We zijn bezig met het modelleren van het domein. Laten we daarvoor een
laag aanmaken. Ook daarvoor maken we een package:
`nl.hu.bep2.casino.blackjack.domain`.

In deze package zouden we nog subpackages kunnen aanmaken, bijvoorbeeld
om zaken te groeperen. Denk bijvoorbeeld aan concepten die herbruikbaar
zijn voor allerlei soorten kaartspellen in plaats van alleen voor
blackjack. Dan zouden we een package kunnen aanmaken:\
`nl.hu.bep2.casino.blackjack.domain.cards`. Dit kunnen we ook doen zodra
we wat verder zijn en bekend is welke concepten er in ons domein leven.

Let op: packagenamen schrijven we in Java altijd met kleine letters,
zonder leestekens!

### Voeg klassen en enums toe

Laten we beginnen met één centrale klasse dat ons aanspreekpunt wordt
voor domeinacties. Die klasse wordt ook het uitgangspunt wanneer we het
gaan opslaan.

Maak deze centrale klasse aan. Selecteer in het projectoverzicht de
package waaraan je een klasse wil toevoegen en klik rechtermuisknop,
`New > Class`. Ook hier kan je hotkeys gebruiken: `ALT + INSERT` (MacOS:
`COMMAND + N`). Laten we het een Engelse naam geven dat spelpotje
betekent (bijvoorbeeld: `Game` of `Table`).

Let op: klasse-, interface, en enum-namen schrijven we in Java altijd
met in Pascal-case (*StudlyCaps*), zonder leestekens!

Wat moet een spelpotje allemaal gaan bijhouden? Probeer dit op te nemen
in de fields. We willen bijvoorbeeld het huidige pakje speelkaarten
bijhouden voor dit spelpotje. Zorg dan dat je klasse er als volgt uit
ziet. Vraag je af: waarom declareren we dit veld als *private*?

``` java
    package nl.hu.bep2.casino.blackjack.domain;

    public class Game {
        private Deck deck;
    }
```

Als het goed is, is `Deck` in IntelliJ roodgekleurd of voorzien van een
waarschuwing. Leer dit soort signalen te herkennen! Om de `Deck` aan te
maken, kan je met je cursor (of caret) op de het type gaan staan
(`Deck`) en de klasse laten genereren door de hotkeys `ALT + ENTER`
(MacOS: `OPTION + ENTER`) te gebruiken (show intention actions).
Selecteer 'create class' en geef de package aan waar je de klasse in wil
aanmaken. Druk op `ENTER`.

### Vul de rest van de objectboom in

Voeg vervolgens op deze zelfde manier alle andere velden (en de
bijbehorende klassen) toe die deze centrale `Game`-klasse nodig heeft.
Voeg ook de velden toe van de velden van deze klasse en herhaal dit
proces totdat je je objectboom klaar hebt.

Je zou `Deck` kunnen voorzien van een verzameling van kaarten en een
kaart weer van een rang en een kleur. Denk na over hoe je rang en kleur
en handigst in Java kunt programmeren op een leesbare en herbruikbare
manier. Er is een manier die ervoor zorgt dat je nooit een kaart kan
maken met een niet-bestaande rang of kleur. Er zijn maar 52
mogelijkheden: 4 kleuren en 13 rangen.

Je mag ook al methodes aanmaken, maar het gaat ons nu vooral om een
eerste structuur. We weten pas hoe de methodes precies werken zodra we
onze use cases implementeren in een applicatie service (zie volgende
opdracht).

Commit je wijzigingen met een duidelijke naam, bijvoorbeeld: \"Structure
initial domain concepts\". Push de wijzigingen naar je remote GitHub
repository.

### Maak constructors aan

Maak voor elke klasse in ons domein een constructor aan. Een constructor
is een speciaal soort (statische) methode die wordt aangeroepen om een
objectinstantie te maken. Daar kunnen we ook instanties aan meegeven om
de velden te vullen.

Ook constructors kan je genereren. Zet je cursor op een veld en klik
rechtermuisknop 'Show Context Actions' of gebruik de hotkey
`ALT + ENTER` (MacOS: `OPTION + ENTER`) terwijl je caret op een veld
staat. Je kan ook willekeurig op een plek in je klasse je caret
neerzetten en iets genereren met `ALT + INSERT` (MacOS: `OPTION + N`).

Nu opent er een scherm om een constructor te genereren op basis van de
velden. Je kan gemakkelijk alle velden selecteren door `SHIFT` ingedrukt
te houden en pijltje naarbeneden te doen totdat je alle velden
geselecteerd hebt. Vervolgens kan je op `ENTER` drukken om je keuze te
bevestigen. Dan krijg je nog wat opties om de constructor aan te passen,
maar meestal hoeft dat niet. Druk nogmaals op `ENTER`.

``` java
    package nl.hu.bep2.casino.blackjack.domain.cards;

    public class Deck {
        private List<Card> cards;

        public Deck(List<Card> cards) {
            this.cards = cards;
        }
    }
```

Je kan ook waarden initialiseren in de velden zelf. Dan hoef je ze niet
mee te geven in de constructor, maar heeft een veld een bepaalde
startwaarde wanneer een object geïnitialiseerd wordt. Denk bijvoorbeeld
aan een lijst van kaarten, zoals in een Deck. Als je met een lege Deck
wil beginnen kan je het volgende doen:

``` java
    package nl.hu.bep2.casino.blackjack.domain.cards;

    public class Deck {
        private List<Card> cards = new ArrayList<>();
    }
```

Wil je een nieuw veld toevoegen aan een bestaande constructor? Declareer
dan eerst het veld en ga vervolgens met je caret op dit (grijze) veld
staan. Doe wederom `ALT + ENTER` (MacOS: `OPTION + ENTER`) en kies 'Add
constructor parameter'.

Commit je wijzigingen met een duidelijke naam, bijvoorbeeld: "Add
constructors to domain concepts". Push de wijzigingen naar je remote
GitHub repository.

### Tip: een named constructor toevoegen aan Deck

Beginnen met een lege Deck en van buitenaf allerlei kaarten toevoegen
(bijvoorbeeld in de constructor of een `add(Card card)` methode) is
misschien niet de meest praktische oplossing.

Waarschijnlijk willen we elke keer als we een nieuwe Deck maken deze
vullen met kaarten. Daarvoor kunnen we een zogenaamde *named
constructor* maken: een static method op `Deck` die een `Deck`
teruggeeft na alle kaarten toegevoegd te hebben. Om een volle deck terug
te geven, zouden we een functie met de volgende vorm kunnen aanmaken:

``` java
public class Deck {
    private List<Card> cards = new ArrayList<>();

    public static Deck full() {
        Deck deck = new Deck();

        // TODO: Creation of all cards and adding them to the deck

        return deck;
    }
}
```

Binnen de `full`-methode kunnen we kaarten toevoegen aan de
deck-instantie door `deck.cards.add(card)` te doen. De `card` moet je
dan wel zelf aanmaken.

Hoe je precies de kaarten moet aanmaken en toevoegen aan de Deck, laten
we nog even aan jou. Afhankelijk van hoe je de kaarten gemodelleerd hebt
in je spel, kan je dit oplossen zonder alle 52 kaarten met de hand te
benoemen!

### Voeg al wat methods toe

Het is goed om alvast wat gedrag toevoegen aan de objecten! Maar wees
niet bang om ze later aan te passen of te verwijderen. Overbodige code
is dode code.

Naast welke objecten precies welke verantwoordelijkheid hebben kunnen we
ook nadenken over het gedrag dat zij aanbieden; het domein is meer dan
slechts met getters en setters data heen en weer te schuiven. Een
algemene tip is om te denken in gedrag in plaats van data. Setters heb
je eigenlijk bijna niet nodig, getters alleen wanneer je ze aanroept.

Probeer het object op zichzelf te beschouwen: welke vragen (queries) zou
je eraan willen stellen? Welke acties (commands) zou je het willen laten
uitvoeren? Waar bestaat het object uit en moet het object met andere
objecten samenwerken? Andere objecten waarmee samengewerkt wordt,
afhankelijkheden, kunnen we het beste in de constructor meegeven of als
parameter van de methode die wordt aangeroepen. Het doel is om te komen
tot een goed georganiseerde objectstructuur met één duidelijk
aanspreekpunt: een game object dat later kan worden opgeslagen. Dit game
object heeft kennis van allerlei onderliggende domeinconcepten die elk
hun eigen specifieke verantwoordelijkheid hebben. Wees niet bang om veel
objecten aan te maken met kleine methodes per specifieke actie! Ook hier
komen de eigenschappen van het objectmodel om de hoek kijken.

Je kan je klassen testen door gebruik te maken van JUnit of het even in
een Main-functie uit te proberen. We gaan het later handmatig testen met
Postman. In een latere cursus gaan we dieper op het correct testen van
object-georiënteerde projecten in.

### Tip: Gebruik je IDE!

Wil je een klasse of package verplaatsen, versleep deze dan in het
projectoverzicht. Alle imports en verwijzingen worden automatisch
geupdate. Wil je hiervoor een hotkey gebruiken, dan is dat `F6` (MacOS:
`F6`) terwijl je het betreffende item hebt geselecteerd in het
projectoverzicht of open hebt staan in de editor. Je kan ook gebruik
maken van het refactor-menu door rechtermuisknop op een klasse of
package te doen.

Wil je een klasse of package hernoemen, dan kan je rechtermuisknop
`Refactor > Rename` doen of de hotkeys `SHIFT + F6` (MacOS: SHIFT + F6).
Dezelfde hotkey kan je gebruiken om velden, variabelen en methoden te
hernoemen.

Gebruik voor dit soort zaken altijd je IDE! Dit bespaart je een hoop
tijd omdat je IDE het op allerlei plekken tegelijkertijd voor je
aanpast. Op het hele project kan slim gebruik van je IDE je uren
besparen!

Er zijn nog meer van dit soort hotkeys. Voor een overzicht, zie:
[Windows
hotkeys](https://www.jetbrains.com/help/idea/reference-keymap-win-default.html)
of [MacOS
hotkeys](https://www.jetbrains.com/help/idea/reference-keymap-mac-default.html).

Heb je geen zin om steeds de handleiding of Google te gebruiken? Dan kan
je altijd de hotkey `CTRL + SHIFT + A` gebruiken om een trefwoord te
typen van wat je wil doen. Vaak geeft IntelliJ een goede suggestie.

Wil je geïnformeerd worden wanneer je iets doet waar je een hotkey voor
had kunnen gebruiken? Dan kan je de IntelliJ-plugin Keypromotor X
installeren, zie [IntelliJ's
uitleg](https://www.jetbrains.com/help/idea/mastering-keyboard-shortcuts.html#learn-shortcuts).
