# cypress-framework
A UI Testing Framework based on Cypress. 

# Documentation

cypress.io -  https://docs.cypress.io/app/get-started/why-cypress
nodejs     -  https://nodejs.org/en/download/

- Uses the nvm node version manager on MacOS and Linux
- Requires make, nvm, node, npm

## Installing Make

### 🛠 Installing make on All Platforms

make is a build automation tool used to run workflows from a Makefile. If it’s not installed on your system, follow the steps below based on your OS.

### 💻 macOS

Most macOS systems come with make via the Xcode Command Line Tools. To install (or ensure it’s installed):
```
xcode-select --install
```
Then verify:
```
make --version
```

### 🐧 Linux (Debian/Ubuntu)

Install with apt:
```
sudo apt update
sudo apt install build-essential
```
Then verify:
```
make --version
```

### 🪟 Windows

Option 1: Git Bash (Recommended for Simplicity)
	1.	Install Git for Windows
	2.	Open Git Bash
	3.	Run:
```
make --version
```
✅ Git Bash includes a minimal make binary that works well for most use cases.

Option 2: Chocolatey (PowerShell)

If you prefer PowerShell and use Chocolatey:
```
choco install make
```


### 🧪 Test it

After installation, run:
```
make --version
```
If you see a version number, you’re ready to use make.

## Use the Make file to install all dependencies:
```
make
```

## To install Cypress:
```
npm install cypress --save-dev
```

# Running Cypress
```
npx cypress open
```

Select a browser
```
npx cypress run --browser {browser-name}
```
