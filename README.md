# GodotLearning

[![Build Status](https://travis-ci.org/votre-utilisateur/votre-projet.svg?branch=master)](https://travis-ci.org/votre-utilisateur/votre-projet)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Mes débuts sur Godot

[Documentation officielle de Godot](https://docs.godotengine.org/en/stable/index.html)

## Installation

Installer Godot avec

```zsh
flatpak install -y flathub org.godotengine.GodotSharp
```

Il il y a aussi un module à télécharger :
<https://github.com/godotengine/FBX2glTF/releases/latest>
[Dernière release de FBX2glTF](https://github.com/godotengine/FBX2glTF/releases/latest)

## En cas de souci "Blender path"

Si vous avez le message :

```debug
modules/gltf/register_types.cpp:73 - Blend file import is enabled in the project settings, but no Blender path is configured in the editor settings. Blend files will not be imported.
```

Ouvrez Godot et allez dans le menu "Editor" (Éditeur).
Sélectionnez "Editor Settings" (Paramètres de l'éditeur) dans le menu déroulant.
Dans la fenêtre des paramètres de l'éditeur, recherchez la section "Import/Export" (Importer/Exporter).
Sous la section "FileSystem/Import", recherchez la catégorie "GLTF" et trouvez le champ "Path to Blender Executable" (Chemin vers l'exécutable de Blender).
Cliquez sur le bouton "..." à côté du champ "Path to Blender Executable" et sélectionnez le chemin vers l'exécutable de Blender sur votre système.
Enregistrez les paramètres de l'éditeur et redémarrez Godot.

## Utilisation

C'est juste mon suivi de l'introduction à Godot depuis leur [section introduction](https://docs.godotengine.org/en/stable/getting_started/introduction/index.html)

Je suis la documentation de l'introduction jusqu'à votre premier jeu 3D.

## Licence

Ce projet est sous licence MIT. Veuillez consulter le fichier [LICENSE](LICENSE) pour plus d'informations.

## Auteurs

- [Harry RICHMOND](https://github.com/RogerBytes)
