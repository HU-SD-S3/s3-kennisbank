# Deployment Vogelvlucht

Voor het deployen van een standaard Java+Javascript Webapplicatie hanteren we standaard VMs (Virtual Machines). Dit is niet de handigste, of de snelste manier om je software te deployen, maar het is de **basis**, en het werkt overal ongeveer hetzelfde (Google, Amazon, Azure, Digital Ocean, etc., etc.). Dat maakt de kennis herbruikbaar.

In dit document lopen we heel 'kort door de bocht' alle stappen door die je nodig hebt om je applicatie in het echt te draaien.

Per onderwerp zullen we linken naar meer achtergrond-informatie, want die zul je nodig hebben op het moment dat er (onvermijdelijk) iets net-iets-anders loopt dan gehoopt/verwacht. 

Het belangrijkste (en moeilijkste) is om tijdens het deployen niet **te** gefrustreerd te raken. Het is gewoon anders en in het begin een beetje lastig.


{% plantuml %}
@startuml
left to right direction

cloud "Azure" {

    node "Some Virtual Machine" {    
        frame "MyApplication.jar" {            
            rectangle "Vite Frontend" as fe             
            rectangle "Backend" as be
        }
        database "Postgres" as pg
        
        ' Dit is echt fucking zwarte chatgpt magie
        fe -[hidden]down-> be
        be -[hidden]down-> pg

        be -> pg
        fe -> be
        
    }
}

@enduml
{% endplantuml %}

## Lokaal 'echt draaien'

De VM werkt grotendeels zoals een 'echte' computer. Kortom, als je het op je eigen laptop niet buiten je IDE om aan de praat kan krijgen, dan gaat je dat op een 'vreemdere' omgeving als een VM ook niet lukken.

### Backend

Aangenomen dat je 'in je IDE' de backend kan draaien, is het eerste subdoel om dit naar de command-line te verplaatsen.

We gebruiken standaard [Maven](https://maven.apache.org/) om onze code te compileren, en onze dependencies te beheren. 

```mvn package``` 

Dit commando genereert een ```.jar``` bestand. Dit bestand is bij ons standaard een 'fat jar': een zip file (hernoem het maar eens naar .zip) met daarin al jouw code, en al jouw dependencies.

Deze jar kun je opstarten met:

```java -jar jouwapp.jar```

Dit is feitelijk wat je IDE doet (met wat slimme trucs om iets sneller te zijn).

### Frontend

Officieel is Javascript geen gecompileerde taal. De gewoonte is echter om Javascript te 'transpileren': het compileren van (hele moderne) Javascript naar (ouderwetse) Javascript (die in alle browsers werkt). Dus in de praktijk werkt het ongeveer hetzelfde.

In development is er vaak iets een commando als:

```npm run dev```

Dit commando start dan een eigen webservice op, die supersnel de javascript hercompileert, zodat jij prettig kan ontwikkelen.

Voor het deployen hebben we hier helemaal niets aan. We gaan immers niet op productie de hele tijd de broncode aanpassen.

We willen dus een stabiel pakketje met getranspileerde javascript-code:

```npm run build```

Dit commando genereert een zogeheten 'bundle' van je frontend-code. Deze bundle kan dan als bestand gedownload worden door de clients, net zoals een plaatje of een lettertype. Dit noemen we ***statische content***.

Het eenvoudigst is om deze bundle in je backend op te nemen. Elk backend framework heeft hier een andere standaard voor. In de Jersey/.war wereld zet je het bijv. in de ```src/main/webapp``` directory, in Spring/.jar zet je het in ```/src/main/resources/static``` (of ```/src/main/resources/public```, of wat voor andere plekken de framework-bouwers verzinnen).

Dit zorgt er dan voor dat de content gewoon als onderdeel van de backend geserveerd wordt, en is je deployment probleem gereduceerd tot het correct deployen van de backend.

(let op: het is -niet- wenselijk om deze bundle in Git in te checken)

## De virtual machine

Op één of andere manier krijg je beschikking tot een Virtual Machine. Hetzij door dit in elkaar te klikken bij een Cloud-provider, of omdat je een VM (ook wel VPS genoemd) huurt of toegewezen krijgt.

### Verbinden

Voor het verbinden met de VM gebruiken we SSH (Secure SHell), een protocol dat onze toetsaanslagen over het internet naar de VM stuurt. Op Windows gebruikte je hier vroeger een extern programma (bijv. '[Putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)') voor, maar tegenwoordig zit er ook gewoon een prima [SSH-client](https://learn.microsoft.com/en-us/windows/terminal/tutorials/ssh) (genaamd ```ssh```) op de command-line (op Mac/Linux is dit zeker weten al pre-installed).

### Voorbereiden

We gaan er vanuit dat je een Linux server hebt geconfigureerd. Dan krijg je bij ons standaard een Ubuntu-VM. Ubuntu is een bepaald smaakje Linux (een 'distributie'), als je iets anders hebt gekozen of gekregen, dan zullen sommige commando's net een beetje anders zijn.

Aangezien we een Java applicatie gaan deployen hebben we een Java-omgeving nodig. Je moet dus een Java Development Kit (JDK) of Java Runtime Environment (JRE) installeren (maakt niet zoveel uit welke, de JDK is iets groter, maar heeft meer debug tooltjes). 

Een standaard Ubuntu server gebruikt ```apt``` om programma's te installeren. Zo kun je Java installeren met:

```sudo apt install openjdk-21-jdk```

```sudo``` is hier een prefix voor 'doe dit als superuser/administrator' en dient als een beveiliging tegen 'per ongeluk' wijzigingen aan je machine maken.

Een andere smaak Linux (bijv. AlmaLinux) zou bijv. het volgende commando gebruiken:

```sudo dnf install java-21-openjdk```

Je ziet dat het best op elkaar lijkt.

Als je een .war wilt deployen, dan zul je ook Tomcat moeten installeren, dat heeft helaas wat meer stappen nodig, zie de [uitgebreidere instructies voor details](./java.md).

### Distribueren

Het fijne aan ```ssh``` is dat automatisch z'n broertje (zusje?) ```scp``` geïnstalleerd wordt. Met ```scp``` kun je bestanden van jouw pc naar de VM kopieëren. De syntax daarvoor is ```scp {bronbestand} {doelbestand}```, waarbij de VM locatie opgeschreven is als ```{vm-connectie}:{locatie-op-vm}```. Bijv:

```scp ./app.jar student@20.91.123.123:~/```

Kopieëert:
* Het bestand ```app.jar```
* Uit de huidige directory (```./```), kortom wherever je het commando uitvoert
* Naar de VM met ipadres ```20.91.123.123```
* Waarop je inlogt als user ```student```
* En je wil het kopiëren naar de userfolder (```~/```) van de student gebruiker. Standaard is dat ```/home/student```.

### Testen

(via Tomcat/.wars werkt dit compleet anders, daar worden deze problemen bij installatie al opgelost)
Om te kijken of het werkt kun je nu de applicatie aanspreken zoals het op je eigen PC zou werken:

```java -jar app.jar```

Als het goed is zie je dan dat de applicatie opstart zoals je gewend bent.
In de output kun je zien op welke poort de applicatie draait (waarschijnlijk 8080).

Door een tweede connectie naar dezelfde VM te openen (in een nieuw tabje/scherm) kun je even testen of de applicatie reageert:

```curl http://localhost:8080/eengeldigeurl```

Curl is een command-line tooltje om http-requests uit te voeren. Meestal is dit al geïnstalleerd op je Linux-server, maar anders kun je dat zelf doen:

```sudo apt install curl```

### Beheren

Er zijn nu drie zaken die nog een probleem vormen:

1. De applicatie is waarschijnlijk niet van buitenaf beschikbaar (firewalls)
2. De applicatie draait waarschijnlijk op een non-standaard poort (bijv. 8080)
3. De applicatie sluit af zodra je de ssh-connectie sluit (dat is niet fijn voor een 'server')

Punt 1 is een lastige. Het configureren van een firewall is per omgeving helemaal anders. Hier kun je vaak vanuit de server niets aan doen, en dit zal dus via een externe omgeving geregeld moeten worden. In het geval van Cloud-providers of VPS-verhuur-bedrijven is er altijd ergens een admin-panel waar dit gemanaged kan worden. Je zult alleen genoeg [netwerken](./netwerken) terminologie moeten kennen om het te herkennen.

Punt 2 kun je oplossen met zogeheten Environment Variables. Standaard luistert Spring naar de ```SERVER_PORT``` Environment Variable:

```SERVER_PORT=80 java -jar app.jar```

Helaas mag je niet zomaar iets op poort 80 laten luisteren, daarvoor heb je root/administrator rechten nodig. Dus (voor nu) ```sudo```-ervoor-zetten it is. (waarschuwing: dit is prima 'voor school', maar in het echt is dit vragen om security-problemen, meer details vind je [hier](./todo))

Punt 3 betekent dat we eigenlijk willen dat de applicatie als 'service' draait. Dus als achtergrondproces dat automatisch opstart als de VM opstart.

Op de meeste servers die we gebruiken draait ```systemd``` (dat is weer één van die linux-smaak dingen, het had ook ```init.d``` of weer iets anders kunnen zijn).

```systemd``` leest alle '.service' files die in de ```/etc/systemd/system``` directory staan. Dus je zult daar een file neer moeten zetten. De kleinste die ik kon verzinnen:

```
[Service]
User=root
Environment="SERVER_PORT=80"
WorkingDirectory=/home/tom
ExecStart=/usr/bin/java -jar s2-in-s3.jar

[Install]
WantedBy=multi-user.target
```
Nu kun je de service starten met:

```sudo systemctl restart java_app```

En kun je er voor zorgen dat de service gelijk opstart met:

```sudo systemctl enable java_app```

Voor meer details rondom ```systemd``` en services verwijs ik graag naar [Linux](./operating_systems)


## Tot slot

Er zijn een aantal zaken die we nu expliciet ***niet*** hebben behandeld. 

### Users

De applicatie draait nu als **root**-user. Dat is een serieus security-probleem. Eventuele security-fouten in je eigen code, of in één van de libraries die je gebruikt kunnen nu misbruikt worden om de hele machine over te nemen.

Jammer bij een schoolprojectje, desastreus in het echt. 
Lees dus even bij over [Linux](./operating_systems) wat je daaraan moet doen.

### Databases

Je hebt nu nog geen database. Maar aangenomen dat het netwerk werkt, is een database connectie opzetten vanuit een applicatie niet zo spannend. Feitelijk bestaat het uit twee subproblemen:

1. De configuratie
2. De verbinding

Probleem 1 hebben we al eerder gezien.
Spring gebruikt standaard de Environment Variable ```DATASOURCE_URL```om aan te geven waar de database gevonden kan worden (inclusief user/password). 

Bij Jersey/Tomcat is het aan te raden zelf een variabele te verzinnen en uit te lezen: ```System.getenv("JOUW_ENV_VAR_HIER")```.

Probleem 2 is een kwestie van goed je [netwerk](./netwerken) kunnen debuggen. Makkelijk als de database op dezelfde machine staat, maar dit kan soms tricky worden.

### HTTPS

Om veilig te kunnen inloggen is HTTPS noodzakelijk.

Om HTTPS te kunnen gebruiken heb je een HTTPS-certificaat nodig. Deze kun je genereren met ```openssl``` (dit staat waarschijnlijk wel geïnstalleerd op je server, en anders is er een packagemanager zoals ```apt``` om dit te installeren).

Vervolgens kun je een 'self-signed' (puur voor testen) certificaat genereren met een commando als:

```openssl req -nodes -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 3650 -nodes```

Dit stelt je een aantal vragen waar de antwoorden (voor test-purposes) allemaal niets uitmaken.

Hoe dan ook levert je dit 2 bestanden op:

* De public-key (ook wel verwarrend genoeg 'het certificaat' genoemd)
* De private-key

Deze bestanden samen worden ook wel 'het certificaat' genoemd (kortom, soms zit de private key er wel in, en soms niet, en daar zijn we altijd semi-bewust onduidelijk over; het is helaas niet anders).

Je kunt Spring instrueren gebruik te maken van dit certificaat door, jawel, meer environment variables (want het is een stuk configuratie):

```sudo SERVER_SSL_ENABLED=true SERVER_PORT=443 SERVER_SSL_CERTIFICATE_PRIVATE_KEY=./key.pem SERVER_SSL_CERTIFICATE=./cert.pem java -jar app.jar```

Als je nu naar je site navigeert (via https!), dan zul je een hele enge waarschuwing krijgen dat de site niet vertrouwd wordt. Dat klopt, want je certificaat komt niet bij een 'trusted authority' vandaan. Dit oplossen gaat wat ver voor een toch-al-uitgelopen vogelvlucht. Zie [webservers](./web) voor meer details.
