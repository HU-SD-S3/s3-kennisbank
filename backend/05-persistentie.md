# Opdracht 5: Persistentie

Het Engelse *to persist* betekent *volharden* en dat is precies wat
persistentie inhoudt: de opslag overleeft het afsluiten van de
applicatie. Het gaat dus langer mee dan het werkgeheugen, bijvoorbeeld
door de data op te slaan in een bestand, database of web service.

Wij gebruiken hiervoor een erg betrouwbare technologie die maar liefst
een halve eeuw geleden is ontwikkeld! Nog steeds is het bij vele grote
en kleine technologiebedrijven te vinden: een Relational Database
Management System (RDBMS).

De database die we gebruiken is PostgreSQL. Hiermee kunnen we praten
middels SQL: *Structured Query Language*.

Een relationele database biedt onder meer garanties rondom de
integriteit bij het wegschrijven en uitlezen van data dankzij
*transactions*. Ook blijft de data consistent wanneer meerdere
gebruikers tegelijkertijd met de data werken dankzij *concurrency
control* middels locking.

De details van persistentie en SQL leer je bij de cursus Data and
Persistency. Wij gebruiken Spring Boot en Hibernate om het ons wat
makkelijker te maken. Maar daarmee moeten we nog wel leren werken.

## Het opzetten van de database

In deze cursus zetten we het liefst de database op met een
developer-hulp-programma genaamd Docker. Latere cursussen maken nog een
boel gebruik van Docker, dus het is aan te raden zo vroeg mogelijk aan
dit programma gewend te raken.

### Een database met Docker

Heb je het project op je machine staan? Open het in je IDE (bij voorkeur
IntelliJ).

Je kan het project op twee manieren opzetten: met Docker of zonder
Docker. Zie ook de README.md van het project.

Het wordt aangeraden om Docker en docker-compose te gebruiken om het
project op te starten. Docker zorgt ervoor dat de technische
afhankelijkheden niet apart geïnstalleerd hoeven te worden, maar
herbruikbaar in het project zelf kunnen worden opgenomen. Docker wordt
daarom veel gebruikt in de praktijk om de infrastructuur gelijksoortig
te houden of je nu op development-, test- of productie-omgeving aan het
werk bent.

In het geval van dit project gaat het om een voorgeconfigureerde
PostgreSQL-database.

#### Installeer Docker

Als je op Windows werkt dan zul je eerst nog iets anders moeten
installeren, namelijk WSL[^1]. WSL staat voor \"Windows Subsystem for
Linux\" en het zorgt er voor dat je Docker op een snellere en stabielere
manier kan draaien. WSL en Docker hebben in het verleden echter nogal
eens gezorgd voor laptops (of desktops) die niet meer opstarten. Neem
dus het zekere voor het onzekere en ***BACKUP AL JE BELANGRIJKE
BESTANDEN***.

Zie de [WSL download
pagina](https://learn.microsoft.com/en-us/windows/wsl/install) voor
verdere details over het installeren van WSL 2.

Download en installeer Docker desktop via de [Docker download
pagina](https://www.docker.com/products/docker-desktop). Volg de
instructies op genoemd op de site.

Vraag studenten en docenten om hulp als je er niet uit komt.

#### Opstarten met docker-compose

Als Docker geïnstalleerd is, kan je de database opstarten met
docker-compose. Navigeer in de commandline naar de project directory (je
kunt in je IDE meestal ook een terminal window openen). In de project
directory kan je `docker-compose up` draaien vanaf de commandline. De
eerste keer duurt dit even: de container voor PostgreSQL wordt
gedownload, geconfigureerd, gebouwd als image en vervolgens wordt de
image opgestart. De volgende keer dat je docker-compose runt wordt
alleen de voorgeconfigureerde image opgestart.

Als je de database op de achtergrond wil draaien (in plaats van dat hij
actief in je commandline blijft), kan je ook `docker-compose start`
gebruiken in plaats van `docker-compose up`.

Gaat er iets mis met `docker-compose` en wil je de container image
opnieuw bouwen, dan kan je `docker-compose up –build -V` gebruiken.

Hoe dit precies werkt hoef je voor deze cursus niet te weten, maar ben
je hierin geïnteresseerd, kijk dan eens naar de `docker-compose.yml` en
in `development/db` binnen het project. Hier staat alles in
gedefinieerd. Zo wordt er een algemene admin-gebruiker voor PostgreSQL
met als username en password `admin` en `admin` aangemaakt. Ook worden
er automatisch username, password en database aangemaakt onder de naam
`bep2-huland-casino`.

De standaardpoort van PostgreSQL is `5321`. Wij herschrijven deze poort
in docker-compose.yml naar `15432` om conflicten te voorkomen met een
bestaande PostgreSQL instantie. De connectiedetails worden beschreven in
de projectconfiguratie onder src/main/resources/application.properties:

``` ini
spring.datasource.url=jdbc:postgresql://localhost:15432/bep2-huland-casino
spring.datasource.username=bep2-huland-casino
spring.datasource.password=bep2-huland-casino
```

Zie hieronder meer over hoe je moet verbinden met PostgreSQL.

#### Problemen oplossen met Docker / PostgreSQL

Check altijd of Docker Desktop draait en of onze PostgreSQL-image wel is
opgestart!

Als data niet lijkt te worden opgeslagen in Docker, zorg dan dat Docker
een 'volume' kent om naar weg te schrijven. Voeg deze directory of de
parent directory toe via de Docker user interface onder
`Settings > Resources > File Sharing`.

Als je niet met de database lijkt te kunnen verbinden, check dan of
Docker wel bij het (virtuele) netwerk van de host kan.

### Starten zonder Docker

Hoewel Docker wordt aangeraden, kan het voorkomen dat dit op jouw
systeem om wat voor een reden dan ook niet lukt. Dan moeten we
PostgreSQL handmatig instellen. Daarvoor moeten we een aantal zaken
handmatig installeren en configureren in het project.

#### PostgreSQL installeren

Zorg dat PostgreSQL geïnstalleerd is. Dit moet je ook voor de cursus
Data & Persistency doen. Je kan ook de instructies voor die cursus erbij
pakken! Zie: [Postgres website](https://www.postgresql.org/download/).

Dit is een database die je gebruikt voor de ontwikkeling van
webapplicaties met persistentie. Zorg dat je de hoofddatabase en de
admin-inloggegevens onthoudt of bewaart. Ben je dit vergeten, dan kan je
het best PostgreSQL opnieuw installeren.

#### Verbinden met de database

Zorg dat je een tool hebt om handmatig te verbinden met de database.
Hiervoor kan je je *IntelliJ* gebruiken of een tool als *pgAdmin*. Om
via IntelliJ te verbinden, kan je de instructies uitvoeren die te vinden
zijn op: [Helppagina
Jetbrains](https://www.jetbrains.com/help/idea/connecting-to-a-database.html#connect-to-postgresql-database).
De instructies zijn vergelijkbaar voor DataGrip.

Voor *pgAdmin*, zie: [Website pgAdmin](https://www.pgadmin.org/).

De volgende gegevens heb je nodig voor het verbinden met de
hoofddatabase:

-   **Host**: `localhost`

-   **Port**: `5432` (met Docker: `15432`)

-   **Database**: `<admin database>` (met Docker: `postgres`)

-   **Username**: `<admin user>` (met Docker: `admin`)

-   **Username**: `<admin password>` (met Docker: `admin`)

#### Database en gebruikers instellen

Als we geen Docker hebben gebruikt, moeten we zorgen dat de database,
username en password voor `bep2-huland-casino` worden aangemaakt.
Hiervoor kan je de volgende queries uitvoeren.

De user (en password) maak je aan met de volgende SQL-query (gebruik een
raw query in je database-tool):

``` sql
CREATE USER "bep2-huland-casino" WITH CREATEDB PASSWORD 'bep-huland-casino';
```

De database maak je als volgt aan met de juiste gebruiker (gebruik een
raw query in je database-tool):

``` sql
CREATE DATABASE "bep2-huland-casino" OWNER "bep2-huland-casino";
```

#### Projectinstellingen veranderen

De standaardpoort van PostgreSQL is `5321`. Ons project staat ingesteld
om te verbinden met poort `15321`, omdat we dat met Docker doen om niet
met andere PostgreSQL-instanties in de knoop te komen.

We kunnen aanpassen hoe onze applicatie met de applicatie verbindt via
de configuratie in src/main/resources/application.properties. Zorg dat
deze er als volgt uitziet:

``` ini
spring.datasource.url=jdbc:postgresql://localhost:5432/bep2-huland-casino
spring.datasource.username=bep2-huland-casino
spring.datasource.password=bep2-huland-casino
```

Heb je iets veranderd en werkt het? Commit je wijzigingen met een
duidelijke naam, bijvoorbeeld: \"Customize database configuration\".
Push de wijzigingen naar je remote GitHub repository.

### De applicatie starten

Als onze database draait kunnen we onze applicatie starten. Dit kunnen
we doen door in onze IDE op de play-knop te drukken naast de main-method
van de klasse CasinoApplication. Of het Maven-commando
`spring-boot:start`. Dit commando kan je in de IDE uitvoeren
(Maven-paneel rechts of via het menu `View > Tool Windows > Maven`). Ook
kan je de commandline gebruiken: `mvnw spring-boot:start`.

Als het goed is, zie je nu in de commandline allerlei log-berichten. De
laatste regels zouden moeten gaan over dat de applicatie te bereiken is
op poort `8080`. Zie je dit niet en in plaats daarvan een lange
foutmelding. Scroll dan omhoog (of omlaag) naar de plek waar je meer
informatie kan vinden over deze fout. Probeer dit te googelen om er meer
over te weten te komen.

Twee veelvoorkomende fouten:

-   De database is onbereikbaar: zorg dat je bovenstaande instructies
    hebt gevolgd om de database (met of zonder Docker) draaiende te
    krijgen.

-   De poort 8080 is al in gebruik: er draait al een web-applicatie op
    poort 8080. Sluit deze applicatie af of stel een andere poort in in
    de application.properties.

Kan je de fout niet oplossen? Trek dan even aan de bel bel je docent of
medestudenten!

## Stap 1: Doorgrond de object-relational impedance mismatch

In onze cursus staat het objectmodel centraal. Een relationele database
werkt echter volgens een heel ander idee.

Relationele databases werken, kort gezegd, volgens het volgende
conceptuele model:

1.  Data wordt gestructureerd in **entiteiten (tabellen)** met **velden
    (kolommen)**

2.  Data kan worden ingevuld in **rijen**: per entiteit worden dan de
    kolommen ingevuld

3.  Entiteiten zijn identificeerbaar middels een **identifier (id)**

4.  Tussen entiteiten kunnen **relaties** bestaan door naar elkaars
    identifiers te wijzen

Een andere manier hoe relationele databases anders werken dan onze
applicatie is dat ze gebruik maken van een andere taal. De database
maakt immers gebruik van SQL, terwijl onze applicatie is geschreven in
Java!

Er zit dus een mismatch tussen het objectmodel, waarin we een objectboom
maken (een spel met allerlei benodigdheden), en het relationele model,
waarin we entiteiten met relaties hebben. Deze mismatch noem je de
*object-relational impedance mismatch* (*impedantie* betekent
'belemmering, bemoeilijking of weerstand').

Om deze mismatch te doorbreken kent een applicatie meestal
*infrastructuur-laag*, waarin de omzetting plaatsvindt van Java naar
SQL, van objectmodel naar relationeel model.

In ons project schrijven we deze laag niet zelf, maar laten we een
*object-relational mapper (ORM)* het werk doen: *Hibernate* via *Spring
JPA*. Wij declareren een *repository* (in de *data-laag*), een interface
voor opslag welke door Spring geïmplementeerd wordt op basis van de
geconfigeerde database. Dat scheelt een boel werk! Voor de omzetting van
domeinobjecten naar entiteiten kunnen we annotaties gebruiken om aan te
geven welke kolommen we nodig hebben en welke relaties er gelegd moeten
worden. Dit kunnen we in aparte data-objecten doen, maar in ons project
staan we het toe om onze domein-objecten van annotaties te voorzien.

Het mooie hieraan is dat we in onze service kunnen zeggen:
`this.repository.save(game)`. Spring regelt de rest op basis van onze
annotaties. En die annotaties\... dat is gelijk het moeilijke hieraan!
Daarom gaan we daarmee oefenen.

### Kanttekening: Geen écht 4-lagenmodel

Hiermee koppelen we wel onze database-abstractielaag aan onze
domeinlaag. Dit is gek in het kader van een gelaagde architectuur:
afhankelijkheden lopen daarin meestal maar één kant op. Voor dit project
staan we het echter toe. De impact van deze koppeling is namelijk te
rechtvaardigen omdat de opslag in dienst staat van het domein. Het zijn
immers de domeinobjecten die we willen opslaan. In dit geval zouden we
de *domain* en de *data* packages als één laag kunnen beschouwen en het
systeem als 3-lagenarchitectuur bestempelen.

Willen we onze applicatie meer overeen laten komen met een
4-lagensysteem, dan zouden we een expliciete vertaalslag kunnen
toevoegen tussen domein- en data-laag. Dat gaat voor deze cursus te ver
en komt terug in de cursus **Software Architecture**.

## Stap 2: Maak een logisch datamodel

Voordat we verder gaan, is het van belang om op basis van ons domein- en
objectmodel een logisch datamodel te maken. Een logisch datamodel geeft
ons een overzicht van hoe onze data gestructureerd gaat worden. Het
hoeft niet zo te zijn dat het in de code exact hetzelfde wordt. Dat
geeft ons wat ruimte om met de verschillen tussen het objectmodel en het
relationele model om te gaan.

Een Entity Relationship Diagram (ERD) kan als logisch datamodel dienen.
We nemen entiteiten, kolommen en relaties op, maar hoeven de datatypes
niet te specificeren. Voor meer informatie over ERDs, zie de [handige
uitleg van Visual
Paradigm](https://www.visual-paradigm.com/guide/data-modeling/what-is-entity-relationship-diagram/#erd-data-models-conceptual)

Met het ERD willen we de volgende vragen beantwoorden:

1.  Welke entiteiten hebben we in ons systeem? Denk aan wat, binnen het
    relationele model, identificeerbaar moet zijn!

2.  Welke kolommen moeten de entiteiten hebben? Past het daadwerkelijk
    in een kolom of is er een extra entiteit nodig?

3.  Welke relaties gelden er tussen die entiteiten? Gaat het om
    een-op-een of een-op-meer?

Gebruik een tool als *diagrams.net*, *software ideas modeler* of *visual
paradigm*, sla het ontwerp op en exporteer het als *.png* of *.jpg*.
Neem dit op in je projectdirectory (bijvoorbeeld onder een mapje
*diagrams*) en commit het resultaat, zodat je docent er naar kan kijken
en er feedback op kan geven. Dit hoeft niet perfect te zijn, dus verzand
niet teveel in details.

## Persistentie in Java

In ons project werken we met een variant van het populaire
Spring-framework: Spring Boot. Spring Boot maakt gebruik van Spring Data
JPA, wat *repositories* toevoegt. Een repository is een opslagmechanisme
voor horende bij één entiteit of een aggregatie van entiteiten. In
Spring Data JPA wordt voor relationele databases Hibernate gebruikt, een
library die de gestandardiseerde Java Persistency API (JPA)
implementeert.

Hibernate is een object-relational mapper (ORM). Dit betekent vrij
letterlijk dat het de mapping (of: vertaling) verzorgt tussen het
objectmodel en het relationele model! Deze mapping kunnen we natuurlijk
met de hand doen door SQL-queries te schrijven voor elk object, maar
Hibernate geeft ons de optie om dit met minder woorden te doen via XML
of annotaties. In Java zijn annotaties tegenwoordig de meestgebruikte
aanpak. Een ORM heeft als doel om de *object-relational impedence
mismatch* te verkleinen!

### Data entities

Een *data entity* (of kortweg: *entity*) is een eenvoudige manier om
persistentie van objecten te realiseren. Het kan een simpel object zijn
met alleen velden en wat getters of een object zijn met meer complex
gedrag.

Een eenvoudig voorbeeld is te vinden in de Chips-entity. Hier zijn
alleen geen relaties in opgenomen:

``` java
@Entity
public class Chips {
    @Id
    @GeneratedValue
    private Long id;

    private String username;

    private Long amount;

    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;

    @UpdateTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastUpdate;

    public Chips() {
    }

    // Methods...
}
```

### Repositories

Een *repository* is een *DAO (data access object)* dat zich als
verzameling gedraagt. Een DAO is een specifieke vorm van een *gateway*:
een interface naar buiten toe dat verschillende implementaties kan
hebben. Hierover later meer.

### Overzicht Spring Data JPA en Hibernate

Het is zeer de moeite waard om de documentatie van [Hibernate (entity
annotations)](https://docs.jboss.org/hibernate/stable/annotations/reference/en/html_single/#entity-overview)
en [Spring Data JPA
(repositories)](https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#repositories)
door te nemen en als referentie te gebruiken (tip: doorzoek digitale
bronnen met `CTRL + F`!). In deze bronnen zijn ook een aantal
voorbeelden opgenomen.

## Stap 3: Annoteer de hoofdentiteit

Als het goed is hebben we één hoofdobject waar alle domeinacties op
uitgevoerd worden.

Om een entity te maken met Hibernate moet je de betreffende klasse
voorzien van de annotatie `@Entity`. Een hele hoop dingen hoeven we niet
aan te geven, zoals tabelnaam en kolomnamen. Deze kunnen we wel
wijzigen, maar Hibernate pakt de naam van de klasse en de velden. Het
kan nuttig zijn om dit aan te geven om wijzigingen over tijd makkelijker
te maken door de tabelstructuur en de klassestructuur los te koppelen.

Omdat entiteiten identificeerbaar zijn, moeten we een veld aanmerken als
identifier. Dit doen we door de annotatie `@Id` boven een veld te
zetten. Heeft een entity nog geen id-veld? Dan kunnen we er een
aanmaken. Het is een aardig idee om hiervoor een Integer of zelfs een
Long te gebruiken. Deze kan je door de database laten genereren door
tussen het veld en de `@Id`-annotatie de annotatie `@GeneratedValue` op
te nemen. Bij de meeste databases zal er dan een incrementele,
sequentiële identifier (een getal dat automatisch oploopt) worden
gebruikt. Een nadeel hiervan is dat je pas ná het opslaan van een nieuwe
entiteit in de database weet van zijn identifier. Dit kan in sommige
situaties problematisch of inefficiënt zijn. In dat soort gevallen kan
je globally unique identifiers (GUIDs) of universally unique identifiers
(UUIDs) gebruiken. Deze kunnen in je code worden gegenereerd en zijn
ontworpen om zelden collissions te hebben.

Een aanvullende eis van Hibernate voor entiteiten is dat de klasse ofwel
géén constructor heeft ofwel een lege constructor als er al een
constructor bestaat. Hibernate neemt namelijk een leeg object als
uitgangspunt en vult dynamisch de velden op basis van verdere
mapping-annotaties.

Van kolommen waarvan Hibernate niet weet hoe ze in SQL-termen moeten
worden omgezet, moeten we aangeven hoe Hibernate deze mapping moet
verzorgen.

Ten slotte moeten relaties naar andere klassen die als `@Entity` zijn
aangemerkt worden gespecifeerd: betreft het bijvoorbeeld een
`@OneToMany` (zoals bij lijsten) of een `@OneToOne`. Daarbij moeten we
ook aangeven in hoeverre wijzigingen in de ene entiteit effect hebben op
de andere. Meestal willen we dat de wijzigingen in de hoofdentiteit
terechtkomen in entiteiten waarnaar verwezen wordt. Dit doe je door dit
te specificeren in je annotatie: `@OneToMany(cascade=CascadeType.ALL)`.
Cascades zorgen ervoor dat wijzigingen worden doorgezet naar
gerelateerde entiteiten. Hiermee voorkom je de foutmelding: "object
references an unsaved transient instance - save the transient instance
before flushing"

#### De Game-entiteit

Laten we wederom de `Game`-klasse nemen. Allereerst moeten we zorgen dat
de klasse identificeerbaar is. We moeten dus een veld id (type *Long*)
toevoegen als we dat nog niet hebben gedaan. Dit veld moeten we als
`@Id` en `@GeneratedValue` markeren.

Vervolgens moeten we per veld kijken of dit een kolom op zichzelf kan
zijn of een mapping vereist naar een andere entiteit toe. In het eerder
besproken model wordt een spelpotje altijd gespeeld met één Deck. Er is
dus sprake van een `@OneToMany` relatie naar die Deck toe.

## Stap 4: Annoteer de overige entiteiten

Dit moeten we doen voor alle entiteiten, bijvoorbeeld voor de eerder
besproken Deck-entiteit.

Als snel kom je problemen tegen. Niet alles is makkelijk te vertalen
naar tabellen en kolommen. Het is de *object-relational impedence
mismatch*!

Denk bijvoorbeeld aan hoe je een Deck met Cards opslaat. We kunnen per
speelkaart een rij opnemen in een \"cards\" tabel (52 kaarten) met elk
hun unieke id (0 t/m 51), maar het is misschien logischer om een kaart
niet te modelleren als entiteit, maar als samengestelde waarde. Een
harten aas kan immers in meerdere spelpotjes voorkomen! Hoe gaan we
daarmee om? En wat doen we met andere zaken die we als enum hebben
gemodelleerd, zoals misschien de spelstatus? Zie hiervoor stap 5.

## Stap 5: Zorg voor conversies van enums en samengestelde waarden

Enums worden standaard omgezet naar integer representaties op basis van
de volgorde van declareren in de enum-klasse. Als je de volgorde in je
code dus aanpast, krijg je problemen in je datamodel!

Daarom kan het handig zijn om de enum om te zetten naar een
text-representatie in het relationele model. Dit doet je door het
betreffende veld aan te merken als `@Enumerated(EnumType.STRING)`.

Het risico is dan weer wel dat de mapping kan breken wanneer je een naam
aanpast!

Sommige objecten zijn niet echt entiteiten of enums, maar weer
groeperingen van waardes. Het is niet heel zinvol om hier het
relationele model op los te laten. Deze klassen zou je eerder kunnen
zien als waarden die weliswaar in losse velden in een aparte klasse
zitten in het objectmodel, maar in het relationele model prima in één
kolom kunnen leven. Denk bijvoorbeeld aan een kaart of lijst van
kaarten.

Bij platte data kan je dit oplossen door een `@Embeddable` object te
maken (in plaats van een `@Entity`) en dit object in een veld op te
nemen dat in de entiteit als . Voor een lijst van kaarten werkt dit
niet.

Een goede, maar vrij geavanceerde oplossing is het aanmaken van een *JPA
Attribute Converter*. Dit is een aparte klasse die je in de datalaag kan
aanmaken en als `@Converter` moet worden aangemerkt. Bijvoorbeeld een
`CardListConverter`. Deze klasse moet JPA's `AttributeConverter<T, U>`
interface implementeren.

``` java
@Converter
public class CardListConverter implements AttributeConverter<List<Card>, String> {
    @Override
    public String convertToDatabaseColumn(List<Card> list) {
        // Serialize list of cards into a single string 
        // (i.e. based on rank and suit)
        //
        // For instance, we could convert this according to a custom format: 
        // HEARTS,ACE;SPADES,KING;...
    }

    @Override
    public List<Card> convertToEntityAttribute(String joined) {
        // Deserialize a single string into a list of cards
        // (i.e. by splitting the string and reading out the rank and suit from the string)
    }
}
```

Vervolgens kan je de `List<Cards>` binnen de betreffende entity
annoteren met `@Convert(converter = CardListConverter.class)`. Vergeet
niet om de lengte van de kolom up te daten: `@Column(length = 2000)` We
slaan namelijk een hele reeks kaarten als een grote string op! Mogelijk
dat niet elke database deze grootte voor VARCHARS ondersteunt. Willen we
een datatype specifiek voor PostgreSQL gebruiken, dan kunnen we
`@Column(columnDefinition = "TEXT")` gebruiken. Let wel dat je dan
minder makkelijk van database kunt veranderen in de toekomst.

### Kom je er niet uit?

Het kan soms pittig zijn om je domeinmodel te voorzien van de juiste
annotaties.

Lees foutmeldingen goed door, benut de Spring JPA / Hibernate
documentatie en vergeet niet om gewijzigde database-tabellen te DROP'en
en de applicatie opnieuw te starten wanneer je de tabelstructuur
aanpast. Vraag docenten en medestudenten om hulp als je het even niet
ziet.

Als het allemaal niet wil lukken, dan zou je een deel kunnen omzetten
naar een `@Lob`: een large object binary. Dan wordt het object
opgeslagen en uitgelezen in binaire vorm. Dit brengt wel een groot
risico met zich mee qua onderhoudbaarheid wanneer de vorm van het object
wijzigt in je Java-code! Probeer dit dus alleen te doen bij objecten die
klein en/of vormvast zijn!

Je hebt zelf de keuze om een van deze oplossingen te kiezen. Wees niet
bang om je tabellen weg te gooien en opnieuw te beginnen als het
allemaal niet helemaal werk zoals verwacht.

## Stap 6: Maak een repository voor de hoofdentiteit

In JPA heb je twee gangbare manieren om een repository te maken. De
eerste manier is om op basis van de *EntityManager* interface een
repository te implementeren.

De EntityManager is een JPA-specifieke wrapper om de Hibernate Session
interface heen. Dus als je met een Hibernate Session (vanuit het vak
Data & Persistenty) kan omgaan, dan kan je ook met een EntityManager
omgaan.

De Chips-repository heeft een voorbeeldimplementatie met behulp van een
EntityManager (excerpt in
[1.1](#pers:entitymanager){reference-type="ref"
reference="pers:entitymanager"}).

<figure id="pers:entitymanager">
<div class="sourceCode" id="cb1"><pre
class="sourceCode java"><code class="sourceCode java"><span id="cb1-1"><a href="#cb1-1" aria-hidden="true" tabindex="-1"></a><span class="at">@Component</span></span>
<span id="cb1-2"><a href="#cb1-2" aria-hidden="true" tabindex="-1"></a><span class="kw">public</span> <span class="kw">class</span> JpaChipsRepository <span class="kw">implements</span> ChipsRepository <span class="op">{</span></span>
<span id="cb1-3"><a href="#cb1-3" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-4"><a href="#cb1-4" aria-hidden="true" tabindex="-1"></a>    <span class="kw">private</span> <span class="dt">final</span> EntityManager entities<span class="op">;</span></span>
<span id="cb1-5"><a href="#cb1-5" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-6"><a href="#cb1-6" aria-hidden="true" tabindex="-1"></a>    <span class="kw">public</span> <span class="fu">JpaChipsRepository</span><span class="op">(</span>EntityManager entities<span class="op">)</span> <span class="op">{</span></span>
<span id="cb1-7"><a href="#cb1-7" aria-hidden="true" tabindex="-1"></a>        <span class="kw">this</span><span class="op">.</span><span class="fu">entities</span> <span class="op">=</span> entities<span class="op">;</span></span>
<span id="cb1-8"><a href="#cb1-8" aria-hidden="true" tabindex="-1"></a>    <span class="op">}</span></span>
<span id="cb1-9"><a href="#cb1-9" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-10"><a href="#cb1-10" aria-hidden="true" tabindex="-1"></a>    <span class="at">@Override</span></span>
<span id="cb1-11"><a href="#cb1-11" aria-hidden="true" tabindex="-1"></a>    <span class="kw">public</span> <span class="dt">void</span> <span class="fu">save</span><span class="op">(</span>Chips chips<span class="op">)</span> <span class="op">{</span></span>
<span id="cb1-12"><a href="#cb1-12" aria-hidden="true" tabindex="-1"></a>        entities<span class="op">.</span><span class="fu">persist</span><span class="op">(</span>chips<span class="op">);</span></span>
<span id="cb1-13"><a href="#cb1-13" aria-hidden="true" tabindex="-1"></a>    <span class="op">}</span></span>
<span id="cb1-14"><a href="#cb1-14" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-15"><a href="#cb1-15" aria-hidden="true" tabindex="-1"></a>    <span class="co">//Etc. voor de andere methods</span></span>
<span id="cb1-16"><a href="#cb1-16" aria-hidden="true" tabindex="-1"></a><span class="op">}</span>    </span></code></pre></div>
</figure>

Deze aanpak, waarbij we de ORM laag achter een interface verstoppen is
vrij standaard, maar Spring heeft nog een (technisch indrukwekkende)
optie, in de vorm van *Spring Data Repositories*.

### Spring Data Repositories

Het maken van een Spring Data Repository is vrij eenvoudig: we
*extenden* een bestaande generieke repository interface. Spring biedt
een aantal verschillende aan, elk met weer een stukje extra
functionaliteit. De meest basale is `Repository<T, ID>`, deze geeft aan
dat het om een repository gaat voor een bepaalde entiteit die
benaderbaar is met een bepaalde id. De benodigde methodes moet je zelf
toevoegen. Dat hoeft bijvoorbeeld niet in het subtype ervan,
`CrudRepository<T,ID>`, welke generieke acties aanbiedt voor Create,
Read, Update Delete (CRUD). De meest specifieke repository is de
`JpaRepository<T,ID>`, welke een uitbreiding is van
`CrudRepository<T,ID>` en de `PagingAndSortingRepository<T,ID`. Het
biedt extra functionaliteit voor projecten die met JPA kunnen werken en
geeft de mogelijkheid om flexibel met verzamelingen te werken.

Een repository is een soort *gateway*: een abstractie vanuit de
component naar de buitenwereld toe. In dit geval betreft het een
**infrastructuurabstractie**, namelijk een toegangspoortje naar een
database. Wij hoeven maar één repository te maken. Maak een de package
*nl.hu.bep2.blackjack.data* aan. Maak hierin de interface aan
*GameRepository*. Denk aan de hotkeys! We moeten aan Spring duidelijk
maken dat het gaat om een subtype van `JpaRepository<T, ID>`, waarbij we
het typeargument `T` invullen met `Game` en de identifier invullen met
`Long`. Met andere woorden: we willen een repository voor games die
identificeerbaar zijn met een long. Spring kan dan op basis van de
entity definities een implementatie genereren en wij kunnen zelfs een
soort queries definiëren in onze interface. Dit hoeven we voorhet
project waarschijnlijk niet te doen. We laden een object in, voeren er
operaties op uit en slaan het weer op. We zouden dus net zo goed een
`CrudRepository<T, ID>` kunnen maken.

Hoe dan ook, het zal de volgende vorm hebben (dit kan je overnemen):

``` java
package nl.hu.bep2.casino.blackjack.data;

import nl.hu.bep2.casino.blackjack.domain.Game;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GameRepository extends JpaRepository<Game, Long> {}
```

Merk op dat de klasse leeg kan blijven omdat we extenden van Spring's
repositories. Dit is echt een bijzonder staaltje werk van Spring.
Normaal moet je voor een interface altijd **zelf** een implementatie
schrijven (want een interface bevat alleen de 'vorm' van een type). In
dit geval genereert Spring een implementatie voor je. Voor de
liefhebber, dit doet Spring op basis van de
*org.springframework.data.jpa.repository.support.SimpleJPARepository*.
Deze kun je vinden als je in IntelliJ je external libraries openklapt,
en dan *Maven: org.springframework.data:spring-data-jpa:\...* openklapt.

## Stap 7: Verbeter de applicatieservices

Zorg dat onze applicatieservice bij onze repository kan door deze als
veld op nemen. Spring zal de dependency injection via auto-wiring
verzorgen.

Verder is het verstandig om de `@Transactional` annotatie op te nemen
boven de klasse. Dit zorgt ervoor dat alle acties die door de service
worden uitgevoerd in één databasetransactie worden uitgevoerd. Als er
ergens in het proces wat misgaat, worden de alle database-operaties
binnen die actie teruggedraaid.

Je zal waarschijnlijk op het volgende uitkomen:

``` java
@Service
@Transactional
public class BlackjackService {
    private GameRepository gameRepository;
    private ChipsService chipsService;

    public BlackjackService(GameRepository gameRepository, ChipsService chipsService) {
        this.gameRepository = gameRepository;
        this.chipsService = chipsService;
    }
    
    // Methods for use cases...
}
```

Verbeter vervolgens alle use case-methodes om gebruik te maken voor het
opslaan en uitlezen van de Game. De start game methode kan natuurlijk
nog geen spel ophalen.

Heb je het met meerdere centrale objecten opgelost, dan zal je meerdere
repositories moeten aanmaken, injecteren en aanroepen.

[^1]: WSL 2 om precies te zijn
