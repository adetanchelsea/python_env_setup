#!/bin/bash

#PYTHON PROJECT ENVIRONMENT BOOTSTRAPPER

#Stopping the script immediately a command fails
set -e

#----------------------------------------------------------
#LOGGING SETUP
#----------------------------------------------------------

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;36m"
RESET="\033[0m"

#Logging File
LOG_FILE=setup.log

#Main logger
log() {
    echo -e "$1"
    echo -e "$1" >> "$LOG_FILE"
}

#Info message
info() {
    log "${BLUE}[INFO]${RESET} $1"
}

# Success message
success() {
    log "${GREEN}[SUCCESS]${RESET} $1"
}

#Warning message
warning() {
    log "${YELLOW}[WARNING]${RESET} $1"
}

#Error message
error() {
    log "${RED}[ERROR]${RESET} $1"
}

#--------------------------------------------------------
#HELPER FUNCTIONS
#--------------------------------------------------------
function venv_setup {
#   Checks if a Python virtual environment exists in the current dictory. If it does, it activates it.
#   If not, it creates a new virtual environment and activates it.
    info "Checking for virtual environment..."

    if [ -d ".venv" ]; then
        info "Virtual environment found. Activating now..."
        source .venv/bin/activate
        success "Activated existing virtual environment."
    else
        info "No virtual environment found. Create a new .venv file."
        python3 -m venv .venv
        source .venv/bin/activate
        success "Virtual environment created and activated."
    fi
}

function pip_upgrade {
#    Upgrades pip to the latest version and logs all output to the log file.
     info "Upgrading pip to the latest version..."
     pip install --upgrade pip >> "$LOG_FILE" 2>&1
     success "Pip has been upgraded."
}

function gitignore {
#   Creates a .gitignore file for Python if it doesn't already exist.
    if [ -f ".gitignore" ]; then
        warning ".gitignore already exists."
    else
        info "Creating .gitignore file..."
        cat <<END > .gitignore
_pycache_/
*.pyc
*pyo
.DS_Store
.venv/
env/
.idea/
.vscode/
END

        success ".gitignore created."
    fi
}

function install_packages {
#   Installs essential python packages (numpy, pandas and matplolib) needed for the project.
    info "Installing required Python packages (numpy, pandas and matplotlib)..."
    pip install -r requirements.txt >> "$LOG_FILE" 2>&1
    success "Python packages installed successfully."
}

#---------------------------------------------------------------------
#MAIN FUNCTION
#---------------------------------------------------------------------
function main {
    info "Initializing project setup..."
    
    venv_setup
    pip_upgrade
    gitignore
    install_packages

    success "Setup done and dusted!"
}

#Execute main function
main

