# Makefile: Auto-install nvm, Node.js, npm, npx, TypeScript, Cypress, and initialize package.json
SHELL := /bin/bash
NVM_DIR := $(HOME)/.nvm

.PHONY: all check-nvm install-nvm check-node check-npm check-npx init-npm check-typescript install-typescript check-cypress install-cypress install-deps

all: check-nvm check-node check-npm check-npx init-npm check-typescript check-cypress install-deps

check-nvm:
	@echo "🔍 Checking for nvm..."
	@if [ -s "$(NVM_DIR)/nvm.sh" ]; then \
		echo "✅ nvm is already installed."; \
	else \
		echo "❌ nvm not found. Installing..."; \
		$(MAKE) install-nvm; \
	fi

install-nvm:
	@echo "📥 Installing nvm..."
	@curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
	@echo "✅ nvm installed. Please restart your shell or source ~/.nvm/nvm.sh"

check-node:
	@echo "🔍 Installing latest Node.js with nvm..."
	@source $(NVM_DIR)/nvm.sh && \
	nvm install node && \
	nvm use node && \
	nvm alias default node

check-npm:
	@echo "🔍 Checking for npm..."
	@if ! command -v npm >/dev/null 2>&1; then \
		echo "❌ npm not found. Something went wrong with Node installation."; \
		exit 1; \
	else \
		echo "✅ npm is installed."; \
	fi

check-npx:
	@echo "🔍 Checking for npx..."
	@if ! command -v npx >/dev/null 2>&1; then \
		echo "❌ npx not found. Attempting to install it..."; \
		npm install -g npx; \
	else \
		echo "✅ npx is installed."; \
	fi

init-npm:
	@echo "📦 Ensuring package.json exists..."
	@if [ ! -f package.json ]; then \
		echo "🔧 Initializing npm project..."; \
		npm init -y; \
	else \
		echo "✅ package.json already exists."; \
	fi

check-typescript:
	@echo "🔍 Checking for TypeScript..."
	@if ! command -v tsc >/dev/null 2>&1; then \
		echo "❌ TypeScript not found. Installing..."; \
		$(MAKE) install-typescript; \
	else \
		echo "✅ TypeScript is installed."; \
	fi

install-typescript:
	@echo "📥 Installing TypeScript..."
	@npm install -g typescript
	@echo "✅ TypeScript installed."

check-cypress:
	@echo "🔍 Checking for Cypress..."
	@if ! command -v cypress >/dev/null 2>&1; then \
		echo "❌ Cypress not found. Installing..."; \
		$(MAKE) install-cypress; \
	else \
		echo "✅ Cypress is installed."; \
	fi

install-cypress:
	@echo "📥 Installing Cypress..."
	@npm install cypress --save-dev
	@echo "✅ Cypress installed."

install-deps:
	@echo "📦 Installing TypeScript dependencies..."
	@npm install --save-dev typescript @types/node @types/cypress
	@echo "✅ TypeScript dependencies installed."