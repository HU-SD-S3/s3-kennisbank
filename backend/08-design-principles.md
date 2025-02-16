# Design principles

## ICE principles

### Program to an Interface, not an Implementation

> There are two benefits to manipulating objects solely in terms of the
> interface defined by abstract classes:
>
> 1.  Clients remain unaware of the specific types of objects they use,
>     as long as the objects adhere to the interface that clients
>     expect.
>
> 2.  Clients remain unaware of the classes that implement these
>     objects. Clients only know about the (\...) \[abstraction\]
>     defining the interface.
>
> This so greatly reduces implementation dependencies between subsystems
> that it leads to the following principle ofreusable object-oriented
> design: *Program to an interface, not an implementation.*

[@Gof1994], p. 18.

### Favor Object Composition over Implementation Inheritance

> That leads us to our second principle of object-oriented design:
> *Favor object composition over class inheritance.* Ideally, you
> shouldn't have to create new components to achieve reuse. You should
> be able to get all the functionality you need just by assembling
> existing components through object composition. But this is rarely the
> case, because the set of available componentsis never quite rich
> enough in practice. Reuseby inheritancemakesit easier to make new
> components that can be composed with old ones. Inheritance and object
> composition thus work together. Nevertheless, our experience isthat
> designers overuse inheritance as a reuse technique, and designs are
> often made more reusable (and simpler) by depending more on object
> composition.

[@Gof1994], p. 20.

#### Encapsulate what varies

## SOLID principles

### Single Responsibility Principle (SRP)

Een manier om de verantwoordelijkheid van een klasse in te richten is
door te kijken naar de informatie waar deze over kan beschikken. Breng
die dingen samen die dezelfde informatie moeten maken, aanpassen, lezen
en verwijderen.

Dit staat ook wel bekend als het *information expert-principe*:

> Assign a responsibility to the information expert---the class that has
> the *information* necessary to fulfill the responsibility.

[@Larman2004], p. 248

In plaats van allemaal lijsten bij te houden van namen en adressen, kan
je vaak beter een lijst bijhouden met personen, waarin namen en adressen
zijn opgenomen.

### Open Closed Principle (OCP)

### Liskov Substitution Principle (LSP)

### Interface Segregation Principle (ISP)

### Dependency Inversion Principle (DIP)
