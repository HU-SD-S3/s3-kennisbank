# AI in compliance
Als developers maken we afspraken over hoe we code schrijven. We maken afspraken over de structuur van de code, de naamgeving van variabelen en functies, de manier waarop we testen schrijven, etc. Deze afspraken zorgen ervoor dat we met meerdere developers aan een project kunnen werken zonder dat we elkaar in de weg zitten. Maar deze afspraken zorgen er ook voor dat we consistent zijn in de manier waarop we code schrijven. Dit is belangrijk omdat het ervoor zorgt dat de code makkelijker te lezen en te begrijpen is.

In deze paragraaf laten we zien hoe je AI kan gebruiken om ervoor te controleren dat de code die er geschreven wordt voldoet aan de afspraken die je gemaakt hebt. We gaan er hierbij vanuit dat je een IDE gebruikt die AI ondersteunt (zoals bv Visual Studio Code met copilot).

## Inhoud

## Compliance prompt
Maak in je project een nieuwe branch aan met de naam `feature/compliance-prompt`. In deze branch gaan we een nieuwe prompt maken die we kunnen gebruiken om de code te controleren op compliance met de afspraken die we gemaakt hebben. Eerst maken we de folder .github/prompts aan in de root van je project. In deze folder maken we een nieuw bestand aan met de naam `compliance.prompt.md`. In dit bestand schrijven we de prompt die we willen gebruiken om de code te controleren op compliance met de afspraken die we gemaakt hebben. Een voorbeeld van zo'n prompt is:

```markdown
Check the code for compliance with the specified guidelines and standards.

Standards
## Lit elements guidelines
- The component should be built using Lit (https://lit.dev/).

### Naming conventions
- The component html tag should be named using kebab-case and include at least one - character.
- The name of the component file should be the same as the html tag of the component.
- The component class name should be in PascalCase and should resemble the component html tag without the - character.

### The render function
- The render function should not change any properties or state of the component.
- If possible the render function should be split up in smaller functions, with names starting with `render` followed by the specific thing they will render.
- All DOM manipulation should be done in the render function or in functions called by the render function. Calls to functions that manipulate the DOM should not be done outside of the render function. So no createElement, appendChild, innerHTML, etc.

### component communication
- The component should use properties to receive data from its parent component.
- The component should use events to send data to its parent component.
- The component should not call any functions outside of itself with the exception of
  - Subscribing to (for example) RxJS Observables 
  - Calls to services (for collecting data)
  - Calls to utility functions (for example for formatting data)

## Separation of concerns
- The component should not contain any business logic. Business logic should be in services or utility functions
- The component should not contain any data fetching logic. Data fetching logic should be in services.
- The component should not contain any formatting logic. Formatting logic should be in utility functions.
```

Run deze prompt in je IDE (bijvoorbeeld door `/compliance` te typen in je code editor). De AI zal nu de code controleren op compliance met de afspraken die we gemaakt hebben. 

De AI gaat nu aan het werk om de code te controleren op compliance met de afspraken die we gemaakt hebben. Als de AI problemen vindt dan zal deze suggesties geven om de code te verbeteren. Bijvoorbeeld:

```
The component 'my-component' does not follow the naming conventions. The html tag should be named using kebab-case and include at least one - character. The name of the component file should be the same as the html tag of the component. The component class name should be in PascalCase and should resemble the component html tag without the - character.
```

Het voorbeeld dat hierboven gegeven is beperkt zich tot een Lit component en is daar niet eens volledig in. 

### Opdracht
Breid deze prompt uit met afspraken en standaarden die je geleerd hebt bij het frontend en backend gildes. Dit stelt je in staat om heel eenvoudig de code die er geschreven wordt te controleren op compliance met de afspraken die je gemaakt hebt. 

Wees je ervan bewust dat de AI niet perfect is en dat deze soms fouten kan maken. Controleer de suggesties die de AI geeft altijd zelf. Het resultaat zou het begin moeten vormen van een gesprek met de developers over de code die er geschreven wordt. Het kan prima zijn dat zij het niet overal mee eens zijn. Dat moet de trigger zijn om de compliance prompt aan te passen.

Hiermee heb je een heel krachtig middel in handen om de kwaliteit van de code die er geschreven wordt te verbeteren.

> NOTE: Het is NIET toegestaan om AI te gebruiken om code te genereren die je inlevert in je portfolio. Het is wel toegestaan om AI te gebruiken om code te controleren op compliance met de afspraken die je gemaakt hebt.