set -e
# echo "\$ZSH_CUSTOM"
if  [[ -z $ZSH_CUSTOM ]]; then
    echo "\$ZSH_CUSTOM is empty, execute the following command"
    echo "export ZSH_CUSTOM"
    echo "EXITING" 
    exit 1
fi
# echo $FOLDER  
if [ -d $ZSH ]; then
    echo "FOLDER $ZSH exists."
    which sed
else
    echo "Folder $ZSH does not exist."
fi

FOLDER=$ZSH_CUSTOM/plugins/zsh-autosuggestions
if [ -d $FOLDER ]; then
   echo "File $FOLDER exists."
else
   echo "Folder $FOLDER does not exist."
   git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
   sed -i '/plugins=(.*)/ s/)$/ zsh-autosuggestions)/'  $HOME/.zshrc
fi

FOLDER=$ZSH_CUSTOM/plugins/zsh-syntax-highlighting
if [ -d $FOLDER ]; then
   echo "File $FOLDER exists."
else
   echo "Folder $FOLDER does not exist."
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
   sed -i '/plugins=(.*)/ s/)$/ zsh-syntax-highlighting)/'  $HOME/.zshrc
fi

FOLDER=$ZSH_CUSTOM/plugins/fast-syntax-highlighting
if [ -d $FOLDER ]; then
    echo "File $FOLDER exists."
else
    echo "Folder $FOLDER does not exist."
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $ZSH_CUSTOM/plugins/fast-syntax-highlighting
    sed -i '/plugins=(.*)/ s/)$/ fast-syntax-highlighting)/'  $HOME/.zshrc
fi

FOLDER=$ZSH_CUSTOM/plugins/zsh-autocomplete
if [ -d $FOLDER ]; then
    echo "File $FOLDER exists."
else
    echo "Folder $FOLDER does not exist."
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
    sed -i '/plugins=(.*)/ s/)$/ zsh-autocomplete)/'  $HOME/.zshrc
fi
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting