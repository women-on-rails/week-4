# Étape 1 : Récuperer le projet week-4

Ouvrez une console et entrez dans votre répertoire de travail (aidez vous des commandes ````cd```` (Changement de Dossier) et ````ls```` (LiSte des fichiers)).
Créez un nouveau dossier de travail (````mkdir```` : MaKe DIRectory):
``` Console
mkdir week-4
````

Entrez dans ce dossier:
``` Console
cd week-4
````

Initialisez GIT pour votre projet:
``` Console
git init
````
Vous allez maintenant lier votre répertoire ````week-4```` situé sur votre ordinateur avec un répertoire distant week-4 situé sur votre compte github. Le lien sera appelé ````origin````.
Pour cela, créez un nouveau répertoire appelé ````week-4```` sur Github et copiez l'url de ce répertoire.
Puis, faites la commande suivante, en remplaçant (votre compte) dans cette adresse par votre compte :
``` Console
git remote add origin git@github.com:(votre compte)/week-4.git
````
Cela vous permet de synchroniser votre compte github avec les modifications que vous ferez sur le projet week-4 sur votre ordinateur.

À cette étape, si vous faites ````ls```` dans votre console, le dossier ````week-4```` doit être vide.
Et si vous faites ````ls -a```` le dossier ````week-4```` ne contient que les fichiers de configuration de git, dans le dossier caché ````.git````.

Maintenant, vous allez lier votre répertoire ````week-4```` situé sur votre ordinateur avec le répertoire distant ````week-4```` situé sur le compte des Women On Rails. Le lien sera appelé ````upstream````. 
Pour cela, faites la commande suivante :
``` Console
git remote add upstream git@github.com:women-on-rails/week-4.git
````
Cela va vous permettre de récupérer facilement le code existant nécessaire pour la suite de l'exercice. 

Pour récupérer ce code, faites la commande suivante :
``` Console
git pull upstream master
````

Cela remplit le dossier ````week-4```` sur votre ordinateur avec tout ce que contient le projet ````week-4```` sur le compte Github des Women On Rails. 
En faisant un ````ls````, vous pourrez voir la liste des fichiers copiés. 

Vous voila prête pour l'exercice !

# Étape 2 : Lire l'exercice et se lancer

### S'essayer à la console


### Application au projet Curiosités

Ouvrez votre projet week-4 avec l'éditeur que vous utilisez.
Si vous utilisez SublimeText, vous pouvez faire ````subl .```` dans la console pour ouvrir directement votre projet. 
(````subl```` c'est SublimeText, l'espace c'est parce que la commande est finie, et le point c'est pour dire "ouvre dans Sublime Text tout le dossier dans lequel je suis, en un coup").

Ouvrez le controleur ````curiosities_controller````. Il y a la méthode ````index```` qui correspond à vue ````index.html.erb```` affichant la liste des curiosités.

Dans cette méthode, vous allez récupérer toutes les curiosités stockées en base de donnée avec le modèle ````Curiosity````:

```Ruby
@curiosities = Curiosity.all
````

Cela définie la variable ````curiosities```` contenant le tableau des objets ````Curiosity```` contenus en base de donnée.

> Important :
> Un objet ````Curiosity```` est composé d'un identifiant (````id````), d'un nom (````name````), d'une description (````description````), d'une url pour une image (````image_url````) et d'un texte relatif à l'image (````image_text````).

Afficher une curiosité dans la console (````rails c````) donnera ceci :
``` Ruby
> curiosities = Curiosity.all
> curiosities[0]
=> #<Curiosity:0x007fd37090f920
 id: 1,
 name: "Joli mug",
 description: "Reçu au Japon, lors d'un congrès interlitières",
 image_url:
  "https://s-media-cache-ak0.pinimg.com/236x/4a/86/bf/4a86bfbf02b472e5b385762b8f267a91.jpg",
 image_text: "Un grand mug de lait pour bien commencer la journée",
 created_at: Sat, 18 Jun 2016 17:54:37 UTC +00:00,
 updated_at: Sat, 18 Jun 2016 17:54:37 UTC +00:00>
````

Cette variable est passée du controleur à la vue et peut donc etre utilisée dans ````index.html.erb````.

Ouvrez la vue ````index.html.erb```` et modifiez la pour remplacer le texte de vos curiosités par les données contenues dans chaque objet ````Curiosity````.

Pour injecter et interpréter du code Ruby dans une page HTML, il faut l'entourer de ````<%```` et ````%>````.
Si vous souhaitez afficher une valeur, il faut l'entourer de ````<%=```` et ````%>````.

Voici des exemples :

``` Ruby
 <% @cusiosities = Curiosity.all %> # Définie une variable 
 <%= @curiosities[0].name %> # Affiche le nom de la curiosité 0 dans la vue
````

Et enfin, pour parcourir le tableau des curiosités, vous pouvez utiliser une boucle ````each```` : 
``` Ruby
<% @curiosities.each do |curiosity| %> # Définie le début de la boucle => affiche le nom pour chaque élément du tableau
 <div> 
   <%= @curiosity.name
 </div>
<%= end %> # Détermine la fin de la boucle
````

À vous de jouer !

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
Apres avoir fait des modifications sur cette vue, vous n'aurez qu'à recharger la page du navigateur pour voir vos modifications apparaître. (rafraichir: F5 ou ````CTRL + R```` sous windows, ````CMD + R```` sous mac)

# Étape 3 : Enregistrer les modifications sur le répertoire distant

Lorsque vous avez fait des modifications dans votre projet ````week-4````, vous pouvez avoir besoin de les enregistrer pour ne pas les effacer malencontreusement. Pour cela, vous allez les ````commit```` (par abus de langage en français "commiter") : sauvegarder l'ensemble des modifications, pas pour votre éditeur de texte, mais pour git. 

Pour voir les différences entre ce que vous avez en ce moment dans les fichiers et ce que git a compris "depuis la dernière sauvegarde", vous pouvez lancer la commande suivante :
``` Console
git status
````
Vous verrez ce qui n'est pas encore "dans git", en rouge.

Pour committer ces changements, vous devez d'abord les ajouter aux modifications à prendre en compte avec la commande :
``` Console
git add .
````

Si vous souhaitez ne prendre en compte que certaines modifications et pas d'autres, vous pouvez utiliser la commande :
``` Console
git add -p 
````
Cela vous permettra de visualier chaque modification et de l'ajouter (````y````) ou non (````n````). 

Quand vous aurez ajouté ce que vous voulez, vous pouvez à nouveau lancer la commande :
``` Console
git status
````
Vous verrez ce qui n'est pas dans votre commit en rouge, et ce qui sera ajouté dans le prochain commit en vert.

Pour "vraiment" enregistrer les modifications "en vert", il faut faire la commande :
``` Console
git commit 
````

Il est vraiment pratique de décrire le contenu de votre commit, pour vous ou pour les autres.
Vous pouvez y ajouter un message avec l'option ````-m```` suivie du message :
``` Console
git commit -m "ce commit sert à faire ceci"
````
Cela permet de savoir rapidement à quoi correspond le commit, au lieu de regarder sa composition. 

Pour envoyer votre commit vers votre repertoire distant (sur Github), vous devez ensuite utiliser la commande ````push````:
```Console
git push 
````

Allez voir sur github, vos modifications apparaitront :)

# Pour aller plus loin :
- En savoir plus sur les controleurs : http://guides.rubyonrails.org/action_controller_overview.html ou
- Les conditions : https://www.grafikart.fr/formations/apprendre-ruby/conditions
- Les boucles : https://www.grafikart.fr/formations/apprendre-ruby/loops
- Les méthodes : https://www.grafikart.fr/formations/apprendre-ruby/method
- Les classes et instances : https://www.grafikart.fr/formations/apprendre-ruby/poo-objet
- Tableaux, hashes et symboles : https://www.grafikart.fr/formations/apprendre-ruby/array-hash ou https://zestedesavoir.com/tutoriels/634/une-introduction-a-ruby/497_les-bases/2490_les-tableaux/
- Les booléens : http://www.tonyryudev.com/joomla3/index.php/menu-mes-developpements/menu-cours-ruby-rgss/4-ruby-cours-n-3-les-booleens-et-les-calculs-logiques
