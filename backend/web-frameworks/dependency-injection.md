# Services en dependency injection

Een terugkerend thema tot nu toe is dat we onze code flexibel willen
houden. In Java kennen we het verschil tussen een Interface (wat kan een
object allemaal doen), en de Implementatie daarvan (hoe dan?!).

## Services in Software Architectuur

We hebben onze Software al sinds het begin van de opleiding in lagen
ingedeeld. De belangrijkste eerste verdeling was tussen \"De
presentatielaag\" en \"De rest van de applicatie\". In een standaard GUI applicatie
bepaalt de presentatielaag hoe dingen eruit zien (bijv. knopjes,
kleuren, schermen etc.), en daar hebben gebruikers gewoon standaard heel
veel (en veranderende!) meningen over.

In een standaard webapplicatie is het ook prima om (op een uitgezoomed
niveau) de Frontend als een presentatielaag te zien. Lange tijd was dat
ook de standaard, maar zowel de Frontend applicatie als de Backend
applicatie zijn de afgelopen jaren zoveel complexer geworden (want onze
gebruikers worden veeleisender), dat het standaard is geworden om de
Frontend applicatie (met een framework als React, Vue, Angular of wat
dan ook) als geheel aparte applicatie te zien, van de Backend
webservice.

Als we dus los naar onze Backend webserivce applicatie kijken, dan heeft
die ook een \"Presentatielaag\", namelijk wat voor URLs, parameters en
andere HTTP zaken (Headers, Verbs, daarover later allemaal meer) er
ondersteund worden. De \@RestControllers (of in oudere frameworks de
Servlets) bepalen de buitenkant van de applicatie.

En nog steeds willen we die buitenkant graag loskoppelen van de rest van
de applicatie. Als we een usecase geimplementeerd hebben, zodanig dat
deze vanuit een HTTP-Request (dmv. een \@RestController) kan worden
aangeroepen, dan is het helemaal niet onredelijk om te verwachten dat er
misschien ook een GUI of commandline applicatie voor Admins is die
soortgelijke acties ook kan uitvoeren. Hoe dan ook is het altijd erg
handig om automatische tests te kunnen aansluiten op de implementatie
van zo'n usecase, en als je het begrip een beetje breed interpreteert is
een Unit-Test ook gewoon een prima buitenkant (en daarmee een
\"Presentatielaag\").

Binnen die \"De rest van de applicatie\" willen we vaak ook een onderscheid maken tussen
Applicatie-logica en Domein-logica. Met domein-logica bedoelen we alle
regels en gekkigheden die optreden binnen het onderwerp waar de
applicatie over gaat (wanneer is een cijfer voldoende, wanneer komt een
klant in aanmerking voor korting, etc.) loskoppelen van de
applicatie-logica (hoe logt een gebruiker in, hoe slaan we onafgeronde
bestellingen op, hoe loggen we errors, etc.). Het verschil tussen domein
en applicatielogica is een grijs gebied, en het loopt vaak in elkaar
over. Maak je dus over dat grijze gebied niet teveel zorgen, dan maak je gewoon een keuze (en je zult altijd developers tegenkomen die
je maar wat graag vertellen dat het *overduidelijk* die andere keuze had moeten zijn). 
Wanneer het winkelmandje van een webwinkel verloopt kun je
bijvoorbeeld als zowel domeinlogica als applicatielogica zien.

Die applicatielogica stoppen we graag in een Applicatielaag (ook wel
\"Taakspecifieke laag\" of gewoon \"Servicelaag\" genoemd). Deze
applicatielaag ligt bovenop de domeinlaag stuurt onze Domeinlaag op
verschillende manieren aanstuurt om zo de kern-diensten (services!) van
de applicatie te realiseren.

Kortom het is handig om de diensten die onze applicatie aanbiedt als
losse dingen te modelleren. Zodat we die kunnen combineren op
verschillende manieren. Dat is de essentie van het ontwerpen van
Services.

Een andere standaard laag die vaak besproken wordt is de Data-laag, daar
komen we in het hoofdstuk Persistentie uitgebreider op terug.

### Servicelagen, domeinlagen en Unit Tests

In dit hoofdstuk zeggen we dat de Applicatielaag handig is voor Unit
Tests. Terwijl we ook vaak zeggen dat het belangrijk is om je Domeinlaag
te testen!

Hoe zit dat nou?

Het flauwe antwoord is dat beide handig is. Omdat de applicatielaag zo
belangrijk is wil je dat daar goede tests voor zijn. Maar omdat de
applicatielaag vaak erg veel doet is het ook vaak lastig dit heel goed
te testen. We willen bijvoorbeeld voor een webwinkel zeker een paar
belangrijke scenarios testen in de applicatielaag (kunnen we producten
bestellen, wordt alles goed verwerkt, wordt er korting toegepast, etc.).

Maar als we een ingewikkeld systeem hebben waarbij vaste klanten via één
of andere berekening korting krijgen, dan is het vaak welliswaar
mogelijk dit te testen via de applicatielaag, maar het is gewoon veel
meer werk dan deze logica direct in de Domeinlaag te testen, omdat je
dan alleen de classes hoeft te testen die bij dat kleine deel van het
proces horen.

Het doel van testen is dat je vertrouwen krijgt dat je code foutloos zal
werken in een productie-omgeving. Dus je kiest waar en hoe je het test
op basis van een goed compromis tussen dat vertrouwen en ouderwetse
gemakzucht.

>Gemakzucht\... niet echt natuurlijk. 
>
>Wij worden als programmeurs betaald voor werkende features, niet voor werkende tests. 
Een deel van het kiezen van het juiste testniveau is dus op een professionele
manier omgaan met \"de baas z'n centen\".
>
>-Tom

### Services in Spring Boot

Een Service-class in Java lijkt in veel opzichten gewoon op een
ordinaire class. Zo heeft het methods en fields, maar de smaak is vaak
een beetje anders. Een Person class heeft misschien een naam, en een
favoriete smaak ijs, die gedurende het leven van een object regelmatig
verandert.

Een pure Service-class is vaak echter wat statiger. Het is vooral een
aanspreekplek voor methods, en zodoende zal er in de fields van een
Service vaak (niet zoveel) *data* staan, maar meer andere, meer
specialistische technische dienst-classes, om naar door te kunnen
verwijzen.

Je zou het kunnen vergelijken met een soort hoofdaannemer. Jij wil als
client gewoon een Huis (of een fietsenstalling, of een badkamer, of wat
dan ook). De aannemer heeft een netwerk van allemaal timmermannen,
metselaars, installateurs en stucadoors

Meestal vertaalt een Service class wensen uit de presentatielaag naar de
domeinlaag, en stuurt daarbij de meer technische classes aan. Je
domeinlaag bestaat vaak uit POJOs (Plain Old Java Objects), en die
technische diensten heb je vaak verstopt achter een interface.

Zo heeft de Chips-service in het casino toegang tot een
Chips-repository, voor persistentie. Misschien zou een toekomstige
versie nog waarschuwingen kunnen versturen (middels een
Notifaction-interface, waarachter dan mails, smsjes of wie-weet kan
liggen; dat is het mooie van interfaces!).

Kortom een Service class heeft mooie methodes die representeren wat een
applicatie allemaal kan.

## Dependency injection

Dependency Injection is een ingewikkelde term voor een (achteraf...)
vrij simpel idee. Veel classes, en vooral (maar niet alleen) het soort
Service classes zoals we hierboven beschreven zijn afhankelijk van
andere classes om hun werk te doen. Ze hebben dependencies.

De meest voor de hand liggende methode om in een OOP taal als Java aan
die dependencies te komen is om zelf de benodigde constructors aan te
roepen.


```java
    @Service
    public class RegistrationService {
        private final MailChimpMailer mailer;
        private final PostGresRegistrationRepository registrations;
        private final KpnAdresCheckerAPI adresChecker;

        //Geen Dependency Injection
        public RegistrationService(){
            //Wat sommige van die parameters doen... geen idee, dan moet je echt de details in duiken...
            this.mailer = new MailChimpMailer("https://blabla", "some-user-name", "some-password", true, 42);
            this.registrations = new PostGresRegistrationRepository("localhost", "15432", "db-user", "db-password");
            this.adresChecker = new KpnAdresCheckerAPI("https://blabla", "een-of-andere-API-key");
        }

        public void Register(...){
            //En dan doen we hier iets met al die private fields
            ...
        }
    }
```

Zoals we hierboven zien neemt deze RegistrationService class alle
verantwoordelijkheid om alle technische zaken zelf netjes te regelen.

Dat heeft als grote voordeel dat het 'lekker makkelijk' is om zo'n
Service te constructen (want geen parameters). Het heeft ook nadelen,
want stel we willen in een andere class rapporteren over de registraties
die gedaan zijn, dan moeten we in code heel goed gaan controleren of
daar wel degelijk met dezelfde database geconnect wordt.

Verder is deze Service class ook weinig flexibel. Het is nagenoeg
onmogelijk om hier bijv. goede automatische tests voor te schrijven
(want je moet op één of andere manier calls naar 2 APIs en een echte
database zien gaan onderscheppen. Dat kan, maar is niet makkelijk, of
leuk).


Laten we het iets beter maken:
```java
    @Service
    public class RegistrationService {
        private final MailChimpMailer mailer;
        private final PostGresRegistrationRepository registrations;
        private final KpnAdresCheckerAPI adresChecker;

        //Dit is technisch gezien Dependency Injection, alleen niet zulke goede
        public RegistrationService(
            MailChimpMailer mailer, 
            PostGresRegistrationRepository registrations,
            KpnAdresCheckerAPI adresChecker
            ){
            this.mailer = mailer;
            this.registrations = registrations;
            this.adresChecker = adresChecker;
        }

        public void Register(...){
            //En dan doen we hier iets met al die private fields
            ...
        }
    }
```

We hebben hier in elk geval al die configuratie weg kunnen duwen (zodat dat
netjes op één centrale plek geregeld kan worden).

Dat is mooi, maar het grote probleem hier is dat we met een hele kleine
wijziging onszelf veel meer flexibiliteit kunnen geven. Als we toch al
niet verantwoordelijk zijn voor exact hoe bijv. die repository
geconfigureerd is, willen we dan wel verantwoordelijk zijn dat het
altijd exact een PostGres database moet zijn?


Het standaardpatroon wordt dus:
```java
    @Service
    public class RegistrationService {
        private final Mailer mailer;
        private final RegistrationRepository registrations;
        private final CheckerAPI adresChecker;

        //Nette standaard DI, aangenomen dat deze parameters Java-interfaces zijn
        public RegistrationService(
            Mailer mailer, 
            RegistrationRepository registrations,
            CheckerAPI adresChecker
            ){
            this.mailer = mailer;
            this.registrations = registrations;
            this.adresChecker = adresChecker;
        }

        public void Register(...){
            //En dan doen we hier iets met al die private fields
            ...
        }
    }
```

Het enige verschil met eerdere voorbeeld is
dat we alle concrete classes in onze parameters en fields hebben
vervangen met Java interfaces.

Dit levert een flexibel ontwerp op, wat (als je er een beetje aan gewend
bent), ook dienst doet als vrij leesbare documentatie. Elke
(Service-)constructor gaat een klein, maar netjes lijstje bevatten aan
exact de interfaces die nodig zijn om de rol te vervullen.

Dit heet met een sjiek woord \"Constructor Injection\", en het is de
standaard manier om Dependency Injection te implementeren (denk 90+% van
de gevallen).

Voor de volledigheid lichten we ook de andere mogelijkheden kort(!) toe.
Voor details verwijzen we naar [Seemann, Dependency Injection in .NET 
](#@SeemannDependencyInjection).

1.  Constructor Injection

2.  Property Injection

3.  Parameter Injection

4.  Ambient Context

5.  Service Locator (Anti-Pattern!)

Constructor injection betekent dat je alle benodigde dependencies in je
constructor vraagt zoals we gezien hebben. Dit is bijna altijd de juiste
optie. Het grote nadeel van Constructor Injection is dat je het risico
loopt gigantisch grote constructors te krijgen. Mijn advies zou zijn om
te mikken op max. 4-6 constructorparameters (een richtlijn, geen wet).
Als je meer nodig hebt, dan is de kans groot dat jouw class gewoon
teveel verschillende dingen probeert te doen (de S van SOLID). Hoe dan
ook is het goed om wat standaard alternatieven voor
constructor-injection te kennen, want als je alleen maar een hamer hebt,
lijkt straks alles op een spijker.

Soms is er sprake van Optionele Dependencies (stel het mailtje na een
registratie is niet zo boeiend), dan is het een beetje lelijk om in je
constructor een Dependency te vragen, die je misschien helemaal niet
nodig hebt! Dan biedt Property Injection een uitkomst.

``` java
    @Service
    public class RegistrationService {
        private final Mailer mailer;
        private final RegistrationRepository registrations;
        private final CheckerAPI adresChecker;

        public void setMailer(Mailer mailer){
            this.mailer = mailer;
        }

        public RegistrationService(
            RegistrationRepository registrations,
            CheckerAPI adresChecker
            ){
            //We vullen een default-waarde in, anders moeten we straks op Null checken
            //Dan is het veiliger te zorgen dat er altijd -iets- is.
            //Ook al zal deze implementatie, als we gokken adhv. de naam, nooit
            //daadwerkelijk een mailtje sturen.
            this.mailer = new NeverActuallyMailMailer();
            this.registrations = registrations;
            this.adresChecker = adresChecker;
        }

        public void Register(...){
            //En dan doen we hier iets met al die private fields
            ...
        }
    }
```

In dit voorbeeld zien we dat we in de constructor niet meer
een Mailer als parameter vragen. Maar dat we een setter exposen. Wel
zorgen we er voor dat er een goede default implementatie beschikbaar is,
door (in dit geval) een NoOp implementatie in ons private field te
zetten. (Dit heet ook wel het Null-Object Design Pattern)

De volgende is Parameter Injection. Stel nou dat onze RegistrationService een method
of 15 heeft...en van die 15 methods gebruikt alleen de register method
de AdresChecker. Dat is vanuit het perspectief van Cohesie niet zo
handig, want al die andere 14 methods hebben die dependency niet nodig!
En toch vragen we 'm in de constructor. Dat is dus erg onvriendelijk in
het gebruik als je een stuk code wilt schrijven dat tevreden is met
alleen die 14 andere methods.

In dat soort gevallen kan Parameter Injection een uitkomst bieden. In
plaats van dat we dan die technische dependency in de constructor
vragen, vragen we 'm alleen als parameter in die ene method die dat
nodig heeft. Dan is de cohesie van onze RegistrationService class beter.
Het nadeel is dat je register method ineens naast allerhande
data-parameters (wie registreert zich, waarom, etc.) ook een technische
service als parameter heeft.

Dan blijven er nog twee soorten over: één twijfelachtige, en één
gevaarlijke. Soms heb je dependencies (bijv. om de werking van je
programma te kunnen loggen) echt *overal* nodig. Dan is het best
irritant om dezelfde dependency (de Logger) in alle constructors van al
je classes toe te voegen.

Dit is een geval waarin het oude Singleton-pattern nog een goede rol kan
hebben. Er is dan een globaal toegankelijke variabele (een public static
getter) die je overal kan aanroepen om bijv. je applicatie van logging
te voorzien. Dit noemt men in DI-literatuur wel een \"Ambient Context\".

Tot slot is er nog iets dat je zeker weten niet moet doen. En dat stond
vroeger bekend als het Service-Locator (of Service Registry) Design
Pattern. In dat Anti-Pattern is er één publiek toegankelijke variabele
die al je dependencies kan teruggeven. Een soort super-telefoonboek.

Dat is heel krachtig, en voelt (voor kleine applicaties) superhandig.
Maar omdat dat telefoonboek overal toegankelijk is, heb je totaal geen
controle meer over waar wat in je applicatie iets gebeurd. Elke class
kan immers op elk moment dat telefoonboek pakken, en alle
functionaliteit van de hele applicatie aanroepen.

Service Locator & Control Freaks zijn bijna altijd foute boel. Ambient
Contexts zijn twijfelachtig. In de eerste editie van
[@SeemannDependencyInjection] is het nog een Design Pattern (goed), in
de tweede editie een Anti Pattern (slecht). Het grote verschil is dat
Ambient Context, je 1 dependency geeft als global variable, maar Service
Locator geeft er heel veel. En global variables zijn vroeg of laat
ellende.

#### Dependency Injection & Inversion of Control

Er is een lange geschiedenis van verwarring en verwisseling tussen de
termen Dependency Injection en Inversion of Control. Het is handig
hiervan op te hoogte te zijn, aangezien je bij het lezen van
documentatie of literatuur er soms rekening mee zult moeten houden dat
deze termen verwisseld of door elkaar gebruikt worden.

In deze tekst proberen we vrij consistent met Inversion of Control het
idee van 'Control flow' aan te duiden. Waar normaal gesproken jouw
*main* method en daaruit voortvloeiende code de globale werking van het
programma aanstuurt, is die controle omgedraaid (inverted) als je direct
de controle overdraagt aan bijv. een framework als Spring.

Dit idee zie je ook terug bij bijvoorbeeld het Observer Pattern (denk
aan bijv. click-handlers in frontend). In plaats van dat we zeggen \"dit
moet er gebeuren\" registreren we een handler bij het click-event. De
controle over wanneer die handler wordt aangeroepen is overgedragen
(inverted) aan het frontend- framwork en de gebruiker.

Tot slot, en daar komt de verwarring vandaan, zie je dit ook terug bij
Dependency Injection. Als onze class niet meer zelf al z'n dependencies
new()'t (de \"control freak\"), maar polymorphistische interfaces vraagt
in diens constructor, dan draagt de class dus feitelijk de controle over
de exacte werking over aan wie-dan-ook de class moet constructen. Dat
kan ordinaire OOP code zijn, of in het geval van Spring een DI
Container.

Kortom, de verwarring is begrijpelijk, maar op moment van schrijven kom
je met een zoekterm als \"Spring IoC Container\" nog steeds erg veel
waardevolle resultaten tegen. Dus is het handig om te weten dat beide
termen nog in gebruik zijn.

### Dependency Injection in Spring (Boot)

Spring is in de kern een Dependency Injection container. Maar dan wel
degene met meer extras dan alle anderen (over in elk geval alle
programmeertalen waar ik ooit mee gewerkt heb).

Dus wat is een Dependency Injection container? En waarom zouden we er
één willen?

Zoals we hierboven hebben gezien is Dependency Injection in de basis
niet zo ingewikkeld. Je gebruikt interfaces, zoals ze bedoeld zijn, en
zorgt dat die als parameter een constructor (of setter of method, etc.)
in gegooid wordt. Het probleem begint te onstaan als je dependencies ook
weer dependencies hebben. Dan kan er al snel een ingewikkeld web van
dependencies ontstaan.

Hier zie je een groter voorbeeld hoe dit
allemaal in z'n werk gaat:

```java
    @SpringBootApplication
    public class HelloApplication {
        public static void main(String[] args){
            SpringApplication.run(HelloApplication.class, args);
        }
    }

    @Component
    public class HelloRunner implements CommandLineRunner {
        public HelloRunner(GreetingService greetingService) {
            this.greetingService = greetingService;
        }

        public void run(String... args){
            this.greetingService.greet("Bob");
        }
    }

    @Service
    public class GreetingService {
        private Greeter greeter;

        public GreetingService(Greeter greeter){
            this.greeter = greeter;
        }

        public void greet(String name){
            String fullGreeting = greeter.createGreeting(name);
            System.out.println(fullGreeting);
        }
    }

    public interface Greeter {
        String createGreeting(String name);
    }

    @Component
    @Primary
    public class PoliteGreeter implements Greeter {
        public String createGreeting(String name){
            return "Greetings " + name;
        } 
    }

    @Component
    public class ImpoliteGreeter implements Greeter {
        public String createGreeting(String name){
            return "Yo " + name;
        } 
    }
```

 Uiteraard is het niet bedoeld als realistisch
voorbeeld (niemand doet zoveel moeite voor een Hello-World achtige
applicatie), maar het is een klein scenario (pastte net op een A4) wat
in elk geval de aanpak van Spring laat zien.

We gaan er even vanuit dat dit allemaal in losse files, in een named
package zit. Dan zorgt \@SpringBootApplication (r1) er in combinatie met
.run() (r4) voor dat alle andere onderdelen op het Component Scan Path
zitten (en dus gevonden worden).

Spring ziet dus alle \@Component en \@Service classes en stopt die in de
container, een soort telefoonboek. Dat heet in Spring-termen de
ApplicationContext (de run() method returnt dit object, mocht je het
eens van dichterbij willen bekijken). De Spring-naam voor al deze
dependencies zijn Beans.

Spring ontdekt dat één van de geregistreerde dependencies een
CommandLineRunner is (r9). Dan weet Spring dat die direct geconstruct
moet worden, zodat de run() (r14) method uitgevoerd kan worden. Spring
begint dus optimistisch aan de constructie van deze HelloRunner, en komt
snel tot de conclusie dat er een GreetingService gemaakt moet worden.

Vol optimisme begint Spring dan de GreetingService te maken, en komt er
(wellicht ontstaat er al enige irritatie bij de Spring-bot) dat er dan
toch eerst een Greeter object gemaakt moet worden. Zo'n Greeter object
is echter niet zomaar te maken, want dat is een *interface*. Spring zal
dus mopperend door de lijst van alle geregistreerde dependencies lopen
om te kijken welke kandidaten die kent voor deze interface.

Stiekem hoopt onze Spring-bot dat er maar één class zal zijn die de
interface implementeert, maar helaas voor de arme container zijn er twee
(r39 en r46). Standaard zou Spring nu een foutmelding moeten gooien
(want Spring wil geen onduidelijkheid welke er gekozen moet worden),
maar gelukkig staat er \@Primary (r38).

#### Spring Boot en \@Autowired

Tot slot moeten we nog heel even iets zeggen over \@Autowired, dit komt
namelijk héél veel voor in code-voorbeelden en documentatie op het
internet. En het is iets dat je in je eigen code zoveel mogelijk wil
vermijden.

We hadden de GreeterService hierboven ook zo kunnen schrijven:
```java
    @Service
    public class GreetingService {
        @Autowired
        private Greeter greeter;

        public void greet(String name){
            String fullGreeting = greeter.createGreeting(name);
            System.out.println(fullGreeting);
        }
    }
```

Dit is 2 regels korter dan het alternatief, maar veel slechter. We
kunnen nu ineens geen instantie van deze class meer maken zonder dat we
het Spring framework gebruiken. We kunnen immers niet bij de
private-fields van de class.

Dus als we hier ooit iets anders mee zouden willen buiten Spring, dan
zitten we gelijk vast. Unit-Tests zijn een veel voorkomend geval waarin
we graag Spring zoveel mogelijk aan de kant zetten. Spring kost namelijk
enkele tientallen tot honderden milisecondes om op te starten. Als we
dat bij elke unit-test gaan doen, dan gaan onze automatische tests al
snel irritant lang duren.

Kunnen we \@Autowired dan gewoon vergeten? Nee, helaas dat ook niet.
Soms kom je een library of framework tegen waarin een class een
parameterloze constructor *moet* hebben.

Ironisch genoeg zijn de Unit-Test classes van JUnit zo'n voorbeeld. Als
we daar in een test onze echte database code zouden willen testen (tegen
een Test-database natuurlijk!), dan willen we graag onze database class
 de JUnit test in injecteren:

```java
    @DataJpaTest
    public class RegistrationRepositoryTest {
        @Autowired
        private RegistrationRepository registrations;

        @Test
        public void canSaveRegistrations(){
            ... //hier komen we in het hoofdstuk Persistentie nog wel op terug
        }
    }
```

Dus in de meeste gevallen zorgt \@Autowired voor problemen bij het
testen. Maar als je nou juist Spring iets in je test wil laten
injecteren is het je enige optie. En de kans dat je ooit zelf een
RegistrationRepositoryTest zou instantieren is toch ook vrij klein.

#### Spring Boot & Configuration

Annotaties als \@Component, \@Service, \@RestController zijn voorbeelden
van annotaties waarmee we classes aanmelden bij de Spring
ApplicationContext (de DI Container) als bruikbare bouwstenen van onze
applicatie.

Er zijn uiteraard nog meer manieren om bruikbare bouwstenen (Beans
in Spring terminologie). Als je b.ijv. later in de opleiding
message-queues gaat gebruiken dan registreert de \@RabbitListener
annotatie ook een nieuwe Bean, en zo zullen veel Spring-uitbreidingen
hun eigen nieuwe \@BeanRegistratie-variant-annotatie hebben.

Er is echter nog een andere handige, maar iets complexere manier om
Beans te registreren, namelijk met \@Configuration classes.


```java
    @Configuration
    public class GreeterConfiguration {

        @Bean
        @RequestScope
        public Greeter createGreeter(){
            if(LocalDate.now().getDayOfWeek() == DayOfWeek.MONDAY){
                return new ImpoliteGreeter();
            }else{
                return new PoliteGreeter();
            }
        }
    }

    public class PoliteGreeter implements Greeter {
        public String createGreeting(String name){
            return "Greetings " + name;
        } 
    }

    public class ImpoliteGreeter implements Greeter {
        public String createGreeting(String name){
            return "Yo " + name;
        } 
    }
```
Spring is zo opgezet dat bij het
opstarten er wordt gezocht naar \@Configuration classes, en (de
resultaten van) alle methods op die classes die een \@Bean opleveren
worden geregistreerd als dependency. 

> Het woord Bean betekent in verschillende contexten veel verschillende dingen 
> in Java. Kennelijk kan geen programmeur de woordgrap van het eiland Java
> richting koffiebonen weerstaan.
>
> -Tom

Deze configuratie geeft aan dat we op maandag chagrijnig zijn, en
onbeleefd mensen groeten, maar dat we er de rest van de week beter aan
toe zijn. Standaard worden deze \@Beans als Singleton geregistreerd, dus
dat zou betekenen dat als we op maandag de applicatie opstarten, dat we
(zolang we de applicatie niet afsluiten) ook op dinsdag en verder
onbeleefd zouden blijven groeten. De annotatie \@RequestScope geeft aan
dat deze methode elk HttpRequest opnieuw uitgevoerd moet worden,
zodoende zal dus op dinsdag automatisch onze groet overschakelen op de
beleefde variant.

In de praktijk gebruik je dit soort functies vooral om onder
verschillende omstandigheden andere dependencies te gebruiken. Een
realistischer voorbeeld is bijv. het versturen van Emails, dat is nog
best ingewikkeld, en veel bedrijven betalen hier liever (een derde partij)[https://cfenollosa.com/blog/after-self-hosting-my-email-for-twenty-three-years-i-have-thrown-in-the-towel-the-oligopoly-has-won.html]
voor dan dat ze hun eigen mailserver gaan opzetten en onderhouden.
Dat houdt natuurlijk in dat je een klein bedrag per mailtje betaald.
Superhandig voor je productie-omgeving. Minder handig voor je
development-omgeving. Er zijn in Spring andere manieren om deze usecase
te voldoen, zoek bijv. maar eens op \@Profile's, maar deze aanpak werkt
in het algemeen.

## Samenvatting

In dit hoofdstuk hebben we het concept van Services geïntroduceerd.
Classes die op een hoog niveau aangeven wat de Applicatie kan doen,
ongeacht hoe \"het knopje er aan de buitenkant uitziet\".

Deze Services hebben vaak veel andere diensten nodig. En Dependency
Injection is een duidelijke, flexibele, en toch nog enigszins
overzichtelijke manier om deze benodigde classes aan te leveren.
Constructor Injection is hierbij de meest gewenste manier om het aan te
pakken.

Spring is in de basis een Dependency Injection Container. Een framework
dat automatisch volgens de gewoontes van Dependency Injection objecten
voor je opbouwt, en (zoals een framework betaamd) deze objecten aan het
werk zet (zo zal een CommandLineRunner op de Commandline runnen, en een
RestController naar HTTP-requests gaan luisteren bijv.).

Spring Boot zorgt er voor dat we hier niet heel veel ingewikkelde dingen
hoeven doen, maar vooral door middel van attributen er voor kunnen
zorgen dat het geheel overzichtelijke geconfigureerd wordt.

