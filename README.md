# Python Environment Setup

This project provides an automated way to set up a Python development environment using a Bash script. The script creates or activates a virtual environment, upgrades pip, installs essential Python packages, generates a .gitignore file, and logs all actions into a setup.log file. It is designed to help new engineers quickly bootstrap a project environment without manually repeating setup steps.

## Table of Contents
- [Features](#features)
- [How To Use](#how-to-use)
- [Example Outputs](#example-outputs)
- [Challenges Faced](#challenges-faced)
- [Lessons Learned](#lessons-learned)

## Features
- Automatically checks for an existing .venv directory in the current project folder.

- Creates and activates a Python virtual environment if not found

- Upgrades pip to the latest version

- Installs essential Python packages (NumPy, Pandas, Matplotlib)

- Generates a .gitignore file with standard Python ignore rules

- Provides colour-coded feedback messages (INFO, SUCCESS, WARNING, ERROR)

- Logs all setup actions into setup.log

- Uses structured functions for clean and reusable code

- Stops immediately if any command fails (set -e)

## How To Use 
Follow the steps to run the setup script on your local machine.
- Make the script executable
```bash
chmod u+x setup.sh
```

- Run the script
```bash
./setup.sh
```
Once the script is executed, it will create and activate .venv, install numpy, pandas and matplotlib, create a gitignore file if missing and write logs to setup.log file.

- Activating the Environment
The script is set to automatically activate the environment during setup but if you open a new terminal later and want to work inside the same environment, you can do this.

```bash
source .venv/bin/activate
```

## Example Outputs

Below are examples of the terminal-style outputs displayed while the script runs:

```
[INFO] Initializing project setup...

[INFO] Checking for virtual environment...

[INFO] No virtual environment found. Create a new .venv file.

[SUCCESS] Virtual environment created and activated.

[INFO] Upgrading pip to the latest version

[SUCCESS] Pip has been upgraded.

[INFO] Creating .gitignore file.

[SUCCESS] .gitignore created.

[INFO] Installing required Python packages (numpy, pandas, matplotlib)...

[SUCCESS] Python packages installed successfully.

[SUCCESS] Setup done and dusted
```

## Challenges Faced
During this project, I encountered and resolved several challenges including:

- Virtual environment creation failure: I discovered that my Ubuntu installation did not include the python3-venv package. Without it, the virtual environment could not be created, and I received an ensurepip is not available error. Installing python3-venv resolved this issue.

- Corrupted .venv directory: After the first failed attempt, an incomplete .venv folder was left behind. This caused activation errors (.venv/bin/activate: No such file or directory). I had to delete the directory manually and rerun the script.

- GitHub authentication issues: I created a Git repository in Ubuntu and needed authentication to push my code to GitHub. Since GitHub no longer supports password authentication for Git operations, I had to generate a Personal Access Token (PAT) and use it in place of my password to successfully push the repository.

These issues helped me understand more about environment setup and permissions.

## Lessons Learned
Through this project, I gained practical experience in:

- Structuring Bash scripts using functions for clarity and reusability.

- Using colour codes to produce a clean terminal output.

- Implementing command logging and redirecting output to a file.

- Handling errors proactively with tools like set -e.

- Automating the creation and activation of Python virtual environments.

- Managing Git authentication securely using Personal Access Tokens.


Overall, this project strengthened my shell scripting and debugging skills. The setup.sh script provides a reliable and reusable approach to preparing Python environments. It reduces manual setup time, ensures consistency across different local machines, and simplifies the onboarding process for new engineers.

This project also improved my understanding of Linux and Bash scripting.