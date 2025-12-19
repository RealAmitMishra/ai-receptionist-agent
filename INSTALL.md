# Installation Guide

This guide provides detailed installation instructions for the AI Receptionist Agent.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation Methods](#installation-methods)
  - [Automated Installation (Recommended)](#automated-installation-recommended)
  - [Manual Installation](#manual-installation)
- [Configuration](#configuration)
- [Troubleshooting](#troubleshooting)

## Prerequisites

Before installing the AI Receptionist Agent, ensure you have:

### Required Software
- **Node.js**: Version 18 or higher ([Download](https://nodejs.org/))
- **npm**: Usually comes with Node.js
- **Git**: For cloning the repository ([Download](https://git-scm.com/))

### Required Accounts & API Keys
1. **OpenAI Account**
   - Sign up at [OpenAI](https://platform.openai.com/)
   - Generate an API key from the [API Keys page](https://platform.openai.com/api-keys)
   - Ensure you have credits or an active subscription

2. **Google Calendar Account**
   - A Google account with Calendar access
   - You'll need to set up OAuth2 credentials in n8n

## Installation Methods

### Automated Installation (Recommended)

The easiest way to install the AI Receptionist Agent is using the provided installation scripts.

#### On Linux/macOS:

```bash
# Clone the repository
git clone https://github.com/RealAmitMishra/ai-receptionist-agent.git
cd ai-receptionist-agent

# Run the installation script
./install.sh
```

#### On Windows:

```cmd
# Clone the repository
git clone https://github.com/RealAmitMishra/ai-receptionist-agent.git
cd ai-receptionist-agent

# Run the installation script
install.bat
```

The script will:
1. Check if Node.js is installed and verify the version
2. Prompt you to install n8n globally or locally
3. Install all necessary dependencies
4. Provide next steps for configuration

### Manual Installation

If you prefer to install manually or need more control:

```bash
# Clone the repository
git clone https://github.com/RealAmitMishra/ai-receptionist-agent.git
cd ai-receptionist-agent

# Install n8n globally (option 1)
npm install -g n8n

# OR install n8n locally (option 2)
npm install
```

## Configuration

After installation, follow these steps to configure the workflow:

### 1. Start n8n

**If installed globally:**
```bash
n8n start
```

**If installed locally:**
```bash
npm run start
```

### 2. Access n8n Interface

Open your browser and navigate to:
```
http://localhost:5678
```

Create an account or log in if you already have one.

### 3. Import the Workflow

1. In n8n, click on **Workflows** in the left sidebar
2. Click **Import from File**
3. Select the `AI_Receptionist_Agent (1).json` file from the repository
4. The workflow will be imported and opened

### 4. Configure OpenAI Credentials

1. Click on the **"OpenAI Chat Model"** node in the workflow
2. Click **"Create New Credential"** (or select existing)
3. Enter your OpenAI API key
4. Click **"Save"**

### 5. Configure Google Calendar Credentials

1. Click on either **"Google Calendar"** node in the workflow
2. Click **"Create New Credential"**
3. Follow the OAuth2 flow:
   - You'll be redirected to Google to authorize access
   - Grant the necessary permissions
   - You'll be redirected back to n8n
4. Update the calendar ID in both Google Calendar nodes to your calendar
5. Click **"Save"**

### 6. Configure the Webhook

1. Click on the **"Webhook"** node
2. Note the webhook URL (e.g., `http://localhost:5678/webhook/7cf0b972-...`)
3. This URL will be used to receive appointment requests

### 7. Activate the Workflow

1. Click the **"Active"** toggle at the top of the workflow editor
2. The workflow is now running and ready to receive requests

## Testing the Installation

Test your installation by sending a POST request to the webhook URL:

```bash
curl -X POST http://localhost:5678/webhook/YOUR-WEBHOOK-ID \
  -H "Content-Type: application/json" \
  -d '{
    "body": {
      "message": {
        "toolCalls": [{
          "id": "test-123",
          "function": {
            "arguments": {
              "Name": "John Doe",
              "Phone Number": "+1234567890",
              "Email Address": "john@example.com",
              "Date and Time": "2024-06-05T15:00:00Z"
            }
          }
        }]
      }
    }
  }'
```

Replace `YOUR-WEBHOOK-ID` with your actual webhook ID.

## Troubleshooting

### Node.js Version Issues

**Problem**: Error about Node.js version

**Solution**: 
```bash
# Check your Node.js version
node -v

# If below v18, update Node.js from https://nodejs.org/
```

### n8n Installation Fails

**Problem**: Permission errors during global installation

**Solution**: 
- On Linux/macOS, use `sudo`:
  ```bash
  sudo npm install -g n8n
  ```
- Or install locally instead:
  ```bash
  npm install
  npm run start
  ```

### Port 5678 Already in Use

**Problem**: n8n won't start because port is in use

**Solution**: Use a different port:
```bash
n8n start --port 5679
```

### OpenAI API Errors

**Problem**: Errors when testing the workflow

**Solution**:
- Verify your API key is correct
- Ensure you have credits in your OpenAI account
- Check the API key has proper permissions

### Google Calendar Authorization Issues

**Problem**: Can't authorize Google Calendar

**Solution**:
- Ensure you're using the correct Google account
- Try clearing browser cache and cookies
- Make sure third-party cookies are enabled
- Check that n8n has proper permissions in your Google account settings

### Workflow Doesn't Import

**Problem**: Error importing the JSON file

**Solution**:
- Ensure you're using a compatible version of n8n (1.0.0+)
- Verify the JSON file is not corrupted
- Try downloading the file again from the repository

## Additional Resources

- [n8n Documentation](https://docs.n8n.io/)
- [OpenAI API Documentation](https://platform.openai.com/docs/)
- [Google Calendar API](https://developers.google.com/calendar)

## Getting Help

If you encounter issues not covered in this guide:

1. Check the [n8n Community Forum](https://community.n8n.io/)
2. Review the [GitHub Issues](https://github.com/RealAmitMishra/ai-receptionist-agent/issues)
3. Open a new issue with:
   - Your operating system
   - Node.js version (`node -v`)
   - n8n version
   - Error messages or screenshots
   - Steps to reproduce the issue
