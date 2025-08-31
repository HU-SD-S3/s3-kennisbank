# Object-georiënteerd programmeren in Java

In voorgaande cursussen is er al meer aandacht besteed aan
object-georiënteerd programmeren in Java, maar het kan nooit kwaad om
hier nogmaals het een en ander te herhalen.

We gaan eerst kort in op Java en de Java Virtual Machine (JVM) om
vervolgens nader in te gaan op allerlei aspecten die je tegenkomt
wanneer je in Java programmeert.

## Java

Java is een veelgebruikte programmeertaal waarmee allerlei verschillende
soorten applicaties kunnen worden gemaakt. De taal is in 1995
uitgebracht en is oorspronkelijk ontworpen door James Gosling bij Sun
Microsystems (later overgenomen door Oracle).

De kracht van Java zit hem in de JVM, een manier om Java (en andere
programmeertalen die JVM-compatible zijn) te kunnen uitvoeren op
verschillende soorten apparaten.

## De Java Virtual Machine (JVM)

De CPU (*Central Processing Unit* of *processor*) in onze computer kan
alleen machinecode lezen die hoort bij de betreffende CPU-architectuur.
Omdat machinecode lastig is te lezen, schrijven en organiseren voor
mensen, zijn er hogere programmeertalen uitgevonden (*high-level
languages*). Dit zijn talen die in meer of mindere mate verder
verwijderd zijn van de concrete hardware en dus op een hoger abstractie
niveau werken. Er zijn talen die relatief dicht op de hardware zitten
(zoals C en C++) en er zijn talen waarbij de gebruiker vrijwel geen
besef hoeft te hebben van de onderliggende hardware (zoals Python en
JavaScript). Talen als Java en C# zitten er een beetje tussenin.

### Compilatie

Er zijn programmeertalen die eerst door de gebruiker moeten worden
omgezet om te kunnen uitgevoerd. Dit noemen we *compilatie*. Een
*compiler* leest broncode van de ene taal en zet het om naar code in de
andere taal. Vaak gaat het hier om omzetting van een hogere taal (zoals
C of C++) naar een lagere taal (zoals een assembly-taal of machinecode).
Zie Figuur [1.1](#fig:compiler){reference-type="ref"
reference="fig:compiler"}. Compilers zijn vaak erg knap geprogrammeerd.
Niet alleen ondersteunen ze veel CPU-architecturen als uitvoer, vaak
worden er tijdens compilatie allerlei optimalisaties aangebracht om de
code sneller te laten draaien. Hierdoor duurt het compileren mogelijk
wat langer, maar de eindgebruiker heeft er later profijt van!

![Compilatie, versimpeld weergegeven.](compilation){#fig:compiler
width=".7\\linewidth"}

Vaak moet de programmeur op de een of andere manier aan de compiler
duidelijk maken welke bestanden allemaal samen moeten worden gevoegd in
het uitvoerbestand. Het kan soms een hele klus zijn om compilers met de
hand in te stellen, hiervoor kunnen *build tools* en *integrated
development environments (IDEs)* uitkomst bieden. Dit soort tools zorgen
ervoor dat programmeurs makkerlijker met de broncode kunnen werken.

### Interpretatie

Een andere aanpak om hogere talen om te zetten naar machinetaal is door
gebruik te maken van een *interpreter*. Dit is een programma dat de
hogere taal inleest en het rechtstreeks omzet naar uitvoering op de CPU.
Zie Figuur [1.2](#fig:interpreter){reference-type="ref"
reference="fig:interpreter"}. Dit heeft als voordeel dat er geen
compilatiestap meer nodig is, maar als nadeel dat er minder tussentijdse
optimalisaties uitgevoerd worden.

![Interpretatie, versimpeld
weergegeven.](interpretation){#fig:interpreter width=".7\\linewidth"}

Python en JavaScript zijn voorbeelden van geïnterpreteerde talen. Web
browsers hebben een ingebouwde JavaScript-interpreter om
gebruikersinteractie te verwezelijken.

### Tussentalen

Hogere programmeertalen zijn wat syntax en grammatica betreft vaak erg
complex. Daarnaast compilers en interpreters veel CPU-architecturen
ondersteunen met elk een eigen soort machinecode als uitvoerformaat. Om
deze complexiteit op te splitsen in beheersbare onderdelen, werken
sommige talen met een soort \"algemene\" tussentaal. Deze algemene,
simpelere tussentaal wordt dan uitgelezen door een soort interpreter die
dit weet uit te voeren voor verschillende CPU-architecturen. Dit soort
talen werken dus met een combinatie van een compiler en een interpreter,
zie Figuur [1.3](#fig:tussentaal){reference-type="ref"
reference="fig:tussentaal"}.

![Tussentaal, versimpeld weergegeven.](tussentaal){#fig:tussentaal
width=".7\\linewidth"}

Java is een voorbeeld van een taal waarvan de broncode (*Java-code*)
eerst wordt omgezet in een tussentaal (*bytecode*), welke vervolgens
wordt uitgevoerd door de *Java Virtual Machine (JVM)*. Nieuwere talen
zoals *Kotlin*, *Clojure* en *Scala* compileren ook naar bytecode en
zijn dus ook uitvoerbaar door de JVM!

Een ander voorbeeld van een taal die met een tussentaal werkt is C#.
Daarin wordt C#-code eerst omgezet naar een *intermediate representation
(IR)* om vervolgens te worden uitgevoerd door de *Common Language
Runtime (CLR)*.

## Typesysteem

Voor een CPU is alle data binair: het bestaat uit enen en nullen. In
werkelijkheid zit er betekenis achter deze bits. De ene keer gaat het om
een heel getal, de andere keer om een kommagetal en weer een andere keer
om een tekst of een lijst van getallen.

In een hogere programmeertaal maken we dit onderscheid middels *data
types*. Het data type bepaalt wat je allemaal met een stuk data kunt
doen en in hoeverre het compatibel is met een ander data type.

### Sterk en statisch getypeerd

Er zijn programmeertalen die heel vergevingsgezind zijn ten aanzien van
de types die de programmeur gebruikt. Sommige talen, zoals Python,
converteren waar mogelijk stilzwijgend data van het ene type naar dat
van een ander type. Dat zie je veel in *zwak getypeerde* talen. Java is
niet zo'n taal, maar is *sterk getypeerd*. Dit houdt in dat de
programmeur zijn datatypes nadrukkelijk moet aangeven en de compiler
klopt of de juiste types worden gebruikt. Hoewel dit erg wennen is als
je nog wat minder bekend bent met de verschillende types, voorkomt dit
een aantal programmeerfouten en kan de compiler gemakkelijker bepaalde
optimalisaties uitvoeren.

In Java wordt *type checking* in de compiler uitgevoerd. Er wordt puur
op basis van de broncode gekeken of de gedeclareerde types en de
beschreven operaties kloppen. Wanneer de types voor de compiler moeten
worden aangegeven in een programmeertaal, noem je deze taal *statisch
getypeerd*. Talen waarin je het typesysteem vooral tijdens runtime
tegenkomt (dus na compileren, bij uitvoering) zijn *dynamisch
getypeerde* talen als JavaScript en Python.

### Value types versus reference types

In Java kennen we *value types* en *reference types*. Value types zijn
types die in het geheugen worden opgeslagen (in de *stack*) op basis van
hun waarde. Zo staat de integer 42 altijd op dezelfde plek in het
geheugen voor een bepaalde methode-aanroep, onafhankelijk van welke
variabele ernaar wijst.

Reference types worden in het geheugen opgeslagen (in de *heap*) op
basis van hun instantie, hun identiteit. Twee objecten worden op
verschillende geheugenadressen opgeslagen, zelfs als hun waarden
hetzelfde zijn!

Anders dan in bijvoorbeeld C++ wordt er in Java geen onderscheid gemaakt
naar *pass-by-value* of *pass-by-reference*. We hoeven dus geen rekening
te houden met pointer-logica. Alle method calls in Java werken volgens
het principe van *pass-by-value*, ook wanneer er een reference type
wordt meegegeven. De reference wordt dan als waarde meegegeven middels
een parameter. Je kan de reference zelf niet aanpassen, slechts de
waarden waarnaar wordt gerefereerd. Je kan bijvoorbeeld een referentie
naar een object meegeven als een parameter van een methode. Dat object
kan je aanpassen via die referentie -- mits de publieke methodes dat
toelaten binnen de methode. Je kan er niet voor zorgen dat er ineens een
ander object op dezelfde plek in het geheugen komt. Dit kan in sommige
andere talen wel, waar het voor enige verwarring kan zorgen onder
developers.

### Primitive types

*Primitive types* zijn basale standaardtypen die door Java worden
geboden. Er zijn 8 verschillende primitive types in Java. Zie
Tabel [1.1](#table:primitive-types){reference-type="ref"
reference="table:primitive-types"}.

::: {#table:primitive-types}
  **Type**    **Betekenis**                                                                                                        **Voorbeeld**
  ----------- -------------------------------------------------------------------------------------------------------------------- --------------------------------------
  *boolean*   een binaire waarheidswaarde van `true` of `false`                                                                    `boolean isGood = true;`
  *byte*      een geheel getal met een grootte van 8 bits (van $-128\, (-2^7)$ t/m $127\, (2^7 - 1)$)                              `// Base 10: 5` `byte bits = 0b101;`
  *short*     een geheel getal met een grootte van 16 bits (van $-32.768\, (-2^{15})$ t/m $32.767\, (2^{15} - 1)$)                 `short smallNumber = 1021;`
  *integer*   een geheel getal met een grootte van 32 bits (van $-2.147.483.648\, (-2^{31})$ t/m $2.147.483.647\, (2^{31} - 1)$)   `int largeNumber = 2312121;`
  *long*      een geheel getal met een grootte van 64 bits (van $-2^{63}$ t/m $2^{63} - 1$)                                        `long largerNumber = 323121211L;`
  *float*     een komma-getal met een grootte van 32 bits (van $-2^{31}$ t/m $2^{31} - 1$)                                         `float pi = 3.14F;`
  *double*    een komma-getal met een grootte van 64 bits (van $-2^{31}$ t/m $2^{31} - 1$)                                         `double pi = 3.1415D;`
  *char*      een tekstteken met een grootte van 16 bits                                                                           `char letterX = ‘X‘;`

  : Java's primitive types
:::

Primitive types zijn value types, ze zijn dus ook immutable. Je kan ze
wel overschrijven, maar niet (gedeeltelijk) aanpassen. In Java kunnen
primitive types aangegeven worden met een kleine letter of een grote
letter. Met een kleine letter (bijvoorbeeld `int`) verwijs je naar een
*unboxed type*. Dit zijn rauwe types zonder methodes; het zijn geen
objecten. Begint het type met een hoofdletter (bijvoorbeeld `Integer`),
d an is het een *boxed type* en gedraagt het zich wel als een object. De
JVM zorgt op veel plekken voor autoboxing. Dat betekent dat het op veel
plekken niet zoveel uitmaakt of je verwijst naar de boxed of de unboxed
variant.

Wil je een methode aanroepen op een object, maar gaat het om de unboxed
variant? Dan kan je het eerst omzetten door de waarde aan de constructor
mee te geven. In de praktijk is het handig om zoveel mogelijk boxed
types te gebruiken.

### Strings

Strings zijn bedoeld om reeksen van teksttekens aan te geven. Een string
is geen primitive type in Java. Je kan er dus alleen naar verwijzen via
`String`, een object van het type String. Omdat ze zoveel voorkomend
zijn hebben ze een bijzonder karakter in Java. Zo kan je met een *string
literal* een String aanmaken: `String text = "Hello world!"`.

Net als primitive types zijn Strings ontworpen met het idee van
immutability. Dat wil zeggen dat, hoewel het reference types zijn, hun
waarde niet deels kunnen worden aangepast. Deze kan slechts in zijn
geheel worden overschreven.

## Objecten en klassen

Java is ontworpen met het idee van object-oriëntatie: objecten zijn de
centrale abstracties waarmee we ons werk doen. Dit leidt tot een aantal
voordelen, maar vereist ook wat denkwerk bij het ontwerpen en realiseren
van objecten. Hierover in een ander hoofdstuk meer.

We duiken in een aantal van Java's belangrijkste object-georiënteerde
mogelijkheden aan de hand van het domein van tweedimensionale
geometrische vormen, zie Figuur [1.4](#fig:shapes){reference-type="ref"
reference="fig:shapes"}.

![Geometrische vormen en hun dimensies.](shapes){#fig:shapes
width=".7\\linewidth"}

Java is een *klasse-gebaseerde* object-georiënteerde programmeertaal.
Dit betekent dat de programmeur nieuwe objecten kan definiëren door
hiervoor nieuwe klassen aan te maken. Een klasse (*class*) is een soort
blauwdruk van een object en bepaalt het type van het object. Zie
bijvoorbeeld de `Rectangle`-klasse die ten grondslag kan liggen aan
verschillende rechthoek-instanties met verschillende configuraties. Zie
Voorbeeld [\[code:rectangle\]](#code:rectangle){reference-type="ref"
reference="code:rectangle"}.

::: listing
``` {.java linenos=""}
public class Rectangle implements Shape2D {
    private Integer height;
    private Integer width;

    public Rectangle(Integer height, Integer width) {
        this.height = height;
        this.width = width;
    }

    public Double calculateArea() {
        return (double) (this.height * this.width);
    }

    public Boolean isLargerThan(Shape2D other) {
        return this.calculateArea() > other.calculateArea();
    }
}
```
:::

In [\[code:rectangle\]](#code:rectangle){reference-type="ref"
reference="code:rectangle"} zien we dat `Rectangle` een klasse is die
een interface implementeert met de naam `Shape2D` (een tweedimensionale
geometrische vorm). De klasse heeft dus het type `Rectangle` en als
supertype `Shape2D`. Dit betekent dat we een object-instantie van het
type `Rectangle` kunnen invullen waar om een `Shape2D` wordt gevraagd.
Dat is een voorbeeld van polymorfisme. Over interfaces en polymorfisme
later meer, maar het is van belang om in te zien dat we verschillende
implementaties kunnen maken van `Shape2D`. Zie
Figuur [1.5](#fig:uml-shapes){reference-type="ref"
reference="fig:uml-shapes"}.

![Een UML klassendiagram van de verschillende shapes, inclusief
realisatie en overerving.](uml-shapes){#fig:uml-shapes
width=".9\\linewidth"}

Objecten brengen toestand (*fields*) en gedrag (*methods*) onder in één
eenheid, waarmee we kunnen praten via publieke methodes. Op die manier
verbergt het object de interne complexiteit en wordt het onmogelijk om
van buiten het object afhankelijk te worden van hoe het object intern te
werk gaat: de implementatiedetails zijn verborgen.

### Fields

De toestand van een object wordt bijgehouden in *fields* (velden, soms
ook: *attributes* of *properties*). In
Voorbeeld [\[code:rectangle\]](#code:rectangle){reference-type="ref"
reference="code:rectangle"} kan je zien dat de fields zijn opgenomen in
regels 2 en 3, namelijk de width (breedte) en height (hoogte), beide van
het type Integer.

Het declareren van fields doen we vaak bovenin de klasse. Meestal
beschrijf je een aantal modifiers (zie hierna), het type van de field en
vervolgens de naam van het field. Het is belangrijk om een leesbare,
menselijke naam te gebruiken die past bij het domein van ons systeem.

We kunnen binnen een objectinstantie toegang krijgen tot een field door
ernaar te verwijzen via `this`, bijvoorbeeld: `this.width`.

### Methods

Met *methods* (methodes) kunnen we gedrag toekennen aan een object. We
declareren een methode door deze in een klasse op te nemen. Een
dergelijke declaratie (een *method signature*) heeft de volgende
onderdelen:

1.  *modifiers*: geven bijzonderheden van de methode aan, zoals
    bijvoorbeeld de zichtbaarheid vanuit andere klassen (zie hierna)

2.  *return-type*: geeft aan wat voor een type er terug wordt gegeven na
    het aanroepen van de methode

3.  *parameter-types en -namen*: als er parameters zijn, geef je deze
    aan met een type en een naam (zie:
    Voorbeeld [\[code:rectangle\]](#code:rectangle){reference-type="ref"
    reference="code:rectangle"}, regels 14-16)

4.  *checked exceptions die gegooid kunnen worden*: als er checked
    exceptions (fouten die afgehandeld moeten worden) gegooid kunnen
    worden die niet in de methode worden afgehandeld, dien je deze te
    specificeren door `throws` met daarachter de te gooien exception
    types

Een voorbeeld is te vinden in
Voorbeeld [\[code:rectangle\]](#code:rectangle){reference-type="ref"
reference="code:rectangle"}, regels 10-12 en regels 14-16. Op deze
manier hebben we de mogelijkheid toegevoegd om van een bestaande
rechthoek de oppervlakte te berekenen en de grootte te vergelijken met
een ander tweedimensionale vorm.

Merk trouwens op dat we de oppervlakte omzetten van een integer naar een
double. Dat doen we met de *type cast* `(double)`. Java past hier
autoboxing toe door de uiteindelijke `double` automatisch om te zetten
naar de in de return type aangegeven `Double`.

Methodes zijn, zoals je ziet, een krachtige manier om betekenis toe te
voegen aan een project: door de namen en typen van klassen en velden te
lezen zien we met welke data we te maken hebben, door de namen,
return-typen en parameter-typen van methodes te lezen zien we wat we
allemaal met een object kunnen doen.

Vaak kunnen we methods onderscheiden in *queries*, die een waarde
teruggeven zonder iets aan te passen of een (externe) actie uit te
voeren, en *commands*, die iets aanpassen of iets anders doen en niet
per se een waarde hoeven terug te geven. Het type `void` is
gelijkwaardig aan `null` (de afwezigheid van een waarde), maar geeft aan
dat er geen intentie is dat de methode iets teruggeeft. Een query kan
per definitie geen void als return type hebben. Er kan wel `null`
terugkomen, wat aangeeft dat er geen waarde 'gevonden' kon worden. In
plaats van null is het overigens het overwegen waard om Optional te
gebruiken.

We roepen een methode aan op een objectinstantie door tussen de
instantie en de methode een punt te zetten en er haakjes achter te
zetten. Moeten we argumenten meegeven voor de parameters, dan vullen we
deze in de haakjes in. Zie
Voorbeeld [\[code:method-call\]](#code:method-call){reference-type="ref"
reference="code:method-call"}, regel 4.

::: listing
``` {.java linenos=""}
Shape2D rectangleA = new Rectangle(10, 20);
Shape2D rectangleB = new Rectangle(20, 30);

if (rectangleB.isLargerThan(rectangleA)) {
    System.out.println("B is larger than A");
}
```
:::

#### Constructor

In Voorbeeld [\[code:rectangle\]](#code:rectangle){reference-type="ref"
reference="code:rectangle"}, regels 5-7, zien we de constructor van onze
rechthoek. Het is een bijzonder soort methode die een objectinstantie
van een klasse maakt. We zien in
Voorbeeld [\[code:method-call\]](#code:method-call){reference-type="ref"
reference="code:method-call"}, regels 1 en 2, hoe we zo'n constructor in
een andere klasse kunnen aanroepen. We kennen de instantie toe aan een
variabele. Deze wijst nu naar een plekje in het geheugen waar de
`Rectangle`-instantie is opgeslagen tijdens de duur van de applicatie.

Merk op dat we bij het declareren van de variabele het supertype hebben
aangegeven. Op deze manier zouden we ook de constructor van een andere
klasse kunnen aanroepen en aan de variabele toekennen, mits deze ook
`Shape2D` implementeert.

Onze IDE kan op basis van de aanwezige fields gemakkelijk een
constructor genereren. In IntelliJ kan je hiervoor op Windows en Linux
de hotkeys `Alt + Insert` gebruiken, op MacOS `Command + N`.

#### Getters en setters

Op dit moment zijn de enige waardes die we uit ons object kunnen krijgen
de oppervlakte (omgezet naar een double) en of het object groter is dan
een ander object (Boolean). De hoogte en breedte van een rechthoek
kunnen we niet uit de objectinstantie opvragen.

Hoewel we hiermee voorzichtig moeten zijn omdat we zo koppeling op de
implementatiedetails van het object mogelijk maken, kunnen we getters
(of: *accessors*) toevoegen om bij verborgen (*private*) fields te
kunnen.

Ook kunnen we de Rectangle van buitenaf niet aanpassen, als we eenmaal
een instantie. Een beetje zoals een *value type*, moeten we een nieuwe
Rectangle maken als we deze willen 'aanpassen'. Dit maakt code over het
algemeen een stuk makkelijker te begrijpen (en en te parallelliseren).
Vinden we dit wat minder belangrijk (en vinden we koppeling op de
interne toestand toelaatbaar), dan kunnen we ervoor kiezen om setters
(ook: *mutators*) toe te voegen. Zie
Voorbeeld [\[code:accessors\]](#code:accessors){reference-type="ref"
reference="code:accessors"}.

::: listing
``` {.java linenos=""}
public class Rectangle implements Shape2D {
    private Integer height;
    private Integer width;

    public Rectangle(Integer height, Integer width) {
        this.height = height;
        this.width = width;
    }

    // Other methods...

    public Integer getHeight() {
        return this.height;
    }

    public Integer getWidth() {
        return this.width;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }
}
```
:::

Ook dit is eenvoudig te genereren door je IDE op basis van de aanwezige
fields. In IntelliJ kan je hiervoor op Windows en Linux de hotkeys
`Alt + Insert` gebruiken, op MacOS `Command + N`.

#### Gelijkwaardigheid: `equals()` en `hashCode()`

Omdat objecten reference types zijn, wordt de `equals`-methode standaard
gebaseerd op het geheugenadres van de instanties. Alleen als deze gelijk
zijn is sprake van hetzelfde object, zie
Voorbeeld [\[code:identity-equality\]](#code:identity-equality){reference-type="ref"
reference="code:identity-equality"}.

::: listing
``` {.java linenos=""}
Shape2D rectangleC = new Rectangle(20, 30);
Shape2D rectangleD = new Rectangle(20, 30);

// Prints: false
System.out.println(rectangleC.equals(rectangleD));

Set<Shape2D> shapes = new HashSet<>();
shapes.add(rectangleC);

// Prints: false
System.out.println(shapes.has(rectangleD));
```
:::

Dit is niet altijd wat we willen. Soms willen we gelijkwaardigheid
vaststellen op basis van waardes, in plaats van identiteit. Daarvoor
kunnen we de `equals`-methode overschrijven.

De `hashCode`-methode is vergelijkbaar, maar ziet op hoe objecten
efficient kunnen worden bewaard in een `HashMap`, `HashSet` of
`HashTable`. Normaliter wordt dat ook op basis van geheugenadres gedaan.
Ook dat is te overschrijven.

::: listing
``` {.java linenos=""}
public class Rectangle implements Shape2D {
    private Integer height;
    private Integer width;

    // Constructor + other methods...

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Rectangle rectangle = (Rectangle) o;
        return Objects.equals(height, rectangle.height) 
            && Objects.equals(width, rectangle.width);
    }

    @Override
    public int hashCode() {
        return Objects.hash(height, width);
    }
}
```
:::

Beide methodes zijn te genereren door onze IDE, zie
Voorbeeld [\[code:hashcode-equals\]](#code:hashcode-equals){reference-type="ref"
reference="code:hashcode-equals"} Je zult zien dat onze IDE zelfs een
aantal randgevallen afdekt in de `equals`-methode! In IntelliJ kan je
hiervoor op Windows en Linux wederom de hotkeys `Alt + Insert`
gebruiken, op MacOS `Command + N`. Na deze toevoegingen printen beide
gevallen uit
Voorbeeld [\[code:identity-equality\]](#code:identity-equality){reference-type="ref"
reference="code:identity-equality"} `true`!

### Inheritance

Inheritance (*overerving*) is een veelgebruikt maar controversieel
mechanisme in Java om aan te geven dat een subklasse (ook: *child*) is
afgeleid van een superklasse (ook: *parent*) en dat deze subklasse
fields en methods overneemt van deze superklasse.

Dit is te zien in
Voorbeeld [\[code:inheritance\]](#code:inheritance){reference-type="ref"
reference="code:inheritance"}. Een vierkant is een specifiek soort
rechthoek, namelijk een rechthoek met gelijke zijden. Daarom roepen we
in de constructor van Square de constructor aan van de superklasse,
Rectangle, middels de `super`-methode en we vullen de size voor zowel de
height als de width in.

::: listing
``` {.java linenos=""}
public class Square extends Rectangle {
    public Square(Integer size) {
        super(size, size);
    }
}
```
:::

Wanneer we een Square-instantie hebben kunnen we daarop dezelfde
niet-private methodes aanroepen als die op Rectangle zijn gedeclareerd.
Dan kan onze Square-klasse zo klein blijven! Merk op dat een Square ook
de Shape2D interface implementeert -- namelijk via diens superklasse.

#### Interface inheritance versus implementation inheritance

Soms beschouwt men het implementeren van een interface als een onderdeel
van inheritance. Wanneer men specifiek die vorm van overerving bedoelt,
spreekt men van *interface inheritance* of *realisatie*.

*Implementation inheritance* is de meer klassieke vorm van overerving.
Implementation inheritance wordt veel gebruikt om bepaalde stukken code
gemakkelijk te delen tussen klassen, maar daarin zit gelijk ook het
gevaar: je koppelt de super- en subklassen aan elkaar. Wanneer een
superklasse meerdere subklassen heeft, ontstaat het gevaar dat
subklassen indirect aan elkaar gekoppeld raken. Veranderingen in een
superklasse ten behoeve van één subklasse komen al gauw terecht in alle
subklassen. Dit kan een risico vormen voor de onderhoudbaarheid. Probeer
implementation inheritance zoveel mogelijk te beperken tot gevallen van
ware inheritance of slechts tot het overerven van een *abstracte* klasse
(zie hierna).

Het is in Java niet mogelijk dat een klasse van meerdere klassen
overerft, terwijl het wel mogelijk is dat een klasse meerdere interfaces
implementeert.

### Modifiers

In de declaratie van fields en methodes kunnen we met behulp van
keywords modifiers toevoegen. Er zijn verschillende modifiers
beschikbaar in Java, wij behandelen de belangrijkste.

#### Access modifiers: `public`, `protected` en `private`

Met access modifiers (of *visibility modifiers*) kunnen we beperken
welke andere klassen allemaal bij een bepaalde field of method kunnen
komen. Een `public` field of method is door elke klasse benaderbaar, een
`private` field of method is enkel door de eigen klasse benaderbaar.
Daarnaast hebben we nog `protected`. Een field of method met die
modifier is alleen niet benaderbaar door de buitenwereld, maar wel
bijvoorbeeld door subklassen, door klassen binnen dezelfde package en de
eigen klasse. Wanneer we geen modifier toevoegen, is er sprake van een
*package-private* field of method: deze zijn alleen zichtbaar voor de
eigen klasse en binnen dezelfde package. Zie
Tabel [1.2](#table:access-modifiers){reference-type="ref"
reference="table:access-modifiers"}.

Klassen zelf kunnen ook als `public` (iedereen kan erbij) of
*package-private* (geen modifier; alleen iedereen binnen package kan
erbij).

::: {#table:access-modifiers}
  **Access modifier**   **Class**   **Package**   **Subclass**   **Outside**
  --------------------- ----------- ------------- -------------- -------------
  `public`              Y           Y             Y              Y
  `protected`           Y           Y             Y              N
  *(no modifier)*       Y           Y             N              N
  `private`             Y           N             N              N

  : Java's access modifiers
:::

Access modifiers zijn een erg krachtig wapen in de strijd tegen
koppeling. Door gebruik te maken van strikte access modifiers kan je
namelijk bepaalde zaken afschermen voor de buitenwereld, zodat er minder
afhankelijkheid kan bestaan op de interne implementatiedetails van een
klasse.

#### De `final`-modifier

Met de `final`-modifier kan je ervoor zorgen dat een field of variabele
binnen een methode niet opnieuw toegekend kan worden.

Wanneer de `final`-modifier wordt gebruik voor een klasse-, field- of
methodedeclaratie betekent dit ook dat deze niet overschreven kan worden
door een subklasse.

Final kan als erg beperkend worden opgevat: velden kunnen niet makkelijk
overschreven worden. Het voordeel daarvan is echter dat het gebruik van
je code voorspelbaarder wordt omdat je er zeker van kan zijn dat iets
niet wordt aangepast. Daarom wordt soms aanbevolen om fields en klassen
standaard final te maken en alleen final weg te halen wanneer je
overschrijfbaarheid en implementation inheritance wil toelaten. Als
uitbreidbaarheid je doel is, is het vaak een goed idee om in plaats van
implementation inheritance eerst naar een compositie-gebaseerde
oplossing te zoeken.

#### De `abstract`-modifier

Met de `abstract`-modifier geef je aan dat de klasse of methode niet op
zichzelf kan bestaan, maar moet worden ingevuld door een subklasse. Vaak
voeg je voor de naam van de abstracte klasse het voorvoegsel `Base` toe.

Met de `abstract`-modifier móet je dus altijd een subklasse hebben om
het als abstract aangemerkte element in te vullen. Je zal dan ook nooit
een `abstract`-modifier combineren met een `final`-modifier voor
dezelfde declaratie.

#### De `static`-modifier

Tot dusver hebben we methods en fields alleen maar gedeclareerd op
*objecten*, instanties. We kunnen ook methodes maken die op de *klasse*
worden aangeroepen. Er zijn namelijk fields die we in het algemeen
willen kunnen bijhouden of methods die we onafhankelijk van enige
instantie willen aanroepen. Daarvoor is de `static`-modifier
uitgevonden.

Een typische reden om een static field te maken is voor het declareren
van een constante. Omdat een constante per definitie niet gewijzigd
hoort te worden, kunnen we de `static`-modifier combineren met de
`final`-modifier. Zo kunnen we een klasse voorzien van een vaste waarde
en het een duidelijke naam geven! Dit ziet er dan bijvoorbeeld uit,
zoals in Voorbeeld [\[code:circle\]](#code:circle){reference-type="ref"
reference="code:circle"}. In de praktijk is het overigens een beter idee
om gebruik te maken van de ingebouwde `Math.PI` constante.

::: listing
``` {.java linenos=""}
public class Circle implements Shape2D {
    private static final float PI = 3.14159265359f;

    private Integer radius;

    public Circle(Integer radius) {
        this.radius = radius;
    }

    public Double calculateArea() {
        return 2 * PI * this.radius;
    }

    public Boolean isLargerThan(Shape2D other) {
        return this.calculateArea() > other.calculateArea();
    }
}
```
:::

Static methods worden veel gebruikt in plaats van dat een klasse
voorzien is van verschillende constructors voor verschillende
creatie-wijzen. In Java kan een methode vaker worden gedeclareerd met
andere parameters, zo kan het gedrag variëren gebaseerd op het type van
het argument dat aan een methode wordt meegegeven. Dit noem je *method
overloading*. Het is echter vaak wenselijk om expliciet aan te geven wat
je wil bereiken met een methode, zodat foutjes kunnen worden voorkomen.
Hiervoor zou je met behulp van static methods een *named constructor*
kunnen maken.

Stel dat we een Circle willen kunnen instantiëren op basis van een
Rectangle, waarbij we de kortste zijde van het rechthoek pakken als
straal (radius). Dan ziet dat eruit als in
Voorbeeld [\[code:named-constructor\]](#code:named-constructor){reference-type="ref"
reference="code:named-constructor"}.

::: listing
``` {.java linenos=""}
public class Circle implements Shape2D {
    private static final float PI = 3.14159265359f;

    private Integer radius;

    public Circle(Integer radius) {
        this.radius = radius;
    }

    public static Circle fromRectangle(Rectangle rectangle) {
        Integer radius = rectangle.determineShortestSide();
        return new Circle(radius);
    }

   // Other methods...
}

// In Rectangle:
public class Rectangle implements Shape2D {
    // All other fields and methods ...
    
    public Integer determineShortestSide() {
        return Math.min(this.width, this.height);
    }
}
```
:::

Merk op dat we in Rectangle de methode `determineShortestSide` hebben
opgenomen, waarin we de ingebouwde static method `Math.min` gebruiken om
het minimum (de kleinste) van twee waarden te bepalen.

Om een Circle aan te maken op basis van een Rectangle, roepen we de
methode `fromRectangle` aan op de *Circle-klasse* (niet een
object-instantie).

::: listing
``` {.java linenos=""}
Shape2D rectangleE = new Rectangle(10, 20);
Shape2D circleA = Circle.fromRectangle(rectangleE);
```
:::

## Enumerations (enums)

Stel dat onze geometrische vormen voorzien kunnen worden van één van de
volgende drie kleuren: *red*, *green*, *blue*. Hoe zouden we deze
beperkte set aan mogelijkheden als field kunnen declareren?

Een eerste gedachte is misschien om met strings te werken de kleur te
bepalen op basis van de waarde van de string. Maar wat doen we wanneer
er sprake is van een string die niet correct is gespeld of als iemand
*yellow* invult? Het aantal mogelijke strings is oneindig. We zouden
natuurlijk bij het invoeren een (runtime) check kunnen uitvoeren of de
invoer klopt met de verwachte red, green of blue.

We zouden ook kunnen werken met drie booleans: isRed, isGreen en isBlue.
Maar wat doen we als we een extra kleur willen ondersteunen in de
toekomst? En hoe zit het als we (per ongeluk) twee booleans true maken?

Het is moge duidelijk zijn: we hebben een oplossing nodig om een
beperkte set aan mogelijkheden te modelleren als een soort keuzemenu van
constantes. De oplossing kan gevonden worden in enums. Een enum is in
Java een speciaal soort klasse. Een enum draagt ook een type. We kunnen
de enum aanmaken als onderdeel van een klasse of, overzichtelijk, in
zijn eigen .java-bestand. Zie
Voorbeeld [\[code:enums\]](#code:enums){reference-type="ref"
reference="code:enums"}.

::: listing
``` {.java linenos=""}
public enum Color {
    RED,
    GREEN,
    BLUE
}
```
:::

Stel nu dat we een Rectangle van een kleur willen voorzien, dan kunnen
we de enum als een field opnemen en de keuzevrijheid bieden bij het
instantiëren van een object (het aanroepen van de constructor), zie
Voorbeeld [\[code:enum-rectangle\]](#code:enum-rectangle){reference-type="ref"
reference="code:enum-rectangle"}.

::: listing
``` {.java linenos=""}
public class Rectangle implements Shape2D {
    private Integer height;
    private Integer width;
    private Color color;

    public Rectangle(Integer height, Integer width, Color color) {
        this.height = height;
        this.width = width;
        this.color = color;
    }
}

// Usage:
public class Main {
    public static void main(String[] args) {
        Shape2D redRectangle = new Rectangle(20, 10, Color.RED);
    }
}
```
:::

Enums gebruik je om het aantal mogelijkheden te beperken. Het grote
voordeel hiervan is dat je een minder strikt hoeft te valideren, zoals
bij een string of een integer. Hier kan je IDE ook handig gebruik van
maken. Deze kan een waarschuwing geven wanneer je in een
switch-statement niet alle takken van een enum hebt afgedekt. Je kan
zelfs alle takken automatisch laten genereren!

Een ander voordeel van enums is dat je kan loopen over de mogelijke
waarden. Dit kan erg handig zijn als je alle permutaties ergens van wil
weergeven.

## Interfaces

Als we terugkijken naar
Figuur [1.5](#fig:uml-shapes){reference-type="ref"
reference="fig:uml-shapes"} en de verschillende codevoorbeelden uit dit
hoofdstuk, zien we dat onze klassen de Shape2D-interface implementeren.
Maar hoe ziet deze interface eruit? Dit zien we in
Voorbeeld [\[code:interface\]](#code:interface){reference-type="ref"
reference="code:interface"}.

::: listing
``` {.java linenos=""}
public interface Shape2D {
    Double calculateArea();
    Boolean isLargerThan(Shape2D other);
}
```
:::

Via een interface kan je vastleggen welk gedrag je verwacht van een
implementatie van de interface. Sommige mensen vergelijken een interface
een contract, maar het kan helpen om het eerder te zien als een soort
wet. Een Shape2D is alleen geldig als het voorziet in het berekenen van
de oppervlakte (en een Double teruggeeft) en als het kan bepalen of het
groter is dan een andere Shape2D (en een Boolean teruggeeft).

Interfaces zijn van groot belang om flexibele software te bouwen, omdat
je ermee afhankelijkheden kunt reguleren. Een interface biedt een soort
garantie: als een klasse afhankelijk is van een Shape2D en deze wordt
ingevuld met een Rectangle, dan kan deze altijd worden vervangen met een
andere Shape2D. Op deze manier kan je dus ook nieuwe shapes ondersteunen
zonder bestaande shapes aan te passen! Laten we bijvoorbeeld een
Triangle maken. Zie
Voorbeeld [\[code:triangle\]](#code:triangle){reference-type="ref"
reference="code:triangle"}.

::: listing
``` {.java linenos=""}
class Triangle implements Shape2D {
    private Integer height;
    private Integer width;

    public Triangle(Integer height, Integer width) {
        this.height = height;
        this.width = width;
    }

    public Double calculateArea() {
        return 0.5 * (this.height * this.width);
    }

    public Boolean isLargerThan(Shape2D other) {
        return this.calculateArea() > other.calculateArea();
    }
}
```
:::

Een Java-klasse kan meerdere interface implementeren.

## Generics

Wat nu als we een soort container type hebben, waarbij we ook het type
willen kunnen variëren van de elementen in die container? Dat is waar
*generics* voor zijn bedoeld: *parameterized types*, hogere abstracties
waarbij het type van de opgenomen elementen later kan worden ingevuld
dankzij een *type argument*. Dit is een feature die sinds JDK 1.5 in
Java is opgenomen.

### Collections

Dit zie je veel bij verzamelingstypen (*collections*), zoals een List,
Set of Map. Zie Figuur [1.6](#fig:java-collections){reference-type="ref"
reference="fig:java-collections"} voor een overzicht van allerlei
klassen en interfaces om verzamelingen te modelleren.

![Allerlei verschillende generic collection interfaces en classes van de
Java Collections API.](java-collections){#fig:java-collections
width=".9\\linewidth"}

Elke soort collectie heeft zijn eigen doel. Om bijvoorbeeld een lijst
van shapes aan te geven, kan je verwijzen naar `List<Shape2D>` (*a list
of shapes*) en deze invullen met een ArrayList\<Shape2D\> implementatie.
Waar lijsten echter vooral zijn bedoeld om elementen aan te bieden op
een bepaalde volgorde, gebruiken we sets vooral om bij te houden of we
iets gezien hebben of niet. Een element kan maar één keer in een set
zitten en een set bevat handige operaties om set logica uit te voeren.
Een set van namen kan bijvoorbeeld weergegeven worden als `Set<Name>`
(*a set of names*). Een map is bedoeld als een doorzoekbaar register
(een dictionary), waarbij een *key* van een bepaald type kan verwijzen
naar een *value* van een bepaald ander type. Stel dat we bijvoorbeeld
willen bijhouden hoe vaak een bepaalde naam voorkomt in een groep, dan
kunnen we een `Map<Name, Integer>` (*a map of names to integers*)
bijhouden.

In dit geval zijn de List, Set en Map allemaal generic interfaces en
worden de type arguments ingevuld door Shape2D, Name en Integer. Maar
hoe definieer je een generic type? Laten we eens kijken naar de een deel
van de Map-interface, zoals deze in Java is gedefinieerd, zie
Voorbeeld [\[code:map-generic\]](#code:map-generic){reference-type="ref"
reference="code:map-generic"}.

::: listing
``` {.java linenos=""}
public interface Map<K, V> {
    V put(K key, V value);
    V get(Object key);
    // Much more methods...
}
```
:::

In
Voorbeeld [\[code:map-generic\]](#code:map-generic){reference-type="ref"
reference="code:map-generic"} zien we dat twee type arguments: K en V.
Deze types kunnen later worden ingevuld voor de elementen die als
respectievelijk *key* en *value* worden opgenomen in de Map. Je kan in
een map dus een object van het ene type laten wijzen naar een object van
het andere type (bijvoorbeeld een String naar een Integer, of een
FullName naar een Address).

### Functional interfaces, streams, lambda expressions

Sinds Java 8 kunnen we functies gebruiken als object. Dit zijn speciale
objecten die een *functional interface* implementeren. Je kan een
functie declareren als variabele, teruggeven uit een methode of
gebruiken als parameter. Dit maakt het makkelijker om bepaald gedrag mee
te geven en te variëren aan een bestaande datastructuur. Dit klinkt
nogal ingewikkeld en het is even wennen, maar je kan er een boel mee!

Een plek waar dit soort functies met name veel gebruikt worden is door
een specifieke operatie uit te voeren op de elementen in een
verzameling, bijvoorbeeld het berekenen van de som van alle getallen in
een lijst het aanpassen van alle waarden in een set of het filteren van
bepaalde element uit een verzameling. Hiervoor kan je sinds Java 8
gebruik maken van de *Streams API*. Op een verzameling in Java kan je
`.stream()` aanroepen en vervolgens een methode die een functional
interface verwacht. Een `Stream<T>` is een generiek type waarbij de
elementen worden aangeboden als een reeks waarden over tijd.

Neem bijvoorbeeld een methode om uit een lijst van namen
(`List<String>`), de namen te verzamelen die beginnen met een bepaalde
letter of reeks letters. Met een for-loop zouden we dat bijvoorbeeld als
volgt doen
(Figuur [\[code:filter-loop\]](#code:filter-loop){reference-type="ref"
reference="code:filter-loop"}):

::: listing
``` {.java linenos=""}
public class FriendsList {
    private List<String> names = 
        List.of("Alex", "Bert", "Arnold", "Anton");

    public List<String> selectNamesByPrefix(String prefix) {
        List<String> selection = new ArrayList<>();

        for (String name : names) {
            String lowerCaseName = name.toLowerCase();
            if (lowerCaseName.startsWith(prefix)) {
                selection.add(name);
            }
        }

        return selection;
    }
}
```
:::

Als we gebruik maken van de Streams API ziet dezelfde method eruit als
in
Figuur [\[code:filter-streams\]](#code:filter-streams){reference-type="ref"
reference="code:filter-streams"}.

::: listing
``` {.java linenos=""}
public class FriendsList {
    private List<String> names = 
        List.of("Alex", "Bert", "Arnold", "Anton");

    public List<String> selectNamesByPrefix(String prefix) {
        return names.stream()
            .map(name -> name.toLowerCase())
            .filter(name -> name.startsWith(prefix))
            .collect(Collectors.toList());
    }
}
```
:::

Met `.stream()` veranderen we de lijst in een stream, zodat we er
stream-operaties op kunnen uitvoeren. Aan de `map` en `filter` methodes
kunnen we een functie meegeven. In het geval van de map-methode is het
een functie die een String transformeert naar een andere String
(`Function<String, String>`). In het geval van de filter-methode is
geven we een predicate mee (`Predicate<String>`). Dit is een functie die
een boolean teruggeeft op basis van een bepaalde invoer, in ons geval
een String. De filter-methode selecteert elementen op basis van de
meegegeven predicate function. Ten slotte moeten we de Stream weer
omzetten naar een lijst, dat doen we met een `Collector`.

De pijlfunctie die we meegeven aan een stream-operatie noem je een
*lambda expressie* of *arrow function*. Dit een verkorte manier om een
functie te declareren. De compiler check wel of het een verwachte en
kloppende implementatie oplevert van een functional interface. Soms kan,
in plaats van een lambda expressie, ook verwijzen naar een methode op
een bepaalde instantie door naar diens naam op de klasse te wijzen. In
het voorbeeld zouden we `name -> name.toLowerCase()` kunnen vervangen
met `String::toLowerCase`.

Er zijn een boel verschillende stream-operaties en hoop verschillende
soorten functional interfaces. Het is ook mogelijk om zelf functional
interfaces te declareren. Dat gaat te ver voor nu.

### Optionals

In Java 8 is het generieke type van de *Optional\<T\>* toegevoegd aan de
taal. De `T` is een *type argument* dat door de developer zelf ingevuld
kan worden. Optionals zijn bedoeld als alternatief voor `null` en het
voorkomen van `NullPointerException`s. Deze foutmelding krijg je
bijvoorbeeld wanneer je een methode of veld op `null` probeert aan te
roepen. Vaak gebeurt dit wanneer je uit een opslag iets probeert op te
vragen dat er niet is. De standaardoplossing hiervoor is om overal waar
je `null` kan verwachten te checken of er sprake is van `null` of niet.
Helaas kan onze compiler niet goed statisch (tijdens compilatie) bepalen
of we voldoende hebben gecheckt of we null terug kunnen krijgen.
Optional probeert daarbij te helpen en voegt daarnaast wat methoden toe
die de code simpeler kunnen maken.

Stel we hebben een methode die `Optional<User>` teruggeeft. Dan krijgen
we een Optional-object terug, waarin een User *kan* zitten. Dat hoeft
niet zo te zijn. Door Optional als type te gebruiken (in plaats van
`null` terug te geven), kunnen compiler en IDE gemakkelijker waarschuwen
als we vergeten om te checken of er wel daadwerkelijk een waarde terug
wordt gegeven.

Het handige aan Optionals zijn de methodes die code een stukje simpeler
kunnen maken. Voor `Optional<User>` kunnen we de methodes aanroepen als
in Tabel [1.3](#table:optional-methods){reference-type="ref"
reference="table:optional-methods"}.

::: {#table:optional-methods}
  **Methode**     **Return type**                                        **Beschrijving**
  --------------- ------------------------------------------------------ -----------------------------------------------------------------------------------------------------------------------------------------
  `isPresent`     `boolean`                                              Geeft terug of er een waarde in de optional zit of niet.
  `ifPresent`     `void`                                                 Voert de meegeven *consumer function* uit als er een waarde inzit, maar doet niets als deze leeg is.
  `orElse`        `User`                                                 Geeft de ingesloten User terug of de aangegeven default User als de optional leeg is.
  `orElseThrow`   `User`                                                 Geeft de ingesloten User terug of gooit een exception als de optional leeg is.
  `get`           `User` (gooit een `NoSuchElementException` als leeg)   Met deze methode kan je de waarde uit de Optional halen. Dit kan je eigenlijk alleen doen als je weet dat de Optional een waarde bevat.

  : Een aantal methods voor `Optional<User>`, in variabele
  `optionalUser`. Dit is generiek toepasbaar op elk soort `Optional<T>`.
:::

Een voorbeeld van het gebruik van `Optional` is te vinden in de
ChipsService die aan de ChipsRepository het aantal Chips voor de
gebruiker opvraagt. Zie
Voorbeeld [\[code:chips-optional\]](#code:chips-optional){reference-type="ref"
reference="code:chips-optional"} Als er geen chips voor de gebruiker
gevonden kunnen worden, wordt standaard een Chips-object teruggegeven
met een waarde van 0. Afhankelijk van hoe strikt je je foutafhandeling
wil inrichten, zou je hier als alternatief een exception kunnen gooien
met `.orThrow`.

::: listing
``` {.java linenos=""}
public Chips findChipsByUsername(String username) {
    return this.chipsRepository
            .findByUsername(username)
            .orElse(new Chips(username, 0L));
}
```
:::

## Annotations

Sinds JDK 1.6 kennen we *annotaties* in Java. Dit is een manier om
metadata toe te voegen aan klassen, methodes, velden en parameters. Met
annotaties kan je data of gedrag toevoegen aan een element door deze
erboven te zetten. Een annotatie ziet eruit als een klassenaam met een
apenstaartje ervoor.

Annotations worden erg veel gebruikt in frameworks. Bijvoorbeeld om een
datamodel te declareren met Hibernate (`@Entity`) of om aan te geven dat
een bepaalde klasse als een injecteerbare service moet worden gezien in
Spring (`@Service`).

Een annotatie kan ook een instructie aan de compiler zijn. Bij het
implementeren van een interface of het overerven van een klasse kan je
in de subklasse boven de overschreven of geïmplementeerde methode de
annotatie `@Override`. De compiler checkt dan of de betreffende methode
wel daadwerkelijk een overschrijving is van een bestaande methode, dus
op de parent(s) aanwezig was. Dit biedt een extra laag bescherming tegen
programmeerfouten.

## Exceptions

*Exceptions* zijn bedoeld om de reguliere programmaflow te doorbreken in
het geval van een fout. Zodra de fout plaatsvindt, stopt de uitvoering
van een bepaalde functie en moet de fout worden afgehandeld. Gebeurt dat
niet in de methode waar de exception gegooid wordt, dan wordt gekeken of
het in de methode gebeurt die die methode aanroept. Is er geen methode
waarin de exception wordt afgehandeld, dan crasht het programma en laat
Java een *stack trace* zien.

### Try, throw en catch

Om aan te geven dat er iets gebeurt dat niet mag of niet verwacht wordt,
kunnen we een exception *gooien* (`throw`). Zie
Voorbeeld [\[code:chips-throw\]](#code:chips-throw){reference-type="ref"
reference="code:chips-throw"}. Bij het opnemen van Chips in ons
casinoproject willen we niet dat iemand een negatief getal kan opnemen
of teveel chips kan opnemen. Daarom gooien we in het Chips-object een
exception als niet aan de voorwaarden wordt voldaan!

::: listing
``` {.java linenos=""}
public void withdraw(Long amountToWithdraw) {
    if (amountToWithdraw < 0) {
        throw new NegativeNumberException(
            "Cannot withdraw a negative amount: " + amountToWithdraw
        );
    }

    long newAmount = this.amount - amountToWithdraw;
    if (newAmount < 0) {
        throw new NotEnoughChipsException(
                String.format(
                        "Cannot withdraw %d chips: %d chips remaining",
                        amountToWithdraw,
                        this.amount
                )
        );
    }

    this.amount = newAmount;
}
```
:::

De betreffende exception kan op hetzelfde of op een hoger niveau worden
*opgevangen* (`catch`) en worden afgehandeld. Het gedeelte waar we een
exception kunnen verwachten, stoppen we in een `try`-blok, wat we
afsluiten met een `catch`-aanduiding.

In het geval van de Chips wordt deze foutmelding niet in het
Chips-object, niet in de ChipsService, maar in de ChipsController
afgehandeld en omzet naar de juiste HTTP-statuscode. Het Spring
framework helpt hierbij: de `ResponseStatusException` wordt automatisch
omgezet naar een HTTP-response met de meegegeven HTTP-statuscode. Status
codes zijn voor clients van belang om te bepalen met wat voor een soort
foutmelding we te maken hebben.

::: listing
``` {.java linenos=""}
@PostMapping("/withdraw")
public Balance withdraw(
    Authentication authentication, 
    @Validated @RequestBody Withdrawal withdrawal
) {
    UserProfile profile = (UserProfile) authentication.getPrincipal();

    try {
        Balance balance = this.service.withdrawChips(
            profile.getUsername(), 
            withdrawal.amount
        );
        return balance;
    } catch (NotEnoughChipsException exception) {
        throw new ResponseStatusException(
            HttpStatus.PAYMENT_REQUIRED, 
            exception.getMessage()
        );
    } catch (NegativeNumberException exception) {
        throw new ResponseStatusException(
            HttpStatus.BAD_REQUEST, 
            exception.getMessage()
        );
    }
}
```
:::

Het kan zijn dat we na het afhandelen van de exception nog wat willen
uitvoeren, bijvoorbeeld wanneer er bepaalde operaties moeten worden
teruggedraaid of een bestand moet worden verwijderd. In dat soort
situaties kunnen we `finally` gebruiken.

### Checked versus unchecked

In Java kennen we twee verschillende soorten exceptions: checked
exceptions en unchecked exceptions. *Checked exceptions* zijn exceptions
waarbij de compiler *checkt* of ze in de methode die ze kunnen
veroorzaken worden afgehandeld. Als dat niet zo is, moet in de method
signature worden opgenomen dat deze een exception kan gooien, door
`throws` op te nemen na de methodelijst. De methode waarin de 'gooiende'
methode wordt aangeroepen speelt het vervolgens weer: afhandelen of
aangeven in de method signature. Aan de ene kant geven checked
exceptions dus wat meer betrouwbaarheid dat fouten daadwerkelijk worden
afgehandeld. Aan de andere kant zorgt dit voor een boel extra code,
terwijl je vaak de foutafhandeling wil verplaatsen naar de randen van je
applicatie als je niet meteen van de fout kan herstellen. In dat soort
situaties gaat het meestal om de omzetting van een onduidelijke
exception naar een voor programmeurs (en gebruikers) leesbare
foutmelding. Zodat helder is wat er precies fout is gegaan en of het aan
de gebruiker of de software ligt.

Bij *unchecked exceptions* voert de compiler niet zo'n controle uit. Dan
is het dus aan de programmeur om goed na te denken hoe met een
dergelijke fout wordt omgegaan. In frameworks, zoals Spring, wordt een
algemene exception handler gebruikt. Als een gebruiker een fout in de
uitvoering veroorzaakt en de programmeur heeft dit niet afgehandeld, dan
wordt dit standaard afgehandeld door Spring. In plaats van dat de hele
applicatie crasht, krijgt alleen het specifieke verzoek van deze
gebruiker een foutmelding terug. In termen van het web zal dit standaard
een `500 Server Error` zijn.

### Custom exceptions

Natuurlijk kent Java een aantal standaardexceptions om verschillende
foutscenario's aan te geven. Het is echter vaak handig om eigen
exceptions te definiëren. Op die manier kan je net wat meer context
meegeven en kan je in de code duidelijk zien om welke foutmelding het
gaat.

In het geval van het opnemen van Chips hebben we twee custom exceptions
gemaakt: `NegativeNumberException` en `NotEnoughChipsException`. Dit
zijn subtypes van RuntimeException, de basisexception voor alle
unchecked exceptions in Java. We hebben slechts één constructor gemaakt,
waarin de message wordt doorgegeven naar de superklasse. Zie
Voorbeeld [\[code:chips-custom-exception\]](#code:chips-custom-exception){reference-type="ref"
reference="code:chips-custom-exception"}. Natuurlijk kan je veel meer
methodes toevoegen. Soms loont het om een named constructor op te nemen
die in detail beschrijft wat er precies is fout gegaan.

::: listing
``` {.java linenos=""}
// NotEnoughChipsException.java
public class NotEnoughChipsException extends RuntimeException {
    public NotEnoughChipsException(String message) {
        super(message);
    }
}

// NegativeNumberException.java
public class NegativeNumberException extends RuntimeException {
    public NegativeNumberException(String message) {
        super(message);
    }
}
```
:::
