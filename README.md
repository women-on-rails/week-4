# Préambule

Slides du cours disponibles [ici](http://slides.com/women_on_rails/week-3)

Ce tutoriel a pour objectif de s'essayer à la console Ruby et de comprendre l'utilisation du langage Ruby dans le projet ``` Curiosities```, dans le cadre du cycle 1 des ateliers Women On Rails.

# Étape 1 : Rappels

## Commandes principales

Vous pouvez retrouver les commandes utiles pour le terminal, git et la console Ruby On Rails [ici](https://women-on-rails.github.io/guide/main_commands).

## Découvrir l'univers de Ruby en voyageant sur de bonnes Rails

Regardez l'architecture du projet.
Vous devriez voir plusieurs fichiers et dossiers, dont les principaux :
- ````app```` : Contient principalement les contrôleur, les vues, les modèles et les assets de l'application
- ````config```` : Contient les fichiers de configuration relatifs à l'application
- ````db```` : Contient tout ce qui permet de construire la base de donnée
- ````Gemfile```` : Contient la liste des plug-ins déjà existants qui vont être utilisés dans l'application

Si vous ouvrez le dossier ````app````, vous découvrirez les dossiers suivants:
- contrôleur (````controllers````) : Ils réagissent aux actions des utilisateurs et vont chercher les données dans la base (grâce aux modèles) pour les mettre à disposition des vues.
- modèles (````models````) : Ce sont des objets assurant la gestion des données.
- vues (````views````) : Elles correspondent à la manière d'afficher les informations à l'utilisateur. Il s'agit généralement d'une combinaison de code HTML et de Ruby dans des fichiers .html.erb.
- ````assets```` : Ce sont les images, les morceaux de code javascript et les feuilles de style en CSS utilisés dans les vues.

# Étape 2 : Lire l'exercice et se lancer

Ouvrez votre projet avec Cloud9, ou l'éditeur que vous utilisez si vous avez une installation native.

### S'essayer à la console et manipuler ruby

[Retrouvez les slides du cours](http://slides.com/soniaprevost/womenonrails-week4#/)

Ouvrez une console ruby en tapant ```irb``` dans votre terminal et maintenant passons aux exercices !

1. **Appliquez des méthodes préconstruites sur une variable**

  Déclarez une variable avec une `String` (un texte est une suite de lettres, une "chaîne de caractères", que nous appellerons String) à l'intérieur comme ceci par exemple :
  ``` Console
  hello = 'hello, world!'
  ```

  Trouvez et appliquez *les* méthodes qui vont mettre en majuscule toute la string et la séparer en plusieurs parties.

  Un principe intéressant de ruby, c'est que vous pouvez **enchaîner** vos méthodes. Cela vous permet d'appliquer en une seule ligne toutes les méthodes pour transformer la String. Par exemple : ```hello.upcase.size```.

  N'hésitez pas à chercher dans la doc Ruby toute opération que vous pouvez faire quand vous avez une String à disposition.

  Essayez aussi avec des Integer (nombres entiers).

2. **Utilisez .each sur un array**

  Définissez un `Array` (tableau, ou liste d'éléments) et jouez l'itérateur `.each`.

  Un Array peut se définir de nombreuses façons, par exemple :
  ``` Console
  tableau1 = ["Salut", "apprenties", "développeuses"]

  element1 = 'Bonjour'
  element2 = 'les'
  element3 = 'Rubyistes'
  tableau2 = [element1, element2, element3]
  ```

  Et voici la syntaxe de la boucle **each**
  ``` Console
  tableau1.each do |element|
    # écrire ce que vous voulez faire avec chacun des éléments du tableau
    element.upcase
  end
  ```

  Allez voir dans la doc ruby des Enumerable ce que vous pouvez faire avec toutes les listes (Array entre autres).

3. **Écrivez une méthode et utilisez-là avec différents arguments**

  Une méthode se déclare comme suit. Par exemple pour fusionner deux textes en une phrase :
  ``` Console
  def nom_methode(parameter1, parameter2)
    # écrire ce que la méthode fait, par exemple ici faire une chaîne de caractères qui "joint" les deux Strings avec " et "
    "#{parameter1} et #{parameter2}"
  end
  ```

  Et s'appelle dans la console comme ceci:
  ``` Console
  nom_methode("Découvrir", "s'amuser")

  argument1 = "coder"
  argument2 = "jouer"
  nom_methode(argument1, argument2)
  ```

  Maintenant, imaginez une méthode qui donne la somme de 2 paramètres, si ces paramètres sont entiers.
  ``` Console
  def somme # à vous de définir les paramètres
    # à vous de définir le code
  end
  somme # à vous d'appeler somme avec plusieurs valeurs pour voir si ça marche
  ```

  À votre tour (et n'oubliez pas, Google et StackOverflow sont vos nouveaux meilleurs amis) !

4. **Écrivez une classe avec plusieurs méthodes et créez plusieurs instances de cette classe**

  Imaginez une classe qui définirait les caractéristiques de votre animal préféré (Grumpy cat, non ?).

  Pour rappel, une classe ressemble à cela :
  ``` Console
  class Animal
    def roar
      puts 'Miaougrmphf'
    end
  end
  ```

  Et vous pouvez l'utiliser ainsi :
  ``` Console
  grumpy = Animal.new
  grumpy.roar
  ```

  Amusez-vous à créer plein de méthodes !

### Application au projet Curiosités

Ouvrez votre projet avec Cloud9, ou l'éditeur que vous utilisez si vous avez une installation native.

Si vous utilisez SublimeText, vous pouvez faire subl . dans la console pour ouvrir directement votre projet. (subl c'est SublimeText, l'espace c'est parce que la commande est finie, et le point c'est pour dire "ouvre dans Sublime Text tout le dossier dans lequel je suis, en un coup").

#### Ouvrir le contrôleur et la vue principaux de l'application

Nous allons manipuler deux fichiers dans cet exercice : le contrôleur ````home_controller```` et la seule vue liée à ce contrôleur.
Essayez de les trouver et ouvrez les avec votre éditeur de texte.

Quelques notions :

Ruby On Rails permet d'utiliser au mieux le [protocole HTTP](https://openclassrooms.com/courses/les-requetes-http), sur lequel repose la navigation Web. Il y a 4 types de requêtes principales en HTTP :
- GET (afficher une page),
- POST (créer une nouvelle ressource),
- PUT (pour modifier entièrement la ressource, ou PATCH pour la modifier partiellement),
- DELETE (supprimer une ressource).

Suite à chaque requête, le serveur envoie une réponse.

De plus, il y a 7 actions de base dans chaque contrôleur Rails:
- SHOW : affiche une ressource en particulier
- INDEX : affiche la liste de toutess les ressources d'un meme type
- NEW : affiche le formulaire pour créer une nouvelle ressource
- CREATE : une fois le précédent formulaire complété, crée la ressource
- EDIT : affiche le formulaire d’édition d'une ressource
- UPDATE : met a jour une ressource spécifiée
- DESTROY : supprime une ressource spécifique

Petit indice : Le controlleur ```Home``` n'a que l'action ```index``` et la vue qui nous intéresse pour cet exercice est liée à cete action (elle a le même nom que l'action, et c'est comme ça que Ruby on Rails la retrouve).

#### Modifier la vue et le contrôleur pour afficher des données

Lancez un serveur Rails avec le bouton ```Run Project``` dans votre workspace Cloud9 pour pouvoir visualiser vos changements (ou avec la commande ```rails server``` dans votre terminal si vous avez une installation native). L'url à utiliser dans le navigateur sera indiquée dans le terminal.

![Page de base](/images/readme/vue_navigateur.png)

Pour le moment, tout ce que vous voyez affiché sur votre navigateur (lorsque vous lancez votre serveur et que vous allez sur l'adresse indiquée par votre console) est contenu dans le fichier ```index.html.erb```.

![Page de base](/images/readme/contenu_dans_html.png)

Nous allons changer cela et définir des variables dans la méthode ``` index ``` du contrôleur ```home``` qui contiendront le texte à afficher.

> Important :
> Notez que les variables définies dans le contrôleur sont précédées par le caractère @. Cela veut dire que la variable sera accessible dans la vue liée à la méthode dans laquelle elle est définie.
> Si la variable n'est pas précédée d'un @, elle ne sera accessible que dans le contexte de la méthode ```index```.

![Page de base](/images/readme/contenu_dans_variable.png)

Appliquez cela à votre propre application puis rechargez la page du navigateur.
Normalement, l'affichage ne devrait pas avoir changé car le contrôleur communique les variables et leur contenu à la vue ```index.html.erb```.

Maintenant, définissons une variable locale (variable non précédée du caractère @) dans notre méthode ```index``` et utilisons la dans la vue ```index.html.erb```.

![Page de base](/images/readme/avec_variable_non_propagée.png)

Rechargez la page de votre navigateur. Vous devriez avoir une erreur qui s'affiche. La variable définie sans @ étant accessible seulement dans le contexte de la méthode ```index``` du contrôleur ```home```, elle n'est pas reconnue par la vue ```index.html.erb```.

![Page de base](/images/readme/erreur.png)

Enlevez la variable problématique dans la vue et dans le contrôleur.

#### Manipuler des objets dans le contrôleur

Retournez dans le contrôleur ```home``` et définissez un tableau de chaines de caractères dans la méthode ```index```.

![Page de base](/images/readme/variable_tableau.png)

Puis, affichez les éléments de votre tableau dans la vue ```index.html.erb``` en utilisant une boucle ```each```.

![Page de base](/images/readme/html_avec_boucle.png)

Rafraichissez la page de votre navigateur et voila ! Vous avez les éléments contenus dans votre tableau qui s'affichent à l'écran.

![Page de base](/images/readme/vue_avec_tableau.png)

Pour aller plus loin, vous pouvez créer une nouvelle classe et remplacer le tableau de chaines de caractères par un tableau contenant plusieurs instances de cette classe. Dans la vue, vous pourriez afficher un attribut de chacune des instances du tableau.

### Lancer le serveur sur lequel va tourner l'application

En premier lieu, vérifiez que votre application a tous les plug-ins qu'elle utilise à disposition : vous pouvez les installer automatiquement en faisant la commande ````bundle install```` dans votre console, à l'intérieur du dossier de votre projet ````week-4````.

Si un problème survient au niveau de la version de ruby, vous devriez avoir besoin d'effectuer la commande ````rbenv install 2.3.1```` dans la console pour installer la version de ruby dont l'application a besoin.
(Si rbenv ne connait pas cette version, utilisez la commande ````brew update && brew upgrade ruby-build```` avant)
Puis, installez bundler pour cette version avec la commande ````gem install bundle````. Et enfin, faites un ````bundle update````pour mettre a jour vos plug-ins.

Pour lancer un serveur Ruby On Rails, vous devez faire la commande ````rails server```` (ou ````rails s````) toujours dans votre console.
Et voila, votre serveur est lancé !

### Visualiser l'application sur le navigateur

Apres avoir lancé votre serveur, vous pourrez ouvrir votre navigateur pour y coller l'URL suivante : http://localhost:3000/
Vous devriez visualiser le contenu de la vue que vous avez ouverte précédement.
Apres avoir fait des modifications sur cette vue, vous n'aurez qu'à recharger la page du navigateur pour voir vos modifications apparaître. (rafraichir: ````F5```` ou ````CTRL + R```` sous windows, ````CMD + R```` sous mac)

# Étape 3 : Enregistrer les modifications sur le répertoire distant

[Enregistrer vos modifications et les envoyer sur votre répertoire Github](https://women-on-rails.github.io/guide/push_project)

# Pour aller plus loin :
- Le protocole HTTP : https://openclassrooms.com/courses/les-requetes-http
- Les actions CRUD : https://fr.wikipedia.org/wiki/CRUD
- La documentation officielle de Ruby On Rails : http://guides.rubyonrails.org/
- En savoir plus sur les controleurs : http://guides.rubyonrails.org/action_controller_overview.html ou
- Les conditions : https://www.grafikart.fr/formations/apprendre-ruby/conditions
- Les boucles : https://www.grafikart.fr/formations/apprendre-ruby/loops
- Les méthodes : https://www.grafikart.fr/formations/apprendre-ruby/method
- Les classes et instances : https://www.grafikart.fr/formations/apprendre-ruby/poo-objet
- Tableaux, hashes et symboles : https://www.grafikart.fr/formations/apprendre-ruby/array-hash ou https://zestedesavoir.com/tutoriels/634/une-introduction-a-ruby/497_les-bases/2490_les-tableaux/
- Les booléens : http://www.tonyryudev.com/joomla3/index.php/menu-mes-developpements/menu-cours-ruby-rgss/4-ruby-cours-n-3-les-booleens-et-les-calculs-logiques