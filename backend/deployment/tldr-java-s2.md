# Deployment Vogelvlucht

Voor het deployen van een standaard Java+Javascript Webapplicatie hanteren we standaard VMs (Virtual Machines). Een Virtual Machine is een technisch truukje om een echte fysieke Machine op te verdelen en te kunnen onderverhuren aan meerdere gebruikers.

Stel je hebt een pittige server met tientallen processor-cores en terabytes aan RAM, dan kun je die verdelen over meerdere kleine machientjes. Deze zijn niet echt (dus virtueel). Het is vaak ook zo dat je hierdoor meer kan verhuren dan je eigenlijk hebt: zolang maar niet al het geheugen, of alle cores, ***tegelijk*** gebruikt wordt.

Dit is niet de handigste, of de snelste manier om je software te deployen, maar het is de **basis**, en het werkt overal ongeveer hetzelfde (Google, Amazon, Azure, Digital Ocean, etc., etc.). Dat maakt de kennis herbruikbaar, en als je 
ooit gezien hebt hoe het 'achter de schermen' werkt, dan kun je ook veel handiger gebruik maken van de meer fancy en gebruikersvriendelijke opties die
we tegenwoordig kunnen gebruiken.

In dit document lopen we heel 'kort door de bocht' alle stappen door die je nodig hebt om je applicatie in het echt te draaien.

Per onderwerp zullen we linken naar meer achtergrond-informatie, want die zul je nodig hebben op het moment dat er (onvermijdelijk) iets net-iets-anders loopt dan gehoopt/verwacht. 

Het belangrijkste (en moeilijkste) is om tijdens het deployen niet **te** gefrustreerd te raken. Het is gewoon anders en in het begin een beetje lastig.

Het model dat we in dit document gaan maken is:

{% plantuml %}
@startuml

cloud "OpenICT" {
    node "Some Virtual Machine" {    
        frame "Tomcat" {
            frame "MyApplication.war" {            
                rectangle "Vite Frontend" as fe             
                rectangle "Backend" as be
            }
        }
        database "Postgres" as pg
        
        be -down-> pg
        fe -down-> be
        
    }
}

@enduml
{% endplantuml %}

Kortom, je krijgt ergens een Virtual Machine vandaan, en die gaan we 'from scratch' helemaal optuigen.

## Lokaal 'echt draaien'

De VM werkt grotendeels zoals een 'echte' computer. Kortom, als je het op je eigen laptop niet buiten je IDE om aan de praat kan krijgen, dan gaat je dat op een 'vreemdere' omgeving als een VM ook niet lukken.

### Backend

#### Tomcat

Tomcat is een webserver (het serveert paginas over http) en een java-application-server (het kan java web-applicaties voor je draaien).

De installatie is redelijk eenvoudig (voor ons simpele geval):

1. Download een [Tomcat binary distribution](https://tomcat.apache.org/) voor je OS.
2. Pak het gedownloade bestand uit op een locatie naar keuze, hierna ```/{Tomcat}``` genoemd. (liefst niet te diep genest, je zult de directory nog een aantal keer moeten intypen)
Dus stel je hebt Tomcat geinstalleerd in ```C:/java/tomcat```, dan bedoelen we met ```/{Tomcat}/bin``` de directory ```C:/java/tomcat/bin```.
3. Start Tomcat door naar de ```/{Tomcat}/bin``` directory te gaan en daar het ```./catalina.sh run``` of (op Windows) ```./catalina.bat run``` commando uit te voeren.
4. Test je Tomcat server door in ```/{Tomcat}/webapps``` een nieuwe directory aan te maken (bijv. ```test```), en daar een ```index.html``` file neer te zetten met een HTML pagina naar smaak. Door naar ```http://localhost:8080/test``` te navigeren zou je dan je eigen testfile moeten terugzien.

Het is misschien een beetje verwarrend, maar het script om Tomcat op te starten 
heet Catalina, omdat dat de interne naam is van de 'motor' van Tomcat.

Developers zadelen graag hun gebruikers op met dit soort eigenaardigheden. 

#### Eigen code

Aangenomen dat je 'in je IDE' de backend kan draaien, is het eerste subdoel om dit naar de command-line te verplaatsen.

We gebruiken standaard [Maven](https://maven.apache.org/) om onze code te compileren, en onze dependencies te beheren. 

```mvn package``` 

Dit commando genereert een ```.war``` bestand (zie de regel ```<packaging>war</packaging>``` in je ```pom.xml```). Dit bestand is bij ons standaard een 'fat war': een zip file (hernoem het maar eens naar .zip) met daarin al jouw code, en al jouw dependencies.

Deze war kun je aan Tomcat geven door het gegenereerde .war bestand naar je ```/{Tomcat}/webapps``` folder te kopieren.

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

Het eenvoudigst is om deze bundle in je backend op te nemen. Elk backend framework heeft hier een andere standaard voor. In de ```.war``` wereld zet je het bijv. in de ```src/main/webapp``` directory.

Dit zorgt er dan voor dat de content gewoon als onderdeel van de backend geserveerd wordt, en is je deployment probleem gereduceerd tot het correct deployen van de backend.

(let op: het is -niet- wenselijk om deze bundle in Git in te checken)

## De virtual machine

Op één of andere manier krijg je beschikking tot een Virtual Machine. Hetzij door dit in elkaar te klikken bij een Cloud-provider, of omdat je een VM (ook wel VPS genoemd) huurt of toegewezen krijgt.

### Verbinden

Voor het verbinden met de VM gebruiken we SSH (Secure SHell), een protocol dat onze toetsaanslagen over het internet naar de VM stuurt. Op Windows gebruikte je hier vroeger een extern programma (bijv. '[Putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)') voor, maar tegenwoordig zit er ook gewoon een prima [SSH-client](https://learn.microsoft.com/en-us/windows/terminal/tutorials/ssh) (genaamd ```ssh```) op de command-line (op Mac/Linux is dit zeker weten al pre-installed, en anders ```apt install openssh``` oid.).

### Voorbereiden

We gaan er vanuit dat je een Linux server hebt geconfigureerd. Dan krijg je bij ons standaard een Ubuntu-VM. Ubuntu is een bepaald smaakje Linux (een 'distributie'), als je iets anders hebt gekozen of gekregen, dan zullen sommige commando's net een beetje anders zijn.

Aangezien we een Java applicatie gaan deployen hebben we een Java-omgeving nodig. Je moet dus een Java Development Kit (JDK) of Java Runtime Environment (JRE) installeren (maakt niet zoveel uit welke, de JDK is iets groter, maar heeft meer debug tooltjes). 

Een standaard Ubuntu server gebruikt ```apt``` om programma's te installeren. Zo kun je Java installeren met:

```sudo apt install openjdk-21-jdk``` 
(of een andere versie, met ```apt search openjdk``` kun je kijken wat er zoal is)

```sudo``` is hier een prefix voor 'doe dit als superuser/administrator' en dient als een beveiliging tegen 'per ongeluk' wijzigingen aan je machine maken.

Een andere smaak Linux (bijv. AlmaLinux) zou bijv. het volgende commando gebruiken:

```sudo dnf install java-21-openjdk```

Je ziet dat het best op elkaar lijkt. Desalniettemin kunnen Linux-fans uren discussieren welke distributie het beste is. We zullen ze laten.

Nu we Java hebben is het tijd om ook Tomcat te installeren. Dat gaat hetzelfde als op je eigen PC, maar dan via de commandline.

De Linux versie is waarschijnlijk een ```.tar.gz``` bestand. Dat is Linux' 
voor:

1. Een enkel bestand dat meerdere bestanden in zich heeft (een kleverige ```.tar```ball)
2. En die kluwe bestanden is gecomprimeerd met ```.gz```ip

Dus eerst downloaden we het bestand, met een commandline tooltje (een browser kunnen we immers niet gebruiken):

```curl https://eenofandereurl/bla/bla/blabla-tomcat-bla.tar.gz --output tomcat.tar.gz```

Vervolgens kun je dat uitpakken met een willekeurig programma dat kan unzippen, meestal is ```tar``` wel geinstalleerd:

```tar -xf tomcat.tar.gz```

En dan blijft het altijd even afwachten of je dan alle bestanden direct in de huidige directory uitgekotst krijgt, of dat er een nette submap wordt aangemaakt... (Leuker kunnen we het niet maken, wel makkelijker)

Vanaf daar kun je naar de productie ```/{Tomcat}/bin``` directory en op soortgelijke wijze je server opstarten.

Het uittesten werkt nog een klein beetje anders. Zeer waarschijnlijk  kun je niet van buitenaf bij je server op de standaard poort van Tomcat (een firewall blokkeert dat dan). Je kunt dan toch vanaf je server testen of http werkt met
```curl```, je hebt dan alleen een tweede commandline tabje nodig om EN Tomcat te draaien, EN een request te doen.


### Distribueren

Het fijne aan ```ssh``` is dat automatisch z'n broertje (zusje?) ```scp``` geïnstalleerd wordt. Met ```scp``` kun je bestanden van jouw pc naar de VM kopieëren. De syntax daarvoor is ```scp {bronbestand} {doelbestand}```, waarbij de VM locatie opgeschreven is als ```{vm-connectie}:{locatie-op-vm}```. Bijv:

```scp ./app.war student@20.91.123.123:~/tomcat/webapps/```

Kopieëert:
* Het bestand ```app.war```
* Uit de huidige directory (```./```), kortom wherever je het commando uitvoert
* Naar de VM met ipadres ```20.91.123.123```
* Waarop je inlogt als user ```student```
* En je wil het kopiëren naar de userfolder (```~/tomcat/webapps```) van de student gebruiker. Standaard is dat ```/home/student/tomcat/webapps```.

### Testen

Om te kijken of het werkt kun je nu Tomcat opstarten via de eerder genoemde ```./catalina.sh run``` of ```./catalina.bat run``` methode.

Als het goed is zie je dan dat de applicatie opstart zoals je gewend bent.
In de output kun je zien op welke poort de applicatie draait (waarschijnlijk 8080).

Door een tweede connectie naar dezelfde VM te openen (in een nieuw tabje/scherm) kun je even testen of de applicatie reageert:

```curl http://localhost:8080/app/eengeldigeurl``` (als je .war bestand anders heette zul je deze url even moeten tweaken)

Curl is een command-line tooltje om http-requests uit te voeren. Meestal is dit al geïnstalleerd op je Linux-server, maar anders kun je dat zelf doen:

```sudo apt install curl```

### Beheren

Er zijn nu drie zaken die nog een probleem vormen:

1. De applicatie is waarschijnlijk niet van buitenaf beschikbaar (firewalls)
2. De applicatie draait waarschijnlijk op een non-standaard poort (bijv. 8080)
3. De applicatie sluit af zodra je de ssh-connectie sluit (dat is niet fijn voor een 'server')

Punt 1 is een lastige. Het configureren van een firewall is per omgeving helemaal anders. Hier kun je vaak vanuit de server niets aan doen, en dit zal dus via een externe omgeving geregeld moeten worden. In het geval van Cloud-providers of VPS-verhuur-bedrijven is er altijd ergens een admin-panel waar dit gemanaged kan worden. Je zult alleen genoeg [netwerken](./netwerken) terminologie moeten kennen om het te herkennen.

Punt 2 kun je oplossen in de configuratie van Tomcat. In ```/{Tomcat}/conf/server.xml``` staat ergens een regel als  

```<Connector port="8080" protocol="HTTP/1.1" ...etc. etc.```

Dat kun je aanpassen naar poort 80 met een command-line text-editor zoals ```nano```, of voor de hardcore ```vim```. (```apt install``` kan dit voor je installeren mocht dit op je exacte VM nog niet geïnstalleerd staan)

Helaas mag je niet zomaar iets op poort 80 laten luisteren, daarvoor heb je root/administrator rechten nodig. Dus als je nu Tomcat opstart met ```./catalina.{bat/sh} run``` wordt er stiekem niets opgestart op poort 80.

Dus (voor nu) ```sudo```-ervoor-zetten om te testen. (websites met ```sudo``` draaien is een serieus slecht idee. Doe dit nooit in het echt)

Punt 3 betekent dat we eigenlijk willen dat de applicatie als 'service' draait. Dus als achtergrondproces dat automatisch opstart als de VM opstart. Gelukkig kunnen we dan tegelijkertijd het eerdere ```sudo``` issue oplossen.

Op de meeste servers die we gebruiken draait ```systemd``` (dat is weer één van die linux-smaak dingen, het had ook ```init.d``` of weer iets anders kunnen zijn).

```systemd``` leest alle '.service' files die in de ```/etc/systemd/system``` directory staan. Dus je zult daar een file neer moeten zetten. De kleinste die ik kon verzinnen:

File: ```/etc/systemd/system/tomcat.service```
```
[Service]
User=student
WorkingDirectory=/home/student
ExecStart=/home/student/tomcat/bin/catalina.sh run

AmbientCapabilities=CAP_NET_BIND_SERVICE
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
```
Nu kun je de service starten met:

```sudo systemctl restart tomcat```

En kun je er voor zorgen dat de service gelijk opstart met:

```sudo systemctl enable tomcat```

Voor meer details rondom ```systemd``` en services verwijs ik graag naar [Linux](./operating_systems)


## Tot slot

Er zijn een aantal zaken die we nu expliciet ***niet*** hebben behandeld. 

### Users

De applicatie draait nu als de student-user. Dat is niet zo netjes. 
Het is netter een aparte user voor de applicatie-zelf te maken, maar dat brengt 
ons net wat te diep bij algemene server-admin taken.

Het grote probleem is dat de student-user sudo-rechten heeft, en dus kan escaleren naar root. Dat is een in-het-echt onacceptabel risico voor een
server die door gebruikers benaderd kan worden.

Prima voor een schoolprojectje, maar in het echt moet je hier dus nog net even
wat meer tijd aan besteden. 
Lees dus even bij over [Linux](./operating_systems) wat je daaraan moet doen.

### Databases

Je hebt nu nog geen database. Maar eerder in de opleiding heb je al eens uit het niets Postgres geinstalleerd. Daar is niets veranderd. 

Aangenomen dat het netwerk werkt, is een database connectie opzetten vanuit een applicatie niet zo spannend. Feitelijk bestaat het uit twee subproblemen:

1. De configuratie
2. De verbinding

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

...TODO... even HTTPS op Tomcat uitzoeken.