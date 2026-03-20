# Installing the Uroboros Neovim Config

### Prerequisites
Before installing, make sure your system has the required dependencies:
* **Neovim** (obviously lmao)
* **Git** (to clone the repo and for plugin management)
* **Ripgrep** and **fd** (for finding files/words)
* **A C Compiler** like `gcc` or `clang` (required for compiling Treesitter syntax parsers. The `zig C++ compiler` is recommended for its small size).
* **A Nerd Font** (so that file and UI icons render correctly).

---

### Step 1: Backup Existing Configurations
If you have used Neovim before, you should back up your current setup and clear out the old cache to prevent conflicts. *(If you get a "No such file or directory" error during these steps, don't worry—it just means you didn't have previous files there.)*

**For Linux / macOS (Terminal):**
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clean Neovim cache and state folders
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

**For Windows (PowerShell):**
```powershell
# Backup existing config
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak -ErrorAction SilentlyContinue

# Backup Neovim data (cache, state, and downloaded plugins)
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak -ErrorAction SilentlyContinue
```

---

### Step 2: Clone the Repository
Next, clone the `uroboros` repository directly into your system's Neovim configuration folder.

**For Linux / macOS:**
```bash
git clone https://github.com/omnimistic/uroboros ~/.config/nvim
```

**For Windows:**
```powershell
git clone https://github.com/omnimistic/uroboros $env:LOCALAPPDATA\nvim
```

---

### Step 3: Launch Neovim
Once the repository is cloned, simply open Neovim from your terminal or PowerShell:

```bash
nvim
```

---

### Step 4: Let `lazy.nvim` Install Plugins
Upon opening Neovim for the first time, the `init.lua` file will run. It will automatically detect that `lazy.nvim` is missing, download it, and immediately begin downloading all the plugins specified in the configuration. 

* You will see a UI window pop up showing the installation progress. 
* Wait for all installations to finish.
* Once the process is complete, you may see parsing messages at the bottom of the screen (this is Treesitter compiling syntax highlighting). 

---

### Step 5: Restart Neovim
After all plugins and parsers have finished downloading, quit Neovim completely by typing:
`:qa` and pressing `Enter`.

Reopen Neovim (`nvim`). Everything should now be fully loaded, themed, and ready to use!

This version is written in the third person, specifically formatted for a GitHub README. It uses a table for the main plugin list to ensure a clean, "dot-free" layout.

---

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

---

## 🍿 Snacks.lua

**Snacks.nvim** serves as a high-performance utility hub within this setup. It is configured to replace several bulkier standalone plugins with optimized Lua modules, centralizing the following features:

* **Navigation & Discovery**: Replaces **Telescope** and **Neo-tree** by providing a built-in Picker for file searching and an integrated Explorer for directory management.
* **Terminal Integration**: Manages a floating, rounded terminal window (`Ctrl+/`) for seamless shell access.
* **Startup Dashboard**: Powers the initial screen with a custom terminal animation (`anim.lua`) and dedicated keys for session restoration and configuration access.
* **System Utilities**: Orchestrates smooth scrolling, stylized input fields, and a notification system capable of handling complex text wrapping.

---
