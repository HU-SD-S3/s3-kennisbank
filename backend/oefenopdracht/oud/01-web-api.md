# Opdracht 1: Web API

## Stap 1: Ontwerp de web API op basis van REST

Als we volgens REST met HTTP willen werken, bieden we meestal per
resource een endpoint aan. REST is een gestandaardiseerde manier van
werken. Het is de moeite waard om te kijken of we dit op de juiste
manier implementeren. Niet alleen omdat we erop beoordeeld worden, maar
ook omdat men in de praktijk bepaalde verwachtingen heeft van een REST
API.

We moeten in het kader van de uniform interface rekening houden met:

1.  De juiste URL-structuur

2.  De juiste HTTP-request methods en headers

3.  De juiste parameters in URL, query en body

4.  De juiste HTTP-response codes, headers en body

Via content negotiation wordt binnen REST een representation aangeboden
van de resource, zoals bijvoorbeeld JSON of XML. Met de *Accept header*
kunnen client en server aangeven met welke representation kan worden
gewerkt. Met de *Content-Type header* kan worden aangegeven welk soort
representation in de body van de request of de response is opgenomen.

Ontwerp hoe je web API eruit moet komen te zien.

Je mag dit documenteren in je project, bijvoorbeeld in een *web-api.md*,
maar dat hoeft niet. Als voorbeeld kan je hiernaar kijken (voor de web
API van chips, zie de ChipsController).

``` markdown
# Chips API

## Show balance: hoeveel chips bekijken
Route: `GET /chips/balance`
Response body: JSON met chips in account

## Withdraw chips: een "withdrawal" toevoegen
Route: `POST /chips/withdrawal`
Request Body: JSON met chips om op te nemen
Response body: JSON met chips in account

## Deposit chips: een "deposit" toevoegen
Route: `POST /chips/deposit`
Request Body: JSON met chips om te storten
Response body: JSON met chips in account

## Status codes
* 200 OK: alles goed gaat
* 400 Bad Request: gebruiker geeft foutieve invoer (bijvoorbeeld: negatief aantal)
* 401 Unauthorized: gebruiker is niet ingelogd 
* 402 Payment Required: gebruiker heeft niet genoeg chips
```

## Stap 2: Implementeer de API met Spring Boot

Spring Boot maakt gebruik van de Spring Web MVC library om web requests
af te handelen via controllers. Intern wordt er gebruikt gemaakt van een
embedded Tomcat-instantie, zodat we niet met losse WAR-bestanden en Java
application containers aan de slag hoeven.

Hier volgt een overzicht van hoe je dingen kan aanpakken in Spring Boot,
maar kijk ook eens in het chips-component! Daar wordt al een boel uit
duidelijk.

``` java
@RestController
@RequestMapping("/chips")
public class ChipsController {
    private final ChipsService service;

    public ChipsController(ChipsService service) {
        this.service = service;
    }

    @GetMapping("/balance")
    public Balance showBalance(UserProfile profile) {
        Balance balance = this.service.findBalance(profile.getUsername());

        return balance;
    }

    @PostMapping("/deposit")
    public Balance deposit(UserProfile profile, @Validated @RequestBody Deposit deposit) {
        try {
            Balance balance = this.service.depositChips(profile.getUsername(), deposit.amount);
            return balance;
        } catch (NegativeNumberException exception) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, exception.getMessage());
        }
    }

    @PostMapping("/withdrawal")
    public Balance withdraw(UserProfile profile, @Validated @RequestBody Withdrawal withdrawal) {
        try {
            Balance balance = this.service.withdrawChips(profile.getUsername(), withdrawal.amount);
            return balance;
        } catch (NotEnoughChipsException exception) {
            throw new ResponseStatusException(HttpStatus.PAYMENT_REQUIRED, exception.getMessage());
        } catch (NegativeNumberException exception) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, exception.getMessage());
        }
    }
}
```

Het is de verantwoordelijkheid van een controller om een HTTP-request om
te zetten naar Java-code, een use case uit te voeren op een service, en
het resultaat weer om te zetten naar een HTTP-response. Controllers zijn
onderdeel van de presentatielaag omdat het één van de manieren is
waarmee een component zijn diensten kan aanbieden aan de buitenwereld.
We zouden bijvoorbeeld ook commandline commands kunnen maken die precies
dezelfde use cases moeten kunnen uitvoeren. Die kunnen dan gebruik maken
van exact dezelfde applicatielaag!

Implementeer de web API voor ons blackjack-component. Houdt rekening met
de correcte URLs, HTTP methods en HTTP statuscodes. Werk natuurlijk je
application services en domeinacties bij om ze verder werkend te
krijgen.

Test je applicatie uit met Postman. Vergeet niet om de aangemaakte
endpoints ook in je Postman-collectie aan te maken, zodat authenticatie
en autorisatie automatisch gaan via de bij het inloggen verkregen
JWT-token!

Commit je wijzigingen met een duidelijke naam, bijvoorbeeld: \"Add
blackjack web API\". Push de wijzigingen naar je remote GitHub
repository.

Hier volgt wat meer informatie om je op weg te helpen.

### Controller: `@RestController`

In Spring Boot maken we een controller door de klasse te annoteren met
`@RestController`. Hiermee wordt aan Spring doorgegeven dat de
verschillende routes (request mappings) moeten worden verzameld en dat
de controller gebruik kan maken van dependency injection.

### Resources en routes: `@RequestMapping`

In Spring kan je een HTTP resource aangeven door boven een controller de
annotatie `@RequestMapping` toe te voegen. In deze annotatie kan je een
pad meegeven om aan te geven wat het hoofdpad is voor deze controller.
Dit komt vaak overeen met de component-naam, de naam van de centrale
entiteit of beide.

Per Java-methode kunnen we ook request mappings toevoegen. We kunnen
zelfs specificeren om wat voor een soort request-method het gaat door
dat te specificeren. `@PostMapping("/deposit")` leidt bijvoorbeeld tot
de route '/chips/deposit' op de host. Op onze ontwikkelomgeving is de
host 'localhost:8080'.

Aan een RequestMapping kan je ook nog allerlei extra waarden meegeven,
waaronder de content-types die ondersteund worden en de content-types
die kunnen worden teruggegeven. Standaard accepteert en stuurt Spring
Boot JSON. We hoeven dus niets in te stellen.

### Data uit URL: `@PathVariable`

In een URL wil je het mogelijk maken om een bepaalde resource te vinden.
Je wil een identifier (id) mee kunnen sturen. Met `@PathVariable` kunnen
we data uit een URL halen. Deze annotatie zet je voor de argumenten van
de Java-methode. De naam van het argument moet overeenkomen met de naam
in het pad. Stel dat we een methode willen maken die een Game kan
ophalen (of eigenlijk: de voortgang van het spel, we willen geen
hole-card tonen), dan zou dat er als volgt uit kunnen zien:

``` java
    @GetMapping("/{id}")
    public Game findGame(Authentication authentication, @PathVariable id) {
        UserProfile profile = (UserProfile) authentication.getPrincipal();
        GameProgress progress = this.blackjackService.findGame(profile.getUsername(), id);
        return progress;
    }
}
```

### Data uit request body (DTO): `@RequestBody`

In een aantal gevallen wil de client data meesturen maar de server,
zoals bijvoorbeeld bij een `POST`, `PATCH` of `PUT`. Dit doe je in de
request body. In Spring maken we hiervoor een simpel data transfer
object (DTO) met ofwel getters en setters, ofwel publieke velden. Zie
bijvoorbeeld de deposit-methode van de Chips-controller. Hierin wordt
gebruik gemaakt van een Deposit-klasse waarin een aantal is opgenomen:

``` java
    // nl.hu.bep2.casino.chips.controller.ChipsController.java
    @PostMapping("/deposit")
    public Balance deposit(Authentication authentication, @Validated @RequestBody Deposit deposit) {
        // ...
    }

    // nl.hu.bep2.casino.chips.dto.Deposit.java
    public class Deposit {
        @Positive
        public Long amount;
    }
```

Een leuke extra is dat je in Spring ook validatie kan toevoegen. Dan
voeg je een `@Validated`-annotatie toe aan de method-argument in de
controller en kan je verschillende validators toepassen op de velden in
de DTO.

Wanneer de gebruikersinvoer niet klopt, geeft Spring automatisch een
`400 Bad Request` terug met een foutmelding! Merk op dat we deze check
zowel in het domein uitvoeren als in de presentatielaag. Dit heet
*defense-in-depth*: we garanderen dat het domein altijd klopt, maar
checken op meerdere plekken om zo vroeg mogelijk feedback te geven.

### Data uit query parameters: `@RequestParam`

Waarschijnlijk niet van toepsing op ons project, maar je kan in een URL
ook query parameters toevoegen. Dit ziet er vaak uit als een reeks keys
en values achter een vraagteken, vaak om een bepaalde verzameling aan
resultaten te filteren of ordenen:
`GET /search?q=cohesion&src=typed_query` met als host *twitter.com*
toont de tweets die voldoen aan de zoekquery "cohesion".

We kunnen een dergelijke variabele inzetten op dezelfde manier als we
doen voor een `@PathVariable`, alleen hoef je niets aan te geven in de
requestmapping-route. Voor ons project zullen we dit niet per se nodig
hebben.

### JSON-serializatie

We hoeven in een controller niets meer om te zetten en kunnen een object
teruggeven. Spring verzorgt een automatische serializatie van een object
naar JSON op basis van de getters van het betreffende object (en de
getters van alle objecten daarbinnen). Hetzelfde geldt voor publieke
velden. Ook deze worden automatisch omgezet.

Standaard wordt er dan een `200 OK` terug gegegeven. Wil je meer
controle dan kan je kijken naar `ResponseEntity` en `@ResponseStatus`.

Let wel op dat je hiermee extra getters toevoegt in je *domeinlaag*,
alleen maar om een JSON-veld toe te voegen in je *presentatielaag*. Dit
introduceert (indirecte) coupling. Om dit verder te ontkoppelen, moet je
in je applicatielaag een vertalingsslag maken van domeinobjecten naar
DTOs die een bepaald resultaat vertegenwoordigen.

### Pro-tip: Foutafhandeling

Spring handelt standaard alle ongespecificeerde fouten af met een 500.

Voor custom foutafhandeling kan je werken met een `try/catch`. Op die
manier kan je (domein-)excepties omzetten naar `ResponseException`s.
Daar kan Spring foutberichten van maken. Zie hiervoor ook de
ChipsController.

Wil je een slimmere manier om foutafhandeling te regelen? Dan kan je
kijken naar `@ControllerAdvice` of `@ExceptionHandler`. *Google is your
friend!*
