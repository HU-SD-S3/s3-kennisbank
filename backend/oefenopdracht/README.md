# HU-land Casino: Blackjack API

HU-land Casino is een aanbieder van online kansspelen. Spelers kunnen
met speelgeld (*chips*) hun favoriete spelletjes spelen. Mogelijk dat
HU-land Casino in de toekomst een betaalde variant op de markt wil
zetten, maar voor nu wil het bedrijf naamsbekendheid verwerven,
advertenties aanbieden en ervaring opdoen.

Voor hun spelletjessite wil HU-land Casino een variant van het bekende
*blackjack* aanbieden. Het deel om in te loggen is overgenomen van een
bestaande component (*security*). Ook is er al enige functionaliteit om
chips toe te voegen wanneer de speler deze niet meer heeft. Omdat nog
onduidelijk is op welke technologieën wordt ingezet en met welke andere
systemen gecommuniceerd zal worden, is het van groot belang dat deze
backend onderhoudbaar en flexibel wordt opgezet. Het bedrijf heeft al
een aantal Java-applicaties draaien met behulp van het Spring Boot
framework. Daarom is gekozen om ook deze applicatie met Java en Spring
Boot op te zetten. HU-land Casino heeft aangegeven waarde te hechten aan
standaardisatie. Daarom is gevraagd extra aandacht te besteden aan object
oriëntatie, design principles, design patterns en REST-principes.

Er is gekozen voor een back-end applicatie om centrale controle te
houden op het spel, terwijl met HTTP en REST compatibiliteit wordt
geboden met verschillende front-ends, waaronder desktop, mobile en web
apps.

Aan jou de taak om jouw ontwerp- en programmeervaardigheden in te zetten
om een losgekoppelde, maar geïntegreerde, backend API voor het
blackjackspel aan te bieden!

## Het plan

We starten aan de buitenkant van de applicatie: de REST-API. Welke acties 
zou een frontend moeten kunnen aanroepen? En op welke urls.

Vervolgens koppelen we aan deze API een eenvoudige database. 

## Het spel

Blackjack is het bekendste kaartspel dat in casino's te vinden is. Het
spel wordt gespeeld met 1 of meer decks met 52 standaard speelkaarten.

Elke speelkaart vertegenwoordigt een bepaalde waarde gebaseerd op de
rang (*rank*) die op de kaart staat. De kleur (*suit*) is niet van
belang voor de regels van het spel, maar natuurlijk wel voor het
weergeven van het spel.

De speler probeert de dealer te verslaan door met de score van de
kaarten in de hand dichter bij de 21 te komen dan de dealer, zonder
boven de 21 uit te komen.

In onze variant is er sprake van 1-speler-blackjack. Er kunnen wel
meerdere potjes tegelijk gespeeld worden door verschillende en dezelfde
speler. Spelers mogen niet aan elkaars spel meedoen.

### Het spelverloop

Laten we het spelverloop van blackjack bestuderen. Let wel voor een
web-applicatie kan het zijn dat sommige stappen anders kunnen verlopen,
bijvoorbeeld ten behoeve van de onderhoudbaarheid of efficiëntie.
Sommige stappen worden immers volledig geautomatiseerd. Om dezelfde
reden kunnen sommige stappen worden samengevoegd. Op die manier beperken
we bijvoorbeeld ook de hoeveelheid netwerkcommunicatie.

Het algemene spelverloop is als volgt:

1.  *Start game*: de speler start het spel door chips in te zetten
    (*bet*)

2.  *Shuffle deck*: de dealer pakt een of meer decks van 52 speelkaarten
    en schudt deze

3.  *Deal cards*: de dealer deelt 1 kaart uit aan de speler, dan 1 aan
    zichzelf, dan 1 aan de speler en dan 1 aan zichzelf.

    -   De speler ziet beide kaarten in diens *hand*.

    -   De speler ziet één kaart van de dealer wel (*up card*) en één
        kaart niet (*hole card*).

4.  *Check blackjack*: als de speler met twee kaarten in de hand een
    score heeft van precies 21 dan eindigt het spel en:

    -   wint de speler $1.5\times$ diens inleg als de dealer niet ook
        een handscore van 21 heeft (*blackjack*)

    -   krijgt de speler diens inleg terug als de dealer ook een
        handscore van 21 heeft (gelijkspel: *push*)

5.  *Select move*: als het spel nog niet geëindigd is, kan de speler een
    move kiezen totdat deze af (handscore \> 21: *bust*) is of het spel
    beëindigt

    -   *Hit*: nog een kaart vragen; hierna volgen dezelfde opties als
        het de speler niet over de 21 is gegaan

    -   *Stand*: met deze hand uitkomen; de dealer blijft hitten zolang
        zijn handwaarde onder de 17 is

    -   *Double down*: de inleg verdubbelen, nog een kaart vragen en
        meteen uitkomen

    -   *Surrender*: opgeven en de helft van de inleg terugvragen

### Kaart- en handscore

Per kaart wordt de score bepaald op basis van de rang (*rank*) van de
kaart:

-   **Getallen (2 - 10)**: de waarde die erop staat

-   **Plaatjes (Jack, Queen, King)**: de waarde 10

-   **Aas (Ace): 1 of 11**

De handscore wordt bepaald door deze scores bij elkaar op te tellen:

  | *Kaarten*                                                  | *Handscore* |
  | ----------------------------------------------------------- |-------------|
  | $\heartsuit 2, \clubsuit 3$                                 | 5           |
  | $\clubsuit 10, \diamondsuit 5, \heartsuit 3, \spadesuit2$   | 20          |
  | $\heartsuit 10, \clubsuit K$                                | 20          |
  | $\spadesuit A, \diamondsuit 4$                              | 15 (of: 5)  |
  | $\clubsuit A, \diamondsuit K$                               | 21 (of: 11) |
  | $\clubsuit A, \heartsuit A$                                 | 12          |


Merk op dat de aas ertoe leidt dat de speler kan kiezen om met de hogere
aas-score uit te komen of te hopen op betere kaarten met de lagere
aas-score. Als de hogere aas-score boven de 21 uitkomt, hoeven we alleen
nog maar te kijken naar de lagere aas-score.

### Speltoestanden

Er zijn een aantal toestanden waar het spel zich in kan bevinden:

-   *Waiting*: het spel is aangemaakt, maar nog niet gestart (optioneel)

-   *Playing*: het spel is gestart en moves kunnen worden geselecteerd

-   *Bust*: speler heeft een handscore \>21 en kan niet meer verder
    spelen

-   *Lost*: speler heeft een lagere eindscore dan de dealer

-   *Surrendered*: speler heeft het opgegeven

-   *Push*: speler heeft dezelfde handscore als de dealer of beiden
    hebben een handscore van 21 in de eerste beurt

-   *Blackjack*: speler heeft een handscore van 21 in de eerste beurt en
    de dealer niet

-   *Won*: speler heeft een hogere handscore dan de dealer of de dealer
    heeft \>21

### Uitbetaling

Het uitbetalen van chips is gebaseerd op de eindtoestand (rond af naar
hele chips). Het spel eindigt alleen bij de volgende speltoestanden:

-   *Bust*: speler krijgt niets terug

-   *Lost*: speler krijgt niets terug

-   *Surrendered*: speler krijgt $0.5\times$ zijn inleg terug

-   *Push*: speler krijgt $1\times$ zijn inleg terug

-   *Blackjack*: speler krijgt $1.5\times$ zijn inleg terug

-   *Won*: speler krijgt $2\times$ zijn inleg terug