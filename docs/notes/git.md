# Git notes

## Commands

#### Configuration

* `git config --global user.name <name>` - Define author name for all commits.
* `git config --global user.email <email>` - Define author email for all commits.
* `git config --global core.editor <editor>` - Set the text editor to be used.
* `git config --global --edit` - Open the global configuration file in a text editor.


When configuring user name, consider using double quotes (`"`) if it has spaces:

```
git config --global user.name "Max Rockatansky"
```

Regarding the text editor, use one that is callable from a command line:

```bash
# For Vi
git config --global core.editor vi

# For VSCode
git config --global core.editor code
```


#### Basic

* `git init <directory>` - Create `.git` folder in the specified directory.
* `git clone <repo>` - Clone repo onto the local machine.
* `git add <file-or-directory` - Stage changes in the file or directory for the next commit.
* `git commit` - Commit staged changes, and launch a text editor to edit the commit mesage.
* `git commit -m <message>` - Commit staged change using `<message>` as commit message.
* `git status`- List which files are staged, unstaged and untracked.
* `git log` - Diplay entire commit history.
* `git diff` - Show unstaged changes.