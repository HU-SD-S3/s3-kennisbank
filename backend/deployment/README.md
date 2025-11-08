---
layout: mermaid
title: Deployment
permalink: /backend/deployment
---

# Deployment

Hoe willen we onze zaken deployen?

Er zijn dit semester een boel mogelijkheden. Voor nu wat algemene plaatjes en ideeën. Meer details zullen moeten volgen.


{% plantuml %}
@startuml
left to right direction

cloud "Azure" {

    node "Some Virtual Machine" {    
        frame "MyApplication.jar" {            
            rectangle "Vite Frontend" as fe             
            rectangle "Backend" as be
        }
        database "Postgres" as pg
        
        ' Dit is echt fucking zwarte chatgpt magie
        fe -[hidden]down-> be
        be -[hidden]down-> pg

        be -> pg
        fe -> be
        
    }
}

@enduml
{% endplantuml %}

Dit is basically de goedkoopste: "Ik wil doen alsof mijn laptop op productie staat". Alles op 1 machine. En gaan.


Als je ook de S2-webapp structuur wil gebruiken krijg je iets als:

{% plantuml %}
@startuml

cloud "Azure" {    
    node "Some Virtual Machine" as db {
        database "Postgres" as pg   
    }

    node "Azure Web App" as app {
        rectangle "Backend" as be
        rectangle "Vite Frontend" as fe
    }

    fe -> be
    be -> pg
}

@enduml
{% endplantuml %}

Deze versie heeft als grote voordeel dat HTTPS automatisch geregeld is (vanwege Azure Web App). HTTPS op je eigen VM is een boel gedoe ([https://letsencrypt.org])


De grote verleider die je -niet- werkend moet proberen te krijgen is:

{% plantuml %}
@startuml

left to right direction

cloud "Azure" {

    node "Some Virtual Machine" {    
        frame "npm run dev" #FF5555 {
            rectangle "Vite Frontend" as fe
        }

        frame "MyApplication.jar" {                        
            rectangle "Backend" as be
        }
        database "Postgres" as pg
        
        fe -> be
        be -> pg
    }
}

@enduml
{% endplantuml %}

```npm run dev``` staat voor development, en daar moet het blijven. ```npm run build``` maakt een productie-pakketje, die prima door je Spring-backend gehost kan worden.


Een laatste (redelijke maar lastige) optie is iets als:
{% plantuml %}
@startuml
cloud "Azure" {    
    node "Some Virtual Machine" as db {
        database "Postgres" as pg   
    }

    node "Azure Web App" as app {
        rectangle "Backend" as be        
    }

    node "Azure Static Website" as static {
        rectangle "Vite Frontend" as fe
    }

    fe -> be
    be -> pg
}

@enduml
{% endplantuml %}

Dit is iets waar je waarschijnlijk online veel documentatie over vindt. Want je frontend op een static website hosten, en je backend op een aparte web-app hosten is een stuk goedkoper, en een stuk beter voor de performance. Maar het is wel een stuk ingewikkelder, want je zult een hele specifieke build van je frontend-moeten maken ("waar staat mijn backend eigenlijk?"), en je zult CORS in de diepte op moeten lossen.

Een laatste advies zit in de 1 VM-met-HTTPS hoek:

{% plantuml %}
@startuml
top to bottom direction

cloud "Azure" {

    node "Some Virtual Machine" {    

        rectangle "Proxy (bijv. Haproxy of Nginx)" as proxy

        together {            
            rectangle "Certbot (Letsencrypt)" as certbot

            frame "MyApplication.jar" as app {            
                rectangle "Vite Frontend" as fe             
                rectangle "Backend" as be
            }
            
            database "Postgres" as pg

            
            ' invisible ordering hints
            certbot -[hidden]down-> app
            app -[hidden]down-> pg
        }
        
        
        be -> pg
        fe -> be

        proxy -> app
        proxy -> certbot
        
    }
}

@enduml
{% endplantuml %}

Certbot ([https://letsencrypt.org]) is een programma dat gratis HTTPS certificaten kan inregelen voor de meest gangbare webservers (zoals bijv. Haproxy of Nginx). Met deze setup configureren we onze proxy zodanig dat Certbot requests naar de Certbot applicatie geroute'd worden, maar dat de rest naar onze "echte" applicatie gaan. 