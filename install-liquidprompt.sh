DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
git clone https://github.com/nojhan/liquidprompt.git
echo "# Only load Liquid Prompt in interactive shells, not from a script or from scp" >> ~/.bashrc
echo "[[ \$- = *i* ]] && source $DIR/liquidprompt/liquidprompt" >> ~/.bashrc
