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
