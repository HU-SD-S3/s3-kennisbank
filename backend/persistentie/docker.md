
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

De standaardpoort van PostgreSQL is `5432`. Ons project staat ingesteld
om te verbinden met poort `15432`, omdat we dat met Docker doen om niet
met andere PostgreSQL-instanties in de knoop te komen.

We kunnen aanpassen hoe onze applicatie met de applicatie verbindt via
de configuratie in src/main/resources/application.properties. Zorg dat
deze er als volgt uitziet:

``` ini
spring.datasource.url=jdbc:postgresql://localhost:15432/bep2-huland-casino
spring.datasource.username=bep2-huland-casino
spring.datasource.password=bep2-huland-casino
```

Heb je iets veranderd en werkt het? Commit je wijzigingen met een
duidelijke naam, bijvoorbeeld: \"Customize database configuration\".
Push de wijzigingen naar je remote GitHub repository.