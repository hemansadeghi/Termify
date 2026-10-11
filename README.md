# Termify — Awesome CLI Tools Collection

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Sentinel](https://github.com/hemansadeghi/Termify/actions/workflows/sentinel.yml/badge.svg)](https://github.com/hemansadeghi/Termify/actions/workflows/sentinel.yml)

A curated and up-to-date collection of command-line interface (CLI) tools for developers, sysadmins, and terminal enthusiasts.

Each tool appears **once**, in its most relevant category. Unmaintained projects have been replaced by their maintained successors (`exa` → `eza`, `xsv` → `qsv`, `youtube-dl` → `yt-dlp`, `bpytop` → `btop`).

---

## Contents

- [Search and Text Processing](#-search-and-text-processing)
- [System Monitoring and Management](#️-system-monitoring-and-management)
- [File and Directory Management](#-file-and-directory-management)
- [Networking and Web](#-networking-and-web)
- [Development and Data Processing](#️-development-and-data-processing)
- [Integration and Utilities](#-integration-and-utilities)
- [Fun Utilities](#-fun-utilities)
- [Termify Sentinel](#-termify-sentinel--repository-health-checker)
- [Getting Started](#-getting-started)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🔎 Search and Text Processing

| Tool | Description |
|------|-------------|
| [fzf](https://github.com/junegunn/fzf) | A fast, interactive fuzzy finder for files, command history, and more. |
| [ripgrep (rg)](https://github.com/BurntSushi/ripgrep) | Fast, recursive search tool optimized for searching plain text. |
| [ag (The Silver Searcher)](https://github.com/ggreer/the_silver_searcher) | A lightning-fast grep alternative optimized for searching codebases. |
| [sd](https://github.com/chmln/sd) | Intuitive and fast alternative to `sed` with regex support for structured text replacement. |
| [ack](https://beyondgrep.com/) | A grep-like search tool optimized for large codebases and language-aware searches. |
| [pt (The Platinum Searcher)](https://github.com/monochromegane/the_platinum_searcher) | A fast and feature-rich search tool like `ag`, written in Go. |
| [peco](https://github.com/peco/peco) | Interactive filtering tool similar to `fzf`, useful for command pipelines. |
| [grex](https://github.com/pemistahl/grex) | Generates regular expressions from user-provided test cases. |
| [ugrep](https://github.com/Genivia/ugrep) | Ultra-fast grep with UI interface, file globs, colors, and JSON support. |
| [ast-grep](https://github.com/ast-grep/ast-grep) | Structural code search, lint, and rewriting based on syntax trees. |
| [ripgrep-all (rga)](https://github.com/phiresky/ripgrep-all) | Ripgrep extended to PDFs, e-books, Office docs, and archives. |
| [miller (mlr)](https://github.com/johnkerl/miller) | Like sed and awk for CSV, JSON, and other tabular data. |
| [choose](https://github.com/theryangeary/choose) | Human-friendly alternative to `cut` and `awk` for field selection. |
| [pup](https://github.com/ericchiang/pup) | Command-line HTML parsing tool with CSS selector support (like `jq` for HTML). |

## 🖥️ System Monitoring and Management

| Tool | Description |
|------|-------------|
| [htop](https://htop.dev/) | Interactive process viewer with a colorful interface. |
| [btop](https://github.com/aristocratos/btop) | Modern resource monitor with mouse support and a slick UI (successor of `bpytop`). |
| [bottom](https://github.com/ClementTsang/bottom) | Yet another cross-platform graphical process/system monitor. |
| [glances](https://github.com/nicolargo/glances) | Cross-platform system monitor with real-time stats. |
| [atop](https://www.atoptool.nl/) | Advanced resource monitor with long-term logging and analysis. |
| [dstat](https://linux.die.net/man/1/dstat) | Versatile resource statistics tool combining vmstat, iostat, and netstat. |
| [collectl](http://collectl.sourceforge.net/) | Lightweight logging tool for CPU, disk, memory, and network stats. |
| [conky](https://github.com/brndnmtthws/conky) | Lightweight system monitor for the desktop with rich customization. |
| [ncdu](https://dev.yorhel.nl/ncdu) | Disk usage analyzer with a simple text UI. |
| [iotop](https://linux.die.net/man/1/iotop) | Show I/O usage by processes in real-time. |
| [Netdata](https://www.netdata.cloud/) | Real-time web dashboard with full system metrics and graphs. |
| [tmux](https://github.com/tmux/tmux) | Terminal multiplexer for managing multiple sessions in one window. |
| [zellij](https://github.com/zellij-org/zellij) | Modern terminal workspace with batteries included (alternative to `tmux`). |
| [dive](https://github.com/wagoodman/dive) | Explore and analyze Docker image layers to find wasted space. |
| [lazydocker](https://github.com/jesseduffield/lazydocker) | Simple terminal UI for Docker and docker-compose. |
| [duf](https://github.com/muesli/duf) | Disk usage and free space at a glance (friendly `df` alternative). |
| [procs](https://github.com/dalance/procs) | Modern replacement for `ps` with color, search, and tree views. |
| [gping](https://github.com/orf/gping) | Ping with a live latency graph for one or many hosts. |
| [nvtop](https://github.com/Syllo/nvtop) | Real-time GPU and accelerator process monitor. |

## 📂 File and Directory Management

| Tool | Description |
|------|-------------|
| [eza](https://github.com/eza-community/eza) | Modern, colorful replacement for `ls` with extra features (maintained fork of `exa`). |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` that learns your habits and jumps to frequent directories. |
| [yazi](https://github.com/sxyazi/yazi) | Fast terminal file manager with previews and async I/O. |
| [tree](http://mama.indstate.edu/users/ice/tree/) | Displays directory contents in a tree-like format. |
| [bat](https://github.com/sharkdp/bat) | A `cat` clone with syntax highlighting and Git integration. |
| [fd](https://github.com/sharkdp/fd) | A simple, fast, and user-friendly alternative to `find`. |
| [dust](https://github.com/bootandy/dust) | A more intuitive version of `du`, written in Rust. |
| [broot](https://github.com/Canop/broot) | Interactive tree view with fuzzy search and file preview. |
| [tldr](https://tldr.sh/) | Simplified and community-driven man pages for common CLI commands. |
| [vifm](https://github.com/vifm/vifm) | A file manager with vi-like keybindings for the terminal. |
| [ranger](https://github.com/ranger/ranger) | Terminal-based file manager with previews and vim-style controls. |
| [xplr](https://github.com/sayanarijit/xplr) | A fast, hackable, and extensible file manager for the terminal. |
| [ouch](https://github.com/ouch-org/ouch) | Compress and decompress anything from the terminal with one command. |
| [rclone](https://github.com/rclone/rclone) | Sync files with cloud storage providers like `rsync` for the cloud. |
| [nnn](https://github.com/jarun/nnn) | Blazing-fast terminal file manager with minimal footprint. |
| [superfile](https://github.com/yorukot/superfile) | Modern terminal file manager with a polished UI and plugin support. |

## 🌐 Networking and Web

| Tool | Description |
|------|-------------|
| [httpie](https://httpie.io/) | User-friendly HTTP client for testing and interacting with APIs. |
| [xh](https://github.com/ducaale/xh) | Fast, friendly HTTP client in Rust (compatible with HTTPie syntax). |
| [curlie](https://github.com/rs/curlie) | Frontend for `curl` that mimics HTTPie syntax. |
| [wrk](https://github.com/wg/wrk) | A powerful HTTP benchmarking tool with multi-threaded design. |
| [iperf3](https://github.com/esnet/iperf) | Tool for measuring network bandwidth and performance between two hosts. |
| [mtr](https://github.com/traviscross/mtr) | Combines ping and traceroute for live network path diagnosis. |
| [nmap](https://nmap.org/) | Powerful network scanner for discovering devices, open ports, and services. |
| [masscan](https://github.com/robertdavidgraham/masscan) | Extremely fast port scanner for large networks. |
| [tcpdump](https://www.tcpdump.org/) | Command-line packet analyzer for capturing and inspecting network traffic in real time. |
| [tshark](https://www.wireshark.org/docs/man-pages/tshark.html) | Command-line version of Wireshark for capturing and analyzing packets. |
| [wireshark](https://www.wireshark.org/) | A powerful GUI-based network protocol analyzer for deep traffic inspection and debugging. |
| [mitmproxy](https://mitmproxy.org/) | Interactive proxy for inspecting, testing, and debugging HTTP/S traffic. |
| [sshuttle](https://github.com/sshuttle/sshuttle) | Transparent proxy server for tunneling network traffic over SSH. |
| [proxychains](https://github.com/haad/proxychains) | Force any TCP connection to go through proxy servers such as TOR or SOCKS. |
| [netcat (nc)](https://netcat.sourceforge.net/) | Versatile networking tool for TCP/UDP connections, debugging, and testing. |
| [socat](http://www.dest-unreach.org/socat/) | Multipurpose relay for bidirectional data transfer between two independent data channels. |
| [aria2](https://github.com/aria2/aria2) | Lightweight multi-protocol and multi-source command-line download utility. |
| [yt-dlp](https://github.com/yt-dlp/yt-dlp) | Command-line downloader for YouTube and hundreds of other video platforms (successor of `youtube-dl`). |
| [speedtest-cli](https://github.com/sivel/speedtest-cli) | Test your internet bandwidth using speedtest.net from the terminal. |
| [iftop](https://www.ex-parrot.com/~pdw/iftop/) | Real-time bandwidth usage per connection on network interfaces. |
| [bmon](https://github.com/tgraf/bmon) | Real-time bandwidth monitor with a curses-based UI. |
| [suricata](https://suricata.io/) | High-performance IDS/IPS and network traffic analysis engine. |
| [Zeek (Bro)](https://zeek.org/) | Network security monitoring platform, turning traffic into analyzable events. |
| [ffuf](https://github.com/ffuf/ffuf) | Fast web fuzzer for discovering directories, files, and parameters. |
| [sqlmap](https://sqlmap.org/) | Automated tool to detect and exploit SQL Injection vulnerabilities. |
| [Burp Suite Community](https://portswigger.net/burp/communitydownload) | Platform for web application security testing (proxy + tools). |
| [doggo](https://github.com/mr-karan/doggo) | Human-friendly DNS client with JSON output and DoH support. |
| [bore](https://github.com/ekzhang/bore) | Minimal single-binary tunnels to expose localhost to the world. |
| [httpstat](https://github.com/davecheney/httpstat) | Visualize `curl` statistics with a timing waterfall. |
| [wuzz](https://github.com/asciimoo/wuzz) | Interactive terminal HTTP inspector for building and replaying requests. |
| [termshark](https://github.com/gcla/termshark) | Terminal UI for `tshark` to inspect packets like Wireshark in text mode. |

## ⚙️ Development and Data Processing

| Tool | Description |
|------|-------------|
| [lazygit](https://github.com/jesseduffield/lazygit) | Simple terminal UI for git commands with search and filtering support. |
| [delta](https://github.com/dandavison/delta) | Syntax-highlighting pager for `git diff` and grep output. |
| [gh](https://cli.github.com/) | GitHub CLI to manage repositories, pull requests, and issues directly from the terminal. |
| [starship](https://github.com/starship/starship) | Minimal, fast, and customizable shell prompt for any shell. |
| [atuin](https://github.com/atuinsh/atuin) | Syncable shell history with fuzzy search and stats. |
| [jq](https://stedolan.github.io/jq/) | Command-line JSON processor for filtering and transforming JSON data. |
| [yq](https://github.com/mikefarah/yq) | YAML processor with a jq-like syntax. Great for config files. |
| [dasel](https://github.com/TomWright/dasel) | Query and modify data structures in JSON, YAML, TOML, XML and more. |
| [fx](https://github.com/antonmedv/fx) | Command-line JSON viewer with syntax highlighting and query support. |
| [csvkit](https://csvkit.readthedocs.io/) | A suite of utilities for converting and analyzing CSV files in the terminal. |
| [qsv](https://github.com/dathere/qsv) | Blazing-fast CSV data-wrangling toolkit (maintained fork of `xsv`). |
| [glow](https://github.com/charmbracelet/glow) | Render markdown files with style in the terminal. |
| [asciinema](https://asciinema.org/) | Terminal session recorder that allows you to share terminal demos as lightweight videos. |
| [graph-cli](https://github.com/marqeta/graph-cli) | Generate ASCII graphs and charts directly from the terminal. |
| [tig](https://github.com/jonas/tig) | Text-mode interface for browsing Git repositories and staging changes. |
| [onefetch](https://github.com/o2sh/onefetch) | Show a Git repository summary with ASCII art, like neofetch for code. |
| [tokei](https://github.com/XAMPPRocky/tokei) | Count lines of code, comments, and blanks across languages in seconds. |
| [hyperfine](https://github.com/sharkdp/hyperfine) | Statistical command-line benchmarking with warmup and exports. |
| [usql](https://github.com/xo/usql) | Universal SQL client for Postgres, MySQL, SQLite, and more. |

## 🔧 Integration and Utilities

| Tool | Description |
|------|-------------|
| [fzf-tmux](https://github.com/junegunn/fzf/wiki/Integration#tmux) | Integration of `fzf` with `tmux` for better terminal multiplexing experience. |
| [direnv](https://github.com/direnv/direnv) | Automatically loads and unloads environment variables based on your current directory. |
| [autoenv](https://github.com/hyperupcall/autoenv) | Similar to `direnv`, automatically loads environment variables when entering a directory. |
| [entr](https://github.com/eradman/entr) | Run arbitrary commands when files change — great for automation and development. |
| [watchexec](https://github.com/watchexec/watchexec) | Executes commands in response to file changes. Useful for live development. |
| [just](https://github.com/casey/just) | A handy way to define and run project-specific scripts with a simple `justfile`. |
| [task](https://github.com/go-task/task) | A task runner / build tool similar to Make but easier to use. |
| [parallel](https://www.gnu.org/software/parallel/) | Execute commands in parallel for faster automation and scripting. |
| [overmind](https://github.com/DarthSim/overmind) | A modern Procfile manager for running multiple services simultaneously. |
| [chezmoi](https://www.chezmoi.io/) | Manage your dotfiles across multiple machines securely and consistently. |
| [pre-commit](https://pre-commit.com/) | A framework for managing multi-language pre-commit hooks for linting and formatting. |
| [mise](https://github.com/jdx/mise) | Polyglot runtime and toolchain manager (Node, Python, Go, and more). |
| [gum](https://github.com/charmbracelet/gum) | Build glamorous interactive shell scripts with prompts and spinners. |
| [stow](https://www.gnu.org/software/stow/) | Manage dotfiles by symlinking package directories into place. |
| [Bitwarden CLI (bw)](https://bitwarden.com/help/cli/) | Fetch passwords and secrets from your vault in scripts and prompts. |
| [age](https://github.com/FiloSottile/age) | Simple, modern file encryption with small keys and no legacy baggage. |

## 👾 Fun Utilities

| Tool | Description |
|------|-------------|
| [asciiquarium](https://github.com/cmatsuoka/asciiquarium) | Asciiquarium is an aquarium/sea animation in ASCII art. |
| [cmatrix](https://github.com/abishekvashok/cmatrix) | Terminal based "The Matrix" like implementation. |
| [astroterm](https://github.com/da-luce/astroterm) | It displays the real-time positions of stars, planets, constellations, and more, all within your terminal! |
| [pipes.sh](https://github.com/pipeseroni/pipes.sh) | Animated pipes terminal screensaver. |
| [sl](https://github.com/mtoyoda/sl) | SL (Steam Locomotive) runs across your terminal when you type "sl" as you meant to type "ls". |
| [fastfetch](https://github.com/fastfetch-cli/fastfetch) | Fast system information display with rich customization (neofetch successor). |
| [lolcat](https://github.com/busyloop/lolcat) | Paint terminal output in rainbow gradients. |
| [cbonsai](https://github.com/jallbrit/cbonsai) | Grow procedural bonsai trees in ASCII art. |

---

## 🔒 Termify Sentinel — Repository Health Checker

To ensure this curated list stays fresh and reliable, Termify includes a script that:

- Checks GitHub repositories listed in the README for **archived/disabled** status (via the GitHub API).
- Verifies **non-GitHub URLs** with plain `curl` (no extra link-checker required).

### Usage

```bash
./termify-sentinel.sh
./termify-sentinel.sh --github-only
./termify-sentinel.sh --links-only --jobs 10
```

Full options:

```text
--readme FILE    README file to scan (default: README.md)
--output FILE    Report file for problems (default: deprecated_termify.txt)
--jobs N         Parallel jobs (default: 6, max: 20)
--github-only    Only check GitHub repos, skip generic links
--links-only     Only check non-GitHub links, skip GitHub API
--help, -h       Show help and exit
```

### Requirements

- `curl` (required)
- `jq` or `python3` (optional, preferred for robust JSON parsing; falls back to `grep`)
- `GITHUB_TOKEN` (optional env var — raises API limit from 60 to 5000 req/hour)

### Output

- Problems are saved in `deprecated_termify.txt` with a timestamp header.
- Exit code is `1` when deprecated/dead links are found (handy for CI), `0` when all healthy.
- A weekly [GitHub Action](.github/workflows/sentinel.yml) runs the check automatically.

---

## 🚀 Getting Started

```bash
git clone https://github.com/hemansadeghi/Termify.git
cd Termify
chmod +x termify-sentinel.sh
./termify-sentinel.sh
```

## 🤝 Contributing

Feel free to contribute by submitting new tools, improving descriptions, or updating entries! Please read [CONTRIBUTING.md](CONTRIBUTING.md) first — one tool per PR, no duplicates, and keep descriptions short with correct spelling and grammar.

---

## 📄 License

MIT © Heman Sadeghi, 2025

---

Enjoy your terminal with these awesome CLI tools!
