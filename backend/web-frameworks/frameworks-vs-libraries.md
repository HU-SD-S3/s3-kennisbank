# Libraries en frameworks

We hebben het tot nu toe veel gehad over modules en modulariteit. Een
groot beoogd voordeel van al deze mooie losse legoblokjes is dat ze
*herbruikbaar* zijn. Maar als modulaire code herbruikbaar is, dan is het
ook hartstikke logisch dat we modules willen (her)gebruiken die door
anderen geschreven zijn.

Uiteraard doen we dit ook al, we gebruiken bijvoorbeeld de \"standard
library\" van onze taal (met in Java bijvoorbeeld Math.random, of
String.format), maar we hebben ook op andere vlakken andermans code
gebruikt, om bijv. JSON te genereren.

We worden dus afhankelijk van deze externe code om de functionaliteit
van onze applicatie te implementeren. In vakyargon zijn we dus *coupled*
aan onze *externe dependencies*. In principe is dit een goede zaak: als
andere mensen mooie herbruikbare code hebben geschreven scheelt ons dat
mooi tijd & moeite. Maar zoals altijd kan je hier juist teveel, of te
weinig gebuik van maken.

Het te weinig gebruik maakt van externe dependencies noemt men wel het
\"Not invented here\"-syndroom. Je wantrouwt alle code die niet uit je
eigen bedrijf komt. Dit heeft als grote nadeel dat je heel veel extra
code zelf zal moeten schrijven. En aangezien het niet je kerntaak is om
bijv. een JSON-serializer te schrijven zal je er veel minder tijd aan
kunnen besteden, en is de kans dat de kwaliteit hieronder lijdt erg
groot.

Aan de andere extreme kant is er het verhaal van [Leftpad
Incident](https://en.wikipedia.org/wiki/Npm_left-pad_incident). Leftpad
was een vrij eenvoudige dependency die simpelweg spaties aan een string
toevoegde. Iets dat je in relatief korte tijd ook zelf nog wel uittypt,
maar niet zo snel als dat je het als externe code van de plank kan
trekken. Je bent echter gekoppeld aan je dependencies, dus als die
dependencies ineens verdwijnen, of onverwachte wijzigingen doorvoeren,
dan heb je mogelijk een groot probleem.

Kortom we moeten altijd op zoek gaan naar de juiste balans hierin. De
stabiliteit van de dependency is hierin de belangrijkste eigenschap.
Daarmee bedoelen we hoe vaak, en/of hoe groot de wijzigingen zijn die je
verwacht te moeten kunnen accepteren. Hoe stabieler de dependency, hoe
minder nadelig het zal zijn om er aan gecoupled te zijn.

Nu zou je kunnen denken \"Maar ik hoef toch niet te updaten? Ik kan toch
gewoon de oude versie blijven gebruiken?\", en soms is dat ook zo.
Echter in veel gevallen zal er vroeg of laat een kritieke bug, of
beveiligingslek ontdekt worden, die je wel dwingt om te upgraden. Al je
dependencies goed up-to-date houden is dus een goede gewoonte.

Binnen deze externe dependencies willen we wel eens onderscheid maken
tussen libraries en frameworks. Dit is geen super-scherp onderscheid,
maar het is nuttig om verschillende perspectieven te hebben. Het
verschil zit in de 'flow of control', hoe kun je een lijn van acties
door je broncode heen trekken.

## Libraries

Libraries zijn vaak wat kleinere pakketjes code, die één gericht
probleem voor je oplossen. Bijvoorbeeld het maken van HTTP requests
(Requests, Python), het genereren van JSON (Jackson, Java), het
uitvullen van Strings (Leftpad, Javascript), of het maken van complexere
berekeningen zoals Annuïteiten (Finmath-lib, Java).

Het belangrijke is dat een library namens jouw code een probleem oplost
of makkelijker maakt. Maar uiteindelijk is jouw applicatie nog nog
steeds *de baas*.

Bij het omgaan met libraries is het belangrijk om te beslissen hoe sterk
je gecoupled wil zijn aan de library. Als je rechtstreeks vanuit jouw
code een library aanroept, en je doet dat op meerdere plekken (stel je
een Python applicatie voor die op meerdere plekken Requests gebruikt om
APIs aan te roepen), dan zul je op al die plaatsen wijzigingen moeten
doorvoeren als de library een onverwachte update uitbrengt. Dan is het
een goed idee om in plaats daarvan een eigen class te schrijven, die
zelf de library aanroept, zodat je later maar op één plek evt.
dependency-problemen hoeft op te lossen.

Verder is het ook van belang om na te denken wat die library precies
vertegenwoordigt. Veel libraries omvatten de interactie met een extern
systeem (zoals een database, een web-API, een barcodescanner, een
webcam, etc.). Juist dit soort externe systemen wil je vaak extra in de
gaten houden, of in (Unit-)tests kunnen vervangen door iets dat
prettiger te testen is. Hier is het dus ook handig om een eigen class
(en evt. een interface) ertussen te schuiven zodat je flexibel blijft in
hoe je applicatie met deze externe systemen omgaat. Zo'n tussenlaagje
noemt men ook wel een *Gateway*.

## Frameworks

Frameworks zijn ook andermans code. Maar in dit geval kiezen we ervoor
om de algemene opzet en structuur van onze applicatie aan het framework
over te laten. Denk bijvoorbeeld aan Java Servlets (BEP1, jaar 1). Je
definiëert een class, zet die op een speciale plek neer, en override de
*doGet* methode. En voilá je code wordt uitgevoerd als er een
HTTP-request binnen komt op een bepaald adres.

Je hebt als programmeur totaal geen zicht op de 'applicatie eromheen',
alleen op jouw kleine onderdeeltje dat je er in hebt geschoven.

Dit is de grote kracht van frameworks, en dat zorgt er voor dat je als
beginnende programmeur al direct alle soorten applicaties ter wereld kan
bouwen. Als het werkt tenminste. Als het niet werkt is het verdraaid
lastig om er achter te komen waarom nou niet.

Het cruciale verschil met een library is dus dat het framework de baas
is. De belangrijkste code in de applicatie, de code die jij schrijft om
de requirements te implementeren, is *niet* de hoofdapplicatie, maar
slechts een handig ingeschoven legoblokje dat aangeroepen wordt door het
framework. Dit noemt men in vakyargon **Inversion of Control**.

## Spring & Spring Boot

Spring is een bekend Java framework uit 2004. In de kern is het een
**Dependency Injection Container**, maar wat dat precies is komen we
later op terug.

Spring is het best te zien als een soort universele kapstok voor Java
code. Wat voor Java code je ook hebt (van GUI-applicaties, Webservices
en Commandline applicaties tot Database libraries en Crypto-miners)
ergens in Spring is wel een ideaal haakje om die code aan op te hangen.

Spring Boot (2014) is een framework om je te helpen met die code
ophangen. Het probleem van zo'n universele kapstok werd namelijk (in de
jaren tussen 2004 en 2014) dat het steeds ingewikkelder werd om te
configureren wat nou precies waar moest hangen, en hoe.

Spring Boot is een framework bovenop Spring die je helpt met standaard
instellingen en zogeheten \"Auto-configurations\". Deze
Auto-configurations kun je voorstellen als dat Spring Boot automatisch
bepaalde stukken code alvast voor je ophangt. Als je bijv. ergens op een
class een *\@RestController* annotatie plakt, dan concludeert Spring
Boot automatisch dat je kennelijk een webapplicatie wil maken (en start
een webserver), en hangt die class dan op de juiste plek in die server.

### Entry Point

Ook al is het framework in principe de baas hoe de applicatie draait. Er
is altijd een baas boven baas. We zullen helemaal aan het begin de
controle aan het framework moeten geven. Met Spring Boot doen we dat zo:

::: listing
``` {.java linenos=""}
    @SpringBootApplication
    public class DemoApplication {
        public static void main(String[] args){
            SpringApplication.run(DemoApplication.class, args);
        }
    }
```
:::

Let er op dat deze class netjes in een (named)package zit. Spring gaat
er vanuit dat al[^1] je code in een named package zit, en dat alle
andere code in hetzelfde package, of een subpackage zit. In iets nettere
bewoording: Spring Boot doet een *Component Scan* startend met het
package waar de \@SpringBootApplication class in zit en al diens
subpackages.

### Hotspots

Uiteraard moet niet alleen het framework opstarten en het zware werk van
ons overnemen. Op een gegeven moment moet het ook de controle weer
teruggeven aan onze eigen stukken code.

Één van de meest eenvoudige zaken om mee te beginnen is een zogeheten
CommandLineRunner (met \@Component erop geplakt). Dat is het Spring
equivalent van de oude *public static void main*.

::: listing
``` {.java linenos=""}
    @Component
    public class StartupRunner implements CommandLineRunner {
        @Override
        public void run(String... args) throws Exception {
            System.out.println("Hello World!");
        }
    }
```
:::

We zien in
[\[code:springhello\]](#code:springhello){reference-type="ref"
reference="code:springhello"} een aantal onderdelen. \@Component zorgt
er voor dat Spring zich bewust wordt van deze class (mits die zich in
het path van de *Component Scan* bevindt zoals eerder genoemd).
Vervolgens weet Spring wat er met deze class gedaan moet worden omdat de
CommandLineRunner interface geimplementeerd wordt: deze class zal
kennelijk op de Command Line simpelweg gerun'd moeten worden.

Uiteraard is dit complete overkill voor een simpele Hello World
applicatie. Maar een CommandLineRunner kan erg handig zijn om bepaalde
opstartlogica te implementeren (bijv. alvast wat dummy-data voor je
applicatie).

Een andere veelgebruikt integratie-punt in deze cursus is de
RestController
([\[code:resthello\]](#code:resthello){reference-type="ref"
reference="code:resthello"}).

::: listing
``` {.java linenos=""}
    @RestController
    public class HelloController {
        @GetMapping("/hello")
        public String hello() {
            return "Hello World!";
        }
    }
```
:::

De \@RestController annotatie, een soort subclass van \@Component, geeft
aan dat deze class methods gaat bevatten die vanuit een HTTP request
aangeroepen moeten kunnen gaan worden. De \@GetMapping even verderop is
zo'n voorbeeld daarvan. Als deze class gevonden wordt in de *Component
Scan*, dan zal Spring een webserver starten (standaard op
<http://localhost:8080>) en daarbinnen een request naar
<http://localhost:8080/hello> doorverwijzen naar deze methode.

## Maven

Een belangrijk punt aan *externe* dependencies is dat ze extern zijn.
Oftewel, de broncode van deze libraries of frameworks zit niet in onze
repository. Vroeger betekende dat goed documenteren welke externe
dependencies je nodig had, en hopen dat de lezer wist waar deze gevonden
en gedownload kunnen worden.

Gelukkig kunnen we (sinds 2004) gebruik maken van Maven, een
command-line tool (maar die ook goed in IDEs geïntegreerd is). Maven is
gebaseerd op het idee van Package Managers van Operating Systems zoals
bijv. [APT](https://en.wikipedia.org/wiki/APT_(software)) voor Linux,
[Chocolatey](https://chocolatey.org/) voor Windows, of
[Homebrew](https://brew.sh/) voor Mac. Dat zijn programmas waar je de
naam van een library of applicatie opgeeft en de Package Manager
installeert het. Dat is vaak veel handiger dan je browser openen, via
google proberen de juiste site te vinden, uitvogelen hoe deze website
nou weer georganiseerd is, een installer downloaden, en op 'next'
drukken totdat de installer tevreden is met je inspanningen.

Wat we willen is in een plain-text document (want dat werkt fijn met
versiebeheer tools zoals *Git*) aangeven welke dependencies er precies
nodig zijn, en dat deze lijst van dependencies dan volautomatisch
gedownload wordt. Maven doet dit door middel van de 'dependencies'
sectie in de *pom.xml* (Pom staat voor Project Object Model[^2]). In de
'dependencies' sectie van je pom staan de zogeheten *Maven Coordinates*
van de externe library die je wilt hebben. Die coordinates bestaan uit 3
dingen: een groupId (wie heeft het gemaakt), een artifactId (hoe heet de
dependency), en tot slot een version. Soms wordt dit opgeschreven in XML
([\[maven:example1\]](#maven:example1){reference-type="ref"
reference="maven:example1"}), soms achter elkaar met dubbele punten
ertussen: *org.junit.jupiter:junit-jupiter:5.10.2*.

Het handige is nu dat als bijv. *junit-jupiter* zelf ook dependencies
heeft (je kunt bijv. in IntelliJ CTRL-klikken op Junit in je pom om die
te zien), dat Maven ook automatisch die dependencies gaat downloaden. En
als die dependencies dan weer dependencies hebben, dan pakt Maven die
ook mee, enzovoorts enzovoorts. Deze dependencies van je dependencies
noemt men ook wel Transitieve Dependencies.

Verder zie je in
[\[maven:example1\]](#maven:example1){reference-type="ref"
reference="maven:example1"} dat ons project zelf ook een volledige set
Maven-coordinates heeft (groupId, artifactId en version). Dat is voor nu
niet relevant, maar als we ooit ons project zouden willen uploaden naar
het publieke internet, dan zijn dat de coordinates waarmee anderen ons
als dependency kunnen toevoegen. Voor nu moet het, omdat het nou eenmaal
verplicht is in Maven om dit op te geven[^3].

::: listing
``` {.xml linenos=""}
<project>
    ...
    <groupId>nl.hu.bep2</groupId>
    <artifactId>casino</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>bep2-huland-casino</name>
    ...
    <dependencies>
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter</artifactId>
            <version>5.10.2</version>
        </dependency>
    </dependencies>
</project>
```
:::

Naast Dependency Management is Maven ook een handige *build-tool*.
Vanuit een IDE als *IntelliJ* merk je er weinig van, maar als je zonder
IDE (en zonder Maven) een Java programma zou moeten compileren, dan zou
je vroeger één voor één *javac Jouw-Class-Hier.java* voor al je
bestanden moeten uittypen. Maven compileert, met het commando *mvn
compile*, automatisch alle bestanden die onder ./src/main/java (en nog
een paar directories zoals bijv. ./src/test/java) staan.

Twee andere belangrijke commandos om te kennen zijn *mvn verify*, dit
draait al je automatische tests, en *mvn package*, dit maakt een mooi
.Jar (Java Archive) bestand van al je gecompileerde code. Zo'n Jar file
is stiekem gewoon een .zip bestand (die je dus ook als zip kan
uitpakken) met al je gecompileerde .class files.

Maven is een oude, uitgebreide tool en heeft dus nog allerhande andere
functionaliteiten (zoals het hosten van een documentatie website), en
nog vele subtiliteiten (zoals de \"dependencymanagement\" sectie, die
weer totaal anders werkt dan de \"dependencies\" sectie), en dan hebben
we het nog niet eens over het concept Lifecycles gehad. Maar voor nu
weet je genoeg om met Maven te gaan stoeien.

### Maven, Dependencies & DependencyManagement {#maven-dependencies-dependencymanagement .unnumbered}

We hebben hierboven uitgebreid zitten praten over hoe Maven-coordinates
altijd uit drie delen bestaan (GroupId, ArtifactId, Version), en dan
vervolgens ziet het eerste voorbeeld van Spring er uit als in
[\[maven:spring\]](#maven:spring){reference-type="ref"
reference="maven:spring"}. Daar staat geen version, en toch snapt Maven
je? Hoe kan dat?

::: listing
``` {.xml linenos=""}
<project>
        ...
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
    </dependencies>
</project>
```
:::

De truuc zit 'm in een ander stuk van deze pom:

## Samenvatting

We hebben het kort gehad over externe code, en dat je dat grofweg kan
verdelen tussen libraries en frameworks. Bij libraries blijf jij
grotendeels 'de baas' over hoe de structuur van de applicatie er uit
ziet, maar bij frameworks kies je er voor om hun standaard-aanpak te
volgen. Die standaard aanpak laat zich uitbreiden door middel van
zogeheten \"hot spots\" (of extension points); plekken waar jij jouw
code in het framework kan \"ophangen\".

Het framework dat we in dit vak gebruiken is Spring, en we gebruiken
Spring Boot om Spring wat makkelijker te kunnen configureren en
opstarten.

Libraries en frameworks zijn vaak geschreven door derden. Dus je hebt
een manier nodig om duidelijk aan te geven welke je gebruikt, en
idealiter ook iets dat ze automatisch binnenhaalt. Dat zorgt er voor dat
jouw code direct uit een Git-repository bruikbaar is, en er niet eerst
nog allerlei spul geïnstalleerd hoeft te worden. Maven is een stuk
gereedschap dat dit probleem oplost.

[^1]: Ok, bijna al je code, maar deze randgevallen wil je echt niet
    opzoeken, geloof me.

[^2]: Een niet bijzonder behulpzame naamgeving. Dus voel je vrij om aan
    het Surinaamse gerecht te denken, dat doe ik ook...

[^3]: De toevoeging SNAPSHOT aan het versienummer is een Maven-gewoonte
    om aan te geven dat de versie 'onstabiel' is. Technisch houdt niets
    je namelijk tegen om dezelfde versie opnieuw te uploaden, maar met
    stiekeme wijzigingen. Dat zou echter erg verwarrend zijn voor mensen
    die jouw code gebruiken. Met de toevoeging \"-SNAPSHOT\" geef je
    expliciet aan dat je nog wel wat wijzigingen van plan bent door te
    voeren.



## Spring Boot

Spring Boot is een veelgebruikte standaardconfiguratie van het Spring
framework. Vanaf gaan we ons mooie java-domein-model aanspreken met een
echte Webservice.

In deze fase gebruiken we al wel de HTTP-functionaliteit van Spring
(@RestControllers), maar de database is er nog niet. Daarvoor gebruiken
we een In-memory nep-implementatie. Voorlopig zal dus alle data ge-reset
zijn elke keer dat je de applicatie opnieuw opstart (maar geen zorgen
dat pakken we later weer op!).

### Project Structuur

Ondertussen is de mappen- en packagestructuur onder `src/main/java` een
stuk uitgebreider geworden:

Het project is dus eerst opgedeeld in verschillende componenten en
vervolgens in lagen. In lagen kunnen we zaken weer groeperen in
deelsystemen. Deze componenten en lagen kunnen we weergeven als
packages, zie
Figuur [1.1](#fig:uml-casino-physical-layers){reference-type="ref"
reference="fig:uml-casino-physical-layers"}.

![Components en layers kunnen met packages worden aangewezen binnen het
casinoproject.](uml-casino-physical-layers){#fig:uml-casino-physical-layers
width=".6\\linewidth"}

#### Componenten

Een component is een opzichzelfstaand onderdeel van een softwaresysteem
dat ziet op een bepaald deelgebied aan functionaliteit, bijvoorbeeld op
een bepaald subdomein.

Het component bevat een aantal domeinobjecten. De communicatie wordt
aangeboden via een service (ook: *facade*). Deze service kan worden
aangesproken door andere services, maar ook door bijvoorbeeld een
controller of een commando uit een commandline interface. De controller
is bedoeld om HTTP-communicatie om te zetten naar Java code en vice
versa. Andersom praat het component alleen met de buitenwereld, zoals
een database, via een *gateway*.

In ons project maken we gebruik van Spring om controllers te schrijven.
Deze controllers kunnen dan door Spring worden aangeroepen wanneer een
bepaald web request moet worden afgehandeld. Aan de andere kant maken we
later ook gebruik van Spring om te voorzien in de data-opslag aan de
hand van repositories.

#### Lagen

Een applicatie, of een deel ervan, is vaak opgedeeld in lagen die elk
verantwoordelijk zijn voor een ander soort logica binnen het systeem.
Het afhandelen van gebruikersinteractie is bijvoorbeeld iets heel anders
dan het uitdelen van kaarten in een kaartspel of het opslaan van een
speelronde. Een gelaagde structuur helpt niet alleen met het terugvinden
van bepaalde klassen op basis van het soort logica dat het betreft. Bij
een losgekoppeld ontwerp kunnen lagen of onderdelen ervan gemakkelijk
uitgewisseld worden.

Gelaagde architecturen komen in verschillende soorten en maten. Sommige
applicaties zijn eerst opgesplitst in componenten en vervolgens
ingedeeld in lagen. Andere zijn eerst opgesplitst in lagen, waarin
vervolgens losse componenten zijn te bespeuren. Het aantal lagen kan
variëren tussen de twee en vijf lagen. Dit hangt af van de verschillende
soorten logica en de specifieke architecturele eisen van de onderdelen
binnen een project.

Deze packages corresponderen met de volgende soorten logica:

-   *Presentation*: Presentatielogica. In het geval van een back-end API
    tref je hier alles aan dat hoort bij de technische vertaling van web
    requests naar Java-code. Controllers (web request handlers) worden
    aangeroepen door het Spring framework zodra een HTTP-request
    binnenkomt met een gedefinieerde route (HTTP-method + URL).

-   *Application*: Taakspecifieke logica. Hierin zitten
    applicatieservices (*facades*) die use cases omzetten naar
    domeinacties met behulp van infrastructuurabstracties. Een
    applicatieservice ziet vaak op één centraal domeinobject dat is
    opgebouwd uit of verwijst naar andere domeinobjecten. Door een
    applicatielaag in te richten kan dezelfde logica geboden worden
    onafhankelijk van de gebruikte technologie in de presentatielaag:
    command line commando's, GUI's, web controllers of message handlers.

-   *Domain*: Domeinlogica. Domeinconcepten, business rules en
    entiteiten vind je vaak in lagen met deze verantwoordelijkheid.

-   *Data*: Infrastructuurabstractie. Hierin zitten meestal interfaces
    of abstracte klassen die door infrastructuurklassen moeten worden
    ingevuld (*gateways*).

Probeer voor jezelf de volgende vragen te beantwoorden, eventueel door
naar de code te kijken. Welke klasse is verantwoordelijk voor de
vertaling van HTTP-verkeer naar Java en andersom? In welke klassen zal
je de use cases van dit component terugzien? In welke methode wordt het
aantal chips verminderd bij een afschrijving? Hoe denk je dat de opslag
geregeld is? Stel een ander component binnen ons systeem wil Chips
opnemen voor een user, welke klasse wordt dan eerst aangesproken?

Je mag dit met docenten en medestudenten overleggen, maar het antwoord
op deze vragen zal naar verloop van tijd duidelijker worden.

#### Kanttekening: Geen écht lagenmodel {#kanttekening-geen-écht-lagenmodel .unnumbered}

Het casinoproject is opgezet met de verschillende soorten logica in
gedachten. Als je het lagenmodel echter strikt zou toepassen op
Figuur [1.1](#fig:uml-casino-physical-layers){reference-type="ref"
reference="fig:uml-casino-physical-layers"}, zie je een overtreding in
de laatste twee lagen van elk component. Hier gaan we later in dit
collegejaar op in (bij de cursus **Software Architecture**), maar
misschien wil je hier al wat meer over weten.

De datalaag bestaat weliswaar slechts uit interfaces die door Spring
geïmplementeerd worden, maar ze zijn afhankelijk van objecten
(entiteiten) die gedefinieerd zijn in het domein. Logisch gezien zou je
het project daarom eerder beschouwen als een drie-lagen-architectuur! De
laatste laag zou dan conceptueel zowel domeinlogica als
infrastructuurabstracties bevatten. Deze laag is dan fysiek (in onze
code) opgedeeld in twee Java packages om de abstracte, stabiele kern
(domein) te scheiden van de meer flexibele aansluiting met
infrastructuur via interfaces (data). Het casino-project kent verder een
flexible layered architecture: je mag lagen overslaan. Zo mag je in de
presentatielaag exceptions uit het domein afhandelen zodat een
HTTP-response de juiste statuscode kan hebben (door middel van
ResponseStatusExceptions). Dit is in veel gelaagde architecturen niet
het geval. In die architecturen heeft een laag alleen koppeling met de
laag rechtstreeks eronder. In ons project is dit niet nodig. Het scheelt
een hoop extra code en we tolereren de extra koppeling.

![Het logisch en fysiek lagenmodel binnen het componenten van het
casinoproject.](casino-layers){#fig:casino-layers width=".7\\linewidth"}

Als je de realisatie toch meer wil afstemmen op de laging, zou je de
data-objecten en domein-objecten van elkaar splitsen en deze als losse
objecten opnemen in de datalaag. Daarvoor moet je dan daartussen een
vertaalslag aanbieden. Als alternatief zou je de
infrastructuur-abstractie (de repositories) kunnen opnemen in het domein
en dat *data* package verwijderen. Ook zou je kunnen verbieden dat er
lagen worden overgeslagen. In ons project passen we deze regels echter
niet zo strikt toe: we accepteren een lichte koppeling op het framework
en op ons domein.

#### Subsystems

Een laag kan nog verder worden opgebroken in subsystems (of
*deelsystemen*). Dit zijn algemene packages die zijn bedoeld om een
reeks objecten samen te verpakken.

### Voorbeeld: Structuur binnen het chips-component

Elk component is in lagen opgedeeld. In het chips-component ziet dat
eruit zoals in Figuur [1.3](#fig:chips-layers){reference-type="ref"
reference="fig:chips-layers"}.

![De semi-gelaagde structuur binnen het
chips-component.](chips-layers){#fig:chips-layers width="80%"}

### Applicatieflow

Hoe loopt de flow binnen de de lagen in een component? Laten we daarvoor
een blik werpen op de *deposit use case* van het Chips-component. Zie
Figuur [1.4](#fig:chips-sequence-diagram){reference-type="ref"
reference="fig:chips-sequence-diagram"}.

![De flow voor de deposit use case van het
Chips-component](chips-sequence-diagram){#fig:chips-sequence-diagram
width="\\linewidth"}

Kijk ook in de code of je dit kunt herkennen! Allereerst moet een
HTTP-client een POST-verzoek doen naar `/chips/deposit`. We willen
namelijk een overmaking toevoegen aan de chips resource voor de huidige
gebruiker. In dat POST-verzoek wordt de huidige gebruiker meegegeven via
een JWT-token in de Authorization header als deze is ingelogd.

Vervolgens zet Spring Web dit verzoek om naar de bijbehorende
controlleractie op de *ChipsController* in de presentatielaag, met de
nodige informatie over de gebruiker (*Authentication*) en de data die in
de HTTP JSON Request Body zit (het *Deposit* data transfer object). De
controller haalt de nodige data uit deze objecten en zet dit om naar een
aanroep op de *ChipsService* in de applicatielaag. Deze ChipsService
bevat allerlei methoden die de use cases van het Chips-component
vertegenwoordigen. De service roept de *ChipsRepository* aan uit de
datalaag om de hoeveelheid *Chips* op te vragen voor de betreffende
*User* (op basis van de username). Vervolgens roept de service de
*deposit*-methode aan op de Chips om het aantal chips te verhogen met de
gekozen hoeveelheid en wordt het *Chips* object weer opgeslagen in de
*ChipsRepository*. Ten slotte geeft de service een *Balance* terug door
de benodigde data uit het *Chips*-object te halen en dit in een nieuw
*Balance*-object te stoppen. De controller geeft ook deze *Balance*
terug aan Spring Web, waarop deze de *Balance* omzet naar een HTTP JSON
Response Body aan de hand van diens getters.

Voor het blackjack-component zou het ideaal zijn als wij ook één
centraal object hebben om op te halen, domeinacties op uit te voeren en
weer weg te schrijven. Het aan elkaar knopen daarvan kan gebeuren in use
cases aangeboden in een BlackjackService!

### Frameworks

Een *framework* is code van anderen die je een hoop werk uit handen
nemen ten aanzien van een of meer functionaliteiten. Het is een
concrete, herbruikbare standaardoplossing. Kenmerkend aan een framework
is dat je als developer een deel van de controle uit handen geeft. Er is
sprake van *inversion of control*: het framework roept onze code aan op
bepaalde plekken. Interactie met het framework vindt op twee plaatsen
plaats:

1.  Entry points: hier roepen we het framework aan

2.  Hot spots: hier haken we onze eigen code in het framework en roept
    het framework onze code aan

Er zijn twee soorten hot spots, die je kan herkennen vanuit het
objectmodel:

1.  Composition hot spots: integratie van het aan een interface meegeven
    van implementerende dependencies

2.  Inheritance hot spots: integratie via het overerven van een
    vooropgezette klassenstructuur

Beide vormen komen vaak voor in een framework.

In Spring herkennen we de `CasinoApplication` als entry point. Deze is
geannoteerd met `@SpringBootApplication`. Vervolgens laadt Spring
allerlei configuratie in, voert het een componentscan uit en klikt het
dependencies in elkaar. Spring's dependency injection is één van de
composition hot spots die te vinden zijn in Spring, terwijl Spring's
repositories een vorm zijn inheritance hot spots.

### Dependency injection

Dependency injection is niets anders dan het meegeven van
afhankelijkheden, in plaats van ze binnen de klasse aan te maken. Dit
zorgt ervoor dat een klasse makkelijker uitbreidbaar en testbaar is.
Hierover in een latere cursus meer.

In Spring maken we services aan door de klasse te annoteren met de
`@Service` annotatie. We kunnen met dependency injection werken door de
services (en opslagmechanismen) waarvan we afhankelijk zijn aan te geven
in de constructor. Spring vindt dan automatisch welke services we
bedoelen. Dit heet *autowiring*. Spring gaat tijdens een opstarten van
de applicatie door onze code op zoek naar `@Bean`, `@Component`,
`@Service`. Dit noem je Beans. Spring kijkt voor de dependencies naar de
constructor en de benodigde interfaces en kijkt of er Beans zijn
geconfigureerd die aan die interface voldoen. Met autowiring injecteert
Spring de benodigde afhankelijkheid dus automatisch!

Kijk voor een voorbeeld wederom in het Chips-component.

Als alternatief voor constructor-injection kan je ook werken met de
`@Autowired` annotatie op setters, constructor parameters of properties.

Als we meerdere implementaties hebben van dezelfde interface
(bijvoorbeeld omdat we een testimplementatie hebben), dan moeten we
specifiek aangeven welke service we willen gebruiken. Dat kunnen we doen
met de `@Qualifier` annotatie op zowel de service als binnen de
constructor. Daarmee kwalificeren we om welke implementatieklasse het
gaat door dit aan te geven boven elke `@Service` en vóór elke parameter
in de constructor die de service gebruikt.

Met `@Value` kan je aangeven dat een waarde moet worden geïnjecteerd,
afkomstig is uit configuratie.

## Libraries

Een library is ook een voorbeeld van een concrete, herbruikbare
standaardoplossing. Het belangrijkste verschil tussen een library en een
framework is dat een framework veel meer controle opeist. Een library
wordt door onze code aangeroepen terwijl een framework uiteindelijk onze
code aanroept (inversion of control).

Wel zie je vaak dat een framework gebruik maakt of zich openstelt voor
verschillende libraries door middel van composition hot spots. Vaak heb
je dan een adapter nodig om de interface van het framework aan te passen
aan de geboden facade van de library. Dit zijn voorbeelden van design
patterns. Hier gaan we het later uitgebreid over hebben.