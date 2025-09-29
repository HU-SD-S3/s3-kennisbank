# Oefenopdracht OOP (15-30min)

In deze oefenopdracht willen we weer even een klein beetje oefenen met Java en OOP.

Je kunt een nieuw Project aanmaken in IntelliJ via ```New Project / Java / Maven```

## Schets

```mermaid
classDiagram
    direction RL

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
        - List~Player~ players
        - Player host
        - AvailableGame chosenGame
        ...
        
        +join(Player actingPlayer) void
        +leave(Player actingPlayer) void
        +start(Player actingPlayer) void
        +end()
    }
    note for Lobby "Op de plek van de puntjes moet je naar eigen inzicht velden toevoegen"
    
    class Player {
        -String username 
        -String fullName
        -String email        
    }
    note for Player "Je mag aannemen dat username uniek is"

    note "getters/setters zijn in de basis weggelaten. Voeg toe naar smaak, zoals zout & peper."

    Lobby "1" --> "*" Player
    Lobby ..> AvailableGame


```

## Requirements

* Alleen de Host mag de game starten
* Nadat het spel is afgelopen mogen spelers niet meer joinen.
* Er mogen geen dubbele spelers in de lobby 

Klaar? Hand omhoog, docent checkt het even.
Was het goed? Top, jij bent nu ook (even) docent.
