# AI in development

## Tab Driven Development
Als je de AI in je IDE aanzet dan zal je zien dat als je code aan het intikken ben dat er regelmatig suggesties komen. Dit is een vorm van AI die je helpt bij het schrijven van code. Dit is een voorbeeld van Tab Driven Development. Je typt een paar letters en de AI vult de rest aan. Dit kan je helpen om sneller code te schrijven en om fouten te voorkomen.

Nadeel is dat de AI geen idee heeft van de context van je code. De AI redeneerd vanuit wat je ingetypt hebt en wat er in de omgeving van je code staat. Maar de AI heeft geen idee van wat je aan het bouwen bent. Hierdoor kan de AI soms suggesties doen die niet relevant zijn voor wat je aan het bouwen bent.

Een heel simpele stap die je kan nemen is om een comment te schrijven boven de code die je aan het schrijven bent. Bijvoorbeeld:

```javascript
// Function to calculate the sum of two numbers
```

Op deze manier geef je de AI meer context over wat je aan het bouwen bent. De AI kan dan betere suggesties doen die relevant zijn voor wat je aan het bouwen bent. 

> Eigenlijk is dat natuurlijk ook wat we ook zonder AI zouden moeten doen. Schrijf eerst op wat je wil geen programmeren, pas dan de code. Doe dit zowel op project basis, op feature basis en op functie basis. Met AI wordt dit alleen maar belangrijker.

Een iets lastiger voorbeeld zou kunnen zijn:

```javascript
// function that shuffles an array of objects randomly
export function shuffleArray(array) {
    for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
}

## Tests genereren met AI
Je kan AI ook gebruiken om tests te genereren voor je code. Dit kan je helpen om sneller tests te schrijven en om fouten te voorkomen.

Neem het bovenstaade voorbeeld. Je kan de AI vragen om tests te genereren voor de `shuffleArray` functie. Selecteer de functie en type bij de (bv copilot) AI in:

```
/tests  write a cucumber test for the selected function
```

De AI zal dan het volgende genereren:

```markdown
Workspace: **Pseudocode plan:**

1. Create a Cucumber feature file describing the behavior of `shuffleArray`.
2. Cover edge cases:
   - Empty array
   - Array with one element
   - Array with two elements
   - Array with multiple elements
   - Array with duplicate elements
   - Array with objects
   - Ensure all original elements are present after shuffle
   - Ensure no elements are lost or duplicated
   - Ensure the array is shuffled (order changes for arrays with length > 1)
3. Implement step definitions in `calc.test.js` using Jest and Cucumber.

**Code:**

**Feature file: `src/utils/shuffleArray.feature`**
```gherkin
Feature: shuffleArray function

  Scenario: Shuffle an empty array
    Given an empty array
    When I shuffle the array
    Then the result should be an empty array

  Scenario: Shuffle an array with one element
    Given an array with one element
    When I shuffle the array
    Then the result should be the same array

  Scenario: Shuffle an array with two elements
    Given an array with two elements
    When I shuffle the array
    Then the result should contain both elements

  Scenario: Shuffle an array with multiple elements
    Given an array with multiple elements
    When I shuffle the array
    Then the result should contain all original elements

  Scenario: Shuffle an array with duplicate elements
    Given an array with duplicate elements
    When I shuffle the array
    Then the result should contain all original elements including duplicates

  Scenario: Shuffle an array of objects
    Given an array of objects
    When I shuffle the array
    Then the result should contain all original objects
```

**Test file: `src/utils/calc.test.js`**
```javascript
// @jest-environment node
const { shuffleArray } = require('./calc');
const { defineFeature, loadFeature } = require('jest-cucumber');

const feature = loadFeature('./src/utils/shuffleArray.feature');

defineFeature(feature, test => {
  test('Shuffle an empty array', ({ given, when, then }) => {
    let array, result;
    given('an empty array', () => {
      array = [];
    });
    when('I shuffle the array', () => {
      result = shuffleArray([...array]);
    });
    then('the result should be an empty array', () => {
      expect(result).toEqual([]);
    });
  });

  test('Shuffle an array with one element', ({ given, when, then }) => {
    let array, result;
    given('an array with one element', () => {
      array = [42];
    });
    when('I shuffle the array', () => {
      result = shuffleArray([...array]);
    });
    then('the result should be the same array', () => {
      expect(result).toEqual([42]);
    });
  });

  test('Shuffle an array with two elements', ({ given, when, then }) => {
    let array, result;
    given('an array with two elements', () => {
      array = [1, 2];
    });
    when('I shuffle the array', () => {
      result = shuffleArray([...array]);
    });
    then('the result should contain both elements', () => {
      expect(result.sort()).toEqual([1, 2]);
    });
  });

  test('Shuffle an array with multiple elements', ({ given, when, then }) => {
    let array, result;
    given('an array with multiple elements', () => {
      array = [1, 2, 3, 4, 5];
    });
    when('I shuffle the array', () => {
      result = shuffleArray([...array]);
    });
    then('the result should contain all original elements', () => {
      expect(result.sort()).toEqual([1, 2, 3, 4, 5]);
    });
  });

  test('Shuffle an array with duplicate elements', ({ given, when, then }) => {
    let array, result;
    given('an array with duplicate elements', () => {
      array = [1, 2, 2, 3];
    });
    when('I shuffle the array', () => {
      result = shuffleArray([...array]);
    });
    then('the result should contain all original elements including duplicates', () => {
      expect(result.sort()).toEqual([1, 2, 2, 3]);
    });
  });

  test('Shuffle an array of objects', ({ given, when, then }) => {
    let array, result;
    given('an array of objects', () => {
      array = [{ id: 1 }, { id: 2 }, { id: 3 }];
    });
    when('I shuffle the array', () => {
      result = shuffleArray([...array]);
    });
    then('the result should contain all original objects', () => {
      expect(result.map(o => o.id).sort()).toEqual([1, 2, 3]);
    });
  });
});
```

## De rol van de Analist/architect (en/of developer)
Mooi dat zowel de code als de tests automatisch gegenereerd worden. Maar hoe zorg je er nu voor dat de juiste code en tests gegenereerd worden? Hier komt de rol van de analist/architect (en/of developer) om de hoek kijken.

In dit voorbeeld zal je de test moeten analyseren en beoordelen of deze de juiste dingen test. Misschien mist er een edge case, of wordt er iets getest wat niet relevant is. Dit is een taak die de AI (nog) niet kan overnemen.

Met bovenstaande voorbeelden bereik je dat de AI de code en de test schrijft, maar je hebt geen invloed op hoe dit gebeurt. Je kan de AI niet sturen in hoe de code en de test eruit zien. Dit is een taak die de analist/architect (en/of developer) moet doen.

Hiervoor gaan we dus specificaties en plannen maken. Dit is een taak die de analist/architect (en/of developer) moet doen.

## Voorbeeld met AGENTS.md
Een manier om dit te doen is door gebruik te maken van AGENTS.md. Dit is een manier om specificaties en plannen te maken die de AI kan begrijpen.

### Oefening met AGENTS.md:
Maak een nieuwe vite project aan (met lit als framework, javascript als taal):
```zsh
npm create vite@latest ai-test -- --template lit
cd ai-test
npm install
```

Maak in de root van het project een bestand aan met de naam `AGENTS.md` en voeg de volgende inhoud toe:

```markdown
# Project guidelines for agents

This document outlines the guidelines and best practices for developing and maintaining agents within this project. Agents are autonomous entities that perform specific tasks or functions, often interacting with users or other systems.

## Project Structure
The project is organized into the following main directories:
- `/src`: Contains the source code for the project.
  - `/components`: Reusable components used by agents.
  - `/pages`: Different pages or views that agents can render.
  - `/services`: Services that provide specific functionalities to agents.
  - `utils`: Utility functions and helpers (must be pure functions).
- `/docs`: Documentation related to the project.
  - `/design`: Design documents and diagrams.
- `/tests`: Unit and integration tests for the project.
- `/configs`: Configuration files for different environments.

## Coding Standards
- Follow consistent naming conventions (e.g., camelCase for variables and functions, PascalCase for components).
- Write clean, readable, and maintainable code.
- Use comments to explain complex logic or decisions.
- Split functionality into smaller, reusable functions or components.
- Use Lit HTML for rendering HTML templates.

## Process for Adding New code
1. **Create a New Branch**: Use a descriptive name for your branch (e.g `feature/add-new-feature`).
2. **Implement the Feature**: Follow the coding standards and project structure. 
3. **Write Tests**: Ensure that your code is covered by unit and integration tests. Use vitest for testing.
```

Hiermee sturen we de AI om code te genereren die past binnen de structuur en standaarden van ons project.

Zet copilot (of een andere AI) aan in je IDE zet deze in Agent mode. En geef de volgende opdracht:

```
Using the AGENTS.md as a guide add a new feature to the project; User can push a button changing the collor of a square to a random color.
```

De AI gaat nu aan de slag om de code te genereren die past binnen de structuur en standaarden van ons project.

De eerste keer dat ik dit deed kreeg maakte de AI geen nieuwe branch aan. Dus heb ik de volgende vraag gesteld:

```
Why did you not create a new branch for the fature?
```

Waarop ik als antwoord kreeg:

```markdown
I did not create a new branch because I do not have direct access to your git environment or permissions to run git commands automatically. My capabilities are limited to file and code changes within your workspace.

However, according to your AGENTS.md guidelines, the correct process is to create a descriptive branch before implementing a new feature. You should run:

> git checkout -b feature/color-square

before making changes. If you want, I can guide you through the full branching workflow or provide the exact commands to use.
```

Hieruit blijkt dat de AI heel duidelijk de richtlijnen uit AGENTS.md volgt. Maar dat de AI geen acties kan uitvoeren die buiten de scope van het project vallen (zoals git commands uitvoeren).

Dit kunnen we oplossing door een setting te veranderen:
![copilot settings](./ai-git-allow.jpg)

We runnen het commando opnieuw en nu maakt de AI wel een nieuwe branch aan.

Als het goed is heb je nu een nieuwe branch met de naam `feature/color-square` en de code die de AI gegenereerd heeft. 

We verwachten dat de AI de volgende bestanden heeft aangepast:
- `src/components/ColorSquare.js`
- `tests/components/ColorSquare.test.js`

Controleer of dat daadwerkelijk gebeurd is. En bekijk de code die de AI gegenereerd heeft. Is deze code goed? Volgt de code de richtlijnen uit AGENTS.md?

### Conclusie
Door gebruik te maken van AGENTS.md kunnen we de AI sturen om code te genereren die past binnen de structuur en standaarden van ons project. Dit maakt het makkelijker om de code te begrijpen en te onderhouden.

We hebben nu de feature direct in copilot ingetypt. We hebben dus niet eerst een specificatie en een plan gemaakt. Dit gaan we in het volgende deel doen.

TODO: Oefening met taken.