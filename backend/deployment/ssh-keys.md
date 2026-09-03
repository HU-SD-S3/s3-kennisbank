# SSH 

SSH (Secure Shell) is een protocol dat gebruikt wordt om command-line toegang tot andere systemen te krijgen.
Het wordt daarnaast vaak ook gebruikt om kleine hoeveelheden data over te zetten (Bijv. via `scp` of `git`).

SSH is met afstand de meest gangbare manier om met productie-omgevingen om te gaan. En aangezien we graag zaken automatiseren kunnen we niet de hele tijd midden in onze scripts wachtwoorden gaan invoeren.

Kortom, SSH geeft ons een manier om makkelijk, op afstand, grote hoeveelheden servers te scripten. SSH keys geven ons een manier om dat te doen zonder de hele tijd onderbroken te worden voor een wachtwoord.

Git is altijd meer vriendjes geweest met het SSH protocol, dan met het HTTP protocol. Via HTTP zijn er rondom inloggen zoveel vreemde randgevallen, dat het echt de moeite waard kan zijn om de iets lastigere variant te leren, om later een boel hoofdpijn te besparen. 

Dus hoewel SSH niet primair voor Git bedoeld is, is het voor een Software Developer vaak wel meest gebruikte use-case.

## A-symmetrische cryptografie

Hoewel SSH technisch gezien met usernames en wachtwoorden kan werken, worden in de meeste gevallen public/private keypairs (in de volksmond *ssh keys*) gebruikt. 

Een public/private keypair is een handige vorm van a-symmetrische cryptografie. 
Het kern-idee erachter is dat je niet met 1 sleutel zowel data kan encrypten (versleutelen) als kan decrypten (ontcijferen).

Klassiek gezien, dus met symmetrische cryptografie, gebruik je 1 geheime sleutel om zowel te encrypten, als te decrypten. 
Dan is het grote probleem om die sleutel op zowel de plek waar je wil encrypten, als de plek waar je wil decrypten te krijgen, zonder dat iemand dat afluistert (je hebt immers nog geen encryptie).

Heel kort-door-de-bocht-gezien lost a-symmetrische cryptografie dit op door meerdere sleutels te hebben, waarmee je OF dingen kan encrypten, OF dingen kan decrypten, maar NIET allebei. Specifiek gezien maken we er twee: een public key om te delen, en een private key om heel voorzichtig mee te zijn.

Als we een beetje nuance overslaan dan kun je doen alsof de public key altijd de encryptie-sleutel is, en de private key altijd de decryptie-sleutel (de werkelijkheid is iets gecompliceerder).

De public key kan je dan aan iedereen die je wilt geven. En die personen kunnen dan allemaal veilig jou een bericht sturen. Wetend dat alleen jij het kan uitpakken.

En als je een bericht terug wilt sturen? Nou dan vraag je gewoon hun public key op, die ze je zonder problemen kunnen geven.

Een andere vergelijking die je zou kunnen hanteren is dat de server waarmee je connect (die dus jouw public key weet, maar niet je private key) een puzzel genereert met jouw public key, waarvan de server weet dat je 'm alleen kan oplossen als je ook de private key hebt. Dat de server dit kan doen zonder de private key te kennen is een knap staaltje wiskunde.

Hoe dan ook, in beide gevallen kun je bewijzen dat jij de andere helft van de sleutel bezit, en dus echt de persoon bent die je claimt te zijn.

Dit vormt ook de basis van HTTPS verkeer, maar dat is een heel ander onderwerp, we zijn nu met SSH bezig.

## TLDR: Hoe werkt het?

Om zonder wachtwoorden met servers te praten, of om op een betrouwbaardere manier met Git-repositories te praten is SSH reuze handig. Meestal heb je dan een Keypair nodig.

Zo'n keypair maak je met:
```shell
> ssh-keygen
```
Dat genereert een `id_{algoritme}` bestand met de **private key**. En een `id_{algoritme}.pub` bestand met de **public key**. Standaard staan deze bestanden in de `~/.ssh` folder (dus een **verborgen** subfolder van je home-directory).

Om op een linux-server (bijv. IP adres 123.123.123.123) als user XYZ in te loggen zet je de public key in de file `/home/XYZ/.ssh/authorized_keys` op de server. Vervolgens connect je dan naar die server met `ssh XYZ@123.123.123.123`. 

Om bijv. met Github een repository te clonen voeg je de public key toe aan je account (ergens onder Settings), en gebruik je de SSH url om te clonen: `git clone git@github.com:ORG_NAME/REPO_NAME.git`. Per geregistereerde SSH-key kun je aangeven welke HU-Enterprise organisations (lees 'semesters') deze key rechten heeft. Dit is zo'n geval waar security en gebruikersvriendelijkheid verre van hand-in-hand gaan.

Mochten om één of andere reden de SSH-commando's niet beschikbaar zijn, dan zijn deze op windows te installeren als 'Optional Feature: OpenSSH Client', en op Mac, Linux met iets als `{pkg_manager} install openssh` (bijv. `apt install openssh`, of `brew install openssh`).