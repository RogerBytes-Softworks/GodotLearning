# Utilisation de Godot

[![Build Status](https://travis-ci.org/votre-utilisateur/votre-projet.svg?branch=master)](https://travis-ci.org/votre-utilisateur/votre-projet)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Mes débuts sur Godot

[Documentation officielle de Godot](https://docs.godotengine.org/en/stable/index.html)

## Installation OneLine

Version normale à jour (FBX2glTF inclus) :

```bash
wget $(curl -s https://api.github.com/repos/godotengine/godot/releases/latest | grep "browser_download_url.*stable_linux.x86_64.zip" | cut -d : -f 2,3 | tr -d \") && unzip "Godot*.zip" && rm Godot*.zip && mkdir -p .godot && mv *.x86_64 .godot/ && find ~/ -maxdepth 1 -type d -name "Godot*" -exec mv {} ~/.godot/ \; && mv .godot/*.x86_64 .godot/godot.x86_64 && timeout 1s .godot/godot.x86_64 ; echo "Error messages intented" ; sudo sh -c 'echo "#!/bin/sh\n\nUSER_NAME=\$(whoami)\nDATA_DIRECTORY=/home/\$USER_NAME/.godot\nBINARY_FILE=/home/\$USER_NAME/.godot/godot.x86_64\ncd \$DATA_DIRECTORY\nexec \$BINARY_FILE \"\$@\"" > /usr/bin/godot && sudo chmod +x /usr/bin/godot' ; sudo sh -c 'echo "[Desktop Entry]\nVersion=1.0\nType=Application\nName=Godot\nComment=Game Engine\nExec=godot\nIcon=godot\nTerminal=false\nCategories=Game;Development;" > /usr/share/applications/godot.desktop && sudo chmod +x /usr/share/applications/godot.desktop' ; sudo update-desktop-database && wget $(curl -s https://api.github.com/repos/godotengine/FBX2glTF/releases/latest | grep "browser_download_url.*linux-x86_64.zip" | cut -d : -f 2,3 | tr -d \") && unzip "FBX2glTF*.zip" && rm FBX2glTF*.zip && mv  FBX2glTF-linux-x86_64/FBX2glTF-linux-x86_64 .godot && rm -r FBX2glTF-linux-x86_64
```

Version C# à jour (FBX2glTF inclus) :

```bash
sudo apt install -y dotnet-sdk-7.0 && wget $(curl -s https://api.github.com/repos/godotengine/godot/releases/latest | grep "browser_download_url.*stable_mono_linux_x86_64.zip" | cut -d : -f 2,3 | tr -d \") && unzip "Godot*.zip" && rm Godot*.zip && find ~/ -maxdepth 1 -type d -name "Godot*" -exec mv {} ~/.godot/ \; && mv .godot/*.x86_64 .godot/godot-dotnet.x86_64 && timeout 1s .godot/godot-dotnet.x86_64 ; echo "Error messages intented" ; sudo sh -c 'echo "#!/bin/sh\n\nUSER_NAME=\$(whoami)\nDATA_DIRECTORY=/home/\$USER_NAME/.godot\nBINARY_FILE=/home/\$USER_NAME/.godot/godot-dotnet.x86_64\ncd \$DATA_DIRECTORY\nexec \$BINARY_FILE \"\$@\"" > /usr/bin/godot-dotnet && sudo chmod +x /usr/bin/godot-dotnet' ; sudo sh -c 'echo "[Desktop Entry]\nVersion=1.0\nType=Application\nName=Godot C#\nComment=Game Engine\nExec=godot-dotnet\nIcon=godot\nTerminal=false\nCategories=Game;Development;" > /usr/share/applications/godot-dotnet.desktop && sudo chmod +x /usr/share/applications/godot-dotnet.desktop' ; sudo update-desktop-database && wget $(curl -s https://api.github.com/repos/godotengine/FBX2glTF/releases/latest | grep "browser_download_url.*linux-x86_64.zip" | cut -d : -f 2,3 | tr -d \") && unzip "FBX2glTF*.zip" && rm FBX2glTF*.zip && mv  FBX2glTF-linux-x86_64/FBX2glTF-linux-x86_64 .godot && rm -r FBX2glTF-linux-x86_64
```

## Désinstallation OneLine

Version normale à jour (FBX2glTF inclus) :

```bash
rm -r .godot && sudo rm /usr/bin/godot && sudo rm /usr/share/applications/godot.desktop && sudo update-desktop-database
```

Version C# à jour (FBX2glTF inclus) :

```bash
rm -r .godot && sudo rm /usr/bin/godot-dotnet && sudo rm /usr/share/applications/godot-dotnet.desktop && sudo update-desktop-database
```

## Réglages de Godot

Juste mes réglages perso pour ma version modifiée de linux mint, notez bien à faire "Editors/Editors Settings.../FileSystem/Import/"

Editors/Editors Settings.../Interface/Theme
Preset : Custom
Icon and Font Color : Light
Base Color : 383838
Accent Color : 596eb5

Editors/Editors Settings.../FileSystem/External Programs/
Raster Image Editor : /usr/bin/gimp
Vector Image Editor : /usr/bin/inkscape
Audio Editor : /usr/bin/ardour #ou /usr/bin/audacity
3D Model Editor : /usr/bin/blender

Editors/Editors Settings.../FileSystem/Directories/
Autoscan Project Path : #par défaut#
Default Project Path : /home/#Votre nom d'utilisateur#/Local/Git

Editors/Editors Settings.../FileSystem/On Save/
Compress Binary Resources : #par défaut#
Safe Save on Backup the Rename : #par défaut#

Editors/Editors Settings.../FileSystem/File Dialog/
Show Hidden Files : #par défaut ou cochez l'option#
Display Mode : #par défaut ou List#
Thumbnail Size : #par défaut#

Editors/Editors Settings.../FileSystem/File Server/
Port : #par défaut#
Password : #par défaut ou mettez un mdp#

Editors/Editors Settings.../FileSystem/Import/
RPC Port : #par défaut#
RPC Server Uptime : #par défaut#
Blender 3 Path : /usr/bin/
FBX
FBX2glTF Path : /home/#Votre nom d'utilisateur#/.godot/FBX2glTF-linux-x86_64

Editors/Editors Settings.../Export/Android

Editors/Editors Settings.../Export/macOS

Editors/Editors Settings.../Export/Web

Editors/Editors Settings.../Export/Windows

Editors/Editors Settings.../Export/SSH

Editors/Editors Settings.../Dotnet/Editor

Editors/Editors Settings.../Dotnet/Build

## Installation détaillée

Requis (pour la version dotnet) :
SDK Dotnet

Pour installer dotnet via un gestionnaire de paquet :
Chercher la dernière version du SDK avec la commande

```bash
nala search dotnet-sdk
```

ensuite installer la dernière version du SDK avec:

```bash
sudo nala install -y dotnet-sdk-7.0
```

ou

```bash
sudo apt install -y dotnet-sdk-7.0
```

Pour vérifier l'installation :

```bash
dotnet --list-sdks
# ou
dotnet --info
```

---

2 Installer Godot :

Télécharger la dernière version DotNet

```bash
wget $(curl -s https://api.github.com/repos/godotengine/godot/releases/latest | grep "browser_download_url.*stable_mono_linux_x86_64.zip" | cut -d : -f 2,3 | tr -d \")
```

Télécharger la dernière version normale

```bash
wget $(curl -s https://api.github.com/repos/godotengine/godot/releases/latest | grep "browser_download_url.*stable_linux.x86_64.zip" | cut -d : -f 2,3 | tr -d \")
#suivi direct de
unzip "Godot*.zip"
rm Godot*.zip
mkdir -p .godot
mv *.x86_64 .godot/
# et passer à #renommer l'executable en godot.x86_64
```

Décompression

```bash
unzip "Godot*.zip"
```

Supprimer le fichier zip

```bash
rm Godot*.zip
```

Renommer le dossier en ".godot"

```bash
find ~/ -maxdepth 1 -type d -name "Godot*" -exec mv {} ~/.godot/ \;
```

Renommer l'executable en godot.x86_64 pour version normale

```bash
mv .godot/*.x86_64 .godot/godot-dotnet.x86_64
```

Renommer l'executable en godot-dotnet.x86_64 pour la version Dotnet

```bash
mv .godot/*.x86_64 .godot/godot-dotnet.x86_64
```

Le lancer une première fois (version normale) pour l'initialiser :

```bash
timeout 1s .godot/godot.x86_64
```

Le lancer une première fois (version Dotnet) pour l'initialiser :

```bash
timeout 1s .godot/godot-dotnet.x86_64
```

Créer l'executable "godot" (avec des chemins relatifs) dans `/usr/bin/` :

Pour la version normale

```bash
sudo sh -c 'echo "#!/bin/sh\n\nUSER_NAME=\$(whoami)\nDATA_DIRECTORY=/home/\$USER_NAME/.godot\nBINARY_FILE=/home/\$USER_NAME/.godot/godot.x86_64\ncd \$DATA_DIRECTORY\nexec \$BINARY_FILE \"\$@\"" > /usr/bin/godot && sudo chmod +x /usr/bin/godot'
#Attention si on le relance depuis la même instance du shell, le whoami ne marchera pas (le whoami ira chercher root au lieu du nom d'utilisateur !
```

Pour la version Dotnet

```bash
sudo sh -c 'echo "#!/bin/sh\n\nUSER_NAME=\$(whoami)\nDATA_DIRECTORY=/home/\$USER_NAME/.godot\nBINARY_FILE=/home/\$USER_NAME/.godot/godot-dotnet.x86_64\ncd \$DATA_DIRECTORY\nexec \$BINARY_FILE \"\$@\"" > /usr/bin/godot-dotnet && sudo chmod +x /usr/bin/godot-dotnet'
#Attention si on le relance depuis la même instance du shell, le whoami ne marchera pas (le whoami ira chercher root au lieu du nom d'utilisateur !)
```

Le lanceur godot.desktop à faire dans `/usr/share/applications`

Pour la version normale :

```bash
sudo sh -c 'echo "[Desktop Entry]\nVersion=1.0\nType=Application\nName=Godot\nComment=Game Engine\nExec=godot\nIcon=godot\nTerminal=false\nCategories=Game;Development;" > /usr/share/applications/godot.desktop && sudo chmod +x /usr/share/applications/godot.desktop'

```

Pour la version Dotnet :

```bash
sudo sh -c 'echo "[Desktop Entry]\nVersion=1.0\nType=Application\nName=Godot C#\nComment=Game Engine\nExec=godot-dotnet\nIcon=godot\nTerminal=false\nCategories=Game;Development;" > /usr/share/applications/godot.desktop && sudo chmod +x /usr/share/applications/godot-dotnet.desktop'

```

Rafraîchir la liste dans `/usr/share/applications`

```bash
sudo update-desktop-database

```

Il y a aussi un module à télécharger :

En One-Line :

```bash
wget $(curl -s https://api.github.com/repos/godotengine/FBX2glTF/releases/latest | grep "browser_download_url.*linux-x86_64.zip" | cut -d : -f 2,3 | tr -d \") && unzip "FBX2glTF*.zip" && rm FBX2glTF*.zip && mv  FBX2glTF-linux-x86_64/FBX2glTF-linux-x86_64 .godot && rm -r FBX2glTF-linux-x86_64
```

ou

[Dernière release de FBX2glTF](https://github.com/godotengine/FBX2glTF/releases/latest)

ou le télécharger direct en wget (la dernière version)

```bash
wget $(curl -s https://api.github.com/repos/godotengine/FBX2glTF/releases/latest | grep "browser_download_url.*linux-x86_64.zip" | cut -d : -f 2,3 | tr -d \")
```

Puis le décompresser :

```bash
unzip "FBX2glTF*.zip"
```

Supprimer le fichier zip

```bash
rm FBX2glTF*.zip
```

Ajouter le module dans le répertoire de godot (.godot) et supprimer le dossier :

```bash
mv  FBX2glTF-linux-x86_64/FBX2glTF-linux-x86_64 .godot
rm -r FBX2glTF-linux-x86_64
```

## Désinstallation détaillée

```bash
rm -r ~/.godot
sudo rm /usr/bin/godot
sudo rm /usr/bin/godot-dotnet  #selon votre version
sudo rm /usr/share/applications/godot.desktop
sudo rm /usr/share/applications/godot-dotnet.desktop #selon votre version
sudo update-desktop-database
```

## Compilation pour le web

Dépendances :

```bash
# Emscripten
## créer on dossier local lib dans .godot
mkdir -p ~/.godot/localesLib
cd ~/.godot/localesLib
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
git pull
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh
## Cacher le message de shell confirmant que EMSDK est bien en route
echo "" >> ~/.zshrc
echo "# Cacher l'alerte de EMSDK" >> ~/.zshrc
echo "export EMSDK_QUIET=1" >> ~/.zshrc
## Ajouter le chemin actuel à la configuration de zsh dans .zshrc
echo "" >> ~/.zshrc
echo "# Ajouter le chemin actuel EMSDK au shell" >> ~/.zshrc
echo "source \"$PWD/emsdk_env.sh\"" >> ~/.zshrc
## Réactualiser le shell avec les derniers réglages ajoutés à .zshrc
source ~/.zshrc
## cmake en lib secondaire
sudo nala install -y cmake

# ------------------------------------------

# Pour installer la dernière version de python

sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update
## Remplacez 3 et 12 par la version que vous voulez,ici c'est la 3.12.
X="3"
Y="12"

## Ou choisir la dernière version en utilisant curl pour récupérer les versions du site officiel et grep pour filtrer la dernière version 3.x
latest_python_version=$(curl -s https://www.python.org/downloads/ | grep "Download Python 3." | head -1 | grep -oP 'Python \K[0-9]+\.[0-9]+')

## Découpez la version pour obtenir les variables X et Y
X=$(echo $latest_python_version | cut -d. -f1)
Y=$(echo $latest_python_version | cut -d. -f2)

## Affichez X et Y pour vérifier
echo "Latest Python 3.x version is: $X.$Y"

## Enfin lancez l'installation avec ces variables :
sudo nala install -y python$X.$Y python$X.$Y-venv python$X.$Y-dev

## Ajouter le choix de version de python (Vérifiez quelle version de python vous avez par défaut dans /usr/bin/ moi c'est la 3.10)
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python$X.$Y 2

## Lancez le menu interactif pour choisir votre version avec
sudo update-alternatives --config python3

## ou choisissez directement avec set
sudo update-alternatives --set python3 /usr/bin/python$X.$Y
## ou pour mettre la dernier index
sudo update-alternatives --auto python3



```

## Auteurs

- [Harry RICHMOND](https://github.com/RogerBytes)
