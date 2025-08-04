# Makefile: Auto-install nvm, latest Node.js, npm, and Cypress (local install)
SHELL := /bin/bash
NVM_DIR := $(HOME)/.nvm

.PHONY: all check-nvm install-nvm check-node check-npm check-cypress install-cypress

all: check-nvm check-node check-npm check-cypress

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
	@echo "🔍 Checking for Node.js (via nvm)..."
	@source $(NVM_DIR)/nvm.sh && \
	nvm install node && \
	nvm use node && \
	nvm alias default node

check-npm:
	@echo "🔍 Checking for npm..."
	@if ! command -v npm >/dev/null 2>&1; then \
		echo "❌ npm not found even after installing Node. Aborting."; \
		exit 1; \
	else \
		echo "✅ npm is installed."; \
	fi

check-cypress:
	@echo "🔍 Checking for Cypress in node_modules..."
	@if [ ! -d "./node_modules/cypress" ]; then \
		echo "❌ Cypress not found. Installing..."; \
		$(MAKE) install-cypress; \
	else \
		echo "✅ Cypress is already installed."; \
	fi

install-cypress:
	@echo "📦 Installing Cypress..."
	@npm install --save-dev cypress