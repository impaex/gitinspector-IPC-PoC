# gitinspector-IPC-PoC
Proof of concept of the IPC architecture for gitinspectorgui.


# Installation

### UV installation for Python
Download UV on Windows by doing the following:
1. Open PowerShell
2. Paste and run the following command:
`powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"`
### Project installation
1. Clone the repository (through GitHub Desktop, Visual Studio Code or any other IDE)
2. With the repository opened in your IDE, open the terminal within the IDE, and run the following commands:
   1. `uv sync`: This installs all dependencies in a virtual environment (if the command isn't recognized, try restarting the IDE)
   2. `uv run gitinspectorgui-old`: This is the entry into the CLI.

