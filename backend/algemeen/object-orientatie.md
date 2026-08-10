# Object-oriëntatie

We hebben het al gehad over object-georiënteerd programmeren in Java,
maar wat zijn precies de ideeën hierachter? Hoe kunnen we objecten
inzetten om separation of concerns, loose coupling en high cohesion te
bereiken?

Hiervoor is het zinvol om stil te staan bij de algemene eigenschappen
van object-oriëntatie. 

We bespreken hier twee theoriën over hoe je je OOP code kan beoordelen op kwaliteit.

* De eerste theorie komt uit het boek Object-Oriented Analysis and Design with Applications van
object- en UML-pionier Grady Booch en anderen ([@Booch2007](/backend/referenties#BoochOO)). Hierin staan een aantal
belangrijke en minder belangrijke elementen die in object-georiënteerde
projecten voorkomen. Deze elementen kan je ook tegenkomen bij andere
stijlen van programmeren, maar wij staan vooral stil bij hoe deze
elementen gebruikt kunnen worden in een object-georiënteerde taal. Hoe
kunnen we deze elementen benutten om tot een sterk ontwerp te komen?

* De tweede theorie is minder specifiek voor OOP, maar is desalniettemin erg populair in deze hoek, en dat is 
Domain-Driven Design van Evans ([@EvansDDD](/backend/referenties#EvansDDD)). In deze theorie staat het domein-model centraal, en willen we proberen zoveel mogelijk van de eigenaardigheden die voortkomen uit het ontwikkelen van Software ontwikkelen daar oplossen. Waar Booch een vrij filosofisch en technisch perspectief biedt, is Evans juist meer Business-gedreven, en zoeken we explicieter de connectie met andere stakeholders.

De twee theorieën vullen elkaar in de meeste gevallen heel mooi aan, en op de punten waar ze elkaar een beetje lijken tegen te spreken zijn ze een mooie reminder dat er altijd meerdere manieren zijn om tegen een probleem aan te kijken.

## Het objectmodel van Booch

Het objectmodel van Booch onderscheidt vier belangrijke elementen die
een rol spelen bij het object-georiënteerd modelleren: [^1]

1.  Abstraction

2.  Encapsulation

3.  Modularity

4.  Hierarchy

Deze onderdelen noemen Booch et al. belangrijk omdat je zonder deze
elementen geen object-georiënteerde taal (OO-taal) kan hebben. Daarnaast
beschrijven zij drie minder belangrijke elementen die je bij veel
OO-talen tegen kunt komen: typing, persistence en concurrency.

Dit betekent natuurlijk niet dat je deze zaken buiten OO-talen niet
tegen zal komen!

### Abstraction

In een object-georiënteerde taal zijn objecten de abstracties waarmee we
werken. Het is niet de bedoeling van een abstractie om de wereld precies
na te bootsen. We willen concepten modelleren voor zover deze van belang
zijn voor het domein van de applicatie en het betreffende
programmaonderdeel. In een object zijn toestand (fields) en gedrag
(methods) samengebracht om een bepaalde rol binnen een systeem te
vervullen.

> An abstraction denotes the essential characteristics of an object that
> distinguish it from all other kinds of objects and thus provide
> crisply defined conceptual boundaries, relative to the perspective of
> the viewer.

[@Booch2007](/backend/referenties#BoochOO), p. 44.

Een manier om te kijken naar abstractie is door het object te beschouwen
van de buitenkant. We zien manieren om met het object te interacteren,
maar we kunnen niet naar binnen kijken of invloed uitoefenen op de
interne structuur of hoe het object precies omgaat met die interactie.
[@Abelson1996](/backend/referenties#Abelson1996) noemen dit een *abstraction barrier* in hoofdstuk 2 van
het invloedrijke boek Structure en Interpretation of Computer Programs.
Als gebruiker van een object kunnen we alleen maar zien tot de \"grens\"
van een abstractie en niet daar voorbij. We kunnen alleen interacteren
met het protocol (de API) van het object: diens publieke method
signatures. In Java en veel andere talen kan je dit protocol afdwingen
met behulp van *interfaces*. De interne implementatie van een object is
dus verborgen. Dit noemt men ook wel *implementation hiding*.

Liskov en Zilles beschreven in hun zoektocht naar programmeren met
abstracties een dergelijke grens:

> When a programmer makes use of an abstract data object, he is
> concerned only with the behavior which that object exhibits but not
> with any details of how that behavior is achieved by means of an
> implementation. The behavior of an object is captured by the set of
> characterizing operations. (\...) Implementation information (\...) is
> only needed when defining how the characterizing operations are to be
> implemented. The user of the object is not required to know or supply
> this information.

[@Liskov1974](/backend/referenties#Liskov1974), p. 51.

Het voordeel van het werken met abstracties is dus dat we ons niet bezig
hoeven te houden met de precieze interne werking van een object, maar
als buitenstaanders ons slechts hoeven te concentreren op de aangebode
publieke methodes.

Bij een digitaal kaart- of bordspel zou je een abstractie kunnen
aanmaken voor het spelpotje zelf, zodat de gehele speltoestand
opgeslagen kan worden. Acties die door de speler(s) op het spel kunnen
worden uitgevoerd kunnen dan opgenomen worden als methodes op het
spelpotje. De verschillende onderdelen en concepten binnen het spel zou
je kunnen opnemen als aparte objecten met hun eigen velden, methodes en
regels. Concepten die in het spel voorkomen kunnen gemodelleerd worden
als objecten die op hun beurt weer van slimme, beschrijvende methodes
kunnen worden voorzien. Denk bijvoorbeeld aan een object waar bepaalde
spelregels in zijn opgenomen, aan alles wat je binnen een spel met een
kaart kan doen of bijvoorbeeld het onderscheid tussen een pakje kaarten
en een hand met kaarten. Elke abstractie heeft zijn eigen toestand en
gedrag. Met een beetje goede naamgeving leest de code dan ook als een
samenvatting van spelacties!

Met abstraction kunnen we cohesion verhogen door zaken bij elkaar te
stoppen die bij elkaar horen en koppeling verminderen door afhankelijk
te zijn van de API van een object in plaats van diens interne
implementatiedetails.

### Encapsulation

Encapsulation and abstraction zijn twee kanten van dezelfde medaille.
Abstraction is een perpectief van buitenaf: wat voor
interactiemogelijkheden biedt een object en hoe gedraagt dit object
zich? *Encapsulation* (of: inkapseling) richt zich meer op de
binnenkant: hoe wordt het interne gedrag afgeschermd van de
buitenwereld? Object-georiënteerde code benut encapsulation op koppeling
te reduceren.

> Encapsulation is the process of compartmentalizing the elements of an
> abstraction that constitute its structure and behavior; encapsulation
> serves to separate the contractual interface of an abstraction and its
> implementation.

[@Booch2007](/backend/referenties#BoochOO), p. 52.

*Information hiding* speelt hierbij een belangrijke rol: we willen niet
hebben dat elk object bij elkaars interne datastructuren kan komen. In
plaats daarvan willen we controle uitoefenen over de afhankelijkheden.
Door informatie te verbergen kan je namelijk het aantal en de
ingrijpendheid van afhankelijkheden tussen klassen verminderen. Hiervoor
gebruiken we in Java de access modifier *private*. Het moderne begrip
van encapsulation is gebaseerd op Parnas-modules, genoemd naar David
Parnas. Hij beschreef afhankelijkheden als *connections* en vond dat
connecties niet teveel informatie mochten prijsgeven.

> The connections between modules are the assumptions which the modules
> make about each other. (\...) We ask, "What changes can be made to one
> module without involving change to other modules?" We may make only
> those changes which do not violate the module being changed. In other
> words, a single module may be changed only while the 'connections'
> still 'fit'. Here, too, we have a strong argument for for making the
> connections contain as little information as possible.

[@Parnas1971](/backend/referenties#Parnas1971), pp. 339-340

Encapsulation, in het bijzonder information hiding, kan dus helpen om
het aantal afhankelijkheden te reduceren en dus koppeling te verlagen.

We hebben als het ware een *capsule* waarbinnen de kern van heb object
ligt besloten en kunnen alleen met die capsule praten via de publieke
methoden. Om die reden willen we voorzichtig zijn met het `public` maken
van fields of het standaard toevoegen van getters en setters. Dit
vergroot de kans dat buitenstaande objecten gekoppeld raken aan de
interne structuur van een object. Door alleen te koppelen tegen de
publieke methodes van een object, is het makkelijker om de interne
toestand van het object te wijzigen.

#### Tell, Don't Ask

Een algemene vuistregel om het gebruik van getters en setters te
verminderen, is *Tell, don't ask*. Hiermee wordt bedoeld dat je liever
tegen een object wil zeggen wat het moet doen, in plaats van dat je alle
informatie eruit trekt er wat mee doet en het vervolgens weer terug in
het object stopt. 


```java
String name = "Alex";
Integer age = 31;
Person person = new Person(name, age);

// Don't make a "dumb" object...
Integer afterBirthday = person.getAge() + 1;
person.setAge(afterBirthday);

// Rather, let the object do the work!
person.celebrateBirthday();
```

In de echte wereld zou je natuurlijk liever de geboortedatum van de persoon opslaan en heb je dit probleem
niet.

Op deze manier reduceer je niet alleen de koppeling, je maakt een object
meer samenhangend omdat de logica die hoort bij wat het betreffende
object vertegenwoordigt onderdeel is van het object. Het hoort bij diens
verantwoordelijkheid. Je kan een boel versimpelen door minder met
getters en setters te werken!

#### Law of Demeter

De *Law of Demeter* of *the principle of least knowledge* is een extra
richtlijn om encapsulation in te richten en koppeling te reduceren
([@Lieberherr1989](/backend/referenties#Lieberherr1989)). In de praktijk wordt dit vaak als volgt samengevat:

-   Objecten mogen slechts kennis hebben van andere objecten als ze nauw
    eraan verwant zijn

-   Objecten mogen alleen praten met vrienden, niet met vreemden

-   Objecten mogen alleen praten met directe vrienden, niet met vrienden
    van vrienden

Probeer objecten dus alleen met elkaar te laten praten als ze
structureel met elkaar samenhangen of als ze een duidelijke dienst
afnemen. Als het gaat om een dienst, praat dan met het object dat de
dienst verleent en ga niet met de objecten praten die dat
dienstverlendende object gebruikt om de dienst te vervullen. In andere
woorden: koppel niet tegen de interne representatie van een object!

Helaas werken veel object-georiënteerde projecten niet volgens dit
principe en is de code met getters in elkaar geknoopt. Zo koppel je
buitenstaande objecten niet alleen op de interne toestand van één
object, maar op de interne toestanden van de objecten die daarin liggen
besloten. 

```java
// A client class, for example: Main.java
Result result;
Integer player1Score = game.getCurrentRound().getPlayer1().getScore();
Integer player2Score = game.getCurrentRound().getPlayer2().getScore();

if (player1Score > player2Score) {
    result = Result.PLAYER_ONE_WON;
} else if (player2Score > player1Score) {
    result = Result.PLAYER_TWO_WON;
} else {
    result = Result.DRAW;
}
```

Dit is wat men ook wel een *train wreck* noemt, omdat de method calls
achterelkaar een soort treintje met wagonnetjes vormen
(`game.getCurrentRound().getPlayer1().getScore()`).

Om dit tegen te gaan, kan je *Tell, don't ask* toepassen om
encapsulation te bereiken en te koppelen tegen de abstractie: vertel de
objecten wat ze moeten doen, in plaats van alle data eruit te trekken.
De externe coupling is dan kleiner, omdat we de interne cohesie
benutten.

```java
// A client class, for example: Main.java
Result result = game.evaluateCurrentRound();

// Inside Game.java:
public Result evaluateCurrentRound() {
    // getCurrentRound is a private method
    Round round = this.getCurrentRound();
    return round.evaluate();
}

// Inside Round.java:
public Result evaluate() {
    if (player1.scoredHigherThan(player2)) {
        return Result.PLAYER_ONE_WON;
    } else if (player2.scoredHigherThan(player1)) {
        return Result.PLAYER_TWO_WON;
    } else {
        return Result.DRAW;
    }
}

// Inside Player.java:
public Boolean scoredHigherThan(Player other) {
    // Note: instances can access private fields of other instances of the same class
    return this.score > other.score;
}
```

In sommige gevallen ontkom je niet aan het gebruik maken van getters.
Dit is vaak het geval bij *serializatie* van objecten naar een ander
formaat. Denk bijvoorbeeld aan het omzetten van een object naar een
JSON-representatie of naar een SQL-query. Omdat dit gewoonlijk aan de
randen van je applicatie gebeurt, wordt hiervoor vaak *data transfer
objects (DTOs)* voor ingezet.

### Modularity

Volgens [@Booch2007](/backend/referenties#BoochOO) zijn object-georiënteerde projecten onderhoudbaar
ingericht dankzij *modularity*.

> Modularity is the property of a system that has been decomposed into a
> set of cohesive and loosely coupled modules.

[@Booch2007](/backend/referenties#BoochOO), p. 56.

Klassen, packages en interfaces zijn de belangrijkste modules binnen een
object-georiënteerd project. Zie hierover uitgebreid het hoofdstuk over
object-georiënteerd programmeren in Java.

In Java brengen we toestand (fields) en gedrag (methods) samen in
klassen en kunnen we klassen groeperen middels packages. Interfaces
kunnen helpen om, dankzij polymorfisme, abstractie en implementatie van
elkaar te scheiden en zodoende programmaonderdelen van elkaar los te
koppelen. Met enums kunnen we het aantal mogelijkheden beperken.
Generics helpen ons om (geparameterizeerde) containertypen te maken
waarvan de interne types kunnen variëren dankzij type arguments. Deze
modules helpen ons een *separation of concerns* te bereiken.

### Hierarchy

Hiërarchie is een ander element van het werken met objecten om een
project onderhoudbaar te houden.

> Hierarchy is a ranking or ordering of abstractions.

[@Booch2007](/backend/referenties#BoochOO), p. 58.

Met de juiste naamgeving en een intelligente package structuur kunnen we
een onderhoudbare *softwarearchitectuur* opzetten, waarin packages een
rol van betekenis vervullen. We brengen daarmee een hiërarchie aan in
ons softwareproject: een bewuste rangschikking van waar welke packages
te vinden zijn.

Binnen het domein kunnen we ook een objecthiërarchie waarnemen: vaak
hebben we één object die verantwoordelijk is voor het uitvoeren van de
domeinacties. Meestal bestaat dit object weer uit allemaal andere
objecten die elk hun eigen velden, methodes en regels bevatten. Op die
manier blijft niet alleen de code overzichtelijk en kan je onderdelen
uitwisselen, de code kan soms lezen als een natuurgetrouwe weergave van
acties --- met hier en daar wat Java-syntax ertussen.

Laten we wat dieper ingaan op deze objecthiërarchie. Objecten en klassen
staan namelijk niet op zichzelf. Ze vertonen allerlei relaties tot
elkaar. In de meest algemene zin kan een object kan een ander object
gebruiken (*afhankelijkheid*). Dit algemene gebruik kan verder worden
gespecifieerd. Een object kan bijvoorbeeld zijn opgebouwd uit andere
objecten (*associatie, aggregatie, compositie*). Ook kan een klasse een
interface implementeren (*realisatie*) of van een andere klasse fields
en methods overerven (*overerving*). Laten we deze dependency types
nader onderzoeken aan de hand van de Unified Modeling Language (UML),
zoals genoemd in [@Booch1999](/backend/referenties#BoochUML).

#### Afhankelijkheid ('gebruikt')

Een *afhankelijkheid* (*dependency*) geeft aan dat de werking van een
bepaalde module op de een of andere manier afhangt van een andere
module. We zeggen ook wel dat de ene module de andere module gebruikt.

> A dependency is a using relationship that states that a change in
> specification of one thing (\...) may affect another thing that uses
> it, but not necessarily the reverse.

[@Booch1999](/backend/referenties#BoochUML), p. 63.

Zie bijvoorbeeld de withdrawChips-methode in de ChipsService van het
chips-component het casinoproject. We halen een Chips-object op uit de
ChipsRepository via `this.findChipsByUsername(username)`). Onze
ChipsService *gebruikt* dus de Chips-klasse!:

```java
public Balance withdrawChips(String username, Long amount) {
    Chips chips = this.findChipsByUsername(username);

    chips.withdraw(amount);
    this.chipsRepository.save(chips);

    return this.showBalanceFor(chips);
}
```

In een UML-klassediagram zouden we dat (versimpeld) weergeven als:

{% plantuml %}
@startuml

ChipsService ..> Chips

note bottom: ChipsService gebruikt de Chips-klasse

@enduml
{% endplantuml %}

Je modelleert een relatie als een algemene afhankelijkheid als je niet
verder kunt of hoeft te specificeren om wat voor een soort
afhankelijkheid het gaat. Het is vaak wel aan te raden om wat dieper te
kijken naar het soort relatie dat de afhankelijkheid vormt.

#### Associatie ('zit vast aan')

Een *associatie* is een algemene manier om te beschrijven dat een
bepaald object structureel verbonden is met een ander object. Dit
betekent dat het ene object, of een referentie daaraan, op de een of
andere manier opgenomen is in het andere object. Dit zie je meestal
terug als een *field declaration* in de klasse. In UML neem je de
association echter niet op in de klasse, maar wordt deze
vertegenwoordigt door een lijn of een pijl. Bij een associatie geef je
de rolnaam en de multipliciteit aan. Een rolnaam komt doorgaans overeen
met de *field name* en de multipliciteit is een bereik van 0 tot 1, 0
tot meer of 1 tot meer. We geven een multipliciteitswaarde van \"tot
meer\" aan als het veld is gedefinieerd als een collectie. Een
multipliciteitswaarde kan 0 zijn als de structurele verbinding optioneel
is. Dit is het geval wanneer het veld conceptueel `null` mag zijn. Naast
deze bereiken kan het voorkomen dat een associatie exact 1 keer is
gevuld.

Een associatie geef je in UML aan met een reguliere pijl om de richting
aan te geven. Werkt de associatie echter beide kanten op, dan zijn de
pijlhoofden weggelaten. Het betreft dan een streep. Let ook hier op de
rolnamen en multipliciteiten. Deze moeten worden opgenomen aan beide
kanten!

> An association is a structural relationship that specifies that
> objects of one thing are connected to objects of another.

[@Booch1999](/backend/referenties#BoochUML), p. 66.

Onderstaand zien we een voorbeeld van een
associatie. Dit voorbeeld betreft de studentenadministratie van een
school. We kunnen zien dat er een Registration-klasse is waarin een veld
is gedeclareerd van het type `PaymentMethod` met de naam `payment`. Er
wordt gebruik gemaakt van een enumeration (enum), omdat er in dit
voorbeeld maar een beperkt aantal betalingswijzen mogelijk zijn, denk
aan een maandelijkse overschrijving, of een jaarlijkse automatische
incasso.


{% plantuml %}
@startuml
class PaymentMethod << enum >>
Registration --> PaymentMethod : -payment

@enduml
{% endplantuml %}

We gebruiken een associatie om een algemene structurele verbinding aan
te geven tussen twee klassen.

#### Aggregatie ('heeft een')

Wil je van een associatie specifiek aangeven dat het om een
deel/geheel-relatie gaat, dan kan je de *aggregatie* gebruiken.

> Sometimes, you will want to model a \"whole/part\" relationship, in
> which one class represents a larger thing (the \"whole\"), which
> consists of smaller things (the \"parts\"). This kind of relationship
> is called aggregation, which represents a \"has-a\" relationship,
> meaning that an object of the whole has objects of the part.

[@Booch1999](/backend/referenties#BoochUML), p. 67.

{% plantuml %}
@startuml

School o-- "0..*" Registration : -registrations

note bottom: Inschrijvingen zijn onderdeel van een school, maar een school kan bestaan zonder inschrijvingen

@enduml
{% endplantuml %}

Een school heeft inschrijvingen.

#### Compositie ('is alleen onderdeel van')

Wil je aangeven van de aggregatie dat het alleen onderdeel mag zijn van
deze klasse en dus niet van andere klassen, dan geef je dat aan met een
*compositie*. Dat houdt ook in dat de levensduur van de objectinstantie
(deel) gekoppeld is aan de levensduur van de objectinstantie (geheel)
waar het onderdeel van is. Over het algemeen zal een UML compositie dus
minder snel vervangbaar zijn opgezet dan een UML aggregatie.

> Composition is a form of aggregation, with strong ownership and
> coincident lifetime as part of the whole. Parts with non-fixed
> multiplicity may be created after the composite itself, but once
> created they live and die with it. Such parts can also be explicitly
> removed before the death of a composite. This means that, in a
> composite aggregation, an object may be part of only one composite at
> a time. (\...) This is in contrast to simple aggregation, in which a
> part may be shared by several wholes. (\...) In addition, in composite
> aggregation (\...) the composite must manage the creation and
> destruction of its parts.

[@Booch1999](/backend/referenties#BoochUML), p. 147.

{% plantuml %}
@startuml

Registration *-- "1" Student : -enrolledStudent

note bottom:  Een inschrijving moet altijd een student betreffen. Een student kan binnen de school niet bestaan zonder inschrijving

@enduml
{% endplantuml %}

Volgens dit model kan een student niet op zichzelf bestaan, maar is altijd onderdeel van een
inschrijving. In dit model zal het studentnummer dus gekoppeld zijn aan
de inschrijving, terwijl in de studentklasse misschien persoonlijke
informatie is opgenomen, zoals geboortedatum, naam, adres en woonplaats.
In de praktijk zal dit op een andere wijze gemodelleerd kunnen worden.

Volgens de definitie in UML is compositie dus een zeer strikte vorm van
aggregatie. Deze definitie wordt in de praktijk echter niet zo strikt
gehanteerd. Dit heeft te maken met het feit dat compositie ook een
begrip is in bijvoorbeeld niet-object-georiënteerde talen, maar ook in
wiskunde en de kunsten. In algemene zin betekent compositie immers
'samenstelling'. Dit komt meer overeen met waar UML de term 'aggregatie'
voor gebruikt.

{% plantuml %}
@startuml

class PaymentMethod << enum >>
Registration --> PaymentMethod : -payment
Registration *-- "1" Student : -enrolledStudent
School o-- "0..*" Registration : -registrations

note bottom: Association, aggregatie en compositie in één model

@enduml
{% endplantuml %}

#### Overerving ('is een soort')

Overerving (*implementation inheritance*) geeft aan dat de subklasse
(*child*) een specifieke soort is van de superklasse (*parent*) en dat
er velden en methodes kunnen worden doorgeven van superklasse naar
subklassen.

> A generalization is a relationship between a general thing (\...) and
> a more specific kind of that thing. (\...) Generalization means that
> objects of the child may be used anywhere the parent may appear, but
> not the reverse.

[@Booch1999](/backend/referenties#BoochUML), p. 65.

Binnen een school kan je denken aan verschillende soorten personeel
`Staff`: personeel in loondienst (`SalariedStaff`) en personeel niet in
loondienst `FreelanceStaff`: 

{% plantuml %}
@startuml

class Staff << abstract >>

class SalariedStaff extends Staff
class FreelanceStaff extends Staff

@enduml
{% endplantuml %}

Van `Staff` kunnen we een abstract class maken om bepaald gedrag te
hergebruiken dat kenmerkend is voor personeel, zonder dat Staff op
zichzelf geïnstantieerd kan worden. In de subklassen kunnen we dan
overschrijven wat specifiek verschilt in die klassen. Hierbij kan je
bijvoorbeeld denken aan hoeveel er voor iemand betaald moet worden in
loondienst versus als freelancer en hoeveel er afgedragen moet worden
aan belastingen en sociale zekerheid.

#### Realisatie ('implementeert')

Realisatie of implementatie (*interface inheritance*) geeft ook aan dat
een subklasse een specifieke soort is van de interface, maar het is niet
de bedoeling om zaken te overerven van het supertype. De insteek van een
interface is om uitwisselbaarheid van implementaties te vergroten zonder
de invulling van parent en child aan elkaar te koppelen.

> A realization is a semantic relationship between classifiers in which
> one classifier specifies a contract that another classifier guarantees
> to carry out.

[@Booch1999](/backend/referenties#BoochUML), p. 149.

Een typisch voorbeeld is de implementatie van een gateway: een
toegangspoortje naar buiten toe, waarbij de onderliggende techniek kan
worden uitgewisseld. Denk bijvoorbeeld aan het opslaan van cursussen in
ons onderwijssysteem. Het feit dat we willen opslaan en uitlezen nemen
we op in de interface. Hóe dat precies gebeurt vinden we in een
implementatie. 

Hier zien we dat we ervoor kunnen kiezen om cursussen op te slaan in het bestandssysteem of in een
database.

{% plantuml %}
@startuml
left to right direction

interface CourseStorage {
    save(course: Course): void
    findByCode(code: String): Course
    findAll(): List<Course>
}

class FileCourseStorage 
class DbCourseStorage 

CourseStorage <|- FileCourseStorage 
CourseStorage <|- DbCourseStorage 

@enduml
{% endplantuml %}

De interface schrijft voor wat een CourseStorage allemaal moet kunnen.
De implementaties moeten daaraan voldoende. Beide klassen zullen de methodes bevatten die worden afgedwongen door de
interface.

#### Subtyping, polymorfisme en dynamic binding

De werkende principes achter overerving en realisatie zijn te vinden in
subtyping, polymorfisme en dynamic binding.

*Subtyping* houdt in dat het mogelijk is om een type-hiërarchie te
hebben. In Java is elk object bijvoorbeeld van het type Object, maar
zitten er specifiekere types onder. We kunnen subtypes definiëren door
een klasse te extenden of een interface te implementeren. In Java kunnen
klassen meerdere interfaces implementeren, maar slechts 1 klasse
tegelijkertijd overerven. Het is wel mogelijk om het subtype verder
steeds te extenden. Bij het verwijzen naar het type van een subklasse
kan je altijd verwijzen naar het supertype (de interface of
superklasse). Andersom is niet mogelijk.

*Polymorfisme* (*polymorphism*) is uit te leggen aan de hand van het
woord zelf. Enerzijds herkennen we het voorvoegsel *poly-* (Grieks voor
*veel*) anderzijds herkennen we het woord *-morfisme* (Morph is grieks
voor *vorm*). Polymorfisme kan men zien als 'veelvormigheid': één
abstractie kan verschillende vormen aannemen. Anders gezegd: één
supertype kan verschillende subtypen hebben. Dit heeft als gevolg dat
een methode, gespecificeerd in het supertype, in het subtype een andere
vorm kan hebben. Het kan immers zijn geïmplementeerd of zijn
overschreven.

*Dynamic binding* is het mechanisme dat het in Java mogelijk maakt een
scheiding te hebben tussen de statische wereld van klassen tijdens
compile time en de dynamische wereld van objecten tijdens runtime. Het
houdt in dat object-instanties van klassen *tijdens runtime* met elkaar
uitgewisseld worden als zij hetzelfde supertype hebben.

> Dynamic binding means that issuing a request doesn't commit you to a
> particular implementation until run-time. Consequently, you can write
> programs that expect an object with a particular interface, knowing
> that any object that has the correct interface will accept the
> request. Moreover, dynamic binding lets you substitute objects that
> have identical interfaces for each other at run-time. This
> substitutability is known as **polymorphism**, and it's a key concept
> in object-oriented systems. It lets a client object make few
> assumptions about other objects beyond supporting a particular
> interface. Polymorphism simplifies the definitions of clients,
> decouples objects from each other, and lets them vary their
> relationships to each other at run-time.

[@Gof1994](/backend/referenties#Gof1994)

Subtyping, polymorfisme en dynamic binding zijn dan de sleutels tot
flexibele object-georiënteerde software: het maakt het gemakkelijk om
een afbakening aan te geven via interfaces of abstracte klassen waarvan
de invulling later kan gebeuren of later vervangen kan worden. De ene
interface-implementatie kan uitgewisseld worden voor de andere, zonder
dat dat de rest van het systeem hoeft te verstoren!

[@Abelson1996](/backend/referenties#Abelson1996), paragraaf 2.4.2, noemen dit ook wel *the principle of
least commitment*: subtyping, polymorfisme en dynamic binding geven ons
de mogelijkheid om te koppelen tegen een (abstracte) interface. Op die
manier hoeven we ons nog niet vast te pinnen op een bepaalde
implementatiekeuze!

## Domain-Driven Design

Naast het Object-Model van Booch is Domain-Driven design van Evans ([@EvansDDD](/backend/referenties#EvansDDD)), 
een andere belangrijke inspiratiebron voor modern OO-design.

Domain-Driven Design claimt dat de primaire drijfveer achter je software-design het domein zelf moet zijn. Primair is dus niet
of je code op een bepaalde manier gestructureerd is, of hoe performant het is, of dat de data allemaal netjes genormaliseerd is, maar puur of de code 'het domein' uitdrukt.

We maken hier onderscheid tussen essentiële complexiteit, en incidentele complexiteit ("accidental complexity", best-effort vertaling). Essentiële complexiteit is complexiteit die altijd onderdeel zal zijn van je project, omdat het voortkomt uit onvermijdbare businessprocessen. Incidentele complexiteit komt daarentegen voort uit nevenzaken, zoals technologie-keuzes. De kernstelling is dat we alle essentiële complexiteit in het domein-model van onze applicatie dienen op te lossen.

Een volledige introductie van DDD gaat voor nu te ver, maar we zullen de basis van wat heet 'tactisch DDD' hier toelichten. Het is belangrijk te realiseren dat dit een ander perspectief op dezelfde soort problemen zijn als het objectmodel van Booch biedt. Het is dus verleidelijk om aan te nemen dat deze zaken naadloos op elkaar aansluiten, maar zo simpel is het niet. Het zijn eenvoudigweg verschillende volledige gedachtegangen over hoe je OOP code kan vormgeven.

Laten we beginnen met het soort probleem bekijken dat Evans wil oplossen met DDD:

``` java
//In een service/applicatie-laag, vlak onder de presentatie/ui-laag
public Boeking updateBoeking(long boekingId, int aantalPersonen, double prijs, long klasse) {
    Optional<Boeking> gevondenBoeking = boekingRepository.findById(boekingId);
    Reisklasse reisKlasse = reisKlasseService.findById(klasse);
    if (gevondenBoeking.isPresent()) {
        Boeking boeking = gevondenBoeking.get();
        boeking.setAantalPersonen(aantalPersonen);
        boeking.setPrijs(prijs);
        boeking.setKlasse(reisKlasse);
        boeking.setStatus(BoekingStatus.active)
        return boekingRepository.save(boeking);
    }
    throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Er is geen boeking gevonden met boeking_id: " + boekingId);
}
```

Als we kijken naar de ```updateBoeking```-methode dan zien we iets geks gebeuren: prijs, klasse en aantalpersonen kunnen los van elkaar ingevoerd worden. Dat is aan de ene kant heel flexibel, maar het is zeer waarschijnlijk dat in het domein van het boeken van kaartjes (in dit geval voor een vliegreis) dat de prijs iets te maken heeft met het aantal tickets en in welke klasse er gevlogen wordt...

Kortom, puur in de ```signatuur``` (naam van de method, welke parameters er gevraagd worden, en wat er gereturned wordt) zie je al gekkigheid. We kunnen in deze methode eigenlijk geen nuttig werk verrichten, behalve domweg data doorschuiven. Aangezien deze methode in de service-laag woont betekent dat dat de echte bedrijfslogica omhoog gedrukt wordt de presentatielaag in, iets dat in elk geval de testbaarheid en herbruikbaarheid niet ten goede zal komen.

``` java
public Klant updateKlant(long id, 
        String voornaam, String achternaam, Integer leeftijd, String nationaliteit,
        String email, String telefoonNr,
        String straat, String huisNr, String toevoeging, String postcode, String stad, String land) throws KlantNotFoundException {
    Klant klant = klantRepository.findById(id).orElseThrow(() -> new KlantNotFoundException("klant met id " + id + " kan niet worden gevonden!"));
    Passagier passagierGegevens = klant.getPassagierGegevens();

    if (voornaam != null) passagierGegevens.setVoornaam(voornaam);
    if (achternaam != null) passagierGegevens.setAchternaam(achternaam);    
    //Etc... etc...
    if (stad != null) passagierGegevens.setStad(stad);
    if (land != null) passagierGegevens.setLand(land);

    return klantRepository.save(klant);
}
```

Als tweede voorbeeld kiezen we deze ```update-klant```-methode. Het eerste dat opvalt is het grote aantal parameters van deze methode (en dat gaan er alleen maar meer worden), en het tweede is dat het bijna allemaal strings zijn. Het fijne aan Strings is dat ze heel flexibel zijn, en het lastige aan Strings is dat ze heel flexibel zijn. Het is makkelijk te vergeten omdat de variabelenamen onze gedachte sturen, maar een String in Java kan zowel leeg ("") zijn, als maximaal 2,147,483,647	karakters lang (ter vergelijking, alle Lord of the Rings boeken, inclusief de Hobbit zijn ong. 5 miljoen karakters), en er kan iets heel redelijks inzitten zoals "Ligusterlaan", of random nonsens zoals "$#I&YFKJDSDH#*$(#)". Kortom, die Strings, die zeggen ons niet zo gek veel. Ze zorgen er in elk geval niet voor dat onze code domein-gedreven voelt.

Belangrijker nog bij een method als updateKlant is dat we graag zouden willen kunnen inschatten of er bugs in zitten. Dat is bij deze method erg lastig! We hebben namelijk geen idee wat de context is waarin deze operatie gebeurd. Zou er misschien een verband zijn tussen de nationaliteit en het land? Geen idee! Kortom, de naam van de methode vertelt ons bizar weinig wat er in deze methode moet gebeurenfootnote:[Op ```applicatie_-niveau. Als deze method in een data-access laag zou voorkomen is het niet zo'n hele gekke methode. Maar we gebruiken zelfs een repository, dus we zijn zeker geen data-access code, want dat zit waarschijnlijk achter die repository-variabele...]...

Tot slot zit er nog iets riskants in de manier waarop zowel updateKlant als updateBoeking als eerste argument een kale ```long``` vragen. Dat betekent dat je als programmeur heel erg moet oppassen dat je niet per ongeluk het verkeerde id doorgeeft. Aangenomen dat de presentatielaag redelijke variabelenamen heeft zal dit risico wel meevallen. 

Maar als we dit idee van kale ids een klein beetje doortrekken kun je best in de problemen komen:

``` java 
//In een class BookingService
public Booking cancelBooking(long flightID, long bookingID, long passengerId) throws MessagingException {
   // Implementatie is niet zo relevant
}

//Deze kan een niveau hoger worden aangeroepen als:

bookingService.cancelBooking(102387, 321314, 89427); //of misschien
bookingService.cancelBooking(102387, 89427, 321314); //of misschien
bookingService.cancelBooking(89427, 321314, 102387); //of nog wat andere mogelijkheden...

```

Toevallig zou een moderne java-IDE zoals IntelliJ je in deze gevallen de parameternamen in de methode laten zien, maar dat is vrij IDE & programmeertaal-specifiek. Het is een oplossing voor een probleem dat er eigenlijk niet zou moeten zijn.

### Ubiquitous Language

[quote, 'https://twitter.com/secretGeek/status/7269997868[Leon Bambrick]']
"There are 2 hard problems in computer science: 
cache invalidation, naming things, and off-by-1 errors."

De eerste stap die DDD neemt om je code te verbeteren is niet eens zo heel technisch, maar wel moeilijk: naming things. Wat nou als we daar iets beter ons best op deden. We hebben het dan over namen van methods, variabelen, classes, packages, etc. etc. 

Een paar simpele gevallen zie je al in de voorbeelden hierboven. Meestal als een methode ```setXYZ``` of ```updateXYZ``` heet, of als een class een ```XYZManager``` is, dan is het totaal niet duidelijk wanneer het uitvoeren van die method wel of niet zou mogen. Het is niet logisch om zomaar de ```setLand``` method aan te roepen, los van ```setStad```, die zaken hebben met elkaar te maken. Je kunt waarschijnlijk niet zomaar ```booking.setStatus(BookingStatus.Active)``` aanroepen, daar zitten regels aan!

Feitelijk is dit niets anders dan het standaard Object-Oriented Programming-principe Encapsulatie. We willen onze objecten beschermen tegen wijzigingen die ze in een ongeldige toestand zouden plaatsen. 

Dus de eerste stap is om wat je toch al aan dingen hebt een goede naam te geven. Laten we voor het gemak aannemen dat al die velden bij ```updateKlant``` op een enkel formulier op een standaard Profile-pagina. Dan is een redelijke naam voor die method ```processProfileForm```.

De tweede stap is om meer dingen te maken die een naam kunnen hebben. In cite:[fowler_refactoring_2018] staan genoeg suggesties, zoals het introduceren van extra variabelen met https://refactoring.com/catalog/extractVariable.html[Extract Variable], het introduceren van korte beschrijvende methods met https://refactoring.com/catalog/extractFunction.html[Extract Method] of hele nieuwe objecten met https://refactoring.com/catalog/extractClass.html[Extract Class]. En dat brengt ons 'toevallig' straks bij Value Objects...

Het basisidee van de Ubiquitous Language is dus ...vergelijkbaar, maar niet exact hetzelfde als het idee van Booch' Abstractions. 

### Entities & Value Objects

#### Entities

Entities zijn objecten met een levensduur. Ze beginnen ergens, maken vanalles mee in hun bestaan, en eindigen tenslotte in een database, om het volgende request weer een nieuw rondje te maken. Wat een leven!

Entities zijn ```dingen``` die over de tijd heen veranderen. Maar we hebben nog wel het gevoel dat het steeds hetzelfde ```ding``` is. Bij Value-Objects hebben we dat niet. Als we een beetje rood bij geel mengen krijgen we een nieuwe kleur (iets oranje'igs). Maar als we een beetje rode verf in een blik met gele verf gieten dan verandert dat blik verf (tenzij het direct overstroomt natuurlijk), het wordt niet een nieuw blik. In dit geval kunnen we niet praten over 'het blik met die-en-die-kleur', want alles aan dat blik kan veranderen (je kan er op staan, en het indeuken bijv.). In het echt is dit geen probleem, we wijzen met onze hand naar een bepaald blik en roepen uit "Dat blik, daar heb ik het over!".

In een database heb je daarvoor een Identifier nodig. Iets dat een bepaald *ding* uniek identificeert, zodat je er in feite naar kan *wijzen*. In onze applicatie hebben we zo'n Identifier ook nodig, want stel we vragen een bepaalde ```Boeking``` in het eerdere ```updateBoeking```-voorbeeld, dan willen we daar misschien een paar requests later nog een update overheen doen. Het is niet redelijk om al die boekingen in het geheugen te houden en hun exacte geheugenadres als Id te gebruiken.

Een entity is dus een object, aangewezen door een id, met een lifecycle, wiens state kan veranderen. Met state bedoelen we alle stukjes data die bij die entity horen; alle attributen in een taal als Java, C# of Python. Die veranderingen gebeuren in een OOP taal via public methods. Het is belangrijk dat die veranderingen altijd netjes gebeuren. Daarmee bedoelen we dat de regels van het object altijd gevolgd moeten worden: met een chique woord zijn objecten ```invariant onder hun methodes_. Die invarianten wijzen dingen aan die altijd waar moeten zijn, zoals "het totaalbedrag van een bestelling moet gelijk zijn aan de optelsom van de delen". Hoewel zowel de bestelde onderdelen, als het totaalbedrag kunnen variëren, staat het feit dat die twee met elkaar kloppen vast, de regel is invariant.

Niet alle combinaties van state zijn geldig voor een object. Laten we als voorbeeld de Java ArrayList nemen. Het handige van een List ten opzichte van een gewone Array is dat je er zomaar objecten aan kan toevoegen. Een Array moet je elke keer met een bepaalde grootte aanmaken. De naam suggereert dat een ArrayList de List interface biedt met een Array op de achtergrond, en als we even onder de motorkap kijken (rechts-click op de ArrayList class en Go-To-Definition, in IntelliJ.)

``` java
//Fields uit de source van ArrayList.java
transient Object[] elementData; 
private int size;
```

Je ziet dat het size veld onafhankelijk wordt bijgehouden van de elementData array. Dat voelt in eerste instantie misschien een beetje stom (waarom niet gewoon elementData.length returnen in getSize()?), maar daar zit een goede reden achter.

De ArrayList class doet veel moeite om zo min mogelijk keren een nieuwe elementData array te maken (dat kost immers performance). Dus als je elementen toevoegt, en er is geen ruimte meer in de array, dan maakt de ArrayList de nieuwe array 'ietsje groter dan nodig', zodat niet per ```add``` call een hele nieuwe array in het geheugen gealloceerd moet worden. Op dezelfde manier laat de ArrayList met plezier wat plekjes in de array leeg als je iets removed, zodat die lege plekjes later hergebruikt kunnen worden. Het size veld moet dus los worden bijgehouden, en het zou echt ```superverwarrend``` worden als het size veld niet exact klopt met hoeveel elementen er in de array zitten.

Een ander voorbeeld zie je in deze ```Order``` class:
``` java

public class Order {
    private Money total = Money.zero(); //Money is in dit geval een value-object die afrondingscomplexiteit met doubles afvangt
    private List<LineItems> items = new ArrayList<>();

    public List<LineItems> getItems(){ return this.items; }
    public Money getTotal(){ return total; }

    public void addItem(Product item){
        items.add(new LineItem(this, item));
        total = total.add(item.getPrice());
    }
}
```

Het probleem hier is dat je items aan de order kan toevoegen (waardoor de prijs omhoog gaat), maar vervolgens buitenom ```order.getItems().clear()``` (bijv.) kan aanroepen. Met als gevolg een order zonder items, maar *met* een prijs.

* OF ```getItems``` moet een Collections.unmodifiableList(this.items) returnen, zodat de collectie niet stiekem aangepast kan wordenfootnote:[Idealiter zouden we een Iterable<> kunnen returnen in Java, maar helaas, die zijn niet zo prettig in het gebruik. Je kunt er bijv. niet makkelijk overheen loopen. Andere talen hebben dit probleem minder, bijv. met de IEnumberable<> uit C#].
* OF ```getTotal``` moet elke keer vers z'n totaal berekenen. Als het kan is dit makkelijker, maar er zijn zat variaties waarin dit niet wenselijk is (omdat er bijv. extra kortingen zijn, of het heel duur is om de hele collectie uit de database te vissen).

Dit is wederom het principe van OOP encapsulatie. En dat is echt essentieel voor OOP als geheel, en DDD in het bijzonder.

Kortom, in een nette codebase gaan entities (en dit is feitelijk gewoon een basisprincipe van OOP) per public method van een nette (consistente) toestand, naar een volgende nette toestand, waarbij aan alle invarianten voldaan is. Dit is heel belangrijk, omdat we bij DDD persistentie graag zo ver mogelijk naar de achtergrond drukken. En dat doen we met Repositories.

##### Id Generation

TODO: Database Ids, Identifiers, URLs en waar genereer je het Id?

##### Lifecycle: Factories

Een Factory is een vrij standaard Design Pattern cite:[gof_design_patterns], zo heb je Abstract Factories, en Factory Methods, maar hier bedoelen we ook gewoon het simpele feit dat objecten graag elkaar maken.

Flauw gezegd is een constructor eigenlijk een heel raar ding. Op een willekeurig moment in je applicatie spreid je je armen, en roep je uit naar de hemel "Laat er een object zijn!". En, vanuit het niets, is er dan ```iets_.

Het is vaak de moeite waard om na te denken of je objecten niet natuurlijker ergens anders vandaan komen. Als we het cliché bestellingsvoorbeeld pakken, met een bidirectionele relatie tussen een Order en diens LineItems:

``` java
Klant zomaarEenKlant = new Klant("Bob");
Order verseOrder = new Order(k);
 //Twaalf stuks van product-id 42, whatever that is
LineItem eersteItem = new LineItem(o, 12, product42);
verseOrder.add(eersteItem);
```

In dit voorbeeld zien we dat alles met het handje aangemaakt wordt. Stel het is een nieuwe klant, dan is dat voor de klant nog enigszins logisch. In een standaard winkel-website komen klanten vaak van buiten het systeem. Die komen vanuit systeem-perspectief dan een beetje uit de lucht vallen. Maar daarna is het twijfelachtiger. De order zouden we kunnen starten met een simpele ```zomaarEenKlant.startOrder();``` method, en het eerste item zouden we kunnen maken als ```verseOrder.add(12, product42);_. 

Het zijn hele kleine tweaks, maar het scheelt toch een paar parameters, en het kan je signaturen stabieler houden. Stel klanten hebben een bepaalde status (bijv. VIP klanten met extra korting), dan moet misschien 
in een volgende versie de VIP-status op het LineItem gezet worden. Als je zelf overal de LineItem constructor aanroept zul je op alle plekken in je code die extra parameter moeten toevoegen. Maar als je de link al gelegd hebt tussen een Klant en diens Order (en daarmee de lineitems), dan kun je dit netjes op één plek aanpakken.

Kortom door goed na te denken over waar je objecten vandaan komen krijg je nieuwe kansen om bepaalde business-rules in het domein te implementeren, en die plek een mooi naampje uit de Ubiquitous Language te geven; of dat nou een zware Factory-class-met-bijbehorend-design-pattern is, of een kleine method die een constructor voor je aanroept. De plek waar je vrij snel aan kan voelen of dit goed loopt is in je unit-tests. Vaak bestaan die uit een Arrange/Act/Assert opzet, en als het Arrange-gedeelte uit de hand loopt, dan is het misschien tijd om serieus werk te maken hoe makkelijker situaties in je applicatie opgezet kunnen worden.


##### Lifecycle: Repositories

Dit is een pattern dat zeer wijdverspreid is. De repository is bedoeld als een hele simpele kijk op persistentie, eentje gebaseerd op een collectie zoals de ingebouwde Collections van Java: 

``` java
public interface Collection<E> extends Iterable<E>{
    //De kern-methoden van de Java Collection interface    
    Iterator<E> iterator();    
    boolean contains(Object o);

    boolean add(E e);
    boolean remove(Object o);
}

public interface Repository<E, Id> {        
    //Een vrij minimale Repository Interface
    List<E> findAll(); //Pas op, gevaarlijk voor performance bij grote collecties
    Optional<E> findById(Id id);
    
    Id add(E e);
    void remove(E e);

    //void flush(); //Technisch detail, verschilt nogal per framework
}
```

De gedachte achter de collectie-abstractie lijkt een beetje op die van een garderobe. Je geeft je Entity (je jas) aan de Collection (de garderobe) en je krijgt een Id (een kaartje) terug om 'm later ooit weer op te halen. (De vergelijking loopt een beetje mank omdat een persistentiestore vaak een kopie van je jas houdt, en je zelden aan een garderobe de opdracht kan geven om je jas te vernietigen (remove), maar in de basis is het vergelijkbaar)

Maar pas op, de Spring JpaRepository heeft bijna 40(!) methods EN een framework om custom-queries op basis van methode-namen te genereren, dus dat is een veeeeel uitgebreidere interface die ... niet echt meer dezelfde ```simpele``` gedachte uitdrukt.

Een ander belangrijk detail is dat de repository nu nergens uitdrukt ```wanneer``` entities worden opgeslagen. Vanuit het begrip van de Repository kun je een Entity uit de repository halen, wijzigingen uitvoeren op die Entity, en in principe mag je er vanuit gaan dat dit allemaal netjes opgeslagen wordt (want je entity zit in de repository, dus er is een persistentie-verplichting). In de praktijk zit er vaak een soort ```flush``` methode bij die er voor zorgt dat die synchronisatie ```nu``` gebeurd (In Spring doen we dit vaak met ```@Transactional```, in plaats van expliciete flushes). 

Al met al is het de bedoeling dat je ooit een Entity aan een Repository toevoegt, dat je je daarna geen zorgen over persistence meer hoeft te maken. Dit idee noemen we ```Persistence Ignorance``` cite:[evans_ddd].


#### Value Objects

Een value-object is een object die een 'hele waarde' representeert. Kijk bijv. nog eens naar het ```updateKlant```-voorbeeld. We sturen daar bijv. alle losse velden van een ```Adres``` door. Netter is dan om één object van de class ```Adres``` door te geven, dan los je ook gelijk het probleem op dat je bijv. per ongeluk alleen het land wijzigt zonder de stad te wijzigen, of dat een opmerking als "Boven de winkels" na een verhuizing in een opmerkingenveld blijft staan. Andere voorbeelden zijn RGB-kleuren, of coördinaten.

Een verbeterde versie van deze signatuur zou er bijv. zo uit zien:

``` java
public Klant processProfileForm(
        long id, 
        Persoonsgegevens persoonsgegevens,
        Contactgegevens contactgegevens,
        Adres adres
    ) throws KlantNotFoundException {
    //Implementatie laat zich raden
}
```

Een bijkomend voordeel van al deze kleine objectjes is dat ze allerhande code kunnen huisvesten (zoals het opmaken van een adres, of naam in een String) die anders erg awkward op de Klant class terecht waren gekomen. (Je zou zeker ook door kunnen gaan en een apart object kunnen aanmaken voor het hele Profile-formulier. Dan wordt de signatuur eenvoudigweg ```public Klant processProfileForm(ProfileForm form)```, alleen zou dat de volgende voorbeelden wat onleesbaarder maken)

Een goed voorbeeld van zo'n standaard Value-Object dat je waarschijnlijk al tientallen keren gebruikt hebt is de DateTime class van je programmeertaal naar keuze (LocalDateTime in Java). Dat is een object dat als waarde een bepaald moment in de tijd voorstelt, en is op die manier een samenraapsel van dag/maand/jaar/tijd, en kan op allerlei verschillende manieren benaderd worden.

Als je twee van die DateTime objecten hebt, die toevallig hetzelfde moment in tijd aanwijzen, dan interesseert het je helemaal niets welke instantie je hebt, ze zijn volledig uitwisselbaar. De waarde telt.

Een tweede doel waar Value Objects zich goed voor lenen is om duidelijk aan te geven waar een object voor bedoeld is. Bijv. dat die ```long``` puur een KlantId is, en niet gebruikt kan worden om een Vlucht of een Boeking op te halen.

``` java
public Klant processProfileForm(
        KlantId id, 
        Persoonsgegevens persoonsgegevens,
        Contactgegevens contactgegevens,
        Adres adres
    ) throws KlantNotFoundException {
    //Implementatie laat zich raden
}

//en elders in de codebase

public class KlantId {
    private final long value;

    public KlantId(long value){
        this.value = value;
    }

    public long getValue(){
        return this.value;
    }
}
```

Je zou nu in je KlantRepository-interface om exact deze Id-class kunnen vragen, en als je dan ooit per ongeluk het verkeerde Id zou gebruiken krijg je een nette compile error. De auto-gegenereerde Spring JPA-Repository interfaces werken helaas niet zo heel fraai met deze truc.

Types (zoals Classes en Interfaces) gebruiken om compiler-errors te genereren voor 'stomme fouten' is de basis van zogeheten Type-Driven Development.

Ten derde kun je Value Objects goed gebruiken om er voor te zorgen dat iets eens en voor altijd een geldige waarde heeft. Stel je moet (zoals in het ```updateKlant```-voorbeeld) een emailadres verwerken: er zijn meer mogelijke Strings dan dat er email-adres strings zijn. Als je emailadressen overal Strings zijn, zul je op verschillende plekken moeten gaan checken of die String eigenlijk wel een emailadres is. Bijv. bij binnenkomst van een POST (in de presentatielaag, als onderdeel van input-validatie), maar ook in de setter van een Klant (want je weet niet ```zeker``` hoe je door de presentatielaag bent gekomen), en ook weer op elke plek waar je het als emailadres in de applicatie gebruikt. Bijv. in een view met een mailto: linkje, of als je geautomatiseerd een zeer-informatieve-absoluut-geen-spam-mail naar iemand wil versturen. Op die manier valideer je je een ongeluk.

Makkelijk is dan om zo gauw je weet dat het een String een emailadres zou moeten zijn om het in een Value-Object te vatten die aangeeft ```dat``` het een emailadres is, en ```dat``` je het ```echt``` gechecked hebt:

``` java
public class EmailAddress {
    private String emailaddress;

    public EmailAddress(String rawValue){
        if(!Pattern.matches("[\\w.]+@\\w+\\.\\w+", rawValue)){ //Emailadressen zijn notoir tricky, maar dit geeft het idee
            throw new IllegalArgumentException("rawValue");
        }
        this.emailaddress = rawValue;
    }

    //getter, en misschien extra getters voor 'het stukje voor/achter de @' 
}

```

Door zo'n Email-value-object te gebruiken weet je op alle plekken waar je een EmailAddress instantie binnenkrijgt dat je gewoon veilig dit object kan gebruiken om een link te genereren, of een mail te versturen. Het was immers niet mogelijk om een instance te maken zonder langs je check in de constructor te komen!footnote:[Uiteraard zijn er altijd workarounds, bijv. in de reflectie-hoek, maar dan moet er ergens een developer-collega wel echt z'n best doen om je het leven zuur te maken. Laten we daar niet vanuit gaan.]

Deze strategie staat ook wel bekend onder de slogan ["Parse, don't Validate!"](https://lexi-lambda.github.io/blog/2019/11/05/parse-don-t-validate/).

##### Immutability & Equals

Een goed value-object is immutable, dat betekent dat het niet gewijzigd kan worden nadat het aangemaakt is. Praktisch betekent dit dus geen setters of andere methods die interne velden wijzigen nadat het object aangemaakt is.

Een tweede essentiele eigenschap van een Value Object is dat het gaat om de waardes (what's in name...). Dat betekent dat het belangrijk is om de equals (en dus ook de hashcode) methode te overschrijven. Dat is zo'n standaard-klusje dat elke programmeertaal daar z'n eigen ritueel/standaard-implementatie voor heeft. In Java kun je dat gelukkig aan IntelliJ overlaten (of de Objects.equals / Objects.hash helper methods gebruiken).

Dit soort objecten (immutable, en puur op waarde vergelijkbaar) zijn veel simpeler te testen dan 'gewone' mutable objecten. Omdat ze niet kunnen wijzigen zijn er minder randgevallen, en is er minder testcode nodig om een goede coverage te behalen. Kortom, als je kan, is het raadzaam zoveel mogelijk van je domeinlogica op deze objecten te implementeren, dat scheelt je testcode.

Het klassieke voorbeeld gaat over blikken verf (mutable) die gemengd moeten worden. Daarbij is de menglogica op kleine Color Value-Objects geïmplementeerd in plaats van op de verfblik-entities, wat een stuk rustiger code-design oplevert. Bij ons vliegtuig-voorbeeld zou je bijv. bij het wijzigen van een boeking de BoekingsGegevens (value-object) van de huidige boeking kunnen vergelijken met de BoekingsGegevens van de gewenste boeking, om zo een verschilfactuur te genereren, en in één keer de juiste wijziging op de opgeslagen boeking te voltooien.

#### Invarianten

Met state bedoelen we alle stukjes data die
bij die entity horen; alle attributen in een taal als Java, C# of
Python. Die veranderingen gebeuren in een OOP taal via public methods.
Het is belangrijk dat die veranderingen altijd netjes gebeuren. Daarmee
bedoelen we dat de regels van het object altijd gevolgd moeten worden:
met een chique woord zijn objecten *invariant onder hun methodes*. Die
invarianten wijzen dingen aan die altijd waar moeten zijn, zoals "het
totaalbedrag van een bestelling moet gelijk zijn aan de optelsom van de
delen". Hoewel zowel de bestelde onderdelen, als het totaalbedrag kunnen
variëren, staat het feit dat die twee met elkaar kloppen vast, de regel
is invariant.

Niet alle combinaties van state zijn geldig voor een object. Laten we
als voorbeeld de Java ArrayList nemen. Het handige van een List ten
opzichte van een gewone Array is dat je er zomaar objecten aan kan
toevoegen. Een Array moet je elke keer met een bepaalde grootte
aanmaken. De naam suggereert dat een ArrayList de List interface biedt
met een Array op de achtergrond, en als we even onder de motorkap
kijken[^12]

``` java
//Fields uit de source van ArrayList.java
transient Object[] elementData;
private int size;
```

Je ziet dat het size veld onafhankelijk wordt bijgehouden van de
elementData array. Dat voelt in eerste instantie misschien een beetje
stom (waarom niet gewoon elementData.length returnen in getSize()?),
maar daar zit een goede reden achter.

De ArrayList class doet veel moeite om zo min mogelijk keren een nieuwe
elementData array te maken. Dus als je elementen toevoegt, en er is geen
ruimte meer in de array, dan maakt de ArrayList de nieuwe array 'ietsje
groter dan nodig'. Op dezelfde manier laat de ArrayList met plezier wat
plekjes in de array leeg als je iets removed. Het size veld moet dus los
worden bijgehouden, en het zou echt *superverwarrend* worden als het
size veld niet exact klopt met hoeveel elementen er in de array zitten.

Een ander voorbeeld zie je in [programlisting_title](#entityconsistent):

``` java
public class Order {
    private Money total = Money.zero(); //Money is in dit geval een value-object die afrondingscomplexiteit met doubles afvangt
    private List<LineItems> items = new ArrayList<>();

    public List<LineItems> getItems(){ return this.items; }
    public Money getTotal(){ return total; }

    public void addItem(Product item){
        items.add(new LineItem(this, item));
        total = total.add(item.getPrice());
    }
}
```

Het probleem hier is dat je items aan de order kan toevoegen (waardoor
de prijs omhoog gaat), maar vervolgens buitenom
*order.getItems().clear()* (bijv.) kan aanroepen. Met als gevolg een
order zonder items, maar **met** een prijs.

-   OF *getItems* moet een Collections.unmodifiableList(this.items)
    returnen, zodat de collectie niet stiekem aangepast kan worden[^13].

-   OF *getTotal* moet elke keer vers z’n totaal berekenen. Als het kan
    is dit makkelijker, maar er zijn zat variaties waarin dit niet
    wenselijk is (omdat er bijv. extra kortingen zijn, of het heel duur
    is om de hele collectie uit de database te vissen).

Dit is wederom het principe van OOP encapsulatie. En dat is echt
essentieel voor OOP als geheel, en DDD in het bijzonder.

Kortom, in een nette codebase gaan entities (en dit is feitelijk gewoon
een basisprincipe van OOP) per public method van een nette (consistente)
toestand, naar een volgende nette toestand, waarbij aan alle invarianten
voldaan is. Dit is heel belangrijk, omdat we bij DDD persistentie graag
zo ver mogelijk naar de achtergrond drukken. En dat doen we met
Repositories.

### Aggregates & Aggregate Roots

Ook al is het voorbeeld zeer cliché, de Orders & LineItems laten een vrij standaard situatie zien: we hebben niet één enkele entity, maar meerdere. Laten we een kleine variatie van dit probleem bekijken:



{% plantuml %}
@startuml

class Course {
    courseId: CourseId
    maxEnrolments: int
}

class Enrolment {
    enrolmentDate: LocalDateTime
    
    +constructor(course, student)
}

class Student {
    studentnr: StudentNr
}

Enrolment --> "1" Student
Enrolment --> "1" Course

@enduml
{% endplantuml %}

In <<inschrijvingen>> zien we drie entiteiten. De aanwezigheid van ```maxEnrolments``` op ```Course``` suggereert dat er een maximaal aantal inschrijvingen voor een cursus kan zijn. Zonder extra documentatie weten we natuurlijk eigenlijk niet hoe hard deze eis is. In sommige systemen mag er absoluut geen overinschrijving plaatsvinden, omdat er bijv. regels vanuit de brandveiligheid zijn. In andere systemen zijn de lokalen misschien groot zat, en willen we best overinschrijving toestaan, maar gebruiken we de ```maxEnrolment``` om de cursus in één-of-ander overzicht een waarschuwingskleurtje te geven, omdat de kwaliteit van het onderwijs dan in het geding is. Het ligt er altijd een beetje aan. In dit voorbeeld gaan we er vanuit dat de eis hard is. 

De groep entiteiten die samen aan bepaalde regels moeten voldoen noemen we een aggregatefootnote:[Een aggregaat in het Nederlands is meestal een nood-generator voor electriciteit, maar het heeft ook een scheikundige betekenis van 'samenklontering'. We doelen hier op de tweede betekenis. Aggregeren is ook wel een synoniem voor 'samenvoegen'. In deze tekst gebruiken we het woord gewoon op z'n Engels. Net als ```Class``` en ```Object``` en allerhande andere yargon termen.]

Een gevolg van deze eis tot consistentie is dat aggregates ook een minimale eenheid van transacties (zie <<transacties>>) aangeven. Als een groepje objecten altijd samen consistent moeten zijn, kunnen we niet maar de helft ervan aanpassen zonder de andere helft op z'n minst te checken (hoe zouden we anders fouten kunnen bespeuren). Dus in een transactie zitten altijd hele groepen van entiteiten. Andersom is het ideaal als één transactie maar één aggregate aanpast, maar deze eis is iets minder hard. 

Deze koppeling tussen aggregates en transacties is essentieel: hoe groter je aggregate, hoe groter je transactie; hoe groter je transactie, hoe meer problemen met concurrency. Hoe kleiner je aggregate, hoe kleiner je transactie; hoe kleiner je transactie, hoe meer problemen met gelijktijdige wijzigingen (concurrency). Er is dus niet zoiets als 'de correcte aggregate-grootte' die je via een of ander Byzanthijns proces kan uitrekenen: het is een ontwerpbeslissing. 

Laten we dit wat concreter maken. In <<inschrijvingen>> hebben we een simpel eerste model getekend. Als we dit in onze standaard stack van Java/JPA/Spring zouden implementeren, dan zouden we drie repositories hebben (één voor elke entity), en puur een paar eenvoudige ```@Many-To-One``` associaties op die entities. Als we echter kijken naar hoe-goed-dit-werkt dan zien we op basis van onze ```maxEnrolments``` eis al direct één probleem: er is geen class in dit diagram dit onze eis kan checken: Course weet niet hoeveel enrolments die heeft. En Enrolment is er maar ééntje, die kan niet bij de andere Enrolments. Dat betekent dat we de verantwoordelijkheid voor deze regel omhoog moeten delegeren naar bijv. een applicatie-service-laag. Dat is altijd een mogelijkheid, maar niet heel domein-gedreven. Dit soort regels (en allerlei andere zaken die we met encapsulatie beschermen) noemen we ook wel 'invarianten', omdat ze altijd waar moeten zijn: het variëert niet of ze gelden, ze gelden altijd.


{% plantuml %}
@startuml

class Course {
    courseId: CourseId
    maxEnrolments: int

    +enrolstudent(student)
}

class Enrolment {
    enrolmentDate: LocalDateTime
}

class Student {
    studentnr: StudentNr
}

Course --> "0..max" Enrolment
Enrolment --> "1" Student
@enduml
{% endplantuml %}

In <<inschrijvingen2>> zien we een voorbeeld waar Course wel in staat is om z'n eigen invarianten te beschermen. Course kan nu prima er voor zorgen dat er niet boven de max. inschrijvingen uit wordt gegaan. In dit voorbeeld hebben we (in Java/JPA/Spring) geen repository voor ```Enrolment```, en zit er op de ```@One-to-Many``` een ```Cascade``` instructie. Dat betekent dat wanneer we een ```Course``` opslaan of deleten dat automatisch ook de ```Enrolments``` worden opgeslagen, of gedelete. Waarschijnlijk willen we geen automatische cascade van ```Enrolment``` naar ```Student``` omdat we niet bij het verwijderen van een cursus alle studenten die er voor ingeschreven staan automatisch willen verwijderenfootnote:[In de praktijk kun je echter cascades vaak nogal fijnmazig configureren (wel inserts, maar geen deletes, en sommige updates, bijv.) dus hoewel een ```Cascade(All)``` in JPA een vrij betrouwbare aanduiding van een aggregate is, kan dit soms genuanceerder zijn].

Onze mogelijkheden om consistentie in het domein te beschermen zijn groter geworden. Maar als we nu een cursusinschrijving willen doen moeten we eerst de hele cursus ophalen, met alle inschrijvingen. De transactiegrens is groter, dus er kunnen niet op exact hetzelfde moment twee studenten zich voor dezelfde cursus inschrijven. En onze mappings zijn ook nog eens (een klein beetje) complexer. Dus hoewel <<inschrijvingen2>> waarschijnlijk in 90% van de gevallen de juiste keuze is, is er ook altijd iets te zeggen voor het alternatief (en dan dus de consistentie-eisen 'elders' oplossen).


> En als dat je niet overtuigt dat het altijd een ontwerpafweging is, dan zou ik je aanraden om een extra eis in dit kleine
> modelletje te verwerken: een student heeft ook een maxEnrolments. In principe mogen studenten max. voor 4 cursussen 
> ingeschreven staan (zodat je niet enorme herkansingsballen krijgt), maar een SLBer mag deze limiet op een per-student-basis 
> aanpassen (voor bijv. die ene student die eigenlijk alles al weet, maar nog een boel eerstejaarsvakken heeft open staan). 
> Dan wordt het ineens tricky om te bepalen hoe je dit netjes in een Domein-Driven stijl modelleert.
> 
> -Tom

#### Aggregate Roots

Aggregates gaan dus over het beschermen van invarianten in groepjes van objecten in de context van transacties. Als je die zin zonder blikken of blozen kan lezen dan zijn we al een heel eind.

Het beschermen van die consistentie is erg complex als alle onderdelen van een aggregate los van elkaar kunnen veranderen. Stel we hebben weer onze standaard Order->OrderLine->Product geval:

``` java

Customer pete = ...; //eeergens komt Pete vandaan
Product newBBQ = ...; //evenzo deze mooie BBQ

Order petesOrder = pete.startOrder();
// Pete bestelt honderden dingen!
petesOrder.add(newBBQ);

//Zoveel dingen dat deze getTotal() niet over alle items kan loopen
//maar dat we tijdens het toevoegen het totaal moeten bijhouden
Money firstTotal = order.getTotal();

//Dan is het heel vervelend als dit zou kunnen:
newBBQ.setPrice(50);
```

Het voorbeeld in <<trickysetters>> is een beetje gemaakt. Meestal zijn bestellingen dusdanig klein dat je best alles kan herberekenen in een getTotal()-achtige methode. Maar laten we even aannemen dat dit niet zo is (en in een latere versie een beter voorbeeld zoeken).
In dit voorbeeld is ```Order``` onze aggregate. En we moeten consistent zijn over de ```Order```, de hoeveelheid ```LineItems```, en de (prijzen van) ```Products_.

Om dit idee makkelijker te maken is het bij aggregates vaak wijs om één enkele entity aan te merken als de aggregate-root. Deze aggregate-root is de enige plek waar dingen in de aggregate gemuteerd kunnen worden, en zo zou die ```setPrice``` onmogelijk zijn. Kortom een aggregate-root is de eindverantwoordelijke voor het feit dat je aggregate consistent blijft. Een standaard manier om dit te doen is er voor te zorgen dat je geen referenties uitgeeft aan entities binnen je aggregate. Als andere classes iets van je willen weten, dan geef je ze dus nooit je eigen entities terug, maar value-objects gemaakt uit die entities. 


## Samenvatting

In dit hoofdstuk hebben we het object-georiënteerd modelleren en
ontwerpen behandeld aan de hand van de belangrijkste onderdelen van het
objectmodel van Booch.

Belangrijkste elementen van het objectmodel van Booch Het objectmodel
van Booch onderscheid een aantal zaken die ons helpen goed
gestructureerde object-georiënteerde software te ontwerpen:

1.  **Abstraction**: klassen en objecten zijn onze kernabstracties
    waarin we toestand (fields) en gedrag (methods) samenbrengen die bij
    elkaar horen. Dit verhoogt *cohesion*. We kunnen met deze
    abstracties communiceren via de publieke methoden. De interne
    werking hoeven we niet te weten (*implementation hiding*).

2.  **Encapsulation**: hoe een abstractie zijn toestand bijhoudt en zijn
    gedrag uitvoert wordt afgeschermd van de buitenwereld. Om
    *information hiding* te bereiken wordt gebruik gemaakt van access
    modifiers. Dit beperkt *coupling*. Handige vuistregels om hierbij te
    helpen zijn *Tell, don't ask* en *the Law of Demeter*.

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

Aan de keerzijde hebben we DDD van Evans. Daar lossen we *essentiële* complexiteit op in het domein, 
door een model te maken van:

1. Entities, objecten waar je met een identifier naar kan wijzen, waarvan de waardes gedurende hun lifecycle veranderen. Deze waardes kunnen of primitieve types (ints, Strings, etc.) zijn, maar zijn meestal Value-Objects.
2. Value-Objects, immutable objecten met geen eigen identiteit, die een bepaalde waarde in het domein representeren.
3. Aggregates, groepen van verschillende objecten (1 of meer) die hun eigen transactionele consistentie waarborgen door hun invarianten te beschermen. Meestal bereik je dat door alle mutaties vanuit 1 kern-object binnen de aggregate (de "aggregate root") te starten.

We drukken dit domeinmodel uit in de *ubiquitous language* een taal wiens termen begrepen ook begrepen worden door de business stakeholders in ons project.



[^1]: In de praktijk wordt ook wel eens verwezen naar de *4 Pillars of
    Object Orientation*: abstraction, encapsulation, polymorphism en
    inheritance. Deze zijn in het objectmodel van Booch inbegrepen.
