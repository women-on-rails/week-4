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

Ouvrez votre projet week-3 avec l'éditeur que vous utilisez. 
Si vous utilisez SublimeText, vous pouvez faire ````subl .```` dans la console pour ouvrir directement votre projet. 
(````subl```` c'est SublimeText, l'espace c'est parce que la commande est finie, et le point c'est pour dire "ouvre dans Sublime Text tout le dossier dans lequel je suis, en un coup").

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

