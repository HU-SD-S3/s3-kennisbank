# Persistentie

Een webapplicatie is standaard (/idealiter) stateless. Dat betekent dat
(wat de backend betreft) elk request helemaal uit het niets komt. Alle
informatie die nodig is om dat request af te handelen moet in dat
request zitten.

Als een webapplicatie echt stateless is, betekent dit dat we op elk
moment de applicatie zouden moeten kunnen herstarten, en dat we dan
gewoon verder kunnen waar we gebleven waren (er was immers geen toestand
in het geheugen die door de herstart verloren is gegaan).

Dit is voor webapplicaties van belang, omdat we vaak in het echt een
beetje willen kunnen sjoemelen met het opstarten en afsluiten van
applicaties. Het internet is namelijk 24/7 open, en iedereen kan bij
elke website. Als het druk is willen we misschien alle requests over
meerdere servers opsplitsen, en als we een update uitvoeren willen we de
applicatie even afsluiten, updaten, opstarten, en dan direct weer door.

Toch willen we in onze webapplicatie met data om kunnen gaan. Een
applicatie die altijd alles vergeet heb je niet zo gek veel aan. We
willen dus dat na een herstart belangrijke data opgeslagen is geweest.
We willen dat die data blijvend (persistent) is. Meestal gebruiken we
een database hiervoor. En meestal is dat een \"relationele database\",
zoals bijv. PostGres.

## Domeinmodel versus datamodel

### Object-relation impedance mismatch

## Spring JPA en Hibernate

### Entities

#### Ids {#ids .unnumbered}

### Relaties

#### Cascades {#cascades .unnumbered}

### Repositories

### Transacties en het belang van goed doortrekken
