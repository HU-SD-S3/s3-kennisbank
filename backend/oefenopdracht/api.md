# Oefenopdracht @RestControllers (2x 15-30min)

We gaan voor de Lobby uit de eerdere opdracht een @RestController maken. Op Canvas staat een link naar een startrepo klaar.
Voor nu gebruiken we gewoon een List<> als data-bron.

```java
@RestController
public class PlayerController {

    private List<Player> players = new ArrayList<>();
    //...    
}

@RestController
public class LobbyController {

    private List<Lobby> lobbies = new ArrayList<>();
    //...    
}

```

## Opdracht 1: PlayerController

Implementeer de volgende endpoints, er staat een *HTTP file* klaar in ```test/nl.hu.s3.project/lobby/presentation/PlayerController.http```.

* **GET /players**
  Return de lijst van alle spelers. We verwachten een response als:
  ```json
  [
     {
        "username": "AliceDeVries",
        "name": "Alice De Vries",
        "email": "alice@example.com"
     },
     ...
  ]
  ```
  Je kunt in de constructor van de PlayerController alvast wat spelers in de lijst stoppen, zodat je niet 'niets' te zien krijgt.

* **GET /players/{username}**  
  
  Return een enkele speler, die met de gevraagde username. Return een enkel object, zoals in de array hierboven:

  ```json
    {
        "username": "AliceDeVries",
        "name": "Alice De Vries",
        "email": "alice@example.com"
    }
  ```
  Return een nette 404-error als de speler niet bestaat.

* **POST /players**
  
  Maak een endpoint dat middels een @Requestbody stukje JSON zoals hierboven accepteert, en deze vervolgens aan de lijst toevoegt.
  Return een nette 400-error als 1 van de velden leeg is.
  Return een 201 created als het wel gelukt is. Daarvoor zul je ook een Spring @-annotatie nodig hebben.

* **DELETE /players/{username}**
  
  Maak een endpoint dat de speler met de gegeven username uit de lijst verwijdert.

## Opdracht 2: LobbyController

Implementeer de volgende endpoints, er staat een *HTTP file* klaar in ```test/nl.hu.s3.project/lobby/presentation/LobbyController.http```.
De spelers in deze controller hoeven niet te kloppen met de spelers uit de PlayerController. Het is voor nu genoeg om gewoon een nieuwe Player met alleen een username te constructen. Dat fixen we netter volgende les.

* **GET /lobbies**

    Return de lijst van alle lobbies. Je kunt als Id de plaats in de lijst gebruiken (dus het eerste item heeft id 0).
    Met als Response iets als:

```json
[
    { 
        "id": 0,
        "game": "Blackjack",
        "host": "BobChunker",
        "players": [ "BobChunker", "AliceDeVries", "etc"]
        ...
    }
]
```

* **GET /lobbies/{id}**

    Vraag een enkele Lobby op. 
    Het id is voor nu gewoon de plek in de lijst. Dus GET /lobbies/0 geeft de lobby die je zou krijgen met:

    ```java
    this.lobbies.get(0);
    ```    
    

* **POST /lobbies**

    Gebruik de @RequestBody om een nieuwe lobby te kunnen maken:
    ```json
    {
        "game": "BLACKJACK",
        "host": "test"
    }
    ```
    
    Return het zojuist gemaakte object als response (dat is dus uitgebreider dan de requestbody). Let op een ResponseStatus van 201 Created, ipv. 200 OK. Daarvoor zul je ook een Spring @-annotatie nodig hebben.



* **DELETE /lobbies/{id}**

    Verwijder een enkele Lobby uit de databron (in dit geval onze lijst).

    (Hier is met de simpelste implementatie iets vreemds aan de hand: wat?)

* **PUT /lobbies/{id}**

    Gebruik de @RequestBody om (alleen!) de game van een Lobby te kunnen wijzigen:
    ```json
    {
        "game": "BLACKJACK"       
    }
    ```

## Opdracht 3: API-Design

We kunnen nu Lobbies aanmaken en verwijderen.
Implementeer een tweetal endpoints voor het joinen/leaven van een lobby:

* **POST /lobbies/{id}/join**
* **POST /lobbies/{id}/leave**

Deze endpoints accepteren in hun body een object met de ```{ username }``` van een speler.
Dit is een procedure-oriented ontwerp. Zie je ook een resource-oriented alternatief?

## Extra uitdagingen

* Location Header op Post. Om een POST helemaal netjes te doen voeg je een Header "Location" toe aan de Response, met daarin de url naar de zojuist aangemaakte resource (want meestal kan je een toegekend Id niet raden)

* Pagination, voeg queryparameters toe, zoals ?pagesize=5&pageStart=10 zodat hele grote hoeveelheden lobbies niet een enorme database-hit worden.
