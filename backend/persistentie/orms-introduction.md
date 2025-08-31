# Persistentie

Een webapplicatie is standaard (/idealiter) stateless. Dat betekent dat
(wat de backend betreft) elk request helemaal uit het niets komt. Alle
informatie die nodig is om dat request af te handelen moet in dat
request zitten.

Als een webapplicatie echt stateless is, betekent dit dat we op elk
moment de applicatie zouden moeten kunnen herstarten, en dat we dan
gewoon verder kunnen waar we gebleven waren (er was immers geen toestand
in het geheugen die door de herstart verloren is gegaan).

Dit is voor webapplicaties van belang, omdat we vaak in het echt een
beetje willen kunnen sjoemelen met het opstarten en afsluiten van
applicaties. Het internet is namelijk 24/7 open, en iedereen kan bij
elke website. Als het druk is willen we misschien alle requests over
meerdere servers opsplitsen, en als we een update uitvoeren willen we de
applicatie even afsluiten, updaten, opstarten, en dan direct weer door.

Toch willen we in onze webapplicatie met data om kunnen gaan. Een
applicatie die altijd alles vergeet heb je niet zo gek veel aan. We
willen dus dat na een herstart belangrijke data opgeslagen is geweest.
We willen dat die data blijvend (persistent) is. Meestal gebruiken we
een database hiervoor. En meestal is dat een \"relationele database\",
zoals bijv. PostGres.


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

## Domeinmodel versus datamodel

### Object-relation impedance mismatch

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

## Spring JPA en Hibernate

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


### Entities

#### Ids {#ids .unnumbered}

### Relaties

#### Cascades {#cascades .unnumbered}


### Repositories [_repositories]

Dit is een pattern dat zeer wijdverspreid is. De repository is bedoeld
als een hele simpele kijk op persistentie, eentje gebaseerd op een
collectie zoals List, Map, etc.

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

De gedachte achter de collectie-abstractie lijkt een beetje op die van
een garderobe. Je geeft je Entity (je jas) aan de Collection (de
garderobe) en je krijgt een Id (een kaartje) terug om 'm later ooit weer
op te halen. De vergelijking loopt een beetje mank omdat een
persistentiestore vaak een kopie van je jas houdt, en je zelden aan een
garderobe de opdracht kan geven om je jas te vernietigen (remove), maar
in de basis is het vergelijkbaar.

Ter vergelijking, de Spring JpaRepository heeft bijna 40(!) methods EN
een framework om custom-queries op basis van methode-namen te genereren,
dus dat is een veeeeel uitgebreidere interface die …​ niet echt meer
dezelfde *simpele* gedachte uitdrukt.

Een ander belangrijk detail is dat de repository nu nergens uitdrukt
*wanneer* entities worden opgeslagen. Vanuit het begrip van de
Repository kun je een Entity uit de repository halen, wijzigingen
uitvoeren op die Entity, en in principe mag je er vanuit gaan dat dit
allemaal netjes opgeslagen wordt (want je entity zit in de repository,
dus er is een persistentie-verplichting). In de praktijk zit er vaak een
soort *flush* methode bij die er voor zorgt dat die synchronisatie *nu*
gebeurd (In Spring doen we dit vaak met *@Transactional*, in plaats van
expliciete flushes).

Al met al is het de bedoeling dat je ooit een Entity aan een Repository
toevoegt, dat je je daarna geen zorgen over persistence meer hoeft te
maken. Dit idee noemen we *Persistence Ignorance*
<span class="citation">([Evans, 2004](#evans_ddd))</span>.

### Transacties en het belang van goed doortrekken

[^1]: WSL 2 om precies te zijn
