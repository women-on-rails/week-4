# Préambule

Slides du cours disponibles [ici](http://slides.com/women_on_rails/week-4)

Ce tutoriel a pour objectif de s'essayer à la console Ruby et de comprendre l'utilisation du langage Ruby dans le projet ``` Curiosities```, dans le cadre du cycle 1 des ateliers Women On Rails.

# Étape 1 : Rappels

## Commandes principales

Vous pouvez retrouver les commandes utiles pour le terminal, git et la console Ruby On Rails [ici](https://women-on-rails.github.io/guide/main_commands).

## MVC

## Le modèle



# Étape 2 : Lire l'exercice et se lancer

## Application au projet Curiosités

Ouvrez votre projet avec Cloud9, ou l'éditeur que vous utilisez si vous avez une installation native.

Si vous utilisez SublimeText, vous pouvez faire subl . dans la console pour ouvrir directement votre projet. (subl c'est SublimeText, l'espace c'est parce que la commande est finie, et le point c'est pour dire "ouvre dans Sublime Text tout le dossier dans lequel je suis, en un coup").

### Manipuler des objets dans la console

#### La base de données et ses migrations

Lorsque l'on crée une application, on écrit des algorithmes visant à manipuler des données.
On veut pouvoir en conserver certaines dans la durée, et c'est le rôle de ce que l'on appelle une "base de données".

Une base de données est un logiciel dans lequel on peut stocker des informations de manière structurée, en évitant au maximum les redondances, pour les réutiliser de diverses manières.

Dans Ruby On Rails, une "migration" est ce qui va permettre de faire évoluer la structure et le contenu de la base de données, au fil du développement d'un projet. Les migrations ne prennent pas en compte le type de base de données utilisé. Elles fonctionnent sur n'importe quelle base de données gérée par Ruby On Rails.

#### Création du modèle Curiosity

Dans votre terminal, tappez la commande suivante:

``` rails generate model Curiosity name:string description:text image_url:text image_text:string ```

![Page de base](/images/readme/generate_model.png)

Cela va créer automatiquement 4 fichiers différents:
- db/migrate/20161023225707_create_curiosities.rb : fichier de migration
- app/models/curiosity.rb : modèle Curiosity
- test/models/curiosity_test.rb : fichier de test (notion non abordée ici)
- test/fixtures/curiosities.yml : fichier utilisé pour les tests (notion non abordée ici)

##### La migration

En ouvrant le fichier ````/db/migrate/20161023225707_create_curiosities.rb```` (les chiffres peuvent changer en fonction de la date à laquelle vous l'avez faite) vous pouvez voir comment est composée une migration qui crée une table.

![Page de base](/images/readme/migration.png)

Une migration est une classe de type ````ActiveRecord::Migration````. La migration ````CreateCuriosities```` contient une méthode ````change```` qui, lorsque l'on applique la migration, va créer la table ````curiosities```` dans la base de données (````create_table :curiosities````).

Cette table ````curiosities```` a plusieurs colonnes (que l'on décrit dans le "block" ````do````):
- ````name```` : le nom d'une curiosité, qui est une petite chaine de caractères (````String````)
- ````description```` : la description de la curiosité, qui est une grande chaine de caractères (````Text````)
- ````image_url```` : l'url vers l'image de la curiosité, qui est une grande chaine de caractères (````Text````)
- ````image_text```` : légende accompagnant l'image de la curiosité, qui est une petite chaine de caractères (````String````)
- ````created_at```` : date de création d'une curiosité, qui est un objet ````DateTime```` (date + horaire)
- ````updated_at```` : date de derniere mise à jour d'une curiosité, qui est un objet ````DateTime```` (date + horaire)

On peut créer les deux dernières colonnes (````created_at```` et ````updated_at````) en un coup grâce à un raccourci : la ligne ````t.timestamps null: false````. Il est intéressant de noter que vous n'avez pas besoin de "penser" à ces deux champs : rien qu'avec leur nom, Ruby on Rails détecte que ce sont des champs pour garder les dates de création et modification (si vous aviez des champs de création / modification qui ne sont PAS nommés ainsi, il faudrait le faire soi-même).

Lorsque des migrations ont été effectuées sur la base de données de votre application, il est possible de retrouver sa structure complète dans le fichier ````/db/schema.rb````.

Pour le moment, aucune migration n'a encore été appliquée à la base de données. Le fichier ````/db/schema.rb```` n'existe pas.

Pour appliquer la migration, faites la commande suivante dans votre terminal:

``` rake db:migrate ```

![Page de base](/images/readme/db_migrate.png)

Ouvrez le fichier ````/db/schema.rb````. Vous pouvez constater que vous retrouvez la méthode de création de la table ````Curiosities````, avec tout ce qui la compose.

![Page de base](/images/readme/schema.png)

> Astuce :
> Une migration a un identifiant. Cela permet à votre application de savoir quelle est la dernière migration qui a été traitée, pour éviter de la rejouer. Cet identifiant de migration est visible dans le nom du fichier de la migration.

Vous pouvez voir à quelle migration vous en êtes dans le fichier ````/db/schema.rb```` avec ````version: 20161023225707````.

##### ActiveRecord et les modèles

ActiveRecord est la partie de Ruby On Rails qui permet de manipuler les informations stockées en base de données avec des classes Ruby (qu'on appelle les modèles).

Cela permet de représenter les attributs d'une table de la base de données dans un modèle, pour avoir accès à chacune des lignes de cette table (comme une ligne dans Excel !) et pouvoir les manipuler dans votre application.

Ouvrez votre terminal puis ouvrez une console Ruby On Rails : ````rails console```` (ou ````rails c````)








- creation du modèle Curiosity
- creation en console de nouvelles curiosités en base de données
- ajout de validations sur le modele pour obliger a avoir un nom



# Étape 3 : Enregistrer les modifications sur le répertoire distant

[Enregistrer vos modifications et les envoyer sur votre répertoire Github](https://women-on-rails.github.io/guide/push_project)

# Pour aller plus loin :
