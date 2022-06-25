#export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
export JAVA8_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=/Applications/Android\ Studio\ Preview.app/Contents/jre/Contents/Home
PATH=${JAVA_HOME}/bin:${PATH}
  
export ANDROID_HOME="$HOME/Library/Android/sdk/"
export PATH=$ANDROID_HOME/platform-tools:${PATH}
export PATH=$ANDROID_HOME/tools:${PATH}
export PATH=$ANDROID_HOME/tools/bin:${PATH}
export PATH=$ANDROID_HOME/build-tools/31.0.0:${PATH}

export PATH=$HOME/.nodebrew/node/v12.9.1/bin:${PATH}

export PATH=${PATH}:$HOME/Documents/github/flutter/bin

alias gitcommitfilediff="python3 $HOME/Documents/github/GitScript/commit_file_diff.py"
alias gitcheckout="python3 $HOME/Documents/github/GitScript/checkout.py"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


export PATH="/usr/local/bin:$PATH"
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# 補完機能有効にする
autoload -U compinit
compinit -u
