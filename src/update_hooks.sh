#!/bin/bash

HOOK_PATH="$HOME/.git-templates/hooks/prepare-commit-msg"

REPOS=(
    # Update with the local directory paths to all of your pre-existing cloned repos
    # You should only have to do this once.
)

git config --global init.templatedir '~/.git-templates'
for repo in "${REPOS[@]}"; do
    if [ -d "$repo/.git" ]; then
        cp "$HOOK_PATH" "$repo/.git/hooks/prepare-commit-msg"
        chmod +x "$repo/.git/hooks/prepare-commit-msg"
        echo "Updated hook for $repo"

    fi
done
