---
layout: mermaid
title: Plugin Tests
permalink: /test
---


# Plugin Tests


## JEmoji

Krijgen we hier een mooie blush emoji?: :blush:


## Mermaid Diagrams

Mermaid diagrams worden client-side gerenderd, dmv. een ander HTML-template (zie het --- blok bovenaan)

```mermaid
classDiagram
    class AvailableGame {
        <<enumeration>>
        Blackjack
        Roulette
        Uno
        The Crew
        Love Letter
        High Society
    }

    class Lobby {
        - List<> players
        - Player host
        - AvailableGame chosenGame
        ...
        +join(Player actingPlayer)
        +leave(Player actingPlayer)
        +start(Player actingPlayer)
        +end()
    }
    
    class Player {
        +String username
    }
    note for Player "Je mag aannemen dat username uniek is"

    Lobby "1" --> "*" Player
    Lobby ..> AvailableGame


```

## Plant-UML-diagrams

PlantUML wordt door een Jekyll plugin via de plantuml website gegenereerd (build-time)

{% plantuml %}
@startuml
 class Example {
    - String name
    - int number 
    
    +void getName()
    +void getNumber()
    +String toString()
  }
@enduml
{% endplantuml %}

PlantUML is kennelijk ook nukkig, want dit is **iets anders**??

{% plantuml %}
@startuml
testdot
@enduml
{% endplantuml %}