# Opdracht 2: Persistentie

## Stap 1: Maak een logisch datamodel (ERD)

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

## Stap 2: Annoteer de hoofdentiteit

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

## Stap 3: Annoteer de overige entiteiten

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

## Stap 4: Zorg voor conversies van enums en samengestelde waarden

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


## Stap 5: Maak een repository voor de hoofdentiteit

In JPA heb je twee gangbare manieren om een repository te maken. De
eerste manier is om op basis van de *EntityManager* interface een
repository te implementeren.

De EntityManager is een JPA-specifieke wrapper om de Hibernate Session
interface heen. Dus als je met een Hibernate Session (vanuit het vak
Data & Persistenty) kan omgaan, dan kan je ook met een EntityManager
omgaan.

De Chips-repository heeft een voorbeeldimplementatie met behulp van een
EntityManager 

``` java
@Component
public class JpaChipsRepository implements ChipsRepository {

    private final EntityManager entities;

    public JpaChipsRepository(EntityManager entities) {
        this.entities = entities;
    }

    @Override
    public void save(Chips chips) {
        entities.persist(chips);
    }

    //Etc. voor de andere methods
}    
```

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

