# 🤖 AI Receptionist Agent

An AI-powered virtual receptionist that handles appointment scheduling using a smart agent, natural language input, and Google Calendar integration.

## 🚀 Quick Start

```bash
# Clone and install
git clone https://github.com/RealAmitMishra/ai-receptionist-agent.git
cd ai-receptionist-agent
./install.sh  # or install.bat on Windows

# Start n8n
npm run start

# Open http://localhost:5678 and import the workflow
```

See [INSTALL.md](INSTALL.md) for detailed installation instructions.

---

## 🧠 What It Does

This agent automates the appointment booking process by:
- Receiving appointment requests via webhook
- Parsing user inputs (Name, Phone, Email, Date & Time)
- Checking availability in Google Calendar
- Booking the appointment if available
- Suggesting 3 alternatives if the time slot is taken
- Responding with a confirmation or alternative suggestions

---

## ⚙️ Features

- Uses OpenAI (GPT-4o) for natural language processing
- Integrates with Google Calendar for real-time scheduling
- Responds with dynamic messages based on availability
- Designed for 30-minute appointment slots
- Built entirely in n8n using modular nodes

---

## 📂 Project Files

- `AI_Receptionist_Agent (1).json` — Full n8n workflow
- `README.md` — This file
- `INSTALL.md` — Detailed installation guide
- `package.json` — Node.js package configuration
- `install.sh` — Installation script for Linux/macOS
- `install.bat` — Installation script for Windows
- `.gitignore` — Git ignore configuration

---

## 📦 Installation

### Prerequisites

- Node.js (v18 or higher)
- npm or yarn package manager
- An OpenAI API key
- A Google Calendar account with API access

### Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/RealAmitMishra/ai-receptionist-agent.git
   cd ai-receptionist-agent
   ```

2. **Install n8n**
   ```bash
   npm install
   npm run install-n8n
   ```
   
   Or install n8n globally:
   ```bash
   npm install -g n8n
   ```

3. **Start n8n**
   ```bash
   npm run start
   ```
   
   Or if installed globally:
   ```bash
   n8n start
   ```

4. **Access n8n**
   - Open your browser and navigate to `http://localhost:5678`
   - Create an account or log in

---

## 🔄 How to Use

1. **Import the workflow**
   - In n8n, go to **Workflows** → **Import from File**
   - Select the `AI_Receptionist_Agent (1).json` file from this repository
   - The workflow will be imported into your n8n instance

2. **Set up credentials**
   - **OpenAI API**: 
     - Click on the "OpenAI Chat Model" node
     - Add your OpenAI API credentials
     - Get your API key from [OpenAI Platform](https://platform.openai.com/api-keys)
   
   - **Google Calendar**:
     - Click on the "Google Calendar" nodes
     - Add your Google Calendar OAuth2 credentials
     - Follow the authentication flow to grant access

3. **Configure the webhook**
   - Click on the "Webhook" node
   - Note the webhook URL (it will be displayed in the node)
   - Update the calendar ID in both Google Calendar nodes to match your calendar

4. **Activate and test**
   - Click "Activate" to enable the workflow
   - Test via a POST request to the webhook URL with appointment details
   - Example payload:
     ```json
     {
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
     }
     ```

---

## 🛡 Rules Embedded in the Agent

- Always check availability before booking
- If unavailable, provide 3 closest alternatives
- If available, confirm booking
- All appointments default to 30 minutes

---

## 💬 Example Use Case

> “Hi, I’d like to book an appointment with John Doe on June 5th at 3 PM.”

➡️ Response:  
> “The appointment has been booked.”  
> or  
> “The requested time is unavailable, these times are: 3:30 PM, 4:00 PM, 4:30 PM.”

---

Let me know if you want a cool project thumbnail or want to bundle a demo GIF for the GitHub repo.
