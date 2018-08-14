if [[ -f $HOME/.github_token ]]
then
  export GITHUB_TOKEN=$(cat $HOME/.github_token)
fi


if [[ -f $HOME/.gitlab_token ]]
then
  export GITLAB_API_PRIVATE_TOKEN=$(cat $HOME/.gitlab_token)
fi
export GITLAB_API_ENDPOINT="https://gitlab.com/api/v4"


export GIT_USER_NAME=codexkz
export GIT_REPO_NAME=Test

##  If you don't have a git repo yet
mkdir $GIT_REPO_NAME && cd $GIT_REPO_NAME
git init
# hub create
gitlab create_project $GIT_REPO_NAME "{visibility_level: 20}"

git remote set-url origin --add https://gitlab.com/${GIT_USER_NAME}/${GIT_REPO_NAME}.git
git remote -v