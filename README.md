# Termify — Awesome CLI Tools Collection

A curated and up-to-date collection of command-line interface (CLI) tools for developers, sysadmins, and terminal enthusiasts.

---

## 🔎 Search and Text Processing

- **[fzf](https://github.com/junegunn/fzf)** — A fast, interactive fuzzy finder for files, command history, and more.
- **[ripgrep (rg)](https://github.com/BurntSushi/ripgrep)** — Fast, recursive search tool optimized for searching plain text.
- **[ag (The Silver Searcher)](https://github.com/ggreer/the_silver_searcher)** — A lightning-fast grep alternative optimized for searching codebases.

## 🖥️ System Monitoring and Management

- **[htop](https://htop.dev/)** — Interactive process viewer and system monitor with colorful interface.
- **[ncdu](https://dev.yorhel.nl/ncdu)** — Disk usage analyzer with an interactive text interface.

## 📂 File and Directory Management

- **[exa](https://the.exa.website/)** — Modern, colorful replacement for `ls` with extra features.
- **[tree](http://mama.indstate.edu/users/ice/tree/)** — Displays directory contents in a tree-like format.
- **[bat](https://github.com/sharkdp/bat)** — `cat` clone with syntax highlighting and Git integration.

## 🌐 Networking and Web

- **[httpie](https://httpie.io/)** — User-friendly HTTP client for testing and interacting with APIs.
- **[sshuttle](https://github.com/sshuttle/sshuttle)** — Transparent proxy server for tunneling network traffic over SSH.
- **[youtube-dl](https://github.com/ytdl-org/youtube-dl)** — Command-line downloader for YouTube and other video platforms.

## ⚙️ Development and Data Processing

- **[jq](https://stedolan.github.io/jq/)** — Command-line JSON processor for filtering and transforming JSON data.
- **[tldr](https://tldr.sh/)** — Simplified and community-driven man pages for common CLI commands.
- **[asciinema](https://asciinema.org/)** — Terminal session recorder that allows you to share terminal demos as lightweight videos.

## 🔧 Integration and Utilities

- **[fzf-tmux](https://github.com/junegunn/fzf/wiki/Integration#tmux)** — Integration of `fzf` with `tmux` for better terminal multiplexing experience.

---

## 🔒 Termify Sentinel — Repository Health Checker

To ensure this curated list stays fresh and reliable, Termify includes a handy script:

- **Checks GitHub repositories** listed in the README for archival (deprecation).
- **Verifies non-GitHub URLs** to detect broken or dead links.

### Usage

Run the script anytime to audit repository statuses:

```bash
./termify-sentinel.sh
```

*Requirements:*  
- `curl` (for HTTP requests)  
- `deadlink` (optional, for dead link checks; install via npm or your package manager)

Deprecated or archived repositories will be listed in `deprecated.txt`.

---

## 🚀 Getting Started

Clone the repository and explore the curated CLI tools:

```bash
git clone https://github.com/yourusername/Termify.git
cd Termify
chmod +x termify-sentinel.sh
./termify-sentinel.sh
```

Feel free to contribute by submitting new tools, improving descriptions, or updating entries!

---

## 📄 License

MIT © YourName, 2025

---

Enjoy your terminal with these awesome CLI tools!
