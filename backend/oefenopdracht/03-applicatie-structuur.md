# Opdracht 4: Application Structure

## Stap 1: Maak een applicatieservice

In ons domein hebben we een aantal domeinklassen gemaakt die
verantwoordelijk zullen worden voor kleine acties per concept. Deze
worden aan elkaar geknoopt door een dienstverlenend object dat
verantwoordelijk is voor het omzetten van use cases naar domeinacties
met behulp van infrastructuur. Dat wordt ook wel een *application
service* genoemd.

Maak eerst weer een package aan onder onze blackjack-component met de
naam `application` Dit is de applicatielaag waarin we onze taakgerichte
logica (use cases) gaan uitvoeren. Maak in die package een klasse aan:
`BlackjackService`. Het is immers een dienst die de acties aanbiedt om
blackjack te kunnen spelen! Deze wordt uiteindelijk aangesproken door de
controller.

Vervolgens moeten we aan Spring doorgeven dat hij deze service kan
gebruiken om te meegeven aan een andere service of bijvoorbeeld een
controller als deze deze nodig heeft in de controller. Spring bevat een
automatisch mechanisme voor *dependency injection* en gebruikt daar
annotaties voor. Om de service als zodanig vindbaar te maken, kan je
`@Service` boven de klassedeclaratie plaatsen.

Dit zou er als volgt uit moeten zien:

``` java
package nl.hu.bep2.casino.blackjack.application;

@Service
public class BlackjackService {
}
```

## Stap 2: Bedenk welke methodes we nodig hebben

Welke acties moet onze service aanbieden? Dit komt overeen met de use
cases van onze component! Als het goed is, hebben we hiervoor een use
case diagram gemaakt.

Maak public methods aan met de namen van deze use cases volgens de
naming conventions van Java (*camelCase*). Bedenk per methode ook wat
voor een input we nodig hebben. Voor sommige methoden is het handig om
het spel te kunnen identificeren op basis van een id (type: *Long*).
Voor de meeste methoden hebben we daarnaast de naam van de gebruiker
nodig (type: *String*).

De identifier zullen we automatisch door de database laten genereren
zodra we met persistentie bezig gaan.

### Voorbeeld: Het starten van het spel

Laten we als voorbeeld het starten van een spel als use case nemen. Het
is belangrijk om hier een duidelijke, beschrijvende naam voor te pakken,
bijvoorbeeld: *startGame* of *start*.

#### Method arguments

Wat moeten we allemaal meegeven als parameters om het spel te starten?

Om het spel te kunnen opzoeken voor deze speler is het handig om de naam
van de speler te bewaren. We kunnen een parameter toevoegen met als type
`String` en als naam `playerName`. Omdat een speler meerdere spellen kan
hebben, moeten we ervoor zorgen dat de database ook elk spel voorziet
van een unieke identifier. Dat doen we later wanneer we met persistentie
bezig gaan.

Het is handig om het spel meteen te beginnen met een inleg. Dat bespaart
ons een extra HTTP request! Laten we de parameter `Integer bet`
toevoegen.

Meer hebben we niet nodig van de speler!

#### Return type

Wat willen we teruggeven nadat we het spel hebben gestart? Hier kunnen
we wat slims verzinnen om aan de speler te laten zien hoe het spel er nu
uitziet: de spelvoortgang. We willen uiteindelijk namelijk in de
controller een bericht terugsturen naar de HTTP client met daarin een
JSON body met alle informatie. Een front-endprogrammeur kan dat mooi
weergeven met afbeeldingen en interacties.

Welke informatie willen we aan de speler laten zien en hoe kunnen we dat
het best structureren? Dat laten we aan jou over! Alvast een tip: we
kunnen een String teruggeven, maar dan gaat er een boel gestructureerde
informatie verloren!

### Stap 3: Vul de methodes in

Nadat we bedacht hebben welke methodes onze service moet hebben, kunnen
we naar de invulling van die methodes kijken. Het is het mooiste als
applicatieservices niet teveel logica bevatten, maar het gros van het
werk door domeinobjecten wordt gedaan. Op deze manier houd je een
abstract en herbruikbaar domein en is je applicatieservice een soort
samenvatting van hoe het domein zich gedraagt.

Probeer in algemene bewoordingen de acties te beschrijven en gaandeweg
acties toe te voegen aan de centrale domeinentiteit en de domeinobjecten
die daarin gebruikt worden.

#### Voorbeeld: Method body van startGame

We hebben een methodenaam, parameters en een return type gedeclareerd.
Welke stappen willen we uitvoeren in de methode?

Globaal zal je op de volgende zaken uitkomen:

1.  Neem het aantal chips op ter hoogte van de bet

2.  Maak een nieuw spel aan

3.  Start het spel

4.  Sla het spel op

5.  Stort chips als sprake van blackjack of push

6.  Geef de voortgang terug

Voor het starten van het spel kan je een methode op het Game object
maken, genaamd *start*. Je kan ervoor kiezen om de benodigde parameters
mee te geven aan de constructor of de start methode. Wat deze methode
moet doen laten we aan jou over. Een aantal tips: wat moet de
speltoestand zijn bij het beginnen van het spel? Laat je het spel zelf
een nieuwe Deck maken of doen we dat in de application service?

Bij de uitvoering van *game.start()*, maken we onder andere gebruik van
Deck en vast ook wel van andere klassen en enums! De kaarten moeten
worden geschud en op de hand worden gebracht van de speler en van de
dealer. Vervolgens moeten scores berekend worden en de huidige
speltoestand geupdatet worden.

Het opslaan van het spel kan je nog even laten zitten, maar het is
misschien handiger om dit tijdelijk te doen door een field op te nemen
in de application service. Je zou hiervoor een `Map<String, Game>`
kunnen gebruiken waarmee tijdelijk spellen (*value*) bewaard kunnen
worden op basis van spelernaam (*key*).

Dit gaan we in een van de volgende opdrachten vervangen met apart object
dat verantwoordelijk is voor de langdurige opslag van spellen: een
GameRepository.

#### Bescherm in domeinacties tegen ongeldige situaties (invariants)

Je domein bepaalt hoe de regels van de kernconcepten eruit zien. Bij een
spel zijn het bijvoorbeeld letterlijk de spelregels. Zie bijvoorbeeld de
Chips-klasse: je mag geen negatieve hoeveelheid opnemen en je mag geen
chips opnemen als je saldo te laag is.

``` java
 public void withdraw(Long amountToWithdraw) {
    if (amountToWithdraw < 0) {
        throw new NegativeNumberException("Cannot withdraw a negative amount: " + amountToWithdraw);
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

Voor het spelen van het spel geldt hetzelfde. Je mag natuurlijk geen
zetten doen als het spel is afgelopen! Hiervoor kan je een
*guard-clause* gebruiken: een *if-statement* die een exception gooit als
iets niet mag. Je hebt geen *else* nodig! De flow wordt immers
doorbroken als er sprake is van een exception.

#### Overige use cases en domeinacties

Doe hetzelfde voor de overige use cases en domeinacties. Hier gaat een
boel tijd inzitten, dus het is niet erg als je dit later verbetert
wanneer we de persistentie en de web API ingericht hebben.

Commit je wijzigingen met een duidelijke naam, bijvoorbeeld: \"Add use
cases to blackjack service\". Push de wijzigingen naar je remote GitHub
repository.
