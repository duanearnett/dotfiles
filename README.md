# dotfiles

## Summary and Goals
Goal of this repo is to keep a generalized version of my dotfiles.


# Helpful Tools
A list of helpful tools to use in conjunction with all of these CLI-based PIM, task, and communication tools.
- **tmux**


## Applicable Applications
- vim
- mutt (specifically [neomutt](https://www.neomutt.org))
- irssi
  - bittlebee
- taskwarrior
  - timewarrior
  - bugwarrior


## Installation

Run the `install.sh` script. That doesn't exist yet but it will


## Applications Detail

### Tmux
Sessions are saved and restored with tmux-continuum and tmux-resurrect. Restart now
worry free!

- Install tmux plugin manager
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`



### Text and code with _VIM_

**Current Functionality**
- Plugin manager allowing conditional loading of plugins for filetypes or even
  on-demand, when specific commands are called
- Syntax highlighting, etc
- Auto-completion
- Integrated git commands via Fugitive plugin

**Planned Functionality**
- Async git commands (e.g., push...)

#### Details and Installation
Install [__vim-plug__](https://github.com/junegunn/vim-plug) to manage
__vim__ plugins and conditionally load them. Review the main repo page for
info on checking for updates, installing new plugins, conditionally loading plugins, etc.

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```


#### Sources, References, and Related Reading
https://medium.com/@mkozlows/why-atom-cant-replace-vim-433852f4b4d1#.ntp4c7xre

---

### Email with _Mutt (neomutt)_

Configuration and nav keys kept to mimic VIM defaults as most as possible.

**Current Functionality**
- Syncs to gMail with several gMail-specific work-arounds and key bindings
- Uses `lpass`, the LastPass CLI, for password management. Updating passwords
  in LastPass will update your email passwords
- Can send emails to TaskWarrior as tasks
- Uses Contacts.app (macOS/OSX) for contact management and auto-completion
- Spell checking and auto-completion inside composer view
  - Simple fix for common mispellings (e.g, 'teh' -> 'the', 'Im' -> 'I'm')

**Planned Functionality**
- Dictionary autocomplete inside composer view
- Combined/aggregated inbox with offlineimap (only combining inboxes, gMail can store the bulk of the mail)
- Alternative contact mgmt that isn't platform-specific
- Enhanced "to task" functionality
- Messages custom colored depending on type (text/calendar, etc)

#### Details and Installation
##### Dependencies
- urlscan (https://github.com/firecat53/urlscan)

#### Sources, References, and Related Reading
**[Steve Losh's article/walkthorugh](http://stevelosh.com/blog/2012/10/the-homely-mutt/#how-i-use-email)**:
I used this pretty extensively to get a decent jumping off point for my own setup. Mainly the gMail
integration and the contacts integration. Great article with practical use-cases.


### Chat and IRC with _irssi_ and _Bittlebee_

**Planned Functionality**
- gChat
- Hipchat
- IRC

#### Sources, References, and Related Reading
**[This Guy's Setup](http://www.antonfagerberg.com/blog/my-perfect-irssi-setup/)**


### Time management with **TimeWarrior**


### Task management with **TaskWarrior**

#### Sources, References, and Related Reading
- todo.txt: http://todotxt.com


## Project TODOs
- Linux/Debian installation script

