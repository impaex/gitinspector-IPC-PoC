# gitinspector-IPC-PoC
Proof of concept of the IPC architecture for gitinspectorgui.


# Installation
This installation manual is Windows focused.

### UV installation for Python
Download UV on Windows by doing the following:
1. Open PowerShell
2. Paste and run the following command:
`powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"`

### Tauri Prerequisites
Tauri has some prerequisites which have to be present on your system first. We'll go over them one-by-one.

##### C++ Build Tools
This is a prerequisite for both Tauri and Rust, hence we install it first.
1. Download the Build Tools at: https://visualstudio.microsoft.com/visual-cpp-build-tools/
2. Once started, Select `Desktop development with C++`
3. A window will pop up once done. It recommends restarting your PC, which we will do later.

##### WebView2
This is included from Windows 10 onwards, so should be already installed.

##### Rust
1. Visit this link: https://www.rust-lang.org/tools/install
2. Select your version to download.
3. Once the installer is downloaded, run it.
4. A console will open, press ENTER to proceed with the standard installation.
5. Once installed, in order for the program to recognize your Rust installation, your PC needs to restart.

##### Node.js
1. Go to https://nodejs.org/en/download
2. Make sure to get the prebuilt Node.js installation for Windows and the right architecture.
3. Once installed, run `node -v` and `npm -v` to make sure everything works properly. (Terminal may need to be restarted)

### Project installation
1. Clone the repository (through GitHub Desktop, Visual Studio Code or any other IDE)
2. With the repository opened in your IDE, open the terminal within the IDE, and run the following commands:
   1. `uv sync`: This installs all dependencies in a virtual environment (if the command isn't recognized, try restarting the IDE)
   2. `uv run gitinspectorgui-old`: This is the entry into the CLI. Running this command should output the help command of the CLI.
3. Within the same terminal, do the following to set up the Tauri app:
   1. `cd tauri-app`: Move into the Tauri App directory.
   2. `npm install`: Install the Tauri App dependencies.
   3. `npm run tauri dev`: Run the Tauri Development server. The initial run may take a while, as it will be downloading and compiling a lot of dependencies. Once done, it should open a window.

# How To Run
In order to run the stack in developer mode, you should do the following:
1. Make sure you have the project open in your IDE, with the terminal in the main directory (gitinspector-IPC-PoC).
2. Run: `cd .\tauri-app\` to change directory into the Tauri directory.
3. To run Tauri, run `npm run tauri dev` in the terminal.
