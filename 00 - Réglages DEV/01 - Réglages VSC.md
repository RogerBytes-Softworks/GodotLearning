# Réglages de VSC

## Changer le thème

Pour changer le thème des icônes et le theme de l'IDE
`Fichier/Préférences/Thème d'icône de fichier`
et
`Fichier/Préférences/Thème de couleur`

Pour un commentaire multilignes `CTRL+SHIFT+A`
Pour un commentaire monoligne `CTRL+SHIFT+:`

Appuyez sur `Ctrl + ,`  pour ouvrir le panneau des paramètres.
Vous pouvez éditer manuellement le fichier .json en cliquant sur l’icône de roue dentée en haut à droite
vous pouvez aller direct dans le dossier où se trouve le dossier de réglages avec :
`~/.config/VSCodium/User`
et ouvrir le "settings.json"
cliquez sur "Modifier dans settings.json" pour accéder au fichier de configuration des paramètres.

Dans le fichier settings.json, remplacez le contenu  :

```json
{
  "editor.matchBrackets": "never",
  "editor.inlayHints.enabled": "off",
  "workbench.colorCustomizations": {
    "editor.lineHighlightBackground": "#1073cf2d",
    "editor.lineHighlightBorder": "#9fced11f"
  },
  "editor.wordWrap": "on",
  "diffEditor.wordWrap": "on",
  "editor.guides.indentation": false,
  "editor.guides.bracketPairs": false,
  "bracketPairColorizer.depreciation-notice": false,
  "redhat.telemetry.enabled": true,
  "security.workspace.trust.untrustedFiles": "newWindow",
  "terminal.integrated.fontFamily": "MesloLGS NF",
  "terminal.integrated.fontSize": 14,
  "terminal.integrated.fontWeightBold": "bold",
  "terminal.explorerKind": "external",
  "terminal.external.linuxExec": "tilix",
  "terminal.integrated.inheritEnv": true,
  "editor.tabSize": 2,
  "cSpell.language": "en,fr,lorem",
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.formatOnSave": true,
  "terminal.integrated.sendKeybindingsToShell": true,
  "workbench.productIconTheme": "material-product-icons",
  "workbench.colorTheme": "Mint-L-Dark-Blue",
  "workbench.iconTheme": "material-icon-theme",
  "files.autoSave": "afterDelay"
}
```

Pour changer les raccourcis clavier :
`CTRL+K` puis `CTRL+S`

Pour bind l'affichage de la barre tout à gauche, recherchez:
`barre d'activités`
Et modifier le bind de "Afficher: Activer/désactiver la visibilité de la barre d'activités"
Mettez `CTRL+B`

et mettez `CTRL+Alt+B` pour la barre latérale

Les raccourcis
`CTRL + B`
Pour afficher masque la barre principale des outils (la barre d'activité)

`CTRL + J` -> le panneau (avec le terminal)

Pour télécharger les extensions manuellement
Depuis le market place :
[https://marketplace.visualstudio.com/VSCode](https://marketplace.visualstudio.com/VSCode)

Par exemple pour console ninja :
[https://marketplace.visualstudio.com/items?itemName=WallabyJs.console-ninja](https://marketplace.visualstudio.com/items?itemName=WallabyJs.console-ninja)
Cliquer sur le bouton "Download Extension"

Dans la section Extensions, cliquer sur "..." (plus d'options) en haut à droite.
Sélectionner "Installer à partir de VSIX" dans le menu déroulant.
Navigue jusqu'à l'emplacement du fichier VSIX que tu souhaites installer et sélectionne-le.
L'extension sera installée et prête à être utilisée dans Codium.

Réglage du spell checker, en bas quand il souligne plein de truc cliquer sur "spell" dans la barre d'état et dans le dock "workspace" "user" "ficher" etc cocher "anglais" et "français" ainsi que "lorem"

Les extensions qui foutent la merde à désinstaller
spell right - ban.spellright
MySQL - cweijan.vscode-mysql-client2

les extensions à rajouter
SQLTools MySQL/MariaDB - mtxr.sqltools-driver-mysql
Material Product Icons - PKief.material-product-icons

Petit infos sur le preview des fichiers markdown (grâce à l'extension preview markdown enhanced)
il y a menu burger dans la fenêtre de preview, en bas à droite. dans le bas du menu il y a l'option pour changer les thèmes

Certaines combinaisons de touches ne vont pas au terminal par défaut. À la place, elles sont gérées par VSCodium.
Ouvre les paramètres sur
@id:terminal.integrated.commandsToSkipShell,terminal.integrated.sendKeybindingsToShell,terminal.integrated.allowChords
