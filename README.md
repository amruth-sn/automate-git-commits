
# Git Commit Message Automation with Groq API Integration

This repository provides a template to automate Git commit message generation using the Groq API for LLMs and custom Git hooks. It includes two key files:
- `src/prepare-commit-msg`: A Git hook that automatically generates commit messages based on staged changes.
- `src/update_hooks.sh`: A script to easily update multiple repositories with the Git hook from the template.

## Table of Contents
- [Setup](#setup)
- [Cloning the Repository](#cloning-the-repository)
- [Copying the Hook Files to Your Template Directory](#copying-the-hook-files-to-your-template-directory)
- [Setting the GROQ_API_KEY Environment Variable](#setting-the-groq_api_key-environment-variable)
- [Using update_hooks.sh to Update Multiple Repositories](#using-hookssh-to-update-multiple-repositories)
- [Editing the Template](#editing-the-template)
- [License](#license)
- [Questions?](#questions)

## Setup

### Cloning the Repository

To get started, first clone this repository into your local environment:

```bash
git clone https://github.com/amruth-sn/automate-git-commits.git
cd automate-git-commits
```

This repository contains two important files located in the `src` directory:
- `prepare-commit-msg`: The Git hook for generating commit messages.
- `update_hooks.sh`: A script that copies the Git hook into the `.git/hooks/` directory of multiple repositories.

### Copying the Hook Files to Your Template Directory

The Git hooks for your repositories are usually stored in `.git/hooks/` for each individual repository. You can copy the template into an individual `.git/hooks/prepare-commit-msg` file for each repository if you don't want this to act globally. However, to streamline hook management across projects, I recommend using Git's global hook template directory.

1. **Create the Git Template Directory**:
   ```bash
   mkdir -p ~/.git-templates/hooks
   ```

2. **Copy the Hook Files to the Template Directory**:
   Run these commands to copy the `prepare-commit-msg` hook and `update_hooks.sh` script to your global Git template directory:
   
   ```bash
   cp src/prepare-commit-msg ~/.git-templates/hooks/prepare-commit-msg
   cp src/update_hooks.sh ~/.git-templates/hooks/update_hooks.sh
   ```

3. **Make the Hook Executable**:
   Ensure the hook is executable:
   
   ```bash
   chmod +x ~/.git-templates/hooks/prepare-commit-msg
   ```

4. **Set the Git Template Directory**:
   Configure Git to use the template directory globally. This is the crucial part that allows Git to use our custom template:
   
   ```bash
   git config --global init.templatedir '~/.git-templates'
   ```

### Setting the GROQ_API_KEY Environment Variable

The `GROQ_API_KEY` environment variable is required to authenticate your requests to the Groq API.

#### Option 1: Set Environment Variable Globally
To set the `GROQ_API_KEY` as a global environment variable in `/etc/environment`, follow these steps:

1. **Open the `/etc/environment` file** in a text editor with superuser privileges:
   ```bash
   sudo nano /etc/environment
   ```

2. **Add the following line** to the file:
   ```bash
   GROQ_API_KEY="your-api-key-here"
   ```

3. **Save and exit** the file (in `nano`, press `Ctrl+X`, then `Y`, and then `Enter`).

4. **Apply the changes**:
   - Either restart your system, or
   - Run the following command to apply the changes immediately:
     ```bash
     source /etc/environment
     ```

This will make the `GROQ_API_KEY` environment variable available globally to all users and processes.

Also add this line to your `.bashrc` (or `.zshrc`) file:

```bash
export GROQ_API_KEY="your-api-key-here"
```

After adding it, reload your shell config:

```bash
source ~/.bashrc  # or source ~/.zshrc for Zsh users
```

#### Option 2: Set Environment Variable for a Specific Session

If you want to set the `GROQ_API_KEY` for a single terminal session, you can run:

```bash
export GROQ_API_KEY="your-api-key-here"
```

This will make the key available only for the current session, but you'll have to redo this every time.

### Using `update_hooks.sh` to Update Multiple Repositories

If you make changes to the `prepare-commit-msg` file and want to apply the updated version to multiple repositories, you can use the `update_hooks.sh` script:

1. **Edit the Hook** (if needed):
   If you need to make any changes to the `prepare-commit-msg` file, edit `~/.git-templates/hooks/prepare-commit-msg` directly using your preferred file editor.

2. **Run `update_hooks.sh` to Update Repositories**:
   After making changes to the hook you can run `update_hooks.sh` to update all repositories with the latest hook. The script will copy the updated `prepare-commit-msg` hook to each repository listed in the script.

   Run:
   ```bash
   cd ~
   ./.git-templates/hooks/update_hooks.sh
   ```

3. **Verify the Changes**:
   The script will update the `prepare-commit-msg` file for each repository and ensure it is executable. You should see an echo'd message indicating success for each repository.

### Editing the Template

If you ever need to make changes to the `prepare-commit-msg` hook for any reason (like re-engineering the prompt, changing the model used, or the maximum number of tokens being outputted):
1. Edit `~/.git-templates/hooks/prepare-commit-msg`.
2. Re-run `update_hooks.sh` to propagate the changes to all your repositories.

### License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
### Questions?
Reach out to me on my [portfolio](https://www.amruthn.com/) website if you have any questions!

