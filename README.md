# GodotLearning

[![Build Status](https://travis-ci.org/votre-utilisateur/votre-projet.svg?branch=master)](https://travis-ci.org/votre-utilisateur/votre-projet)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Mes débuts sur Godot

[Documentation officielle de Godot](https://docs.godotengine.org/en/stable/index.html)

## Installation

Installer Godot avec

En One-Line :

Version normale à jour :

```zsh
wget $(curl -s https://api.github.com/repos/godotengine/godot/releases/latest | grep "browser_download_url.*stable_linux.x86_64.zip" | cut -d : -f 2,3 | tr -d \") && unzip "Godot*.zip" && rm Godot*.zip && mkdir -p .godot && mv *.x86_64 .godot/ && find ~/ -maxdepth 1 -type d -name "Godot*" -exec mv {} ~/.godot/ \; && mv .godot/*.x86_64 .godot/godot.x86_64 && timeout 1s .godot/godot.x86_64 ; echo "Error messages intented" ; sudo sh -c 'echo "#!/bin/sh\n\nUSER_NAME=\$(whoami)\nDATA_DIRECTORY=/home/\$USER_NAME/.godot\nBINARY_FILE=/home/\$USER_NAME/.godot/godot.x86_64\ncd \$DATA_DIRECTORY\nexec \$BINARY_FILE \"\$@\"" > /usr/bin/godot && sudo chmod +x /usr/bin/godot' ; sudo sh -c 'echo "[Desktop Entry]\nVersion=1.0\nType=Application\nName=Godot\nComment=Game Engine\nExec=godot\nIcon=godot\nTerminal=false\nCategories=Game;Development;" > /usr/share/applications/godot.desktop && sudo chmod +x /usr/share/applications/godot.desktop' ; sudo update-desktop-database
```

Version dotnet à jour :

```zsh
sudo apt install -y dotnet-sdk-7.0 && wget $(curl -s https://api.github.com/repos/godotengine/godot/releases/latest | grep "browser_download_url.*stable_mono_linux_x86_64.zip" | cut -d : -f 2,3 | tr -d \") && unzip "Godot*.zip" && rm Godot*.zip && find ~/ -maxdepth 1 -type d -name "Godot*" -exec mv {} ~/.godot/ \; && mv .godot/*.x86_64 .godot/godot.x86_64 && timeout 1s .godot/godot.x86_64 ; echo "Error messages intented" ; sudo sh -c 'echo "#!/bin/sh\n\nUSER_NAME=\$(whoami)\nDATA_DIRECTORY=/home/\$USER_NAME/.godot\nBINARY_FILE=/home/\$USER_NAME/.godot/godot.x86_64\ncd \$DATA_DIRECTORY\nexec \$BINARY_FILE \"\$@\"" > /usr/bin/godot && sudo chmod +x /usr/bin/godot' ; sudo sh -c 'echo "[Desktop Entry]\nVersion=1.0\nType=Application\nName=Godot\nComment=Game Engine\nExec=godot\nIcon=godot\nTerminal=false\nCategories=Game;Development;" > /usr/share/applications/godot.desktop && sudo chmod +x /usr/share/applications/godot.desktop' ; sudo update-desktop-database
```

et le module FBX2glTF

```zsh
wget $(curl -s https://api.github.com/repos/godotengine/FBX2glTF/releases/latest | grep "browser_download_url.*linux-x86_64.zip" | cut -d : -f 2,3 | tr -d \") && unzip "FBX2glTF*.zip" && rm FBX2glTF*.zip && mv  FBX2glTF-linux-x86_64/FBX2glTF-linux-x86_64 .godot && rm -r FBX2glTF-linux-x86_64
```

Ou en détail :

1 dépendances :
Requis (pour la version dotnet) :
SDK Dotnet

Pour installer dotnet via un gestionnaire de paquet :
Chercher la dernière version du SDK avec la commande

```zsh
nala search dotnet-sdk
```

ensuite installer la dernière version du SDK avec:

```zsh
sudo nala install -y dotnet-sdk-7.0
```

ou

```zsh
sudo apt install -y dotnet-sdk-7.0
```

Pour vérifier l'installation :

```zsh
dotnet --list-sdks
# ou
dotnet --info
```

----------------------------------------------------

2 Installer Godot :

Télécharger la dernière version DotNet

```zsh
wget $(curl -s https://api.github.com/repos/godotengine/godot/releases/latest | grep "browser_download_url.*stable_mono_linux_x86_64.zip" | cut -d : -f 2,3 | tr -d \")
```

Télécharger la dernière version normale

```zsh
wget $(curl -s https://api.github.com/repos/godotengine/godot/releases/latest | grep "browser_download_url.*stable_linux.x86_64.zip" | cut -d : -f 2,3 | tr -d \")
#suivi direct de
unzip "Godot*.zip"
rm Godot*.zip
mkdir -p .godot
mv *.x86_64 .godot/
# et passer à #renommer l'executable en godot.x86_64
```

Décompression

```zsh
unzip "Godot*.zip"
```

Supprimer le fichier zip

```zsh
rm Godot*.zip
```

Renommer le dossier en ".godot"

```zsh
find ~/ -maxdepth 1 -type d -name "Godot*" -exec mv {} ~/.godot/ \;
```

Renommer l'executable en godot.x86_64

```zsh
mv .godot/*.x86_64 .godot/godot.x86_64
```

Le lancer une première fois pour l'initialiser :

```zsh
timeout 1s .godot/godot.x86_64
```

Créer l'executable "godot" (avec des chemins relatifs) dans `/usr/bin/` :

```zsh
sudo sh -c 'echo "#!/bin/sh\n\nUSER_NAME=\$(whoami)\nDATA_DIRECTORY=/home/\$USER_NAME/.godot\nBINARY_FILE=/home/\$USER_NAME/.godot/godot.x86_64\ncd \$DATA_DIRECTORY\nexec \$BINARY_FILE \"\$@\"" > /usr/bin/godot && sudo chmod +x /usr/bin/godot'
#Attention si on le relance depuis la même instance du shell, le whoami ne marchera pas (le whoami ira chercher root au lieu du nom d'utilisateur !
```

Le lanceur godot.desktop à faire dans `/usr/share/applications`

```zsh
sudo sh -c 'echo "[Desktop Entry]\nVersion=1.0\nType=Application\nName=Godot\nComment=Game Engine\nExec=godot\nIcon=godot\nTerminal=false\nCategories=Game;Development;" > /usr/share/applications/godot.desktop && sudo chmod +x /usr/share/applications/godot.desktop'

```

Rafraîchir la liste dans `/usr/share/applications`

```zsh
sudo update-desktop-database

```

Il y a aussi un module à télécharger :

En One-Line :

```zsh
wget $(curl -s https://api.github.com/repos/godotengine/FBX2glTF/releases/latest | grep "browser_download_url.*linux-x86_64.zip" | cut -d : -f 2,3 | tr -d \") && unzip "FBX2glTF*.zip" && rm FBX2glTF*.zip && mv  FBX2glTF-linux-x86_64/FBX2glTF-linux-x86_64 .godot && rm -r FBX2glTF-linux-x86_64
```

ou

[Dernière release de FBX2glTF](https://github.com/godotengine/FBX2glTF/releases/latest)

ou le télécharger direct en wget (la dernière version)

```zsh
wget $(curl -s https://api.github.com/repos/godotengine/FBX2glTF/releases/latest | grep "browser_download_url.*linux-x86_64.zip" | cut -d : -f 2,3 | tr -d \")
```

Puis le décompresser :

```zsh
unzip "FBX2glTF*.zip"
```

Supprimer le fichier zip

```zsh
rm FBX2glTF*.zip
```

Ajouter le module dans le répertoire de godot (.godot) et supprimer le dossier :

```zsh
mv  FBX2glTF-linux-x86_64/FBX2glTF-linux-x86_64 .godot
rm -r FBX2glTF-linux-x86_64
```

## Désinstaller

En One-Line :

```zsh
rm -r .godot && sudo rm /usr/bin/godot && sudo rm /usr/share/applications/godot.desktop && sudo update-desktop-database
```

ou

```zsh
sudo rm -r ~/.godot
sudo rm /usr/bin/godot
sudo rm /usr/share/applications/godot.desktop
sudo update-desktop-database
```

## En cas de souci "Blender path"

Si vous avez le message :

```zsh
modules/gltf/register_types.cpp:73 - Blend file import is enabled in the project settings, but no Blender path is configured in the editor settings. Blend files will not be imported.
``````

Ouvrez Godot et allez dans le menu "Editor/Editor Settings..." (Éditeur).

Dans "FileSystem/Import"

Blender path : "/usr/bin/"
FBX2glTF path : "/home/YOUR_USERNAME/.godot/FBX2glTF-linux-x86_64"

Puis cliquez sur "Close"

Enregistrez les paramètres de l'éditeur et redémarrez Godot.

## Utilisation

C'est juste mon suivi de l'introduction à Godot depuis leur [section introduction](https://docs.godotengine.org/en/stable/getting_started/introduction/index.html)

Je suis la documentation de l'introduction jusqu'à votre premier jeu 3D.

## Licence

Ce projet est sous licence MIT. Veuillez consulter le fichier [LICENSE](LICENSE) pour plus d'informations.

## Auteurs

- [Harry RICHMOND](https://github.com/RogerBytes)
