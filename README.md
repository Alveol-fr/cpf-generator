# CPF Generator

CPF Generator est une petite application Rails qui permet de générer une attestation sur l'honneur pour s’inscrire à une action de formation dispensée aux créateurs et repreneurs d’entreprise. 

Pour le moment l'appli ne gère que ce document, n'hésitez pas à proposer des Merge Requests pour améliorer l'offre de génération de document 


## Installation 

```bash 
    git clone https://github.com/Alveol-fr/cpf-generator.git && cd cpf-generator && bundle install && yarn install && rails db:create && rails s 
```

Rendez-vous sur votre [localhost:3000](http://localhost:3000)

Si vous souhaitez envoyer vos documents directement dans votre drive, n'oublier pas de rajouter vos clef d'authentification dans le fichier `config.json` à la racine de l'app 

### Prérequis  

Vous devez avoir un environnement de développement Ruby / Rails installé sur votre machine si vous souhaitez tester ou coder cette app en local.

- Yarn 
- Bundler 
- Ruby 2.5.1
- Rails 6.0.3

Si vous n'avez pas les paquets requis et que vous rencontrez des erreurs lors de l'installation, suivez [cette installfest](https://installfest.railsbridge.org/installfest/), il vous aidera à installer votre environnement de développement. 
