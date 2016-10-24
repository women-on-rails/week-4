# Préambule

Slides du cours disponibles [ici](http://slides.com/women_on_rails/week-4)

Ce tutoriel a pour objectif de comprendre l'utilisation des modèles dans l'application ``` Curiosities``` et de manipuler des objets dans un controleur et une vue, dans le cadre du cycle 1 des ateliers Women On Rails.

# Étape 1 : Rappels

## Commandes principales

Vous pouvez retrouver les commandes utiles pour le terminal, git et la console Ruby On Rails [ici](https://women-on-rails.github.io/guide/main_commands).

## MVC

Le rappel sur le patron de conception [Modèle - Vue - Controleur] peut etre trouvé [ici](openclassrooms.com/courses/apprendre-asp-net-mvc/le-pattern-mvc)

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

Dans votre terminal, tapez la commande suivante:

```Shell
 rails generate model Curiosity name:string description:text image_url:text image_text:string
````

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

```Shell
 rake db:migrate
````

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

La commande ``` rails generate model Curiosity name:string description:text image_url:text image_text:string ``` précedemment utilisée a créé le modèle ```Curiosity``` contenu dans le fichier ``` app/models/curiosities.rb```.

![Page de base](/images/readme/model.png)

###### Créer une curiosité en base de données

Nous allons maintenant créer une nouvelle curiosité dans notre base de données en utilisant ce modèle ``` Curiosity``` :

```Ruby
 Curiosity.create(name: "Joli mug", description: "Recu au Japon, lors d'un congres interlitieres", image_url: "https://s-media-cache-ak0.pinimg.com/236x/4a/86/bf/4a86bfbf02b472e5b385762b8f267a91.jpg", image_text: "Un grand mug de lait pour bien commencer la journee")
````

![Page de base](/images/readme/creation_curiosity.png)

Cela va d'abord vous afficher la requête SQL faite grâce à Active Record pour créer la curiosité :

```Ruby
(0.1ms)  begin transaction
SQL (0.2ms)  INSERT INTO "curiosities" ("name", "description", "image_url", "image_text", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?)  [["name", "Joli mug"], ["description", "Recu au Japon, lors d'un congres interlitieres"], ["image_url", "https://s-media-cache-ak0.pinimg.com/236x/4a/86/bf/4a86bfbf02b472e5b385762b8f267a91.jpg"], ["image_text", "Un grand mug de lait pour bien commencer la journee"], ["created_at", "2016-10-23 23:09:18.922795"], ["updated_at", "2016-10-23 23:09:18.922795"]]
(3.3ms)  commit transaction
````

Puis, cela va renvoyer l'objet nouvellement créé qui a dans l'exemple l'identifiant `3` en base de données (ici ce sont des numéros croissants donc c'est la numéro 3 ou #3, mais ça pourrait etre l'objet 4 ou 5) :

```Ruby
 => #<Curiosity id: 3, name: "Joli mug", description: "Recu au Japon, lors d'un congres interlitieres", image_url: "https://s-media-cache-ak0.pinimg.com/236x/4a/86/bf...", image_text: "Un grand mug de lait pour bien commencer la journe...", created_at: "2016-10-23 23:09:18", updated_at: "2016-10-23 23:09:18">
````

###### Récupérer une curiosité de la base de données

Pour manipuler cette nouvelle curiosité dans une variable, on peut la récupérer de la manière suivante :

```Ruby
 ma_curiosite = Curiosity.find(3)
````

Cela va d'abord vous afficher la requête SQL faite grâce à Active Record pour récupérer la curiosité qui a l'identifiant `3` en base de données :

```Ruby
Curiosity Load (0.2ms)  SELECT  "curiosities".* FROM "curiosities" WHERE "curiosities"."id" = ? LIMIT 1  [["id", 3]]
````

À la suite de cette ligne, vous pouvez voir l'objet qui représente la curiosité #1 avec tous ses attributs :

```Ruby
#<Curiosity:0x007f9f697791c8
 id: 3,
 name: "Joli mug",
 description: "Recu au Japon, lors d'un congres interlitieres",
 image_url:
  "https://s-media-cache-ak0.pinimg.com/236x/4a/86/bf/4a86bfbf02b472e5b385762b8f267a91.jpg",
 image_text: "Un grand mug de lait pour bien commencer la journee",
 created_at: Sat, 18 Jun 2016 17:54:37 UTC +00:00,
 updated_at: Sat, 18 Jun 2016 17:54:37 UTC +00:00>
 ````

La ligne avec l'identifiant 3 de la table ````Curiosity```` de la base de données a été abstraite dans le modèle (ou classe) ````Curiosity```` de l'application, ce qui donne une instance de ce modèle.

Amusez-vous à créer de nouvelles curiosités dans votre base de données avec ce que vous venez d'apprendre !

Nous allons maintenant quitter la console Rails. Pour cela, tapez "exit" dans la console à partir du terminal.

### Affichage des curiosités dans l'application

Ouvrez le controleur ```app/controllers/home_controller.rb```. Il y a la méthode index qui correspond à vue index.html.erb affichant votre page d'accueil.

Dans cette méthode, vous allez récupérer toutes les curiosités stockées en base de donnée avec le modèle ```Curiosity```:

```Ruby
@my_curiosities = Curiosity.all
````

![Page de base](/images/readme/my_curiosities.png)

Cela définit la variable ```@my_curiosities``` contenant le tableau des objets de la classe ```Curiosity``` contenus en base de données.

> Important : Un objet ```Curiosity``` est composé d'un identifiant (```id```), d'un nom (```name```), d'une description (```description```), d'une url pour une image (```image_url```) et d'un texte relatif à l'image (```image_text```).

Afficher une curiosité dans la console (```rails c```) donnera ceci :

```Ruby
> curiosities = Curiosity.all
> curiosities[0]
=> #<Curiosity:0x007fd37090f920
   id: 3, name: "Joli mug", description: "Recu au Japon, lors d'un congres interlitieres", image_url: "https://s-media-cache-ak0.pinimg.com/236x/4a/86/bf/4a86bfbf02b472e5b385762b8f267a91.jpg", image_text: "Un grand mug de lait pour bien commencer la journee", created_at: Sat, 18 Jun 2016 17:54:37 UTC +00:00, updated_at: Sat, 18 Jun 2016 17:54:37 UTC +00:00>
````

Cette variable d'instance (variable avec un ```@```) est passée du contrôleur à la vue et peut donc etre utilisée dans index.html.erb.

Ouvrez la vue ```app/views/home/index.html.erb``` et modifiez-la pour remplacer le texte de vos curiosités par les données contenues dans chaque objet ```Curiosity```.

> Rappel : Pour interpréter du code Ruby sans rien afficher dans votre page HTML, il faut entourer le code avec ```<%``` et ```%>```. Si vous souhaitez afficher le résultat, il faut l'entourer de ```<%=``` et ```%>```.

Voici des exemples :

```Ruby
<% @cusiosities = Curiosity.all %> # Remplit la variable @curiosities avec toutes les Curiosités
<%= @curiosities[0].name %> # Affiche le nom de la curiosité 0 (la première de la liste) dans la vue
````

Et enfin, pour parcourir le tableau des curiosités, vous pouvez utiliser une boucle ```each``` :

```Ruby
<% @curiosities.each do |curiosity| # Définit le début de la boucle %>
<div>
  <%= curiosity.name # affiche le nom pour chaque élément du tableau %>
</div>
<% end %> # Détermine la fin de la boucle
````

Voici un exemple de liste de curiosités dans la vue ``` app/views/home/index.html.erb ``` :

![Page de base](/images/readme/example_each.png)

Et voici son rendu :

![Page de base](/images/readme/final_view.png)
À vous de jouer !

# Étape 3 : Pour aller plus loin

## Ajouter de nouveaux attributs

Nous aimerions ranger chaque curiosité dans des catégories, une par curiosité. Par exemple :
- le joli mug sera de catégorie ````Vaisselle````
- la bobine de fil sera de catégorie ````Coffre à jouet````
- le super t-shirt sera de catégorie ````Penderie````
- le jeu de société Catopoly sera de catégorie ````Coffre à jouet````
- etc

Pour cela, il faut ajouter un nouvel attribut ````Category```` à la table ````Curiosity```` de la base de données. Pour demander à Ruby On Rails de créer notre nouvelle migration, il faut utiliser le générateur de migrations avec la commande suivante dans le terminal :

```Shell
rails generate migration add_category_to_curiosities category:string
````

Cette commande crée un nouveau fichier de migration dans le dossier ````db```` situé à la racine du dossier de l'application. Ouvrez ce fichier de migration avec votre éditeur de texte.

Le contenu devrait ressembler à cela :

```Ruby
class AddCategoryToCuriosities < ActiveRecord::Migration
  def change
    add_column :curiosities, :category, :string
  end
end
````

Il y a donc la classe ````AddCategoryToCuriosities````, qui "hérite" de ````ActiveRecord::Migration```` (elle sait faire tout ce que sa classe mère sait faire). Dans cette classe-là, on a la méthode ````change```` permettant de faire des modifications sur la base de données.

Dans la méthode ````change````, il y a la ligne ````add_column :curiosities, :type, :string````. ````add_column```` veut dire que l'on demande à ajouter une colonne à une table qui s'appelle ````Curiosities```` (````:curiosities````) et que cette nouvelle colonne s'appelle ````category```` (````:category````) et est de type ````String````.

Le fichier de la migration a été créé, mais n'a pas encore été exécuté. D'ailleurs, si on regarde le fichier ````db/schema.rb````, le numéro de version n'est pas encore celui de cette mirgation : il est encore au numéro de celle d'avant (dans notre exemple ````20160618174815````).

Pour appliquer notre nouvelle migration, nous devons effectuer la commande suivante dans le terminal :
````rake db:migrate````

````rake```` est un outil permettant de lancer des "tâches". Il a une "famille" de tâches "db" pour gérer la base de données, et on souhaite qu'il exécute la tâche ````migrate````.

Cela devrait afficher quelque chose de similaire à :
````
$ rake db:migrate
#== 20160626095924 AddCategoryToCuriosities: migrating #=========================
#-- add_column(:curiosities, :category, :string)
#   -> 0.0029s
#== 20160626095924 AddCategoryToCuriosities: migrated (0.0029s) ================
````
Grace à ce message, on sait que notre migration a été effectuée avec succès. Si on rouvre de nouveau le fichier ````db/schema.rb````, on peut voir que le numéro de version a été mis à jour et que notre nouvelle colonne est bien prise en compte :
```Ruby
  create_table "curiosities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "image_url"
    t.string   "image_text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "category"
  end
````

Revenons dans une console Ruby On Rails pour voir ce qu'il en est de notre instance de classe ````Curiosity````. Tapez ````curiosity = Curiosity.find(3)````

Cela va de nouveau vous afficher la requête que ActiveRecord envoie à la base de données pour récupérer la curiosité #3 :

````
Curiosity Load (0.2ms)  SELECT  "curiosities".* FROM "curiosities" WHERE "curiosities"."id" = ? LIMIT 1  [["id", 3]]
````

Puis, vous pouvez voir l'objet qui représente la curiosité #1 avec tous ses attributs, dont l'attribut ````category````... qui est vide pour le moment :

```Ruby
#<Curiosity:0x007ff36803a300
 id: 1,
 name: "Joli mug",
 description: "Recu au Japon, lors d'un congres interlitieres",
 image_url:
  "https://s-media-cache-ak0.pinimg.com/236x/4a/86/bf/4a86bfbf02b472e5b385762b8f267a91.jpg",
 image_text: "Un grand mug de lait pour bien commencer la journee",
 created_at: Sat, 18 Jun 2016 17:54:37 UTC +00:00,
 updated_at: Sat, 18 Jun 2016 17:54:37 UTC +00:00>,
 category: nil>
 ````

Et voila, une catégorie est associée à votre curiosité !

## Ajout de validations des données

Si vous souhaitez renseigner les catégories de toutes vos curiosités, il serait intéressant de rajouter une validation au niveau du modèle ````Curiosity```` pour que l'attribut ````category```` n'accepte que quelques valeurs. Cela permet d'être sûr de ce qu'il y a en base de données et d'éviter les doublons 'cachés'.

Par exemple, si on veut avoir une catégorie 'Penderie', pour simplifier la recherche sur cette catégorie, on ne veut pas pouvoir créer des curiosités avec la catégorie 'penderie' ou 'pendrie' ou encore 'PenDeRie'. Seule la 'Penderie' sera acceptée comme valeur de l'attribut ````category````.

Aidez-vous de la page 'Validations' du guide Ruby On Rails (http://guides.rubyonrails.org/active_record_validations.html) et ajoutez une validation au niveau de l'attribut ````category```` du modèle ````Curiosity```` pour n'accepter que les valeurs suivantes :
- Penderie
- Coffre à jouets
- Vaisselle
- Décorations
- Amis
- Bibliothèque

# Étape 4 : Enregistrer les modifications sur le répertoire distant

[Enregistrer vos modifications et les envoyer sur votre répertoire Github](https://women-on-rails.github.io/guide/push_project)

# Liens Utiles :
- La documentation de Ruby : http://ruby-doc.org/core-2.3.1/
- La documentation de Ruby On Rails : http://api.rubyonrails.org/
- Modèle - Vue - Controleur : http://fr.slideshare.net/happynoff/rails-king ou www.youtube.com/watch?v=gTBCHu0btn8 ou encore https://fr.wikipedia.org/wiki/Mod%C3%A8le-vue-contr%C3%B4leur
- Active Record : https://fr.wikipedia.org/wiki/Active_record (concept en français) ou http://guides.rubyonrails.org/active_record_basics.html (introduction de Rails, en anglais)
- Comparaison entre Sqlite, MySql et Postgres (EN) : https://www.digitalocean.com/community/tutorials/sqlite-vs-mysql-vs-postgresql-a-comparison-of-relational-database-management-systems
- Les migrations (EN) : http://guides.rubyonrails.org/active_record_migrations.html
- Les validations (EN) : http://guides.rubyonrails.org/active_record_validations.html
