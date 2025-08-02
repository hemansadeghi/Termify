
# Termify — Awesome CLI Tools Collection

A curated and up-to-date collection of command-line interface (CLI) tools for developers, sysadmins, and terminal enthusiasts.

---

## 🔎 Search and Text Processing

| Tool                                  | Description                                                        |
|-------------------------------------|------------------------------------------------------------------|
| [fzf](https://github.com/junegunn/fzf)           | A fast, interactive fuzzy finder for files, command history, and more.    |
| [ripgrep (rg)](https://github.com/BurntSushi/ripgrep) | Fast, recursive search tool optimized for searching plain text.  |
| [ag (The Silver Searcher)](https://github.com/ggreer/the_silver_searcher) | A lightning-fast grep alternative optimized for searching codebases. |
| [sd](https://github.com/chmln/sd) | Intuitive and fast alternative to `sed` with regex support for structured text replacement. |
| [ack](https://beyondgrep.com/) | A grep-like search tool optimized for large codebases and language-aware searches. |
| [pt (The Platinum Searcher)](https://github.com/monochromegane/the_platinum_searcher) | A fast and feature-rich search tool like `ag`, written in Go. |
| [peco](https://github.com/peco/peco) | Interactive filtering tool similar to `fzf`, useful for command pipelines. |
| [grex](https://github.com/pemistahl/grex) | Generates regular expressions from user-provided test cases. |
| [ugrep](https://github.com/Genivia/ugrep) | Ultra-fast grep with UI interface, file globs, colors, and JSON support. |
| [lazygit](https://github.com/jesseduffield/lazygit) | Simple terminal UI for git commands with search and filtering support. |
| [xsv](https://github.com/BurntSushi/xsv) | Extremely fast CSV toolkit for slicing, filtering, and analyzing. |
| [mlr (Miller)](https://github.com/johnkerl/miller) | Like awk, sed, cut for structured data such as CSV and JSON. |



## 🖥️ System Monitoring and Management

| Tool                                  | Description                                                       |
|-------------------------------------|-----------------------------------------------------------------|
| [htop](https://htop.dev/)                          | Interactive process viewer with a colorful interface.            |
| [ncdu](https://dev.yorhel.nl/ncdu)                 | Disk usage analyzer with a simple text UI.                        |
| [glances](https://github.com/nicolargo/glances)    | Cross-platform system monitor with real-time stats.              |
| [tmux](https://github.com/tmux/tmux)                | Terminal multiplexer for managing multiple sessions in one window.|
| [bpytop](https://github.com/aristocratos/bpytop)   | Resource monitor with a slick UI in the terminal.               |
| [iotop](https://linux.die.net/man/1/iotop)          | Show I/O usage by processes in real-time.                       |
| [bottom](https://github.com/ClementTsang/bottom)    | Yet another cross-platform graphical process/system monitor.    |

## 📂 File and Directory Management

| Tool                                  | Description                                                       |
|-------------------------------------|-----------------------------------------------------------------|
| [exa](https://the.exa.website/)                    | Modern, colorful replacement for `ls` with extra features.       |
| [tree](http://mama.indstate.edu/users/ice/tree/)   | Displays directory contents in a tree-like format.                |
| [bat](https://github.com/sharkdp/bat)              | `cat` clone with syntax highlighting and Git integration.         |
| [tldr](https://tldr.sh/)                            | Simplified and community-driven man pages for common CLI commands.|
| [vifm](https://github.com/vifm/vifm)                | A file manager with vi-like keybindings for the terminal.         |
| [ranger](https://github.com/ranger/ranger)          | Terminal-based file manager with previews and vim-style controls. |
| [broot](https://github.com/Canop/broot)             | Interactive tree view with fuzzy search and file preview.        |
| [dust](https://github.com/bootandy/dust)             | A more intuitive version of `du` in rust    |

## 🌐 Networking and Web

| Tool                                  | Description                                                       |
|-------------------------------------|-----------------------------------------------------------------|
| [httpie](https://httpie.io/)                       | User-friendly HTTP client for testing and interacting with APIs.|
| [sshuttle](https://github.com/sshuttle/sshuttle)  | Transparent proxy server for tunneling network traffic over SSH. |
| [youtube-dl](https://github.com/ytdl-org/youtube-dl) | Command-line downloader for YouTube and other video platforms.   |
| [nmap](https://nmap.org/)                           | Powerful network scanner for discovering devices, open ports, and services. |
| [aria2](https://github.com/aria2/aria2)             | Lightweight multi-protocol & multi-source command-line download utility. |
| [speedtest-cli](https://github.com/sivel/speedtest-cli) | Test your internet bandwidth using speedtest.net from the terminal. |
| [curlie](https://github.com/rs/curlie)              | Frontend for `curl` that mimics HTTPie syntax.                  |

## ⚙️ Development and Data Processing

| Tool                                      | Description                                                                 |
|-------------------------------------------|-----------------------------------------------------------------------------|
| [jq](https://stedolan.github.io/jq/)      | Command-line JSON processor for filtering and transforming JSON data.       |
| [asciinema](https://asciinema.org/)       | Terminal session recorder that allows you to share terminal demos as lightweight videos. |
| [fx](https://github.com/antonmedv/fx)     | Command-line JSON viewer with syntax highlighting and query support.        |
| [glow](https://github.com/charmbracelet/glow) | Render markdown files with style in the terminal.                          |
| [yq](https://github.com/mikefarah/yq)     | YAML processor with a jq-like syntax. Great for config files.              |
| [dasel](https://github.com/TomWright/dasel) | Query and modify data structures in JSON, YAML, TOML, XML and more.        |
| [graph-cli](https://github.com/marqeta/graph-cli) | Generate ASCII graphs and charts directly from the terminal.             |
| [httpie](https://httpie.io/)              | User-friendly HTTP client for testing APIs with JSON support and clean syntax. |
| [bat](https://github.com/sharkdp/bat)     | A `cat` clone with syntax highlighting and Git integration.                |
| [fzf](https://github.com/junegunn/fzf)    | Interactive fuzzy finder for searching files, commands, processes, and more. |

## 🔧 Integration and Utilities

| Tool                                  | Description                                                       |
|-------------------------------------|-----------------------------------------------------------------|
| [fzf-tmux](https://github.com/junegunn/fzf/wiki/Integration#tmux) | Integration of `fzf` with `tmux` for better terminal multiplexing experience.|
| [direnv](https://github.com/direnv/direnv)           | Automatically loads and unloads environment variables based on your current directory. |
| [entr](https://github.com/eradman/entr)              | Run arbitrary commands when files change — great for automation and development. |
| [watchexec](https://github.com/watchexec/watchexec)  | Executes commands in response to file changes. Useful for live development. |
| [just](https://github.com/casey/just)                | A handy way to define and run project-specific scripts with a simple `justfile`. |
| [task](https://github.com/go-task/task)              | A task runner / build tool similar to Make but easier to use.   |

## 👾 Fun Utilities 
| Tool                                  | Description                                                       |
|-------------------------------------|-----------------------------------------------------------------|
| [asciiquarium](https://github.com/cmatsuoka/asciiquarium) | Asciiquarium is an aquarium/sea animation in ASCII art.|
| [cmatrix](https://github.com/abishekvashok/cmatrix) | Terminal based "The Matrix" like implementation.|

---

## 🔒 Termify Sentinel — Repository Health Checker

To ensure this curated list stays fresh and reliable, Termify includes a handy script that:

- Checks GitHub repositories listed in the README for archival (deprecation).  
- Verifies non-GitHub URLs to detect broken or dead links.

### Usage

Run the script anytime to audit repository statuses:

```bash
./termify-sentinel.sh
```

### Requirements

- `curl` (for HTTP requests)  
- `deadlink` (optional, for dead link checks; install via npm or your package manager)  

### Output

Deprecated or archived repositories will be listed in `deprecated_termify.txt`.

---

🚀 **Getting Started**

```bash
git clone https://github.com/hemansadeghi/Termify.git
cd Termify
chmod +x termify-sentinel.sh
./termify-sentinel.sh
```

Feel free to contribute by submitting new tools, improving descriptions, or updating entries!

---

📄 **License**

MIT © Heman Sadeghi, 2025

---

Enjoy your terminal with these awesome CLI tools!
