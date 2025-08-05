# Inleiding [_inleiding]

Deze reader hoort bij de cursussen Backend Programming 3 & Advanced
Software Design van de Hogeschool Utrecht. Deze cursussen zijn
samengevoegd tot de Kennisroute Software Development Backend als
onderdeel van het Innovation semester.

Naast deze reader bestaat de cursus ook uit hoorcolleges en
werkcolleges, zijn er oefeningen te maken uit een Github repository en
hoort er een (deel van) een gedistribueerd systeem ontwikkeld te worden.

De reader is op dit moment zeer in ontwikkeling en bestaat voornamelijk
uit een soort 'improvisatie hoorcollege, maar dan furieus typend'.

De inhoud van de cursus is gebaseerd op een 4-tal leerdoelen. Deze
behoeven enige toelichting.

## Leerdoel Gedistribueerde Systemen [_leerdoel_gedistribueerde_systemen]

> “De student kan systemen, en niet slechts applicaties ontwikkelen, die
> in z’n geheel een echt probleem oplossen.”

In jaar 2 hebben we geleerd hoe we een superstandaard CRUD API maken.
Een heel groot deel van de Software Development wensen in het
bedrijfsleven kunnen met deze kennis (en een beetje meer oefenen) prima
opgelost worden.

Soms echter loop je tegen grenzen aan. Dan is het goed om een idee te
hebben van het verdere landschap. De leeruitkomst Gedistribueerde
Systemen probeert je handvaten te geven waar je zelf verder zou kunnen
gaan zoeken om op dat soort momenten je problemen op te lossen. Het
vakgebied gedistribueerde systemen is namelijk vééél te groot om in de
diepte in een (klein deel van) een semester te behandelen.

De insteek is bij deze leeruitkomst in alle gevallen primair praktisch.
Hoe krijg je zo snel mogelijk een werkend product in handen, zodat je
zelf kan gaan experimenteren en doorleren.

## Leerdoel Gedreven Ontwerpen [_leerdoel_gedreven_ontwerpen]

> "De student kan gerichte, genuanceerde ontwerpen opstellen volgens
> moderne standaarden en gedachtegoeden.”

In jaar 2 hebben we allerlei standaarden geleerd, zoals een
lagen-architectuur, of een componentenarchitectuur. We hebben geleerd
hier (in voor- en tegenspoed) allerhande diagrammen van te maken.

De steeds terugkerende vraag bij deze documentatie naar ons als docenten
was: "Is dit nu goed?". Helaas sta je er over een paar jaar helemaal
alleen voor.

Het primaire doel van deze leeruitkomst is je handvaten geven om *zelf*
je koers te bepalen. Waarom heb je gekozen voor een bepaalde oplossing?
Wat zijn de voordelen? Maar ook, wat zijn de nadelen? Zou je na een half
jaar nog tevreden zijn met die afweging?

## Overige leerdoelen [_overige_leerdoelen]

> “De student voelt zich een professionele developer in de dop en kan
> dat onderbouwen met de juiste vaardigheden."

Als één van de laatste 'vakken' in je opleiding is het ook belangrijk om
stil te staan bij je rol als developer. De meesten van jullie gaan
straks voor 20,30,40 uur in de week aan de slag als *Software
Developer*. Als je iets zoveel uur in de week doet, dan gaat het (of je
dat nou wil of niet) onderdeel uitmaken van je identiteit. Je bent
straks één van ons!

> “De student is zich bewust van zijn SD werk binnen het bredere kader
> van ICT.”

Wat houdt dat nou in? Hoe kunnen we er voor zorgen dat, mede dankzij
jou, software als geheel gewoon een stukje beter draait in de wereld?

Dit gaat in elk geval een zekere mate van bewustwording inhouden wat
voor *andere* richtingen, beroepen en vakgebieden met jouw werk in
aanraking komen.

Het gaat in elk geval niet over het reduceren van Software Development
tot "Jira-ticket-erin, Software-eruit".

## Verantwoording HBO-I [_verantwoording_hbo_i]

Op moment van schrijven wordt dit getoetst middels een vrije
project-structuur. Kleine teams van studenten bouwen elk verschillende
gedistribueerde systeempjes gekoppeld aan een centraal thema. En
vervolgens integreren we de individuele systemen tot één groot systeem
(nouja, dat proberen we, het gaat om de problemen die dit oplevert).

Het is de bedoeling dat Gedistribueerde Systemen Niveau 3
inhouds-complexiteit levert voor Software Realiseren. We bouwen een
systeem bestaande uit meerdere applicaties, en schaalbaarheid is één van
de dimensies die we behandelen. We willen expliciet ook een evolueerbaar
systeem maken, dus met evt. regressies moet ook rekening gehouden
worden. In de cursus maken we constant onderscheid tussen hoe je de
applicatie technisch werkend krijgt, en daarna hoe je het volgens
standaard design-patterns netjes houdt.

Evenzo moet Gedreven Ontwerpen Niveau 3 inhouds-complexiteit leveren
voor Software Ontwerpen / Analyseren. Bij het koppelen van de
verschillende systemen moet er kritisch gekeken worden naar de (vaak
conflicterende) wensen van de verschillende teams, alsmede de
requirements van de externe gebruikers (verwoord door de docent). Deze
bestaande systemen moeten geïntegreerd worden, en waar nodig
vervangen/aangevuld met nieuwe services. Met NoSQL wordt het
noodzakelijk architectuur op data-verwerking toe te passen. Door
expliciet vanuit verschillende perspectieven te testen wordt het hele
systeem beschouwd.

De Context-complexiteit van deze vorm is niveau 3 (omdat er veel
afhankelijkheid is tussen de verschillende studenten, en omdat ze vrij
worden gelaten qua invulling). De zelfstandigheid is waarschijnlijk
niveau 2 voor de meeste studenten, maar niveau 3 voor degene die een
lead-rol binnen hun team aannemen. == Gedistribueerde Systemen

## Wat is het? [_wat_is_het]

> “A distributed system is one in which the failure of a computer you
> didn’t even know existed can render your own computer unusable.”
>
> —  Leslie Lamport

Tot nu toe heb je in je opleiding applicaties gemaakt die bepaalde
problemen voor je stakeholders oplossen. Dat is een nobel begin, maar
vaak staan deze applicaties niet op zichzelf en wordt het tijd om na te
denken over groepen applicaties die samen nog steeds de problemen van je
stakeholders oplossen.

Zo’n groep applicaties die samen een doel dienen noemen we een
gedistribueerd systeem. Een gedistribueerd systeem distribueert
(verdeelt) de werking van het systeem over meerdere nodes (computers).
Met een computer wordt in dit geval een 'rekenend ding' bedoeld, niet
noodzakelijk het fysieke apparaat. Als jij twee applicaties op je laptop
draait, dan kan men verwarrend genoeg spreken van twee computers
(processen) op je computer (hardware-apparaat). Deze gedistribueerde
systemen hebben de verdiende reputatie om erg ingewikkeld te worden.

## Voorbeelden [_voorbeelden]

> "A distributed system is a collection of independent computers that
> appears to its users as a single coherent system."
>
> —  Tanenbaum Van Steen (2017)

### Satelieten [_satelieten]

### Whatsapp [_whatsapp]

### Bitcoin [_bitcoin]

## Waarom distribueren? [_waarom_distribueren]

Bovenstaande systemen zijn allemaal best intimiderend qua complexiteit.
En tot nu toe werkte zo’n Spring @RestController toch prima? Waarom zou
je jezelf dit aan willen doen?

In de literatuur (TODO:2 ref) hanteert men vaak de volgende
standaardredenen:

-   Fysieke redenen

-   Performance / schaalbaarheid

-   Reliability / fault-tolerance

-   Integratie bestaande systemen

Allereerst Fysieke (of essentiele) redenen. Stel je neemt een systeem
als Whatsapp, of een multi-player game als Counterstrike. Deze software
systemen zijn per definitie gedistribueerd. Het zit in hun aard. Zonder
het systeem uit meerdere processen (clients, servers) te laten bestaan
kun je niet een bericht van een telefoon (client) via een server van
Whatsapp naar andermans telefoon sturen. Evenzo kun je niet multiplayer
iemand proberen neer te schieten als je niet alletwee achter je eigen
computer zit (met evt. een centrale server ertussen). Een ander
voorbeeld is als er echt fysieke redenen zijn om een computer op een
bepaalde plek te zetten, zoals bijv. bij de satelieten, of bij een
MRI-scanner in een ziekenhuis. Die scanner gaat nergens heen, dus je
zult de computer naar de scanner moeten brengen (en die wil z’n
informatie natuurlijk delen met de rest van het ziekenhuis).

Twee computers kunnen meer rekenen dan één. Da’s een waarheid als een
koe. Er zijn zat problemen (TODO:3 voorbeelden, zoals eiwit vouwen,
HADRON collider, maar ook wat moderners) die ook voor de grootste
supercomputer te groot zijn. Dan kun je de last verdelen over meerdere
computers, en heb je direct alle uitdagingen van een gedistribueerd
systeem te pakken. Dichter bij huis kun je die performance-winst vaak
ook wel vinden, want stel je wil bijv. je site op een Cloud-provider als
AWS of Azure hosten, dan is het vaak goedkoper om twee kleinere machines
te huren, dan om één grote te contracteren.

Wat mij betreft de meest interessante, en veelal de meest praktische
reden om een systeem te distribueren is om de reliability
(betrouwbaarheid) te vergroten. Als je systeem uit slechts één proces
bestaat, en dat proces functioneert niet (de server is **down**, het
process is gecrashed, het netwerk laat je er niet bij), dan doet niets
in je systeem het. Als je je systeem uit meerdere onderdelen laat
bestaan, dan kan je systeem 'een beetje stuk' zijn.

Het klinkt raar om 'een beetje stuk' als iets goeds te zien, maar veelal
zijn er oorzaken buiten je controle die er voor zorgen dat het maar wat
handig is dat bepaalde delen van je systeem gewoon doordraaien, als er
andere delen even uit liggen. Denk hierbij bijv. aan klassieke
hardware-fouten (hardware gaat stuk, iemand trekt de stekker eruit),
rampen (brand in het datacenter), of onschuldiger, een software update
(dan moet het proces ook eventjes uit).

Persoonlijk was reliability voor mij een groot goed. Vroeger was ik
verantwoordelijk voor een grote applicatie die uit 1 proces bestond,
maar wel uit veel verschillende delen. Updates aan deze applicatie
uitvoeren was erg lastig, want dan was alle functionaliteit van ons
bedrijf onbereikbaar.

Het gevolg was dat we 3-4 keer per jaar, midden in de nacht, een
mega-release deden. Dat ging eigenlijk nooit goed en was altijd enorm
stressen om alles voor 06:00 's ochtends weer 'goed genoeg' te krijgen.

Een ander gevolg was dat als 1 deel van de applicatie een foutje had (en
bijv. de CPU van de server op 100% zette), dat de hele applicatie het
niet meer deed.

Deze twee zaken zorgden voor een bedrijfssfeer en cultuur waarbij er
altijd stress en druk was, en vooral *schuld* een grote rol speelde. Op
het ergste moment zette een collega van mij alle instructies die hij van
projectmanagers ontving in een git-repository, zodat hij achteraf kon
bewijzen dat hij een bepaalde instructie echt ontvangen had (omdat er
bij grote outages vaak geclaimed werd dat "De developers zomaar wat
deden, waardoor het allemaal mis ging").

Door de technieken van deze cursus te leren en toe te passen was ons
bedrijf in ong. een jaar tijd vervormt van een hele nare plek om te
werken, naar een hele prima plek. Door de applicatie in stukjes te
hakken, high-availability patterns toe te passen, en vooral messaging te
gebruiken konden we gewoon overdag onder werktijd deployen. En omdat het
zo makkelijk was gingen we dat ook veel vaker doen (meestal elke twee
weken, maar ook vaak zat vaker). En als er problemen op productie waren,
dan konden we vaak dat stuk van de aplicatie gericht even 'offline voor
maintenance' halen, en kon de rest doordraaien. Niet ideaal, maar
*stukken* beter dan het alternatief.

De stof van dit semester heeft me echt rust, en een veel fijnere baan
gegeven.

-Tom

Tot slot hebben we nog de aanwezigheid van bestaande systemen die ons
kunnen dwingen om de uitdagingen van een gedistribueerd systeem het
hoofd te bieden. Op school heb je er niet zoveel mee te maken, maar in
de meeste praktijk situaties heb je te maken met bestaande software
systemen. De studentenlijst moet uit Osiris komen, en correct in Canvas
geladen worden. Cijfers uit Testvision moeten teruggezet worden bij een
assignment in Canvas, etc. (dit is allemaal wensdenken overigens, de HU
is niet zo geautomatiseerd). Deze systemen zijn allemaal afzonderlijk
van elkaar ingekocht, en vaak in compleet andere programmeertalen
geschreven, dus in deze gevallen kun je er niet één applicatie van
maken, ook al zou je het willen.

## Waarom niet? [fallacies]

Genoeg redenen om een systeem te distribueren dus. Helaas heeft het ook
zeker nadelen. Een klassieke opsomming zijn de 8 fallacies[^1]
(drogredenen) van gedistribueerde systemen \[TODO:2 Ref Deutsch &
Gossling, deze is lastig te vinden?\]:

-   The network is reliable

-   Latency is zero

-   Bandwidth is infinite

-   The network is secure

-   The topology does not change

-   There is one administrator

-   Transport cost is zero

-   The network is homogenous

Al deze fallacies zijn makkelijk te negeren als developer. We zitten
immers 90% van onze tijd lekker te klungelen op `http://localhost:8080`.
Als we communiceren met localhost (ook wel bekend als ip-adres
127.0.0.1) dan is het netwerk *wel* reliable. Het is zeer
onwaarschijnlijk dat je zogeheten loopback-adapter het niet doet.

De latency, plat gezegd de vertraging tussen het versturen van pakketjes
(*packets*) informatie en het aankomen er van, is via die
loopback-adapter ook nagenoeg nul. En de bandbreedte, dus hoe groot de
packets informatie mogen zijn en hoeveel data er in totaal verstuurd kan
worden is praktisch oneindig. Kortom, op localhost hebben we met deze
fallacies niet zoveel te maken.

Het is daarom vaak een nare verrassing als je daar ineens *wel* rekening
mee moet houden. De eerste drie fallacies spreken voor zich, als je
lange kabels hebt kan er van alles mee gebeuren, er kunnen zelfs haaien
in bijten \[TODO:3 ref haaien\]. En als het niet jouw netwerk is, dan
kun je er ook kosten voor moeten betalen (Cloud providers zoals Azure en
AWS kunnen je hier vaak met een onverwacht gepeperde rekening
presenteren).

Als je niet mag aannemen dat het netwerk veilig (*secure*) is, dan
betekent dat dat je allerlei extra infrastructuur zult moeten hanteren
om te zorgen dat je toch veilig tussen verschillende
computers/applicaties/processen kan communiceren. TLS (Transport Layer
Security) is een veelgebruikte oplossing hiervoor. Dit ken je
waarschijnlijk zelf als het verschil tussen http en http&\*S\*.

De aanname dat er één administrator is (vaak gekoppeld met de aanname
dat jij dat bent, aangezien jij immers de baas bent van je eigen
localhost-omgeving) zorgt vaak voor onverwachte problemen. Het kan bijv.
een stuk langer duren voordat je überhaupt toegang krijgt tot je
productie-database, of je kan er ineens niet meer bij omdat je een
mailtje over het hoofd hebt gezien. Anderzijd s kan het ook zo zijn dat
een ander systeem dat jij nodig hebt (bijv. een gedeeld inlog-systeem)
besluit een update uit te voeren. Dan heb je ineens twee problemen:
tijdens de update heb je een overduidelijk probleem, want het andere
systeem ligt eruit, maar je moet ook uitzoeken of je na de update nog
wel correct met het systeem kan praten!

Tot slot hebben we nog twee stukjes yargon. De aanname dat de topologie
niet verandert betekent dat de *abstracte vorm* van het netwerk niet
verandert. Stel je hebt een kantoornetwerk, waarbij elke computer
verbonden is met een switch, en die switch gaat via een router naar
buiten. Als we dan al die computers een beetje gaan verschuiven
verandert het netwerk dan welliswaar van vorm (alle computers staan op
een andere plek), maar niet van abstracte vorm (het zijn nog steeds een
ster van computers aan een switch, die vanuit daar naar een router
gaan). In internet-systemen kom je dit vaak tegen als
lange-afstand-routes door bijv. BGP \[TODO:2 ref BGP\] veranderen.

De laatste is de aanname dat het netwerk *homogeen* is, oftewel dat het
uit dezelfde soort apparaten bestaat. Tussen jouw systemen staan vaak
allerlei andere apparaten, en je bent vaak een beetje afhankelijk van
wat voor soort protocollen, dataformaten en groottes deze apparaten
ondersteunen. Een voorbeeld hiervan is de enorme vertraging die de
overstap van IPv4 naar IPv6 op is gelopen \[TODO:3 IPv4-IPv6 link\].
Dichter bij huis was (is?) er een reverse-proxy ergens voor Canvas die
Cookie-headers afkapt, sommige studenten (die bijv. bij veel
verschillende \*.hu.nl sites waren ingelogd) konden soms (want het
verkeer ging niet altijd over die server) niet inloggen bij Canvas.

## Voorbeelden [_voorbeelden_2]

We hebben eerder gekeken naar grote gedistribueerde systemen. Maar als
we goed kijken zien we deze problemen (en kansen) al in veel kleinere
systemen terug.

### Databases [_databases]

Op het moment dat we een externe database gebruiken voor onze webservice
hebben we eigenlijk al een gedistribueerd systeem!

Meestal is de verbinding tussen die twee systemen zo goed dat we er niet
over na hoeven denken. Maar soms gaat die vlieger niet op. Bij grote
hoeveelheden data, of bij grote hoeveelheden requests kun je toch merken
dat er vertraging ontstaat bij de interactie met de database.

Denk bijv. terug aan het *N+1*-probleem in een ORM. Dat is het probleem
waarbij je entity hebt, met een referentie naar een collectie van andere
entities, die op hun beurt een *lazy* referentie hebben naar een derde
entity. Een concreet voorbeeld is bijv. een *Klas* met
*Student*-objecten, en elk *Student* object heeft een lazy referentie
naar diens *Adres*. Als je zonder goed na te denken (*eager fetching*)
een lijstje van adressen van een klas wilt teruggeven in een controller,
dan zal jouw ORM framework per student een losse call naar de database
doen om dat ene adres op te halen. Dat is op localhost al niet fijn,
maar als je database enkele tientallen miliseconden verder weg staat ga
je dat al heel snel merken. Latency is immers niet zero.

Een ander geval waarin je gedistribueerde systemen problematiek
tegenkomt is wanneer je *caching* gebruikt. Stel je hebt een dure query
die een paar seconden duurt, maar de informatie verandert niet heel
vaak…​ Dan is het vaak slim om de resultaten een paar seconden of minuten
in het geheugen te houden, en andere requests voor dezelfde informatie
direct uit het geheugen te beantwoorden. Op dat moment zijn er twee
kopieën van de data aanwezig in het systeem (de waarheid in de database,
en jouw lokale gecachede kopie). Zorgen dat die twee niet te ver uit
elkaar lopen kan snel vrij tricky worden, en de bandwith is niet
infinite.

### Doodnormale webapp [_doodnormale_webapp]

Een doorsnee webapp zien we vaak niet als gedistribueerd systeem, maar
de combinatie frontend en backend is er toch echt één. Meestal stuur je
als frontend een pakketje html, javascript en css naar de
client-computer, en die draait op diens systeem de geleverde code.

Meestal hoef je daar niet te diep over na te denken, maar in sommige
gevallen wordt dat ineens erg belangrijk. Stel je hebt bijv. gegevens en
plaatjes in een beveiligde Cloud-opslag account staan…​ De meeste
cloud-providers hebben een javascript API zodat je in javascript bij
deze gegevens zou kunnen, maar dan is dat nog steeds geen goed idee!
Want je zou in dit geval dan jouw inlog-gegevens moeten meesturen met de
frontend-bundle, en hoe goet je dat ook probeert te verstoppen of te
verbergen, die informatie gaat te achterhalen zijn…​ De network is immers
niet secure.

## Distribution Transparancy [_distribution_transparancy]

Waarom denken we bij dat soort kleinere situaties vaak niet aan
gedistribueerde systemen? Dat komt omdat hun gedistribueerde aard goed
verstopt is! Als je online aan het shoppen bent, dan voelt de frontend
echt als onderdeel van de winkel (terwijl het toch echt op jouw pc
draait), en je denkt niet aan hun database, of webserver, of
loadbalancer, of inlogsysteem: er is gewoon *de winkel*.

Dit principe, dat je niet doorhebt dat er eigenlijk vele verschillende
processen een rol spelen noemen we met een chique woord *Distribution
Transparancy* <span class="citation">([Tanenbaum & van Steen,
2017](#tanenbaum_distributed_2017))</span>. Deze term is een beetje
verwarrend, want Distribution Transparancy is behaald als men *niet* kan
zien dat het systeem gedistribueerd is[^2].

Uiteraard is deze transparantie nooit volmaakt, en kan die op
verschillende wijzes complexiteit verbergen, of juist laten
doorschemeren.

-   Access Transparancy: Hiermee bedoelen we dat het niet precies
    duidelijk is hoe we bij bepaalde informatie komen. Krijgen we de
    informatie direct? Of zit er een tussenpersoon tussen? Als jij naar
    een website gaat zit daar vaak een <https://www.x.y> adres voor,
    maar het zou maar zo kunnen dat de ene helft van de website van een
    web-winkel-server komt, terwijl bijv. de nieuwspagina van een
    CMS-server komt, en de bedrijfsinformatie op een derde plek gehost
    wordt. Door een slimme Gateway/API-facade/etc. er voor te zetten
    merk je dit niet. Totdat ineens de ene helft van de site offline is,
    en de andere niet. Dan wordt duidelijk dat er altijd al meerdere
    delen waren.

-   Location Transparancy: Er zijn vele truken om te voorkomen dat men
    exact weet *waar* een bepaalde service gehost wordt. Neem bijv.
    urls. Als we bijv. kijken waar <https://utrecht.nl> gehost wordt,
    dan is het een redelijke aanname dat dit in Utrecht is, en
    inderdaad, dat blijkt (op moment van schrijven tenminste) te
    kloppen[^3]. Dan zou het ook logisch zijn om aan te nemen dat
    <https://hu.nl> ook in Utrecht te vinden is. Maar nee, de Hogeschool
    Utrecht site woont in een datacenter in Amsterdam. De exacte locatie
    is dus niet te zien, een vorm van transparantie.

-   Replication Transparancy: Grote websites krijgen vaak zoveel
    bezoekers dat één server het niet allemaal aan kan. Performance was
    immers een reden om een gedistribueerd systeem te bouwen.
    Desalniettemin kun je als het goed is niet zien dat er meerdere
    servers gebruikt worden. Wie weet hoeveel servers er achter
    <https://hu.nl> schuilen? Een genant[^4] alternatief zou bijv. zijn
    als er op drukke Open Dagen sommige opleidingen zouden draaien op
    <https://opendag1.hu.nl/ICT> en anderen op
    <https://opendag2.hu.nl/tandheelkunde>.

-   Concurrency Transparancy: Als ik op een grote internet webwinkel zit
    te browsen achter mijn computer, dan *voelt* het alsof ik de enige
    klant in de winkel ben. Ik zie in elk geval geen andere klanten! Dus
    het lijkt alsof die server alleen met mij bezig is, wat natuurlijk
    een enorme eer is. In werkelijkheid is die server met tichduizend
    mensen tegelijk bezig. Allemaal onzichtbaar (transparant) voor mij.

-   Failure Transparancy: Je hebt vast wel eens meegemaakt dat je
    ineens, in plaats van een mooie pagina, geconfronteerd wordt met een
    kale HTML pagina, waarop ineens staat dat er geen connectie gemaakt
    kan worden met database XYZ. Meestal ook nog met een mooie
    stacktrace, en een hint wat voor server/framework/database gebruikt
    wordt. Vervolgens haal je je schouders op, en druk je op F5 om te
    refreshen, en voilá alles werkt weer. In dat geval ben je even mooi
    met je neus op de feiten gedrukt dat deze site een aparte database
    gebruikte, dat er een verschil tussen backend-en-frontend framework
    is, en meer van zulks.

## Integratiestijlen [_integratiestijlen]

Grofweg zijn er 4 stijlen te vinden waarop we applicaties met elkaar
integreren <span class="citation">([Hohpe & Woolf,
2012](#hohpe_enterprise_2012))</span>

-   File Transfer

-   Shared Database

-   RPC

-   Messaging

File transfer gaat over het exporteren van grote hoeveelheden data
(dumps) uit systeem A, om die vervolgens in systeem B in te laden. Dat
kan geautomatiseerd, of met de hand (download, en vervolgens upload).
Shared Database is de voor de hand liggende strategie om meerdere
processen direct op dezelfde database aan te sluiten, dan is de
integratie ook snel geregeld.

File transfers zijn vaak nogal log, duren lang, en zijn nogal fragiel.
Als er eeeergens iets mis gaat moet je vaak het hele proces annuleren,
omdat je niet met zekerheid kan zeggen dat de rest van de data nog wel
veilig geïmporteerd is.

Een Shared Database klinkt als een goed idee, en voor hele kleine
integraties kan het ook nog wel. In de praktijk leidt deze aanpak echter
al snel tot frictie. We zijn gewend om onze database te kunnen updaten
(kolommetje erbij, kolommetje renamen, etc.). Dit gaat enorm fout als er
meerdere applicaties op dezelfde database draaien. Het is al lastig om
dit allemaal goed te onthouden als je zelf als solo-developer al die
applicaties onderhoudt, maar als de applicaties ook nog eens door
verschillende teams van developers onderhouden worden, dan wordt deze
aanpak al snel één grote chaos.

Jarenlang had één van onze klanten een systeem waarbij bepaalde
rapporten die bij hen op een of ander dashboard getoond werden
rechtstreeks op onze database gedraaid werden. Deze afspraak was lang
voor mijn tijd gemaakt en kon, voor zover men zei, niet worden
aangepast.

Dit zorgde er voor dat grote delen van ons datamodel compleet vast zaten
en niet verbeterd konden worden. Een groot probleem omdat we een
multi-tenant (meerdere-klanten-op-1-systeem) applicatie hadden.

Uiteindelijk werd het zo erg dat we maar de hele codebase geforked
hebben zodat al onze andere klanten geen last hadden van deze deal.
Jarenlang hebben we dus bij elke wijziging rekening moeten houden met
'kan het ook voor die ene klant?!'.

Kortom, pas op met Shared Databases. Je hebt supersnel een eerste
versie, en daarna vaak jarenlang ellende.

-Tom

Een Remote Procedure Call (RPC) is een bericht dat een methode aanroept
in een extern systeem. Dat is een hele gangbare en flexibele manier van
integreren waar we in [Remote Procedure Calls](#_remote_procedure_calls)
dieper op in zullen gaan.

Tot slot kun je gebruik maken van asynchrone messaging systemen. Dat is
een zeer flexibele, maar ook in eerste instantie lastige, manier van
integreren. Hierbij leggen de verschillende onderdelen berichtjes voor
elkaar klaar, die dan zo snel mogelijk opgepikt dienen te worden. Deze
stijl van integratie is één van de grotere technische uitdagingen van
deze cursus en zal uitgebreid worden behandeld in
[Messaging](#_messaging) en [Messaging & Events](#_messaging_events).

## Communicatiewijzes [_communicatiewijzes]

Naast een algemene stijl van integratie zijn er ook verschillende
manieren waarop de verschillende nodes in je systeem met elkaar
communiceren. In <span class="citation">([Hohpe & Woolf,
2012](#hohpe_enterprise_2012))</span> onderscheiden we grofweg drie
manieren:

-   Fire & Forget

-   Request-Reply

-   Publish-Subscribe

Degene die verreweg het meest bekend zal zijn is Request-Reply. Tot nu
toe waren onze backends voornamelijk HTTP gericht, dus met een
HTTP-Request en een HTTP-Response (de reply). Hierin verwachten we
altijd een antwoord op ons verzoek, al is het maar puur een erkenning
dat het Request correct begrepen en/of uitgevoerd is. Uiteraard is het
nadeel van een Request-Reply strategie dat je alle Fallacies of
Distributed systems dubbel tegenkomt! Op de heenweg (het Request) en op
de terugweg (de Reply). Meestal gebruikt een RPC integratie
Request-Reply als communicatiewijze.

Als je per se tegen de stroom in wilt, dan zou je kunnen beweren dat een
Request/Acknowledge HTTP interactie een voorbeeld is van Fire & Forget
met RPC. Bij Request/Acknowledge checkt de ontvangende partij puur of
het ingekomen bericht begrijpelijk is, en stuurt zo snel mogelijk een
HTTP-status 202-Accepted terug. Het daadwerkelijke werk gebeurt dan op
bijv. een andere Thread. Een voorbeeld hiervan zijn bijv. de algemene
AVG & Privacy-rapporten die je kan opvragen bij Social Media providers.
Dan verzoek je al je data en krijg je een paar dagen later een berichtje
dat je een zipje/pdfje/ander-verslagje kan downloade.

Publish-Subscribe kan natuurlijk ook over RPC, dan denk je bijv. aan
zogeheten Web-Hooks. Zo kun je bij Github bijv. voor verschillende
*Events* (zoals een push, of een gefaalde CI-build, of iets dergelijks)
één of meerdere URLs opgeven waar Github dan een bepaalde POST naartoe
stuurt als die gebeurtenis optreedt.

In het geval van Fire & Forget sturen we een bericht naar een andere
service. En dat was het. We weten niet *OF* het is aangekomen, *OF* het
begrepen is, *OF* dat het misschien grandioos is misgegaan. Weten we
allemaal niet. En, als dit acceptabel is in onze usecase, dan is dat ook
heel bevrijdend! We weten het niet, en hoeven er dus ook geen rekening
mee te houden in ons systeem! (sterker nog, dat kunnen we helemaal
niet). Een voorbeeld is als je bijv. informatie wilt loggen en dat naar
een ander systeem wilt brengen. Meestal is die informatie van vrij lage
waarde, dus we willen absoluut niet het risico lopen dat een fout in het
versturen van onze logging-informatie de echt belangrijke
business-processen tot een halt roept. In de praktijk gebruiken we een
Fire & Forget interactie ook wel in het wat grijzere gebied waarbij we
een bericht versturen, en de informatie over hoe het is gegaan op een
totaal andere wijze, vaak veel later, pas terug komt. Neem bijv. het
versturen van een e-mail. Als dit niet lukt (bijv. omdat het andere
emailadres niet bestaat, of omdat er iets qua spam-regels niet helemaal
soepel gaat), dan hoor je dit vaak pas uren/dagen later, via een totaal
ander kanaal. Het is dan een beetje een grijs gebied of dit
Request-Reply, of twee losse Fire & Forgets zijn.

Tot slot is er Publish-Subscribe, dat is het standaard Observer-Pattern,
maar dan voor communicatie tussen processen. Bij het Observer-pattern is
er een Event (bijv. een Button-Click), waar meerdere functies zich aan
kunnen hangen (*subscriben* als een *observer*). Op het moment dat er
daadwerkelijk geclicked wordt, dan wordt de click-event gepublished naar
alle subscribers; oftewel al die functies worden uitgevoerd. Bij de
Publish-Subscribe integratie-wijze meldt je een service dus aan om
bepaalde berichten te ontvangen. Dit zorgt er voor dat de service waar
informatie vandaan komt niet hoeft te weten *OF*, en zo ja, *hoeveel*
services er van diens informatie afhankelijk zijn. Dat is ook heel
bevrijdend qua werklast. Jij kan als service-developer gewoon je ding
doen, services komen wel naar jou toe als ze interesse hebben. Zo’n
event wordt vaak via eenzelfde systeem als Fire & Forget gepublished,
dus één kant op, met geen fancy foutafhandeling. Dat is ook belangrijk,
want je wil niet dat één subscriber er voor kan zorgen dat alle andere
subscribers hun berichten niet meer ontvangen!

Eenvoudige messaging integraties maken vaak gebruik van Fire & Forget,
en zodra er meer & meer services ontstaan evolueert dit vaak naar
Publish/Subscribe. Het is uiteraard ook mogelijk om Request/Reply
interacties op te zetten met Messaging, maar dat is iets minder
gebruikelijk (het is gewoon net iets lastiger qua frameworks & code, dan
om in dat soort gevallen een RPC call te doen). Spring-AMQP heeft bijv.
een aantal SendAndWaitForReply methodes, maar dat is vaak een beetje
zonde, omdat jouw applicatie dan middenin een stukje server-code gaat
zitten wachten op een reply. Dat is voor een webserver vaak vragen om
performance-problemen.

## Coupling

Bij Software Architecture hebben we het gehad over Coupling: hoeveel
afhankelijkheid hebben stukken code van elkaar? De koppeling die we daar
hebben besproken was primair gericht op compile-time dependencies. Welke
andere classes of modules gebruikt een class of module om z’n werk te
doen. Dit concept van koppeling kun je breder trekken, naar
verschillende soorten koppeling. In deze cursus spelen 3 andere soorten
Coupling ook een grote rol:

-   Spatial Coupling (ook wel Referential Coupling genoemd): services
    weten van elkaar in detail **waar** ze zijn

-   Temporal Coupling: services zijn sterk afhankelijk van elkaars
    temporele eigenschappen, ze moeten bijv. tegelijk online zijn, of
    als de één traag is wordt de ander dat ook.

-   Semantic Coupling: De ene service weet stiekem heel veel details van
    hoe de ander z’n werkt doet, en maakt daar ook gebruikt van.

Als voorbeeld nemen we een bestellings-applicatie (van zeg…​
broodroosters), met daarachter een magazijn-applicatie (die bijhoudt
hoeveel we er per soort nog op voorraad hebben) en een
bezorgings-applicatie die de bestelde broodroosters tot aan je deur
brengt. En laten we een aantal mogelijke manieren doorlopen waarop dit
systeem geïmplementeerd zou kunnen zijn…​

Stel de bestellings-applicatie stuurt een bericht naar de
magazijn-applicatie via HTTP naar een bepaald IP adres (bijv. POST
<http://192.168.178.42:8082/toasters/reservations>), en die
magazijnservice stuurt een bezorgings-commando door naar de bezorging
(bijv. POST <http://192.168.178.99:8080/toasters/deliveries>). Deze
services weten nu heel precies van elkaar waar de processen draaien (op
IP-adres en poort), en omdat het HTTP is moeten ze ook allemaal tegelijk
online zijn om deze usecase te laten werken. Stel nu dat de bestelling
geannuleerd wordt, en dat in dat geval de bestellings-applicatie *weet*
dat er dan een annulering doorgestuurd moet worden naar **EN** het
magazijn, **EN** de bezorging. Dan weet de bestelservice ook nog 's
stiekem dat de magazijnservice überhaupt met de bestelservice praat.
Deze drie applicaties zijn dus Spatieel, Temporeel en Semantisch sterk
geCoupled. De kleinste fout of miscommunicatie tijdens het onderhouden
of doorontwikkelen van deze services kan het hele bestelproces om zeep
helpen, en dat zal het bedrijf niet leuk vinden.

Als je het zo expliciet leest dan denk je misschien bij jezelf "Dat
soort systemen zou ik nooit bouwen!", maar vaak ontstaan dit soort
systemen omdat dit soort features langzaam groeien, en een directe
coupling bij elke kleine stap met afstand de makkelijkste optie was.

Een alternatieve strategie is om de bestellings-applicatie via Messaging
en Publish Subscribe één bericht ("Er is een bestelling voor
broodrooster XYZ") te laten afleveren op een gedeelde plek. Zowel de
magazijn-applicatie, als de bezorgings-applicatie subscriben aan deze
berichten en krijgen dus een kopietje. De annulering kan dan soortgelijk
verlopen. In dit scenario weten de applicatie van elkaar niet waar ze
gehost zijn, of ze überhaupt online zijn, en al helemaal niet wat er
onderling gebeurd. Deze applicaties zijn dus op al deze dimensies
ontkoppelt.

Uiteraard is de compleet ontkoppelde wereld ook niet altijd ideaal, want
misschien stuurt in dit geval de magazijnservice wel nog steeds een
bericht dat de bezorging geannuleerd moet worden, en krijgt de arme
bezorger dubbele spam op z’n telefoon. Een super-los-gecoupled systeem
kan erg rommelig en chaotisch overkomen. Dus een zekere mate van
Coupling geeft ook duidelijkheid en structuur.

Tot slot nog een korte noot over de reeds bekende vorm van Coupling, die
van dependencies tussen classes en modules, maar dan in de wereld van
gedistribueerde systemen. Een vaak genoemd voordeel van gedistribueerde
systemen is dat je verschillende programmeertalen kan mengen (zodat je
teams met verschillende expertises kan laten samenwerken). Dan is het
uiteraard niet goed mogelijk om ze classes en modules te laten delen (je
kunt immers in C# geen Java classes inladen).

Ook als dit wel mogelijk is (omdat alle applicaties in dezelfde taal
zijn geschreven) is het heel erg oppassen geblazen. Het algemene advies
is om zowieso geen afhankelijkheid in te bouwen tussen services (dus
Service A zou alle classes van Service B mogen gebruiken), dat levert
teveel chaos[^5]. Op zo’n moment kun je expliciet een extra module
starten met daarin alleen gedeelde code, dan is ook voor iedereen
duidelijk dat die code niet zomaar aangepast kan worden zonder overleg
(of op z’n minst rekening-houden-met). Uiteraard zijn er puristen die
zeggen dat je dit nooit mag doen, maar wees hier vooral pragmatisch in.
Praktische voorbeelden hiervan zie je in [Multi-project-POMs
(Java-specifiek)](#multipom).

# Gedreven ontwerpen [_gedreven_ontwerpen]

> "Software Architecture is the stuff you can’t google."
>
> —  Mark Richard

Één van de lastigste issues in de overstap van een opleiding naar 'het
echte werk' is dat alle beoordelingskaders wegvallen. Het is me al lang
opgevallen dat studenten geobsedeerd zijn met de vraag "Is dit goed?".
En dan speelt dit meer bij de design-vakken, dan bij de bouw-vakken.

En het eerlijke antwoord is bijna altijd "Ik heb geen idee, wat
probeerde je te bereiken?". En dan is het antwoord vaak een zeer
verbloemde versie van "Niets eigenlijk, ik wil gewoon van deze opdracht
af zijn". En het is erg lastig om daar een ontwerp voor te maken.

-Tom

Software design is een vreemd vak. Het bestaat uit twee delen: \* Het
zichtbare gedeelte: de documenten, de diagrammen, de presentaties, het
gepraat \* Het onzichtbare gedeelte: het model van het ICT-product in je
hoofd, en hoe je dat model kan manipuleren, uitbreiden, etc.

En als het goed is, is het bij software architecture net als bij
ijsbergen: het gedeelte dat je niet ziet is veel groter, zwaarder en
belangrijker dan het topje dat je ziet. Bij elke regel code nemen we
beslissingen (hoe noem je een variabele?), en bij elk code-blokje
(afsplitsen in een nieuwe method of niet?), en bij elke nieuwe
functie/method (wat worden de input/output parameters?) en bij elke
class (welke verantwoordelijkheden beleg ik hier?) en bij elke package
(welke classes wonen hier) en bij elke module, laag, component,
microservice, deelsysteem, systeemlandschap, bedrijscontext,
concurrentiepositie, etc.

Bij gedreven ontwerpen willen we kijken naar de verschillende vormen
waarop je die onzichtbare basis kan vormgeven, en uiteraard moeten we
daarom ook even stilstaan met hoe je dat begrip zou kunnen communiceren
aan je medestudenten en docenten.

## Data-driven Design [_data_driven_design]

De meest gangbare start van projecten is helaas nog steeds dat een stel
ICTers de koppen bij elkaar steken en eens even goed gaan nadenken welke
**data** het systeem *in* en *uit* gaat. Dit leidt dan vaak tot een
ERD-diagram of UML-class-diagram, want die zijn best geschikt om
attributen weer te geven en kardinaliteitsrelaties (één-op-meer,
meer-op-meer, etc.) weer te geven.

We hebben ook sinds de jaren 80 al een redelijk idee hoe we zo’n model
kunnen maken dat voor 90% van dit soort systemen goed genoeg is
([Normalisatie](#_normalisatie)). Vervolgens maken we voor al die
stukjes data een front-end-formulier, een REST-controller die het de
database in propt, en een paar excelletjes die je kan downloaden met de
overige informatie. En hoppa, de volgende 6-/10 applicatie is tot leven
gewekt in onze industrie.

En soms is dit precies wat je nodig hebt. Weet dan dat er allerhande
frameworks zijn die je een hoop werk uit handen nemen[^6].

Door echter zo op data te focussen, en het schuiven van die data van hot
naar her (ik stel me een oude verweerde man met een sneeuwschop voor,
met een pijp in z’n mond, en zo’n oubollig petje) heb je eigenlijk ook
niet zoveel aan al die moeite die we stoppen in use-cases,
process-analyse, etc. Want *eigenlijk* interesseert het je niet, of in
elk geval alleen tot in de mate dat het invloed heeft welk veld wel/niet
in een tabel/formulier moet.

OOP heeft hier ook totaal geen zin, want we zijn alleen met
data-structuren bezig. Deze basis-architectuur noemen we vaak ook wel
een Transaction-Script <span class="citation">([Fowler & Rice,
2003](#fowler_peaa))</span>.

## Responsibility Driven Design [_responsibility_driven_design]

Er zijn in ons vakgebied een heleboel "Driven Design" of "Driven
Development" aanpakken, zoveel dat we er een leeruitkomst naar vernoemd
hebben. Dan moeten we op z’n minst even kijken naar de methode die deze
*meme* <span class="citation">([Dawkins, 1976](#dawkins_meme))</span>
gestart is: Responsibility Driven Design
<span class="citation">([Wirfs-Brock & Wilkerson,
1989](#wirfs_brock_rdd))</span>.

Het belangrijkste resultaat was in elk geval dat het verzet tegen de
tyrannie van de data geboren was.

## Attribute Driven Development (ADD 3.0) [_attribute_driven_development_add_3_0]

### Drivers [_drivers]

## Fundamental Laws of Software Architecture [_fundamental_laws_of_software_architecture]

1.  Everything in Software Architecture is a tradeoff.

    -   If you think it isn’t a tradeoff, it’s more likely you haven’t
        identified it yet.

2.  The Why is more important than the how.

<span class="citation">([Richards & Ford,
2020](#richards_ford_fundamentals))</span>

# Monolithische Architectuur [_monolithische_architectuur]

Het woord monoliet betekent een steenblok dat uit één stuk steen
bestaat. Een mono

## Diagrams [_diagrams]

### Refresher Class Diagrams [_refresher_class_diagrams]

Onderdelen van de refresher:

### Refresher Sequence Diagrams [_refresher_sequence_diagrams]

### Refresher Component Diagrams [_refresher_component_diagrams]

### Logical vs. Physical [_logical_vs_physical]

### C4 [_c4]

## Design = Communicatie [_design_communicatie]

asdf

# Domain-Driven Design - Tactical [_domain_driven_design_tactical]

## Inleiding [_inleiding_2]

Domain-Driven Design (hierna afgekort DDD, want het is nogal een
mondvol) is het geesteskind van Eric Evans
<span class="citation">([Evans, 2004](#evans_ddd))</span>, en zoals de
naam suggereert, claimt dat de primaire drijfveer achter je
software-design het domein zelf moet zijn. Primair is dus niet of je
code op een bepaalde manier gestructureerd is, of hoe performant het is,
of dat de data allemaal netjes genormaliseerd is, maar puur of de code
'het domein' uitdrukt.

En nu komen we meteen op het grootste issue dat men heeft met DDD heeft:
wat betekent het in vredesnaam allemaal? Klassiek gezien bestaat DDD uit
twee delen, het tactische deel, en het strategische. Het strategische
gedeelte wordt gezien als het meest belangrijke en vernieuwende, en gaat
over hoe software ontwikkeling vaak verschillende conflicterende visies
op "het domein" moet verenigen: dit zullen we behandelen in
[Domain-Driven Design - Strategic](#ddd-strategic). We starten met het
tactische deel, het deel dat direct toepasbaar is binnen het ontwikkelen
van een enkele applicatie.

Laten we eerst even kijken wat voor soort code we willen voorkomen:

<div class="formalpara-title" markdown="1">

**wijzigen van een boeking in Java**

</div>

``` java
//In een service/applicatie-laag, vlak onder de presentatie/ui-laag
public Boeking updateBoeking(long boekingId, int aantalPersonen, double prijs, long klasse) {
    Optional<Boeking> gevondenBoeking = boekingRepository.findById(boekingId);
    Reisklasse reisKlasse = reisKlasseService.findById(klasse);
    if (gevondenBoeking.isPresent()) {
        Boeking boeking = gevondenBoeking.get();
        boeking.setAantalPersonen(aantalPersonen);
        boeking.setPrijs(prijs);
        boeking.setKlasse(reisKlasse);
        boeking.setStatus(BoekingStatus.active)
        return boekingRepository.save(boeking);
    }
    throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Er is geen boeking gevonden met boeking_id: " + boekingId);
}
```

Als we kijken naar [formalpara_title](#updateBoeking) dan zien we iets
geks gebeuren: prijs, klasse en aantalpersonen kunnen los van elkaar
ingevoerd worden. Dat is aan de ene kant heel flexibel, maar het is zeer
waarschijnlijk dat in het domein van het boeken van kaartjes (in dit
geval voor een vliegreis) dat de prijs iets te maken heeft met het
aantal tickets en in welke klasse er gevlogen wordt…​

Kortom, puur in de *signatuur* (naam van de method, welke parameters er
gevraagd worden, en wat er gereturned wordt) zie je al gekkigheid. We
kunnen in deze methode eigenlijk geen nuttig werk verrichten, behalve
domweg data doorschuiven. Aangezien deze methode in de service-laag
woont betekent dat dat de echte bedrijfslogica omhoog gedrukt wordt de
presentatielaag in, iets dat in elk geval de testbaarheid en
herbruikbaarheid niet ten goede zal komen.

<div class="formalpara-title" markdown="1">

**Updaten van een klant in Java**

</div>

``` java
public Klant updateKlant(long id,
        String voornaam, String achternaam, Integer leeftijd, String nationaliteit,
        String email, String telefoonNr,
        String straat, String huisNr, String toevoeging, String postcode, String stad, String land) throws KlantNotFoundException {
    Klant klant = klantRepository.findById(id).orElseThrow(() -> new KlantNotFoundException("klant met id " + id + " kan niet worden gevonden!"));
    Passagier passagierGegevens = klant.getPassagierGegevens();

    if (voornaam != null) passagierGegevens.setVoornaam(voornaam);
    if (achternaam != null) passagierGegevens.setAchternaam(achternaam);
    //Etc... etc...
    if (stad != null) passagierGegevens.setStad(stad);
    if (land != null) passagierGegevens.setLand(land);

    return klantRepository.save(klant);
}
```

Als tweede voorbeeld zien we [formalpara_title](#updateKlant). Het
eerste dat opvalt is het grote aantal parameters van deze methode (en
dat gaan er alleen maar meer worden), en het tweede is dat het bijna
allemaal strings zijn. Het fijne aan Strings is dat ze heel flexibel
zijn, en het lastige aan Strings is dat ze heel flexibel zijn. Het is
makkelijk te vergeten omdat de variabelenamen onze gedachte sturen, maar
een String in Java kan zowel leeg ("") zijn, als maximaal 2,147,483,647
karakters lang (ter vergelijking, alle Lord of the Rings boeken,
inclusief de Hobbit zijn ong. 5 miljoen karakters), en er kan iets heel
redelijks inzitten zoals "Ligusterlaan", of random nonsens zoals
"\$*I&YFKJDSDH*\*\$(#)". Kortom, die Strings, die zeggen ons niet zo gek
veel. Ze zorgen er in elk geval niet voor dat onze code domein-gedreven
voelt.

Belangrijker nog bij een method als updateKlant is dat we graag zouden
willen kunnen inschatten of er bugs in zitten. Dat is bij deze method
erg lastig! We hebben namelijk geen idee wat de context is waarin deze
operatie gebeurd. Zou er misschien een verband zijn tussen de
nationaliteit en het land? Geen idee! Kortom, de naam van de methode
vertelt ons bizar weinig wat er in deze methode moet gebeuren[^7]…​

Tot slot zit er nog iets riskants in de manier waarop zowel updateKlant
als updateBoeking als eerste argument een kale *long* vragen. Dat
betekent dat je als programmeur heel erg moet oppassen dat je niet per
ongeluk het verkeerde id doorgeeft. Aangenomen dat de presentatielaag
redelijke variabelenamen heeft zal dit risico wel meevallen.

Maar als we dit idee van kale ids een klein beetje doortrekken kun je
best in de problemen komen:

<div class="formalpara-title" markdown="1">

**cancelBooking**

</div>

``` java
//In een class BookingService
public Booking cancelBooking(long flightID, long bookingID, long passengerId) throws MessagingException {
   // Implementatie is niet zo relevant
}

//Deze kan een niveau hoger worden aangeroepen als:

bookingService.cancelBooking(102387, 321314, 89427); //of misschien
bookingService.cancelBooking(102387, 89427, 321314); //of misschien
bookingService.cancelBooking(89427, 321314, 102387); //of nog wat andere mogelijkheden...
```

Toevallig zou een moderne java-IDE zoals IntelliJ je in deze gevallen de
parameternamen in de methode laten zien, maar dat is vrij IDE &
programmeertaal-specifiek. Het is een oplossing voor een probleem dat er
eigenlijk niet zou moeten zijn.

## Ubiquitous Language [_ubiquitous_language]

> "There are 2 hard problems in computer science: cache invalidation,
> naming things, and off-by-1 errors."
>
> —  [Leon Bambrick](https://twitter.com/secretGeek/status/7269997868)

De eerste stap die DDD neemt om je code te verbeteren is niet eens zo
heel technisch, maar wel moeilijk: naming things. Wat nou als we daar
iets beter ons best op deden. We hebben het dan over namen van methods,
variabelen, classes, packages, etc. etc.

Een paar simpele gevallen zie je al in de voorbeelden hierboven. Meestal
als een methode *setXYZ* of *updateXYZ* heet, of als een class een
*XYZManager* is, dan is het totaal niet duidelijk wanneer het uitvoeren
van die method wel of niet zou mogen. Het is niet logisch om zomaar de
*setLand* method aan te roepen, los van *setStad*, die zaken hebben met
elkaar te maken. Je kunt waarschijnlijk niet zomaar
*booking.setStatus(BookingStatus.Active)* aanroepen, daar zitten regels
aan!

Feitelijk is dit niets anders dan het standaard Object-Oriented
Programming-principe Encapsulatie. We willen onze objecten beschermen
tegen wijzigingen die ze in een ongeldige toestand zouden plaatsen.

Dus de eerste stap is om wat je toch al aan dingen hebt een goede naam
te geven. Laten we voor het gemak aannemen dat al die velden bij
*updateKlant* op een enkel formulier op een standaard Profile-pagina.
Dan is een redelijke naam voor die method *processProfileForm*.

De tweede stap is om meer dingen te maken die een naam kunnen hebben. In
<span class="citation">([Fowler, 2018](#fowler_refactoring_2018))</span>
staan genoeg suggesties, zoals het introduceren van extra variabelen met
[Extract
Variable](https://refactoring.com/catalog/extractVariable.html), het
introduceren van korte beschrijvende methods met [Extract
Method](https://refactoring.com/catalog/extractFunction.html) of hele
nieuwe objecten met [Extract
Class](https://refactoring.com/catalog/extractClass.html). En dat brengt
ons 'toevallig' bij Value Objects…​

## Value Objects [_value_objects]

Een value-object is een object die een 'hele waarde' representeert. Kijk
bijv. nog eens naar [formalpara_title](#updateKlant). We sturen daar
bijv. alle losse velden van een *Adres* door. Netter is dan om één
object van de class *Adres* door te geven, dan los je ook gelijk het
probleem op dat je bijv. per ongeluk alleen het land wijzigt zonder de
stad te wijzigen, of dat een opmerking als "Boven de winkels" na een
verhuizing in een opmerkingenveld blijft staan. Andere voorbeelden zijn
RGB-kleuren, of coördinaten.

Een verbeterde versie van deze signatuur zou er bijv. zo uit zien:

``` java
public Klant processProfileForm(
        long id,
        Persoonsgegevens persoonsgegevens,
        Contactgegevens contactgegevens,
        Adres adres
    ) throws KlantNotFoundException {
    //Implementatie laat zich raden
}
```

Een bijkomend voordeel van al deze kleine objectjes is dat ze allerhande
code kunnen huisvesten (zoals het opmaken van een adres, of naam in een
String) die anders erg awkward op de Klant class terecht waren gekomen.
[^8]

Een goed voorbeeld van zo’n standaard Value-Object dat je waarschijnlijk
al tientallen keren gebruikt hebt is de DateTime class van je
programmeertaal naar keuze (LocalDateTime in Java). Dat is een object
dat als waarde een bepaald moment in de tijd voorstelt, en is op die
manier een samenraapsel van dag/maand/jaar/tijd, en kan op allerlei
verschillende manieren benaderd worden.

Als je twee van die DateTime objecten hebt, die toevallig hetzelfde
moment in tijd aanwijzen, dan interesseert het je helemaal niets welke
instantie je hebt, ze zijn volledig uitwisselbaar. De waarde telt.

Een tweede doel waar Value Objects zich goed voor lenen is om duidelijk
aan te geven waar een object voor bedoeld is. Bijv. dat die *long* puur
een KlantId is, en niet gebruikt kan worden om een Vlucht of een Boeking
op te halen.

<div class="formalpara-title" markdown="1">

**Strongly Typed Id**

</div>

``` java
public Klant processProfileForm(
        KlantId id,
        Persoonsgegevens persoonsgegevens,
        Contactgegevens contactgegevens,
        Adres adres
    ) throws KlantNotFoundException {
    //Implementatie laat zich raden
}

//en elders in de codebase

public class KlantId {
    private final long value;

    public KlantId(long value){
        this.value = value;
    }

    public long getValue(){
        return this.value;
    }
}
```

Je zou nu in je KlantRepository-interface om exact deze Id-class kunnen
vragen, en als je dan ooit per ongeluk het verkeerde Id zou gebruiken
krijg je een nette compile error [^9].

Types (zoals Classes en Interfaces) gebruiken om compiler-errors te
genereren voor 'stomme fouten' is de basis van zogeheten Type-Driven
Development.

Ten derde kun je Value Objects goed gebruiken om er voor te zorgen dat
iets eens en voor altijd een geldige waarde heeft. Stel je moet (zoals
in [formalpara_title](#updateKlant)) een emailadres verwerken: er zijn
meer mogelijke Strings dan dat er email-adres strings zijn. Als je
emailadressen overal Strings zijn, zul je op verschillende plekken
moeten gaan checken of die String eigenlijk wel een emailadres is. Bijv.
bij binnenkomst van een POST (in de presentatielaag, als onderdeel van
input-validatie), maar ook in de setter van een Klant (want je weet niet
*zeker* hoe je door de presentatielaag bent gekomen), en ook weer op
elke plek waar je het als emailadres in de applicatie gebruikt. Bijv. in
een view met een mailto: linkje, of als je geautomatiseerd een
zeer-informatieve-absoluut-geen-spam-mail naar iemand wil versturen. Op
die manier valideer je je een ongeluk.

Makkelijk is dan om zo gauw je weet dat het een String een emailadres
zou moeten zijn om het in een Value-Object te vatten die aangeeft *dat*
het een emailadres is, en *dat* je het *echt* gechecked hebt:

<div class="formalpara-title" markdown="1">

**Email Value-Object**

</div>

``` java
public class EmailAddress {
    private String emailaddress;

    public EmailAddress(String rawValue){
        if(!Pattern.matches("[\\w.]+@\\w+\\.\\w+", rawValue)){ //Emailadressen zijn notoir tricky, maar dit geeft het idee
            throw new IllegalArgumentException("rawValue");
        }
        this.emailaddress = rawValue;
    }

    //getter, en misschien extra getters voor 'het stukje voor/achter de @'
}
```

Door een [formalpara_title](#emailvalueobject) te gebruiken weet je op
alle plekken waar je een EmailAddress instantie binnenkrijgt dat je
gewoon veilig dit object kan gebruiken om een link te genereren, of een
mail te versturen. Het was immers niet mogelijk om een instance te maken
zonder langs je check in de constructor te komen![^10]

Deze strategie staat ook wel bekend onder de slogan "Parse, don’t
Validate!" <span class="citation">([King,
2019](#parse_dont_validate))</span>.

### Immutability & Equals [_immutability_equals]

Een goed value-object is immutable, dat betekent dat het niet gewijzigd
kan worden nadat het aangemaakt is. Praktisch betekent dit dus geen
setters of andere methods die interne velden wijzigen nadat het object
aangemaakt is.

Een tweede essentiele eigenschap van een Value Object is dat het gaat om
de waardes (what’s in name…​). Dat betekent dat het belangrijk is om de
equals (en dus ook de hashcode) methode te overschrijven. Dat is zo’n
standaard-klusje dat elke programmeertaal daar z’n eigen
ritueel/standaard-implementatie voor heeft. In Java kun je dat gelukkig
aan IntelliJ overlaten (of de Objects.equals / Objects.hash helper
methods gebruiken).

Dit soort objecten (immutable, en puur op waarde vergelijkbaar) zijn
veel simpeler te testen dan 'gewone' mutable objecten. Omdat ze niet
kunnen wijzigen zijn er minder randgevallen, en is er minder testcode
nodig om een goede coverage te behalen. Kortom, als je kan, is het
raadzaam zoveel mogelijk van je domeinlogica op deze objecten te
implementeren, dat scheelt je testcode.

Het klassieke voorbeeld <span class="citation">([Evans,
2004](#evans_ddd))</span> gaat over blikken verf (mutable) die gemengd
moeten worden. Daarbij is de menglogica op kleine Color Value-Objects
geïmplementeerd in plaats van op de verfblik-entities, wat een stuk
rustiger code-design oplevert. Bij ons vliegtuig-voorbeeld zou je bijv.
bij het wijzigen van een boeking de BoekingsGegevens (value-object) van
de huidige boeking kunnen vergelijken met de BoekingsGegevens van de
gewenste boeking, om zo een verschilfactuur te genereren, en in één keer
de juiste wijziging op de opgeslagen boeking te voltooien.

Uiteindelijk heeft Immutability natuurlijk en grens en moet er namelijk
wel ergens iets veranderen in een database, en dat brengt ons bij…​

## Entities [_entities]

Deze kennen we! @Entity erboven, een Long’tje met @Id en @GeneratedValue
en gaan met die banaan! Was het leven maar zo mooi…​

Entities zijn objecten met een levensduur. Ze beginnen ergens, maken
vanalles mee in hun bestaan, en eindigen tenslotte in een database, om
het volgende request weer een nieuw rondje te maken. Wat een leven!

Entities zijn *dingen* die over de tijd heen veranderen. Maar we hebben
nog wel het gevoel dat het steeds hetzelfde *ding* is. Bij Value-Objects
hebben we dat niet. Als we een beetje rood bij geel mengen krijgen we
een nieuwe kleur (iets oranje’igs). Maar als we een beetje rode verf in
een blik met gele verf gieten dan verandert dat blik verf (tenzij het
direct overstroomt natuurlijk), het wordt niet een nieuw blik. In dit
geval kunnen we niet praten over 'het blik met die-en-die-kleur', want
alles aan dat blik kan veranderen (je kan er op staan, en het indeuken
bijv.). In het echt is dit geen probleem, we wijzen met onze hand naar
een bepaald blik en roepen uit "Dat blik, daar heb ik het over!".

In een database heb je daarvoor een Identifier nodig. Iets dat een
bepaald *ding* uniek identificeert, zodat je er in feite naar kan
*wijzen*. In onze applicatie hebben we zo’n Identifier ook nodig, want
stel we vragen een bepaalde *Boeking* op voor
[formalpara_title](#updateBoeking), dan willen we daar misschien een
paar requests later nog een update overheen doen. Het is niet redelijk
om al die boekingen in het geheugen te houden en hun exacte
geheugenadres als Id te gebruiken [^11].

Een entity is dus een object, aangewezen door een id, met een lifecycle,
wiens state kan veranderen. Met state bedoelen we alle stukjes data die
bij die entity horen; alle attributen in een taal als Java, C# of
Python. Die veranderingen gebeuren in een OOP taal via public methods.
Het is belangrijk dat die veranderingen altijd netjes gebeuren. Daarmee
bedoelen we dat de regels van het object altijd gevolgd moeten worden:
met een chique woord zijn objecten *invariant onder hun methodes*. Die
invarianten wijzen dingen aan die altijd waar moeten zijn, zoals "het
totaalbedrag van een bestelling moet gelijk zijn aan de optelsom van de
delen". Hoewel zowel de bestelde onderdelen, als het totaalbedrag kunnen
variëren, staat het feit dat die twee met elkaar kloppen vast, de regel
is invariant.

Niet alle combinaties van state zijn geldig voor een object. Laten we
als voorbeeld de Java ArrayList nemen. Het handige van een List ten
opzichte van een gewone Array is dat je er zomaar objecten aan kan
toevoegen. Een Array moet je elke keer met een bepaalde grootte
aanmaken. De naam suggereert dat een ArrayList de List interface biedt
met een Array op de achtergrond, en als we even onder de motorkap
kijken[^12]

``` java
//Fields uit de source van ArrayList.java
transient Object[] elementData;
private int size;
```

Je ziet dat het size veld onafhankelijk wordt bijgehouden van de
elementData array. Dat voelt in eerste instantie misschien een beetje
stom (waarom niet gewoon elementData.length returnen in getSize()?),
maar daar zit een goede reden achter.

De ArrayList class doet veel moeite om zo min mogelijk keren een nieuwe
elementData array te maken. Dus als je elementen toevoegt, en er is geen
ruimte meer in de array, dan maakt de ArrayList de nieuwe array 'ietsje
groter dan nodig'. Op dezelfde manier laat de ArrayList met plezier wat
plekjes in de array leeg als je iets removed. Het size veld moet dus los
worden bijgehouden, en het zou echt *superverwarrend* worden als het
size veld niet exact klopt met hoeveel elementen er in de array zitten.

Een ander voorbeeld zie je in [programlisting_title](#entityconsistent):

``` java
public class Order {
    private Money total = Money.zero(); //Money is in dit geval een value-object die afrondingscomplexiteit met doubles afvangt
    private List<LineItems> items = new ArrayList<>();

    public List<LineItems> getItems(){ return this.items; }
    public Money getTotal(){ return total; }

    public void addItem(Product item){
        items.add(new LineItem(this, item));
        total = total.add(item.getPrice());
    }
}
```

Het probleem hier is dat je items aan de order kan toevoegen (waardoor
de prijs omhoog gaat), maar vervolgens buitenom
*order.getItems().clear()* (bijv.) kan aanroepen. Met als gevolg een
order zonder items, maar **met** een prijs.

-   OF *getItems* moet een Collections.unmodifiableList(this.items)
    returnen, zodat de collectie niet stiekem aangepast kan worden[^13].

-   OF *getTotal* moet elke keer vers z’n totaal berekenen. Als het kan
    is dit makkelijker, maar er zijn zat variaties waarin dit niet
    wenselijk is (omdat er bijv. extra kortingen zijn, of het heel duur
    is om de hele collectie uit de database te vissen).

Dit is wederom het principe van OOP encapsulatie. En dat is echt
essentieel voor OOP als geheel, en DDD in het bijzonder.

Kortom, in een nette codebase gaan entities (en dit is feitelijk gewoon
een basisprincipe van OOP) per public method van een nette (consistente)
toestand, naar een volgende nette toestand, waarbij aan alle invarianten
voldaan is. Dit is heel belangrijk, omdat we bij DDD persistentie graag
zo ver mogelijk naar de achtergrond drukken. En dat doen we met
Repositories.

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

#### Strongly-Typed Ids in Java & Spring [strongids]

### Factories [_factories]

Een Factory is een vrij standaard Design Pattern
<span class="citation">([Gamma et al.,
1994](#gof_design_patterns))</span>, zo heb je Abstract Factories, en
Factory Methods, maar hier bedoelen we ook gewoon het simpele feit dat
objecten graag elkaar maken.

Flauw gezegd is een constructor eigenlijk een heel raar ding. Op een
willekeurig moment in je applicatie spreid je je armen, en roep je uit
naar de hemel "Laat er een object zijn!". En, vanuit het niets, is er
dan *iets*.

Het is vaak de moeite waard om na te denken of je objecten niet
natuurlijker ergens anders vandaan komen. Als we het cliché
bestellingsvoorbeeld pakken, met een bidirectionele relatie tussen een
Order en diens LineItems:

<div class="formalpara-title" markdown="1">

**Constructors overal**

</div>

``` java
Klant zomaarEenKlant = new Klant("Bob");
Order verseOrder = new Order(k);
 //Twaalf stuks van product-id 42, whatever that is
LineItem eersteItem = new LineItem(o, 12, product42);
verseOrder.add(eersteItem);
```

In het voorbeeld van [formalpara_title](#constructors) zien we dat alles
met het handje aangemaakt wordt. Stel het is een nieuwe klant, dan is
dat voor de klant nog enigszins logisch. In een standaard winkel-website
komen klanten vaak van buiten het systeem. Die komen vanuit
systeem-perspectief dan een beetje uit de lucht vallen. Maar daarna is
het twijfelachtiger. De order zouden we kunnen starten met een simpele
*zomaarEenKlant.startOrder();* method, en het eerste item zouden we
kunnen maken als *verseOrder.add(12, product42);*.

Het zijn hele kleine tweaks, maar het scheelt toch een paar parameters,
en het kan je signaturen stabieler houden. Stel klanten hebben een
bepaalde status (bijv. VIP klanten met extra korting), dan moet
misschien in een volgende versie de VIP-status op het LineItem gezet
worden. Als je zelf overal de LineItem constructor aanroept zul je op
alle plekken in je code die extra parameter moeten toevoegen. Maar als
je de link al gelegd hebt tussen een Klant en diens Order (en daarmee de
lineitems), dan kun je dit netjes op één plek aanpakken.

Kortom door goed na te denken over waar je objecten vandaan komen krijg
je nieuwe kansen om bepaalde business-rules in het domein te
implementeren, en die plek een mooi naampje uit de Ubiquitous Language
te geven; of dat nou een zware
Factory-class-met-bijbehorend-design-pattern is, of een kleine method
die een constructor voor je aanroept. De plek waar je vrij snel aan kan
voelen of dit goed loopt is in je unit-tests. Vaak bestaan die uit een
Arrange/Act/Assert opzet, en als het Arrange-gedeelte uit de hand loopt,
dan is het misschien tijd om serieus werk te maken hoe makkelijker
situaties in je applicatie opgezet kunnen worden.

## Aggregates [_aggregates]

Ook al is het voorbeeld zeer cliché, de Orders & LineItems laten een
vrij standaard situatie zien: we hebben niet één enkele entity, maar
meerdere. Laten we een kleine variatie van dit probleem bekijken:

<figure id="inschrijvingen">
<img src="inschrijvingen.svg" alt="inschrijvingen" />
<figcaption>Inschrijvingen</figcaption>
</figure>

In [Inschrijvingen](#inschrijvingen) zien we drie entiteiten. De
aanwezigheid van *maxEnrolments* op *Course* suggereert dat er een
maximaal aantal inschrijvingen voor een cursus kan zijn. Zonder extra
documentatie weten we natuurlijk eigenlijk niet hoe hard deze eis is. In
sommige systemen mag er absoluut geen overinschrijving plaatsvinden,
omdat er bijv. regels vanuit de brandveiligheid zijn. In andere systemen
zijn de lokalen misschien groot zat, en willen we best overinschrijving
toestaan, maar gebruiken we de *maxEnrolment* om de cursus in
één-of-ander overzicht een waarschuwingskleurtje te geven, omdat de
kwaliteit van het onderwijs dan in het geding is. Het ligt er altijd een
beetje aan. In dit voorbeeld gaan we er vanuit dat de eis hard is.

De groep entiteiten die samen aan bepaalde regels moeten voldoen noemen
we een aggregate[^14]

Een gevolg van deze eis tot consistentie is dat aggregates ook een
minimale eenheid van transacties (zie [ACID Transacties](#transacties))
aangeven. Als een groepje objecten altijd samen consistent moeten zijn,
kunnen we niet maar de helft ervan aanpassen zonder de andere helft op
z’n minst te checken (hoe zouden we anders fouten kunnen bespeuren). Dus
in een transactie zitten altijd hele groepen van entiteiten. Andersom is
het ideaal als één transactie maar één aggregate aanpast, maar deze eis
is iets minder hard.

Deze koppeling tussen aggregates en transacties is essentieel: hoe
groter je aggregate, hoe groter je transactie; hoe groter je transactie,
hoe meer problemen met concurrency. Hoe kleiner je aggregate, hoe
kleiner je transactie; hoe kleiner je transactie, hoe meer problemen met
gelijktijdige wijzigingen (concurrency). Er is dus niet zoiets als 'de
correcte aggregate-grootte' die je via een of ander Byzanthijns proces
kan uitrekenen: het is een ontwerpbeslissing.

Laten we dit wat concreter maken. In [Inschrijvingen](#inschrijvingen)
hebben we een simpel eerste model getekend. Als we dit in onze standaard
stack van Java/JPA/Spring zouden implementeren, dan zouden we drie
repositories hebben (één voor elke entity), en puur een paar eenvoudige
*@Many-To-One* associaties op die entities. Als we echter kijken naar
hoe-goed-dit-werkt dan zien we op basis van onze *maxEnrolments* eis al
direct één probleem: er is geen class in dit diagram dit onze eis kan
checken: Course weet niet hoeveel enrolments die heeft. En Enrolment is
er maar ééntje, die kan niet bij de andere Enrolments. Dat betekent dat
we de verantwoordelijkheid voor deze regel omhoog moeten delegeren naar
bijv. een applicatie-service-laag. Dat is altijd een mogelijkheid, maar
niet heel domein-gedreven. Dit soort regels (en allerlei andere zaken
die we met encapsulatie beschermen) noemen we ook wel 'invarianten',
omdat ze altijd waar moeten zijn: het variëert niet of ze gelden, ze
gelden altijd.

<figure id="inschrijvingen2">
<img src="inschrijvingen2.svg" alt="inschrijvingen2" />
<figcaption>Inschrijvingen Aggregate</figcaption>
</figure>

In [Inschrijvingen Aggregate](#inschrijvingen2) zien we een voorbeeld
waar Course wel in staat is om z’n eigen invarianten te beschermen.
Course kan nu prima er voor zorgen dat er niet boven de max.
inschrijvingen uit wordt gegaan. In dit voorbeeld hebben we (in
Java/JPA/Spring) geen repository voor *Enrolment*, en zit er op de
*@One-to-Many* een *Cascade* instructie. Dat betekent dat wanneer we een
*Course* opslaan of deleten dat automatisch ook de *Enrolments* worden
opgeslagen, of gedelete. Waarschijnlijk willen we geen automatische
cascade van *Enrolment* naar *Student* omdat we niet bij het verwijderen
van een cursus alle studenten die er voor ingeschreven staan automatisch
willen verwijderen[^15].

Onze mogelijkheden om consistentie in het domein te beschermen zijn
groter geworden. Maar als we nu een cursusinschrijving willen doen
moeten we eerst de hele cursus ophalen, met alle inschrijvingen. De
transactiegrens is groter, dus er kunnen niet op exact hetzelfde moment
twee studenten zich voor dezelfde cursus inschrijven. En onze mappings
zijn ook nog eens (een klein beetje) complexer. Dus hoewel
[Inschrijvingen Aggregate](#inschrijvingen2) waarschijnlijk in 90% van
de gevallen de juiste keuze is, is er ook altijd iets te zeggen voor het
alternatief (en dan dus de consistentie-eisen 'elders' oplossen).

En als dat je niet overtuigt dat het altijd een ontwerpafweging is, dan
zou ik je aanraden om een extra eis in dit kleine modelletje te
verwerken: een student heeft ook een maxEnrolments. In principe mogen
studenten max. voor 4 cursussen ingeschreven staan (zodat je niet enorme
herkansingsballen krijgt), maar een SLBer mag deze limiet op een
per-student-basis aanpassen (voor bijv. die ene student die eigenlijk
alles al weet, maar nog een boel eerstejaarsvakken heeft open staan).
Dan wordt het ineens tricky om te bepalen hoe je dit netjes in een
Domein-Driven stijl modelleert.

Precies deze eis heeft sommige er toe geleid om heel de notie van
aggregates het raam uit te gooien. In
<span class="citation">([Pellegrini,
2023](#pellegrini_killaggregate))</span> heeft Pellegrini een mooi
betoog over hoe dit tot problemen, oplossingen en verwarringen kan
leiden. Persoonlijk ben ik nog niet overtuigd, maar het is leuk om over
na te denken.

-Tom

Tot slot nog even over die Student. Stel we zijn bezig met een
Course-usecase. Dan is het zeer onwaarschijnlijk dat we methods als
*setName(…​)* op Student zouden willen kunnen aanroepen. In de Course
Aggregate is het dus heel redelijk mogelijk om Student niet als een
Entity, maar als een Value-Object te behandelen. We zijn niet
geïnteresseerd in Student als wijzigbaar ding, nee we zijn vooral
geïnteresseerd in *Student* als referentie naar een student. Een beetje
vergelijkbaar met [formalpara_title](#stronglytypedid), maar dan met net
ietsje bredere value-objects. Hieruit volgt het dringende advies dat
Aggregates nooit direct wijzen naar andere Aggregates. In plaats van een
referentie te nemen naar de andere Entity zelf kun je dan een referentie
nemen naar diens Id.

Als dit echt niet praktisch is, dan kun je in een OO-taal als Java er
vaak ook nog voor kiezen om een Read-only-interface te maken, en die in
je getters te exposen. Het probleem dat we willen voorkomen is dat je
kan Aggregate-hoppen, door middel van *agg1.getX().getY().setZ(..)*
paden, want dan wordt het beschermen van die consistentie zo
onoverzichtelijk.

### Aggregate Roots [_aggregate_roots]

Aggregates gaan dus over het beschermen van invarianten in groepjes van
objecten in de context van transacties. Als je die zin zonder blikken of
blozen kan lezen dan zijn we al een heel eind.

Het beschermen van die consistentie is erg complex als alle onderdelen
van een aggregate los van elkaar kunnen veranderen. Stel we hebben weer
onze standaard Order→OrderLine→Product geval:

``` java
Customer pete = ...; //eeergens komt Pete vandaan
Product newBBQ = ...; //evenzo deze mooie BBQ

Order petesOrder = pete.startOrder();
// Pete bestelt honderden dingen!
petesOrder.add(newBBQ);

//Zoveel dingen dat deze getTotal() niet over alle items kan loopen
//maar dat we tijdens het toevoegen het totaal moeten bijhouden
Money firstTotal = order.getTotal();

//Dan is het heel vervelend als dit zou kunnen:
newBBQ.setPrice(50);
```

Het voorbeeld in [programlisting_title](#trickysetters) is een beetje
gemaakt. Meestal zijn bestellingen dusdanig klein dat je best alles kan
herberekenen in een getTotal()-achtige methode. Maar laten we even
aannemen dat dit niet zo is (en in een latere versie een beter voorbeeld
zoeken). In dit voorbeeld is *Order* onze aggregate. En we moeten
consistent zijn over de *Order*, de hoeveelheid *LineItems*, en de
(prijzen van) *Products*.

Om dit idee makkelijker te maken is het bij aggregates vaak wijs om één
enkele entity aan te merken als de aggregate-root. Deze aggregate-root
is de enige plek waar dingen in de aggregate gemuteerd kunnen worden, en
zo zou die *setPrice* onmogelijk zijn. Kortom een aggregate-root is de
eindverantwoordelijke voor het feit dat je aggregate consistent blijft.
Een standaard manier om dit te doen is er voor te zorgen dat je geen
referenties uitgeeft aan entities binnen je aggregate. Als andere
classes iets van je willen weten, dan geef je ze dus nooit je eigen
entities terug, maar value-objects gemaakt uit die entities.

## Overige Patterns [_overige_patterns]

### Domain Services [_domain_services]

Kort door de bocht: we willen als het even kan zo veel mogelijk
functionaliteit van de applicatie op onze Entities en Value-Objects
implementeren.

### Domain Events [_domain_events]

# Remote Procedure Calls [_remote_procedure_calls]

Remote Procedure Calls zijn de meest klassieke vorm van communicatie
tussen systemen. Zeker in object-georiënteerde talen is het al sinds de
jaren 90 (CORBA, later SOAP etc. \[TODO:2 ref\]) een wijd-verspreide
stijl van communicatie.

``` java
//PaymentService is in dit geval een Interface
private PaymentService paymentService;

public void generatePayment(Order o){
    //allerhande code om van Order naar betaling te komen...
    PaymentLink link = paymentService.createPaymentLink(o.getPaymentDetails());
    //en de rest van je applicatielogica
}
```

Van OOP hebben we geleerd dat we hele verschillende implementaties
kunnen schrijven voor die payment-service. Wie weet is die payment-link
zo simpel dat we 'm kunnen genereren door puur een String op een
bepaalde manier te formatten? Dan kunnen we de hele operatie binnen ons
proces uitvoeren. Dit noemen we dan een *lokale* service aanroep. Bij
veel betalings-services moet je zo’n betaling echter eerst expliciet
aanmelden, dus dan stuur je een Request naar hun service, en met de
benodigde informatie in de Response om de link te genereren: Het mooie
van deze interface is dat we dat verschil nu niet zien! Dit noemen we
dan een *remote* service aanroep.

Dit is de kerngedachte van een Remote-Procedure integratiestijl. We
kunnen procedures (of methods, of functies, we gebruiken de term niet
heel precies) aanroepen in andere services, *net zoals* we dat voor
lokale services doen.

## Nadelen RPC [_nadelen_rpc]

Zoals opgemerkt is het grote voordeel van een RPC interface dat je het
verschil tussen een lokale en een remote aanroep niet kan zien. Het
grootste nadeel van een RPC interface is echter dat we dat verschil nu
niet kunnen zien!

> "First Law of Distributed Object Design: Don’t distribute your
> objects!"
>
> —  Fowler (2003)

Als we terugdenken aan de Fallacies of Distributed Systems ([Waarom
niet?](#fallacies)) willen we misschien juist weten of er hier een
remote-procedure call achter schuil gaat!

``` java
//Dit is waarschijnlijk wel redelijk:
Order order = //... ergens komt een order vandaan.
PaymentLink link = paymentService.createPaymentLink(order.getPaymentDetails());

//Dit is echter vragen om problemen!:
List<Order> orders = //... ergens komt een lijst van 100+ orders vandaan.
List<PaymentLink> links = new ArrayList<>();
for(Order o: orders){
    PaymentLink link = paymentService.createPaymentLink(o.getPaymentDetails());
    links.add(link);
}
```

Het probleem hier is dat in de for-loop er 100+ keer een los
netwerkbericht naar een externe service wordt gestuurd. Dit is heel
traag en foutgevoelig. En het vervelende is, je *ziet* het niet als
programmeur. We hebben een te sterke abstractie gemaakt, het verbergt
teveel!

In recente jaren is het steeds gebruikelijker aan het worden om dit
soort interfaces te wrappen in een extra laagje dat aangeeft dat het
mogelijk lang duurt om een reactie te krijgen. Zo’n extra laagje noemen
we in Javascript een Promise, in C# een Task, in Python een Future, en
in Java een Mono[^16]. Er zijn kleine verschillen tussen de talen en
libraries, maar in de basis is het idee hetzelfde.

Een ander nadeel is dat RPC bijna altijd gekoppeld is aan de
communicatiewijze (Zie [Communicatiewijzes](#_communicatiewijzes))
Request-Reply. Dit betekent dat het alle fragiliteit van die
communicatiewijze heeft. Ook bij methodes die niets returnen (*void*)
die technisch gezien via een Fire & Forget wijze gecommuniceerd zouden
kunnen worden heeft het onderliggende protocol vaak nog een lege
success-Response. Zodoende is het belangrijk om voor kritieke RPC-paden
in je applicatie een goede High-Availibility oplossing te overwegen
([Load balancing](#availability) zullen we later behandelen), of
anderzijds een tijdelijke onderbreking te kunnen accepteren.

Al met al is RPC een veelvoorkomende integratiestijl en van de methoden
die we in deze cursus behandelen de meest intuïtieve. Er zijn nadelen,
zowel qua API als qua implementatie, maar die kunnen enigszins
gemitigeerd worden.

## Stijlen RPC [_stijlen_rpc]

### REST [_rest]

Tot nog toe hebben we vooral webservices gemaakt die door een
client-side stuk javascript, vaak door middel van *fetches* aangeroepen
wordt. Zodoende hebben we vooral REST-APIs voor Postman en onze eigen
frontends gemaakt.

Er is natuurlijk geen enkele reden waarom we niet vanuit andere talen en
contexten (zoals onze eigen backends) ook calls naar andere
REST-services zouden kunnen maken. In jaar 1 moest je bijv. in Python
een weer-API uitvragen[^17].

REST als een vorm van RPC zien is helaas een beetje verwarrend. Bij REST
willen we een Resource-Oriented API ontwikkelen, dat betekent dat we de
Resources (de "dingen") leidend willen laten zijn. Dit zorgt voor die
standaard URL verdelingen die we eerder hebben gezien:

|  |  |
|------------------------------------|------------------------------------|
| *GET* /persons | vraagt een lijst van alle personen |
| *GET* /persons/{id} | vraagt een enkel persoon op, namelijk die met een bepaald {id} |
| *POST* /persons | voeg een persoon toe aan de lijst, met de details in de request body |
| *DELETE* /persons/{id} | verwijdert een enkel persoon |
| *PUT* /persons/{id} | vervangt de gegevens van een persoon (strict genomen in z’n geheel) |
| *PATCH* /persons/{id} | doet een partiële update van een bepaald persoon |

Deze stijl van ontwikkelen, waarbij de 'dingen' (resources) centraal
staan, en de HTTP-verbs (GET,PUT, POST, etc.) de mogelijke handelingen
voorstellen is relatief flexibel en eenvoudig te doorgronden.

Dit kun je contrasteren met een RPC-API, waarbij je bijv. een *POST*
doet naar */persons/maaknieuw*, of */updateperson*, of desnoods zoiets
als */api*, waarbij dan de requestbody zoiets bevat als *{"method":
"updateperson"}*. Deze stijl van API noemt men een RPC-API, omdat je
feitelijk ook qua contractstijl expliciet een bepaalde method (als
synoniem van procedure) in de andere service aanroept.

Het is onfortuinlijk dat we dus twee verschillende betekenissen van het
woord RPC door elkaar gebruiken. In het oude geval was RPC het
tegenovergestelde van de Resource-Oriented-stijl van REST (misschien was
Procedure-Oriented een mooier woord geweest). In dit vak is RPC als
communicatiewijze een alternatief van Messaging, we doelen daarmee dus
op een process waarbij een call naar een externe service wordt
ge-encapsuleerd als (bijna?) een lokale call.

#### Task-based REST [_task_based_rest]

Het is relatief eenvoudig om CRUD services (services die create, read,
update & delete functionaliteit aanbieden) op entities via REST aan te
bieden. Je koppelt een controller aan een Repository. Met een POST save
je dan een nieuwe entity, met een GET kun je een find method aanroepen,
met een PUT wederom een (updatende) save, en je zult nooit raden wat we
met DELETE doen…​

Maar wat doe je als de applicatie ingewikkelder wordt?

Stel we hebben groothandel, die containerladingen vol electronica over
de Atlantische Oceaan verscheept en een winkelketen als klant die zaken
inkoopt. Zo’n bedrijf heeft vaak enorm veel contacten over de hele
wereld, en zou het best fijn vinden om als service aan te kunnen bieden
dat bedrijven hun bestelling nog een klein beetje kunnen aanpassen (voor
een extra bedrag natuurlijk).

Dus stel winkelketen MM merkt dat het net teveel TV’s heeft besteld,
maar ja, die zijn al onderweg met de container. Er is een best goede
kans dat de groothandel die Tvs binnen afzienbare tijd bij één van diens
andere klanten kwijt zou kunnen (misschien voor een kleine korting, maar
kleiner dan het bedrag dat MM extra betaald). En als het allemaal niet
lukt voordat de schepen uitgeladen moeten worden, tja, dan heeft
winkelketen MM pech en moet alsnog de originele factuur voldaan worden.

In dit soort gevallen ga je er waarschijnlijk niet komen met een
standaard entity-based REST-ful model. Dan heb je waarschijnlijk een
resource */orders*, en als je dan dus iets minder TVs wil bestellen, wat
doe je dan?

Je zou kunnen proberen te gaan PUTten of PATCHen op bijv. */orders/764*,
maar de verwachting is dan dat je die resource aanpast, en dat je dan
vervolgens een GET naar diezelfde URL kan doen, om direct het resultaat
te zien.

Een veel gebruikte oplossing in de praktijk is dat je de neiging om
alles als resources te modelleren even loslaat. En dan heb je toch een
paar 'Remote Procedure'-oriented urls, zoals bijv.
*/orders/764/requestOrderChange*. Daar kun je dan naartoe POSTen (want
POST heeft de minste regels), en dan krijg je een result terug (de REST
regels hebben we toch al opgegeven, dus je kunt doen wat je wil).
Aangezien het overduidelijk geen RESTful url is, is er ook geen
verwachting dat een GET naar */orders/764/requestOrderChange* iets
nuttigs gaat opleveren.

Maar kan het niet netter? Een relatief simpele manier is om er 'even
anders tegenaan te kijken'. Nu maken we van onze entities de resources,
maar wat als we juist van onze usecases de resources maken? We zouden
'de verzochte wijzigingen aan een order' als resource kunnen
bestempelen: */orders/764/orderChanges*. Als dit de resource is, dan
kunnen wijzigingsverzoeken gePOST worden, vervolgens krijgen we volgens
RESTful standaarden een Location-header terug, en kunnen we op zeg
*/orders/764/changes/1* kijken wat de status is van die wijziging. We
zouden 'm zelfs kunnen proberen te PUTen (nog meer TVs!) of DELETEn
(toch maar geen extra TVs). Kortom, niet alleen de originele usecase
heeft een plekje gekregen, maar ons ontwerp bedelt ons om nog meer
handige functionaliteit te implementeren!

Uiteraard zullen er altijd een paar vreemde eenden overblijven. Het
meest bekende voorbeeld zien we op urls als */login* en */logout*. Dit
heeft z’n grondvesten in het feit dat naast de REST-structuur, we ook
nog de klassieke HTML-paginas hebben. Daar kan men een formulier
(\<form\>) definiëren, en dat vervolgens opsturen naar een url middels
een POST. De login use-case past prima in zo’n
'formulier-verwerkings'-stroom, maar niet in een standaard
Resource-oriented setup. We POSTen er welliswaar iets naartoe, maar het
voelt niet logisch om vervolgens een lijst van logins te krijgen als je
een GET doet naar */login*.

Het organiseren van je applicatie in resources (zowel entities, als
usecases, of acties) is dus een goede richtlijn, en er zullen altijd een
paar uitzonderingen blijven. Soms heb je ook gewoon meer tijd nodig om
de juiste resources te ontdekken, dus blijf vooral niet geforceerd
proberen overal resources van te maken. Gebruik het als het past.

#### Richardson Maturity Model [_richardson_maturity_model]

In Restful Web Services <span class="citation">([Richardson & Ruby,
2007](#richardson_webservices))</span> geeft Richardson een mooi
overzicht van de filosofie achter REST. De meest beroemde toevoeging is
echter het Richardson maturity model
<span class="citation">([Richardson,
2008](#richardson_maturity))</span>. Flauw gezegd heeft elke API een
bepaald level:

|  |  |
|------------------------|------------------------------------------------|
| Level 0 | Urls betekenen niets. HTTP verbs ook niet. Maar hey, het werkt. Denk aan een enkel */api* endpoint, waar je alles naartoe *POST* |
| Level 1 | Urls betekenen iets, maar qua HTTP verbs doen we maar wat. (vaak de klassieke 'alles is een POST'-services) |
| Level 2 | Urls betekenen iets, en HTTP verbs betekenen iets. Dit is onze standaard tot nu toe. |
| Level 3 | Level 2 + Hypermedia: HatEoAS |

De gedachte achter HatEoAS, een verschrikkelijke afkorting die staat
voor Hypermedia as the Engine of Application State, is precies dezelfde
stap als van Text naar Hypertext (de HT van HTTP): Text, of Media (zoals
JSON, XML, etc.) is tof, maar het wordt pas echt tof (hypertof, zeg
maar) als de stukken tekst en data naar elkaar gaan verwijzen. Dit is de
basis van het toch best wel succesvolle 'World Wide Web'.

Persoonlijk heb ik soms enigszins moeite met REST level 3. Er is
absoluut niets tegen een collectietje links in je response-documenten.
En als je moet kiezen voor een (publiek!) id voor je entity is vaak
"customerid: 3785" een stuk minder informatief dan customerid:
<https://myapi.example.org/customers/3785>. Die tweede optie kost een
stuk meer bytes, maar elke client weet dan ook precies waar verdere
informatie gezocht kan worden.

Aan de andere kant heb je dan weer vrij pittige standaarden als
[JSON:API](https://jsonapi.org/). Deze standaarden zorgen er voor dat je
allerlei randgevallen netjes kan afhandelen, maar de prijs die je
betaalt is wel dat je …​ nouja…​ vrij lelijke JSON returnt. En het is me
niet altijd direct duidelijk waarom dat steekt? Waarom zou ons
serializatie-format mooi moeten zijn? Maar steken doet het.

Een andere interessante stelling vind je bij één van mijn favoriete
auteurs: [Mark Seemann over Hackable
URLs](https://blog.ploeh.dk/2013/05/01/rest-lesson-learned-avoid-hackable-urls/).
In die post lezen we dat als we HatEoAS hanteren, dat we dan eigenlijk
ook al onze voorheen-leesbare REST-2 urls compleet onleesbaar moeten
maken, zodat we clients *dwingen* ook daadwerkelijk alleen de links te
gebruiken.

De combinatie van deze twee adviezen lijkt me helemaal interessant: dan
zou je om een REST-3-API te worden zowel je URLs moeten slopen, als de
leesbaarheid van je responses omlaag moeten halen. Ik snap de
redenaties, en ik zie er geen gaten in, maar toch kan ik moeilijk uit de
voeten met de conclusie.

Maar misschien jij wel? Laat 't me vooral weten!

-Tom

### SOAP & GRPC [_soap_grpc]

SOAP is een oud RPC-protocol waarbij we lijvige XML-documenten sturen
als Request en Response. Deze werden meestal over HTTP verstuurd, maar
soms ook over andere communicatiemedia. Bij SOAP (en GRPC) is het
basisidee dat er een programmeertaal-onafhankelijke service definition
file is (een WSDL file voor SOAP, een Protobuf file voor GRPC), waaruit
voor meerdere programmeertalen een skelet van code gegenereerd kan
worden voor elke operatie die de service aanbiedt, of elke
data-structuur die als parameter of return-waarde dient voor deze
operaties.

Op zich is dit geen gek idee. Het is dus jammer dat dit bij SOAP een
beetje stuk liep op het feit dat elke programmeertaal dit skelet -net-
even anders genereerde, waardoor het in de praktijk toch een hele hoop
gedoe was om verschillende talen met elkaar te laten praten.

GRPC gebruikt geen XML, maar Protobuf over (de lower-level delen van )
het HTTP/2 protocol. In de basis heeft het veel overeenkomsten met SOAP,
maar het is een heel stuk efficienter (en ook efficienter dan bijv.
REST). Tot nu toe lijkt het drama qua implementaties van SOAP achterwege
te blijven, maar dat komt waarschijnlijk voornamelijk omdat de
organisatie achter GRPC (Google RPC) bijna alle clients zelf gebouwd en
ge-opensourced heeft.

Een nadeel is dat er geen goede (browser-)javascript SOAP of GRPC
clients zijn, dus deze protocollen zijn voor server-server communicatie.

### GraphQL [_graphql]

GraphQL is een project van Facebook waarin je een bepaald datamodel
direct kan exposen als API. Dus je maakt een datamodel, en je hebt maar
één endpoint nodig om vervolgens je clients zelf hun eigen queries en
operaties te laten schrijven.

Dit is tegelijkertijd de grootste kracht, en de grootste zwakte. Het is
superflexibel, maar het is ook verdraaid lastig om alle mogelijke
queries performant te houden.

## Multi-project-POMs (Java-specifiek) [multipom]

### Maven refresher [_maven_refresher]

### Gespleten POMs, BOMs, en meer [_gespleten_poms_boms_en_meer]

# Messaging [_messaging]

Naast Remote-Procedure Calls is Messaging de andere integratie-stijl
waar we in deze cursus dieper op in gaan. Zoals besproken in
[Coupling](#coupling) willen we de Spatiële en Temporele coupling in
onze applicatie beperken.

Een Messaging oplossing kun je het beste voorstellen als het
'klaarleggen van een bericht op een bekende plek'. Beetje zoals in
spionnenfilms, bij een parkbankje legt spion A iets klaar, en uren/dagen
later pakt spion B het op. Zo hoeven de twee spionnen elkaar niet te
kennen, en kunnen ze elkaar ook niet verraden. En uiteraard is het niet
de bedoeling dat ze er gelijktijdig zijn, dat zou veel te verdacht zijn.

Technisch gezien, als je bijv. met Wireshark het netwerk-verkeer gaat
analyseren, werkt een RPC-call (zoals een HTTP webservice call) ook met
'berichten', maar dan 'packets' genoemd, maar omdat er allerlei
protocollen (TCP of UDP) bovenop liggen *gedraagt* het zich niet zo. Je
stuurt een request, en je verwacht een response, anders krijg je een
Exception.

Met Messaging omarmen we juist deze simpliciteit. We leggen ergens een
bericht neer, en gaan er vanuit dat er vast wel iemand (of meerdere)
zijn die er vervolgens iets mee doen.

## Asynchroniteit [_asynchroniteit]

Het lastige aan deze manier van werken is dat deze manier asynchroon is.
Laten we iets preciezer zijn wat we daarmee bedoelen. Een systeem is
'synchroon' als de verschillende computers/processen in dat systeem
allemaal in gelijke tred marcheren. Hiermee bedoelen we dat het systeem
zich gedraagt alsof er een gedeelde klok is, en dat ze elke tik van die
klok een actie ondernemen (die actie mag 'niets-doen-en-wachten' zijn)
<span class="citation">([Tanenbaum & van Steen,
2017](#tanenbaum_distributed_2017))</span>.

Dat is nog steeds een beetje vaag, dus laten we een RPC call als
voorbeeld nemen:

|      |                             |                               |
|------|-----------------------------|-------------------------------|
| Tijd | Client                      | Server                        |
| t+0  | Client stuurt GET /Students | …​wachten…​                     |
| t+1  | …​wachten…​                   | Server ontvangt GET /Students |
| t+2  | …​wachten…​                   | Server verwerkt GET /Students |
| t+3  | …​wachten…​                   | Server verstuurt Response     |
| t+4  | Client ontvangt Response    | …​wachten…​                     |

Dit ziet er in Java uit als:

``` java
RestTemplate template = new RestTemplate();
Student[] students = template.getForEntity("https://example.org/students", Student[].class);
//Doe iets met students
```

De reden dat dit werkt is dat de Client *zeker weet* dat nadat hij het
request heeft verstuurd, dat de server 'tikken van de klok' krijgt om
een antwoord te formuleren.

Laten we dit vergelijken met een bekend asynchroon proces:

``` javascript
//NIET: let students = fetch("https://example.org/students");
//maar:
fetch("https://example.org/students").then(students => {
    //Doe iets met students
});
console.log('dit wordt direct geprint, waarschijnlijk nog voordat de response ontvangen is');
```

In Javascript is fetch een asynchroon proces. Met een fetch-instructie
in ons script instrueren we de browser om namens ons script een request
te sturen, maar gaan we *direct* door met de volgende regel code. De
reden is dat we geen aannames hebben over gedeelde klokken met de
Browser (die het echte request voor ons stuurt) of de Server, **en** dat
we in Javascript maar 1 executiethread hebben. We hebben geen idee hoe
lang dat request er over gaat doen, en zolang dat request (en diens
response) onderweg is, hebben we geen data. Dat zou 1 'tik van de klok'
kunnen duren, maar ook 100, of 1000. En gegeven dat we in Javascript
maar 1 executiethread hebben, kunnen we er niet op wachten (anders zou
onze browser vastlopen[^18]). Dus in plaats van dat we wachten op een
antwoord *moeten* we direct door. Java kan dit probleem omzeilen met
meerdere Threads.

Uiteraard willen we in Javascript ook iets met de response kunnen doen.
Dus in plaats van dat onze code op de response wacht, sturen we een
stukje van onze code met de fetch-instructie (aan de Browser) mee. Met
het meesturen van deze functie instrueren we onze Browser om een request
te sturen EN de meegegeven functie (een 'callback') uit te voeren
wanneer de response eindelijk terugkomt (de meegegeven functie wordt
niet meegestuurd met het request uiteraard).

Voor verdere details over hoe dit in Javascript werkt verwijzen we je
naar <span class="citation">([Simpson,
2014](#simpson_knowjs_perf))</span>.

Messages werken dus ook asynchroon, en dat is qua programmeermodel even
wennen:

``` java
//Deze injecteren we via de constructor of @Autowired
RabbitTemplate template;

template.convertAndSend("destination-queue", new ExampleMessage(...));
//De message is nu bij RabbitMQ afgeleverd,
//maar verder kun je geen aannames doen.
```

Je zult dus een software-ontwerp moeten hebben waarbij het niet
essentieel is om zeker te weten dat op de volgende regel het bericht
verwerkt is. Het is geen synchroon-zwemmen, je kunt er niet op rekenen
wat de andere applicaties in het systeem doen.

## Message anatomie [_message_anatomie]

Een message bestaat (net als een HTTP request) uit een Header met
allerhande metadata en een Body. Metadata zijn zaken zoals hoe vaak de
message al afgeleverd is, welke user 'm gemaakt heeft, hoe geheim het
bericht is, etc. De body is puur een String, of rauwe bytes (bijv. een
object, tot JSON geserializeerd). De header is meer voor allerhande
messaging frameworks, en niet iets waar we regelmatig als
applicatie-programmeur mee omgaan.

De vier berichtsoorten die we onderscheiden in deze cursus ([Versockas
2022](https://thehonestcoder.com/types-of-messages-in-message-driven-systems/)):

-   Command

-   Query

-   Document

-   Event

## Brokers, Busses & Queues [_brokers_busses_queues]

## RabbitMQ [_rabbitmq]

## Delivery [_delivery]

Exactly Once At-most-once At-least-once

acks/nacks/amqp

# Consistency & RDBMS [_consistency_rdbms]

## Relationeel model [_relationeel_model]

### ACID Transacties [transacties]

### Normalisatie [_normalisatie]

## Refresher SQL, DAOs [_refresher_sql_daos]

## Refresher JPA & ORM [_refresher_jpa_orm]

## Evaluatie Relationele Databases [_evaluatie_relationele_databases]

asdf

# NoSQL [_nosql]

## K/V [_kv]

### Redis

## Object / Document [_object_document]

## Graph [_graph]

## Wide-column [_wide_column]

asdf

# Architecturele stijlen [_architecturele_stijlen]

## Monoliet [_monoliet]

### Microkernel / plugins [_microkernel_plugins]

## Shared Data [_shared_data]

## Service Orientation [_service_orientation]

## Microservices [_microservices]

asdf

# Domain-Driven Design - Strategic [ddd-strategic]

## Bounded Contexts [_bounded_contexts]

### Conways Law [_conways_law]

## Context Maps [_context_maps]

asdf

# Messaging & Events [_messaging_events]

## Topics [_topics]

## CQRS [_cqrs]

### Refresher CQS [_refresher_cqs]

## Event Sourcing [_event_sourcing]

## Streams [_streams]

asdf

# CAP Theorem [_cap_theorem]

# Clustering & Consensus [_clustering_consensus]

## Load balancing [availability]

## Service Discovery [_service_discovery]

## Configuration Management [_configuration_management]

# Enterprise Architecture [_enterprise_architecture]

## Zachman [_zachman]

## TOGAF [_togaf]

## Nora [_nora]

# Agile Testing [_agile_testing]

## Pyramid [_pyramid]

## Quadrant [_quadrant]

asdf

# Evoluerend design [_evoluerend_design]

## Refactoring [_refactoring]

### Towards deeper insight [_towards_deeper_insight]

## Versioning [_versioning]

## Blue/Green deployment [_bluegreen_deployment]

asdf

# Observability [_observability]

## Logs [_logs]

## Metrics [_metrics]

### Refresher: Percentiles & Histograms [_refresher_percentiles_histograms]

## Tracing [_tracing]

asdf

# Bibliography [_bibliography]

<span id="dawkins_meme"></span>Dawkins, R. (1976). The Selfish Gene. In
*The Selfish Gene*. Oxford University Press, Oxford, UK.

<span id="evans_ddd"></span>Evans, E. (2004). *Domain-Driven Design:
Tackling Complexity in the Heart of Software*. Addison-Wesley.

<span id="fowler_refactoring_2018"></span>Fowler, M. (2018).
*Refactoring: Improving the Design of Existing Code*. Pearson Education.
<https://books.google.nl/books?id=2H1_DwAAQBAJ>

<span id="fowler_peaa"></span>Fowler, M., & Rice, D. (2003). *Patterns
of Enterprise Application Architecture*. Addison-Wesley.
<https://books.google.nl/books?id=Jl5rkQnbfAIC>

<span id="gof_design_patterns"></span>Gamma, E., Helm, R., Johnson, R.,
& Vlissides, J. M. (1994). *Design Patterns: Elements of Reusable
Object-Oriented Software* (1st ed.). Addison-Wesley Professional.
<http://www.amazon.com/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612/ref=ntt_at_ep_dpi_1>

<span id="hohpe_enterprise_2012"></span>Hohpe, G., & Woolf, B. (2012).
*Enterprise Integration Patterns: Designing, Building, and Deploying
Messaging Solutions*. Pearson Education.
<https://www.enterpriseintegrationpatterns.com/>

<span id="parse_dont_validate"></span>King, A. (2019). *Parse, don’t
Validate*.
<https://lexi-lambda.github.io/blog/2019/11/05/parse-don-t-validate/>

<span id="pellegrini_killaggregate"></span>Pellegrini, S. (2023). *Kill
the Aggregate*.
<https://sara.event-thinking.io/2023/04/kill-aggregate-chapter-1-I-am-here-to-kill-the-aggregate.html>

<span id="richards_ford_fundamentals"></span>Richards, M., & Ford, N.
(2020). *Fundamentals of Software Architecture: An Engineering
Approach*. O’Reilly Media, Incorporated.
<https://books.google.nl/books?id=_pNdwgEACAAJ>

<span id="richardson_maturity"></span>Richardson, L. (2008). *Justice
Will Take Us Millions Of Intricate Moves*.
<https://www.crummy.com/writing/speaking/2008-QCon/>

<span id="richardson_webservices"></span>Richardson, L., & Ruby, S.
(2007). *RESTful Web Services*. O’Reilly.
<https://www.safaribooksonline.com/library/view/restful-web-services/9780596529260/>

<span id="simpson_knowjs_perf"></span>Simpson, K. (2014). *You Don’t
Know JS: Async & Performance*.
<https://github.com/getify/You-Dont-Know-JS/blob/1st-ed/async%20&%20performance/README.md#you-dont-know-js-async–performance>

<span id="tanenbaum_distributed_2017"></span>Tanenbaum, A. S., & van
Steen, M. (2017). *Distributed Systems*. CreateSpace Independent
Publishing Platform.
<https://www.distributed-systems.net/index.php/books/ds3/>

<span id="wirfs_brock_rdd"></span>Wirfs-Brock, R., & Wilkerson, B.
(1989). Object-oriented design: a responsibility-driven approach.
*SIGPLAN Not.*, *24*(10), 71–75. <https://doi.org/10.1145/74878.74885>

[^1]: Het woord *fallacie* is geen nederlands woord, we verbasteren het
    een beetje. Net zoals we van een *class* kunnen *inheriten*.

[^2]: Ik vind dit verwarrend, want ik zou zeggen dat als de distributie
    transparant is, dat je dan *juist* goed kan zien hoe de
    verschillende onderdelen in elkaar zitten. Maar dit is dus **niet**
    hoe deze term in de praktijk gebruikt wordt. -Tom

[^3]: Het commando 'ping -4 utrecht.nl' geeft je een ip adres waar je de
    locatie van kan opzoeken

[^4]: Uiteraard heb ik exact dit soort zaken met schaamte in productie
    gedraaid…​ Het was opvallend hoe ontzettend weinig dit uitmaakt voor
    veel non-technische mensen. Ik durfde me echter niet meer op
    Developer-meetups te vertonen! -Tom

[^5]: Spring doet hier technisch ook heel moeilijk over. De
    Spring-boot-maven plugin herschrijft je JAR files zodanig dat je ze
    niet als dependency meer kan gebruiken. Geluk bij een ongeluk, wat
    mij betreft.

[^6]: Spring-data-rest bijv. heeft genoeg aan je repositories om de hele
    presentatie/service-laag te genereren. Dat is handig als je een
    project wil scaffolden

[^7]: Op *applicatie*-niveau. Als deze method in een data-access laag
    zou voorkomen is het niet zo’n hele gekke methode. Maar we gebruiken
    zelfs een repository, dus we zijn zeker geen data-access code, want
    dat zit waarschijnlijk achter die repository-variabele…​

[^8]: Je zou zeker ook door kunnen gaan en een apart object kunnen
    aanmaken voor het hele Profile-formulier. Dan wordt de signatuur
    eenvoudigweg *public Klant processProfileForm(ProfileForm form)*,
    alleen zou dat de volgende voorbeelden wat onleesbaarder maken. Maar
    in de praktijk zeker geen gek idee!

[^9]: De auto-gegenereerde Spring JPA-Repository interfaces werken
    helaas niet zo heel fraai met deze truc.

[^10]: Uiteraard zijn er altijd workarounds, bijv. in de reflectie-hoek,
    maar dan moet er ergens een developer-collega wel echt z’n best doen
    om je het leven zuur te maken. Laten we daar niet vanuit gaan.

[^11]: Nouja, misschien kan dit wel, zie bijv. [Redis](#redis), maar dan
    nog heeft persistent opslaan in een database zo z’n voordelen

[^12]: rechts-click op de ArrayList class en Go-To-Definition, in
    IntelliJ. Echt een aanrader!

[^13]: Idealiter zouden we een Iterable\<\> kunnen returnen in Java,
    maar helaas, die zijn niet zo prettig in het gebruik. Je kunt er
    bijv. niet makkelijk overheen loopen. Andere talen hebben dit
    probleem minder, bijv. met de IEnumberable\<\> uit C#

[^14]: Een aggregaat in het Nederlands is meestal een nood-generator
    voor electriciteit, maar het heeft ook een scheikundige betekenis
    van 'samenklontering'. We doelen hier op de tweede betekenis.
    Aggregeren is ook wel een synoniem voor 'samenvoegen'. In deze tekst
    gebruiken we het woord gewoon op z’n Engels. Net als *Class* en
    *Object* en allerhande andere yargon termen.

[^15]: In de praktijk kun je echter cascades vaak nogal fijnmazig
    configureren (wel inserts, maar geen deletes, en sommige updates,
    bijv.) dus hoewel een *Cascade(All)* in JPA een vrij betrouwbare
    aanduiding van een aggregate is, kan dit soms genuanceerder zijn

[^16]: Java heeft meerdere populaire libraries, zoals Project Reactor,
    of RXJava. Het heet overal net iets anders. Spring gebruikt Reactor,
    en die noemt het een Mono.

[^17]: Of zoiets, de opdracht wil nog wel eens veranderen

[^18]: De voorganger van Fetch, XMLHttpRequest, kun je in synchrone
    modus zetten. Probeer dat eens, dan zie je hoe ernstig je browser
    vastloopt.
