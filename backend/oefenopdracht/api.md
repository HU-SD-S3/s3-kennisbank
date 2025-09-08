# Oefenopdracht @RestControllers (15-30min)

We gaan voor de Lobby uit de eerdere opdracht een @RestController maken.

Als startcode gebruiken we een template van https://start.spring.io/. Zorg dat je als Dependency ```Spring Web``` toevoegt.

Voor nu gebruiken we gewoon een List<> als data-bron.

```java
@RestController
public class LobbyController {

    private List<Lobby> lobbies = new ArrayList<>();

    //...    

}
```

## Opdracht 1: Endpoints

Implementeer de volgende endpoints, gebruik in deze versie nog geen DTOs:

* **GET /lobbies**

    Return de lijst van alle lobbies.

    Met als Response iets als:

```json
[
    { 
        "game": "Blackjack",
        "host": { "username": "BobChunker" },
        "players" [ { ... }, { ... }, { ... }]
        ...
    }
]
```

* **POST /lobbies**

    Gebruik de @RequestBody om een nieuwe lobby te kunnen maken.
    Return het zojuist gemaakte object als response. Let op een ResponseStatus van 201 Created, ipv. 200 OK.

* **GET /lobbies/{id}**

    Vraag een enkele Lobby op. 
    Het id is voor nu gewoon de plek in de lijst. Dus GET /lobbies/0 geeft de lobby die je zou krijgen met:

    ```java
    this.games.get(0);
    ```

* **DELETE /lobbies/{id}**

    Verwijder een enkele Lobby uit de databron (in dit geval onze lijst).

* **PUT /lobbies/{id}**

    Vervang een lobby uit de databron met die uit de RequestBody.

## Opdracht 2: DTOs

Verbeter de bovenstaande implementatie door DTO's te gebruiken, zowel in de Requests als in de Responses.

We willen nu niet meer de Player als losse class kunnen herkennen, maar gewoon usernames als String kunnen doorgeven (het feit dat we daar een losse class voor hebben is een implementatiedetail van de Backend).

Dit zou je ook in staat moeten stellen om een zinnigere implementatie te maken van **PUT /lobbies/{id}**


## Opdracht 3: API-Design

We kunnen nu Lobbies aanmaken en verwijderen. Maar wat is nu een mooi ontwerp voor om een extra speler de lobby te laten joinen? (of leaven)

## Extra uitdagingen

* Location Header op Post. Om een POST helemaal netjes te doen voeg je een Header "Location" toe aan de Response, met daarin de url naar de zojuist aangemaakte resource (want meestal kan je een toegekend Id niet raden)

* HATEOAS, in plaats van pure strings voor de players, maak je een losse @RestController voor players aan, en in je Lobby responses _link je de Players naar hun eigen Resource.

* Pagination, voeg queryparameters toe, zoals ?pagesize=5&pageStart=10 zodat hele grote hoeveelheden lobbies niet een enorme database-hit worden.
