# Uroboros Neovim Config

A custom Neovim configuration built for speed and simplicity.

## Prerequisites

Make sure your system has these dependencies before installing:

- **[Neovim](https://neovim.io/doc/install/)** (the editor itself)
- **[Git](https://git-scm.com/install/)** (for cloning the repo and plugin management)
- **Ripgrep** and **fd** (for file and text searching)
- **C Compiler** like `gcc` or `clang` (Treesitter needs this to compile syntax parsers. The `zig C++ compiler` is recommended for its small size)
- **[Nerd Font](https://www.nerdfonts.com/font-downloads)** (for proper icon rendering in the UI)

## Installation

### Step 1: Backup Your Existing Config

If you already use Neovim, back up your current setup and clear the cache to avoid conflicts. If you see "No such file or directory" errors, that just means you had no previous config files there.

**Linux / macOS:**
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clean Neovim cache and state folders
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

**Windows (PowerShell):**
```powershell
# Backup existing config
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak -ErrorAction SilentlyContinue

# Backup Neovim data (cache, state, and plugins)
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak -ErrorAction SilentlyContinue
```

### Step 2: Clone Uroboros

Clone the repository directly into your Neovim config directory.

**Linux / macOS:**
```bash
git clone https://github.com/omnimistic/uroboros ~/.config/nvim
```

**Windows:**
```powershell
git clone https://github.com/omnimistic/uroboros $env:LOCALAPPDATA\nvim
```

### Step 3: Launch Neovim

Open Neovim from your terminal:
```bash
nvim
```

### Step 4: Plugin Installation

On first launch, `init.lua` will automatically:
- Detect that `lazy.nvim` is missing and download it
- Install all plugins specified in the config
- Show a progress UI window during installation

Wait for the installation to complete. You may see Treesitter parsing messages at the bottom while syntax parsers compile.

### Step 5: Restart Neovim

After everything finishes installing, quit Neovim:
```
:qa
```

Reopen Neovim with `nvim`. Your config is now fully loaded and ready to use.

## Usage

Explore the keybindings and configurations in the `lua` directory to customize Uroboros to your workflow.

## 🛠️ Plugin Architecture

This configuration utilizes a curated selection of plugins to enhance the Neovim environment, focusing on performance, modularity, and visual clarity.

| Plugin | Description | Functionality & Integration |
| :--- | :--- | :--- |
| **autopairs.lua** | Automated bracket closure | Handles pair expansion and integration with completion engines. |
| **blink-cmp.lua** | Completion engine | Acts as the primary hub for LSP, snippets, and path suggestions. |
| **colorizer.lua** | Color highlighter | Provides real-time previews for hex codes and CSS colors. |
| **colorscheme.lua** | Global aesthetic | Defines the theme and highlight groups for the entire UI. |
| **conform.lua** | Code formatter | Interfaces with external CLI tools to ensure consistent code style. |
| **flash.lua** | Enhanced navigation | Enables rapid cursor movement to any search pattern on screen. |
| **fugitive.lua** | Git integration | Allows for comprehensive version control management via Vim commands. |
| **gitsigns.lua** | Visual Git indicators | Displays file changes in the sign column and manages hunks. |
| **harpoon.lua** | File marking tool | Facilitates near-instant switching between frequently used buffers. |
| **indent-blankline.lua** | Indentation guides | Adds vertical lines to assist with visual code alignment. |
| **lspconfig.lua** | LSP bridge | Manages the connection between Neovim and Language Servers. |
| **lualine.lua** | Status line | Provides a fast, informative bar for modes, Git, and diagnostics. |
| **mason.lua** | Package manager | Orchestrates the installation of LSPs, linters, and formatters. |
| **mini-ai.lua** | Text objects | Extends the logic for selecting and manipulating code blocks. |
| **mini-indentscope.lua** | Scope visualization | Animates a vertical line to indicate the current active scope. |
| **modicator.lua** | Mode-based styling | Dynamically changes line number colors based on the editor mode. |
| **neoclip.lua** | Clipboard manager | Maintains a searchable history of all previous yanks and deletes. |
| **noice.lua** | UI overhaul | Modernizes the command line, messages, and popup windows. |
| **nvim-surround.lua** | Surroundings tool | Provides keys to add, change, or delete brackets and quotes. |
| **nvim-ts-autotag.lua** | Tag management | Uses Treesitter to automatically close and rename HTML tags. |
| **persistence.lua** | Session management | Automatically restores the last workspace state upon startup. |
| **treesitter.lua** | Syntax engine | Parses code for high-performance highlighting and analysis. |
| **trouble.lua** | Diagnostics UI | Consolidates errors and warnings into a unified, filterable list. |
| **which-key.lua** | Keybinding menu | Displays interactive popup hints for available command shortcuts. |

## 🍿 Snacks.lua

**Snacks.nvim** serves as a high-performance utility hub within this setup. It is configured to replace several bulkier standalone plugins with optimized Lua modules, centralizing the following features:

- **Navigation & Discovery**: Replaces **Telescope** and **Neo-tree** by providing a built-in Picker for file searching and an integrated Explorer for directory management.
- **Terminal Integration**: Manages a floating, rounded terminal window (`Ctrl+/`) for seamless shell access.
- **Startup Dashboard**: Powers the initial screen with a custom terminal animation (`anim.lua`) and dedicated keys for session restoration and configuration access.
- **System Utilities**: Orchestrates smooth scrolling, stylized input fields, and a notification system capable of handling complex text wrapping.

## Contributing

Contributions are welcome! If you want to improve Uroboros, follow these steps:

### How to Contribute

1. **Fork the repository** on GitHub
2. **Clone your fork** to your local machine:
```bash
   git clone https://github.com/your-username/uroboros.git
```
3. **Create a new branch** for your feature or fix:
```bash
   git checkout -b feature/your-feature-name
```
4. **Make your changes** and test them thoroughly
5. **Commit your changes** with a clear message:
```bash
   git commit -m "Add feature: your feature description"
```
6. **Push to your fork**:
```bash
   git push origin feature/your-feature-name
```
7. **Open a Pull Request** on the main repository

### Contribution Guidelines

- Keep the config minimal and focused on performance
- Test your changes on both Linux/macOS and Windows if possible
- Document any new keybindings or features in comments
- Follow the existing code style and structure
- Make sure plugins added are actively maintained

### Reporting Issues

Found a bug or have a suggestion? Open an issue on the [GitHub Issues](https://github.com/omnimistic/uroboros/issues) page with:
- A clear description of the problem or suggestion
- Steps to reproduce (for bugs)
- Your system info (OS, Neovim version)

All contributions, big or small, are appreciated!