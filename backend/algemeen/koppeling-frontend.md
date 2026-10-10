# Backend vs. Frontend?

Vanwege geschiedkundige en organisatorische redenen is dit semester vrij hard gesplitst in "Frontend" en "Backend".
Dat is op zich een nuttig onderscheid, want het zijn in veel bedrijven al jarenlang gescheiden banen (geweest?). In andere bedrijven heeft men daarentegen juist weer 'full stack developers', maar daarnaast wel-of-niet losse UX-designers.

We hebben het vaak over 'de stack', een stapel van technologieën. Er is geen definitief overzicht, maar stel je zou de stapel van een afstandje bekijken, van gebruiker tot hardware. Dan zijn er veel verschillende gebieden om kennis van te nemen:

1. De gebruiker, en diens situatie. Denk aan UX designers, of grafische designers
2. De interne structuur van de applicatie die de gebruiker in handen heeft (de 'frontend')
3. De services & servers waar deze applicatie van gebruik maakt (de 'backend')
4. Het operating system, of browser run-time, waar deze zaken op draaien (denk aan Linux, commandline, maar ook Chromium/Webkit), en de procedures waarmee die daar komen, en/of blijven
5. De (meestal relationele) database waar vaak alle data uiteindelijk in terecht komt (old-skool DBA's)
6. De hardware (machines, netwerken, etc.), reëel of virtueel, waar dit alles op draait
7. De 'politiek' om al deze zaken heen (licensing, compliance, projectmanagement, etc.)
(en zo vergeten we vast nog vele zaken)

En niemand kan een specialist in al deze zaken zijn. 
In onze opleiding willen we dat je specialiseert in (2) & (3), en in elk geval genoeg kennis hebt van de overige zaken om met specialisten in de andere zaken constructief te overleggen.

## Frontend en Javascript

Het eerste dat even gezegd moet worden is dat in een web-wereld de Frontend bijna altijd in Javascript gemaakt wordt (zie [Typescript](TODO) en transpilatie, of juist [Webassembly](TODO) voor alternatieven). Dit betekent niet dat Frontend en Javascript synoniem zijn. Bijna alle principes die we bij Frontend en Backend onderwijzen blijven overeind als je bijv. op [Android](TODO) je frontend maakt in Java of [Kotlin](TODO), of voor [IOS](TODO) in [Swift](TODO).

Het grootste verschil tussen Javascript en de andere genoemde talen, is dat Javascript een dynamische taal is: een taal zonder type-checking, of compilatieslag. Dat is echter niet een backend-frontend onderscheid, want er zijn ook meer dan genoeg dynamische talen om een backend te maken (Javascript met NodeJS, Python, Ruby, etc.). 

## Frontend en Object-Orientatie

In dit semester gebruiken we Web Components, dmv. Lit. Dit is in essentie "Object Geörienteerd programmeren zoals het hoort". 
Het hele idee is dat je meerdere instanties van dezelfde soort *class*/*web-component* op dezelfde pagina kan renderen, met elk z'n eigen consistente interne state.

Dit betekent dat alle principes direct toepasbaar zijn:

1. Abstractie: Qua abstractie raden we je aan om componenten op verschillende niveaus te maken (bijv. volgens Atomic Design). En het helpt natuurlijk immens als een 'courses-list' component niet stiekem eigenlijk een piano is.

2. Encapsulatie: In Javascript wordt er meestal geen hard onderscheid gemaakt tussen public/private, maar in webcomponents hebben we in elk geval het verschil tussen attributes & state. De dingen die van buiten de component beinvloed horen te worden, en de dingen die intern bijgehouden moeten worden (bijv. ```isLoading=false```).

3. Modularity: We groeperen in frontend op beoogde feature, we splitsen 'fetchende-services' op van hun organism. Kortom er zijn zat plekken waarbij we bewust een bepaalde soort component isoleren van de rest; zodat we er makkelijker over kunnen redeneren.

4. Hierarchy: Je ziet veel duidelijker in frontend land dat er een keuze is tussen compositie (Page-Component A rendert Organism-Component B, die herbruikbare-component C rendert, etc.) en inheritance (de "toggle-button" is een subclass van "standard-button").

Vanuit Domain-driven design is het lastiger om parallelen te vinden. DDD gaat volledig over het 'correct implementeren van domein-logica'. Dit is in de meeste applicaties puur in de backend geimplementeerd, want in Frontend-land wordt de code (aanpasbaar-en-al) eerst naar de gebruiker gestuurd, en je wil niet dat gebruikers gaan klooien in de invarianten van je kritieke bedrijfsprocessen...

Maar dit is puur een gevolg van het soort applicaties dat we maken. We maken meestal 'Line-of-Business' applicaties, waarbij meerdere gebruikers een bepaalde informatie-toestand willen inzien en bewerken ("Hoeveel XYZ hebben we deze maand verkocht?"). Als je echter bijv. het ook de niet-onaanzienlijke (;)) (single-player-)games markt bekijkt: dat zijn reusachtige domeinmodellen in je frontend.

## Frontend en Structurele Kwaliteit

Structurele kwaliteit gaat over het maken van zinnige onderverdelingen qua groepen code. En over de relaties tussen de zojuist onderverdeelde eenheden.

Er is geen enkele reden waarom hier een verschil zou zijn tussen Backend en Frontend. We willen dingen onderverdelen op zo'n manier dat we makkelijk en correct kunnen redeneren over onze code zonder elke regel te inspecteren (*separation of concerns*).

We willen dat deze onderdelen geen chaos creëeren, waarbij onverwacht dingen stuk gaan als je ergens iets aanpast: Low Coupling. In Frontend uit zich dit vooral in welke methodes/attributen je op andere componenten aanroept, en hoe specifiek je *events* zijn gedefiniëeerd. Hoe meer micromanagement in de aanroepen, of hoe meer verwachtingen of aannames bij het afvuren van een Event, hoe meer Coupling.

## Frontend en onze referentie-architectuur

Onze referentie-architectuur voor Backend heeft bepaalde voordelen en nadelen. En onze eisen aan de Frontend kant zijn een beetje anders. Kortom, exact dezelfde architectuur zou niet de juiste keuze zijn. Maar je zult zien dat we voor vergelijkbare problemen in veel gevallen zeer vergelijkbare oplossingen hanteren. Alleen is de terminologie vaak net een beetje anders.

{% plantuml %}
@startuml

package Backend {
    package Presentation
    package Application
    package Domain
    package Data
}

package Frontend {
    package Components {
        
    }
    package Pages
    package Services
}

@enduml
{% endplantuml %}