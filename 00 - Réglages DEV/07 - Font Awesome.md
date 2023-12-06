# Font Awesome

C'est une extension très pratique pour ajouter des icônes dans mon body, via des iframe.

Rechercher les icônes sur
[Font Awesome Free](https://fontawesome.com/search?o=r&m=free)

Alternative pour les svg
[SvgRepo](https://www.svgrepo.com/collections/)

Un autre dédié aux icônes de languages de programmation
[DevIcon](https://devicon.dev)

Tuto basé sur [Doc de Font Awesome](https://fontawesome.com/docs/web/setup/packages)

## Installation

A la racine du projet, lancer

```bash
npm install --save @fortawesome/fontawesome-free
```

Ne pas oublier de mettre le stylesheet dans le head

```bash
<link rel="stylesheet" href="./node_modules/@fortawesome/fontawesome-free/css/all.min.css">
```

## Utilisation

Dans le CSS

```css
/* font-awesome est une police d'écriture, donc pour changer la tailler des icônes, on utilise "font-size" et color pour sa couleur */
font-size: 100px;
color: green;
/* width et height changeront la taille de l'image, et du svg (attention par défaut les svg de font-awesome ont un attribut "heigh" qui aura la priorité) */
width : 200px;
height: 200px;
/* fill est une propriété unique aux svg et conditionne leur couleur de remplissage */
fill: aqua;
/* on notera que le svg importé par une balise "img" n'est pas affecté par "fill" */
```
