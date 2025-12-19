#!/bin/bash

# AI Receptionist Agent - Installation Script
# This script helps you set up the AI Receptionist Agent workflow

set -e

echo "======================================"
echo "AI Receptionist Agent - Setup"
echo "======================================"
echo ""

# Check for Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed."
    echo "Please install Node.js v18 or higher from https://nodejs.org/"
    exit 1
fi

NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "⚠️  Node.js version 18 or higher is required."
    echo "Current version: $(node -v)"
    echo "Please upgrade Node.js from https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js $(node -v) detected"
echo ""

# Check for npm
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed."
    exit 1
fi

echo "✅ npm $(npm -v) detected"
echo ""

# Install n8n
echo "📦 Installing n8n..."
echo ""

read -p "Do you want to install n8n globally? (y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing n8n globally..."
    npm install -g n8n
    echo ""
    echo "✅ n8n installed successfully!"
else
    echo "Installing n8n locally..."
    npm install
    echo ""
    echo "✅ Dependencies installed successfully!"
    echo "Use 'npm run start' to run n8n"
fi

echo ""
echo "======================================"
echo "Installation Complete! 🎉"
echo "======================================"
echo ""
echo "Next steps:"
echo "1. Start n8n:"
echo "   - If installed globally: n8n start"
echo "   - If installed locally: npm run start"
echo ""
echo "2. Open http://localhost:5678 in your browser"
echo ""
echo "3. Import the workflow:"
echo "   - Go to Workflows → Import from File"
echo "   - Select: AI_Receptionist_Agent (1).json"
echo ""
echo "4. Configure credentials:"
echo "   - OpenAI API (get key from https://platform.openai.com/api-keys)"
echo "   - Google Calendar OAuth2"
echo ""
echo "For more details, see README.md"
echo ""
