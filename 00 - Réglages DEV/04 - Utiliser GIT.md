# Utiliser GIT

Je dois corriger cette doc, il y a 36 fois les mêmes explications !!
Git est un système de contrôle de version qui permet de suivre les modifications apportées à un ensemble de fichiers au fil du temps. Il facilite la collaboration entre les développeurs en permettant de gérer les différentes versions d'un projet et de fusionner les modifications apportées par plusieurs personnes.

GitHub, quant à lui, est une plateforme en ligne basée sur Git qui facilite le partage, la collaboration et l'hébergement de projets Git. Cela permet aux développeurs de travailler ensemble sur des projets, de contribuer aux dépôts existants, de signaler des problèmes ou de demander des fonctionnalités, et de suivre les modifications apportées aux projets via l'interface web conviviale de GitHub.

________________________________________________________

## Utilisation de Git

### Bases de Git

#### Régler Git

Commencez par régler git pour y mettre vos informations :

```bash
git config --global user.email "your_email@example.com"
git config --global user.name "John Doe"
```

Pas besoin de vous connecter à votre compte github, SSH s'en charge déjà.

#### Créer / Transférer / Supprimer / lister les dépôts

Pour créer un depot sur github :

```bash
gh repo create {[org/]repo} --private
# par exemple :
gh repo create MyOrg/test --private
# -> pour un repo public, utiliser --public à la place
```

Pour transférer un repo :
je n'ai pas encore trouvé la commande, il faudra que je créé un snippet, sinon il faut aller sur la page
[Page Transfert de GitHub](https://github.com/#NomDeCompte#/#Repo#/transfer)

Pour supprimer un repo :

```bash
gh repo delete {[org/]repo} --yes
# par exemple :
gh repo delete MyOrg/test
```

Pour lister vos repo :

```bash
gh repo list {[org]}
# -> si vous n'avez pas d'organisation, juste
gh repo list
```

Pour crée une organisation allez sur cette page :
[Page Organisation de GitHub](https://github.com/settings/organizations)

Pour ajouter un collaborateur à votre repo (j'arrive pas à le faire en CLI) :
[https://github.com/ORGANISATION/REPO/settings/access](https://github.com/ORGANISATION/REPO/settings/access)

### Trouve titre

Régler le nom de branche initiale par défaut (pour éviter les avertissements stupides et inutiles)

```bash
git config --global init.defaultBranch master
```

Pour initialiser un repertoire comme dépôt local (en ayant choisi le bon dossier avec cd dans le shell) :

```bash
git init
```

Pour supprimer l'initialisation, il suffit de faire dans le même chemin:

```bash
rm -r .git
```

Pour sélectionner des fichiers :

```bash
git add --all
```

-> le sélecteur sur "-all" sélectionne tous les fichiers et dossiers enfants.

Pour faire une sauvegarde sur git l'on fait un commit, via le système de branche l'on peut tester une nouvelle fonctionnalités, si elle nous plait on peut la merge.

Pour envoyer les fichiers sélectionnés dans la branche actuelle :
git commit -m 'description du changelog'

git branch
permet d'afficher dans quelle branche on se trouve

git branch #nouveau nom#
pour en créer une nouvelle ou
git checkout -b #nouveau nom#

git branch -M #nouveau nom#
pour renommer la branche actuelle

git switch #nom de branche#
ou
git checkout #nom de branche#
Pour changer de branche (apparemment il est plus pertinent d'utiliser checkout, qui a d'autres options)

git merge 'nom de branche'
depuis master

commande unie pour envoyer tout :
git add . && git commit -m 'description du changelog'

Une fois qu'on a un compte github, on peut utiliser un
git push
pour envoyer notre code sur le serveur.

Ensuite ajoutez le gitignore (permet de blacklist du dépôts des fichiers inutiles) :

```bash
curl -o .gitignore https://www.toptal.com/developers/gitignore/api/<type>
# dans le cas du repo avec mes cours vu qu'il s'agit de différents languages web etc, on utilise le type global ->
curl -o .gitignore https://www.toptal.com/developers/gitignore/api/global
# puis re-sauver (prendre l'habitude) avec :
git add .gitignore && git commit -m 'description du changelog'
```

Ensuite on va associer en SSH (plus besoin de taper des identifiants et mdp) ce repo local avec notre repo distant sur github avec

```bash
git remote add origin git@compte/repo.git
# par exemple
git remote add origin git@github.com:RogerBytes-Softworks/MonNouveauProjet.git
```

Si erreur de frappe faire

```bash
git remote remove origin
# revérifier
git remote add origin git@github.com:RogerBytes-Softworks/MonNouveauProjet.git

# suivi de
git push --set-upstream origin master
```

Notez que compte peut être remplacé par votre compte personnel ou celui d'une de vos organisation, ca marche de la même façon.

-> on peut le changer si vous avez "transfer" le repo, une fois cette commande fait, le repo local sera automatiquement réglé pour pull et push depuis le repo distant

Cette commande permet de voir le référentiels des associations du depot local vers un depot distant :

```bash
git remote -v

```

Ensuite pour envoyer vers le repo distant :

```bash
git push
```

Exemple pour créer un nouveau repo local avec plusieurs branches et le référencer sur un nouveau repo distant

je créé le repo distant sur github avec cette commande :

```bash
gh repo create {[org/]repo} --private
par exemple
gh repo create RogerBytes-Softworks/your-repo --private
# là j'ai créé un projet "your-repo" dans mon org mais si je voulais le faire direct sur mon compte perso:
gh repo create your-repo --private
# qui donne par exemple pour un dépôt public (je mets "RogerBytes-Softworks/" devant car je ne veux pas le créer sur mon propre compte mais sur mon organisation "RogerBytes-Softworks") :
gh repo create RogerBytes-Softworks/Portfolio --public
```

Ensuite on va associer en SSH le repo local existant au repo distant existant (plus besoin de taper des identifiants et mdp) ce repo local avec notre repo distant sur github avec

```bash
git remote add origin git@compte/repo.git
# par exemple
git remote add origin git@github.com:RogerBytes-Softworks/MonNouveauProjet.git
```

Si vous vous trompez dans le nom d'org ou de dépôt faites :

```bash
git remote remove origin
# et recommencez le remote add
```

et enfin je peux initialiser le push

```bash
git push --set-upstream origin master
```

les prochains push seront à taper juste comme ça :

```bash
git push
```

Dans le terminal je me déplace dans le dossier où je veux avoir mon dépôt

```bash
cd ~/Documents/dépôts\ git\ distants/mes\ repo
```

je crée le dossier qui sera mon repo avec la branche master :

```bash
mkdir -p Portfolio/master
```

je vais dans mon dossier "Portfolio/master" :

```bash
cd Portfolio/master
# j'initialise mon git local :
git init
```

Ensuite je créé un fichier README en markdown et je le commit :

```bash
echo "# Portfolio" >> README.md && git add --all && git commit -m "first commit"
```

Je créé la branche "beta" au git (master est créé par défaut), git switch #NomDeBranche pour basculer :

```bash
git branch beta
```

ensuite je synchronise le dossier avec mon repo de github en lui ajoutant un référentiel distant :

```bash
git remote add origin git@github.com:RogerBytes-Softworks/Portfolio.git
```

-> c'est à ne faire qu'une seule fois, et si vous clonez le repo depuis une autre machine ou un autre dossier vous n'aurez pas à le faire !

ensuite j'associe ma branche locale master à celle correspondante du référentiel distant :

```bash
git push --set-upstream origin master
```

je change de branche avec

```bash
git switch beta
```

Ensuite j'associe cette 2e branche locale beta à celle correspondante  du référentiel distant, ça la créée automatiquement sur le dépôt distant :

```bash
git push --set-upstream origin beta
```

vu que je suis dans le dossier master je switch à nouveau sur la branche correspondante :

```bash
git switch master
```

je remonte dans mon dossier parent :

```bash
cd ..
# je rentre dans le dossier beta :
cd beta

# je retourne sur la branche master
git switch master

# je remonte dans le dossier parent :
cd ..

```

je clone la branche beta de mon repo dans un dossier qui s'appelle beta :

```bash
git clone -b beta git@github.com:RogerBytes-Softworks/Portfolio.git beta
```

-> les branches correspondantes du projet se trouvent dans leurs dossiers respectifs.

Gestion de projets avec plusieurs branche :
La structure que vous avez décrite est parfaitement valable et bien organisée. Elle suit une approche de création de dossiers distincts pour chaque branche sous le dossier principal du projet, ce qui permet de garder les fichiers spécifiques à chaque branche bien séparés. Voici comment cela fonctionne :

```text
MonProjet/ (dossier principal du projet)
  - master/ (dossier de la branche principale)
    Contient les fichiers spécifiques à la branche principale.
  - feature/
    - branch1/ (dossier de la branche "branch1")
      Contient les fichiers spécifiques à la branche "branch1".
    - branch2/ (dossier de la branche "branch2")
    Contient les fichiers spécifiques à la branche "branch2".
```

Cette structure est facile à comprendre et à naviguer. Elle sépare clairement les fichiers liés à chaque branche, ce qui est utile lorsque vous avez plusieurs branches actives dans votre projet. Assurez-vous de maintenir la cohérence dans votre convention de nommage et de documenter cette structure pour que les membres de l'équipe

## Pour faire un nouveau projet quand tout est réglé

### Je crée un dossier local

```bash
mkdir testGodot
# Et je rentre dedans
cd testGodot
```

### J'initialise un repo local dedans

```bash
git init
```

Je créé un repo distant du même nom sur mon org de github

```bash
gh repo create RogerBytes-Softworks/testGodot --public
```

J'active le remote depuis le repo distant sur le repo local

```bash
git remote add origin git@github.com:RogerBytes-Softworks/testGodot.git
```

On ajoute les premiers fichiers (indispensable pour le remote), comme le README.md par exemple, puis :

```bash
git add --all && git commit -m "First commit"
```

Et on fait le premier push :

```bash
git push --set-upstream origin master
```

Ensuite on utilise les commandes normales

## Ouvrir une page github pour heberger une page web

[https://github.com/#NomUser#ouNomOrg/#NomRepo/settings/pages](https://github.com/#NomUser#ouNomOrg/#NomRepo/settings/pages)

Par exemple pour mon repo "testjeuweb" se trouvant dans mon org "RogerBytes-Softworks"

[https://github.com/RogerBytes-Softworks/testjeuweb/settings/pages](https://github.com/RogerBytes-Softworks/testjeuweb/settings/pages)

Sous branche choisissez laquelle contient votre html (chez moi sur master).
Puis cliquez sur `Save``

Au refresh de page le lien n’apparaît pas immédiatement
il faut une minute ou deux avant que le site soit actualisé/créée

Ca donnera un lien du type
[https://#NomUser#ouNomOrg.github.io/#NomRepo/](https://#NomUser#ouNomOrg.github.io/#NomRepo/)

dans mon cas :
[https://rogerbytes-softworks.github.io/testjeuweb/](https://rogerbytes-softworks.github.io/testjeuweb/)

Attention, github fait un conflit avec node js, pour le résoudre :

```bash
touch .nojekyll
```

Cela va créer un fichier nommé ".nojekyll" à la racine de votre projet, empêchant GitHub de semer la zizanie.
