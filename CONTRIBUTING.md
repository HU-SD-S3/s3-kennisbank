# Meeschrijven aan de kennisbank

Zowel docenten als studenten zijn welkom om bij te dragen. 
Je helpt al door het aanmaken van issues als er zaken niet duidelijk zijn of ontbreken, maar mocht je zelf ook willen
schrijven, dan is dat ook van harte welkom.

Maak als je een groter stuk wil schrijven wel altijd eerst een issue aan, dan kan er een kort overleg plaatsvinden voordat
je er teveel tijd in stopt.

Spelfouten, en kleine tweaks kun je altijd gewoon inschieten als pull-request.


## Hoe werkt dit dan?

De S3-kennisbank is een Github-pages website. In een ideale wereld zou dat betekenen dat het 'gewoon werkt', maar helaas.
Neem bijv. [Mermaid diagrammen](https://mermaid.js.org/), deze werken -wel- in de repository-browser, maar niet op de 
standaard pages-site. Dus hebben we iets dieper ingehaakt op de plugin-structuur van Github-pages (Jekyll, achter de schermen).

Eenvoudige tekstuele wijzigingen kun je gewoon rechtstreeks committen en pull-requesten. Als je echter ook met diagrammen,
of andere truukjes qua styling gaat werken, dan is het handig even te testen of alles werkt voordat je een pull-request maakt.

### Docker-gebaseerd

`docker compose up --build --remove-orphans site`

### De ingewikkelde route

De ingewikkelde route is om lokaal gewoon Jekyll te draaien, maar dat is een beetje irritant als je geen Ruby-ervaring hebt.
Hoe dan ook:

* Ruby is nukkig op Windows, dus gebruik WSL.
* Zodra je Ruby hebt, moet je Bundler installeren: `gem install bundler`
  (Gem en Bundler samen vormen een redelijke package manager. Gem installeert dingen, Bundler houdt versies bij)
* In de repository-directory draai je `bundle install` om de benodigde gems te installeren.
* Vervolgens kun je de site bouwen met `bundle exec jekyll build`, of debuggen met `bundle exec jekyll serve`.


