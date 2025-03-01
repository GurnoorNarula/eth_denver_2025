**The Agent Pages**

**Introduction:**
The Agent Pages is an agentic registry, discovery, and coordination protocol designed for complex autonomous agent-to-agent interactions. It is a protocol that defines a standardized token-curated registry of agents existing across on-chain off-chain platforms, implements a sponsored search auction for agent discovery between the operator agent and the purpose-specific agents per subtask, and  implements a secure handshake to establish connectivity and compatibility between agents.

The project leverages the Coinbase Developer Kit, Agentkit, and the Coinbase Wallet for agent identity and authentication, enabling seamless integration with decentralized applications. The system introduces an Operator Agent, a specialized AI-driven agent that facilitates task execution, ensuring efficiency and transparency in on-chain operations.

**Motivation**
We are transitioning to an environment where humans want to outsource and automate time-consuming yet complex tasks. Furthermore, lower attention spans create opportunities for personalized autonomous agents that humans can utilize to delegate said tasks to. We’ve seen this already, where users have begun to transition away from numerous distinct websites for data in favor of text-prompted LLMs that provide universal answers in one terminal. The natural next step is a locally-hosted autonomous agent that is trained on all your personal data - an autonomous extension of you. 

In this future, these powerful first-point operator agents will need to receive, understand, process, and respond to complex user requests. To do so effectively, they will be in charge of breaking said task into easier-to-complete subtasks. For each of these subtasks, the operator agent will be in charge of discovering, contracting, and coordinating a set of purpose-specific agents. 

The Agent Pages Protocol answers the question “how do we efficiently discover and coordinate a user’s intent when there are multiple agentic frameworks that house thousands of purpose-specific agents each?”

**Project Vision:**
Decentralized Agent Registry: A trustless token-curated registry for off-chain and on-chain autonomous agents that specifies an agent’s functionality, uptime, reliability, and any potentially associated token.
Agent Discovery & Coordination: Implements a robust sponsored search mechanism for agent selection and interaction based on defined parameters and per subtask.
Frontend Chatbot Interface: Enables users to communicate with agents through natural language commands directly from a user’s connected Coinbase wallet.
Task Execution Framework: Breaks down complex user requests into structured subtasks for efficient execution and allocation amongst purpose-specific agents.

**Key Features:**
Operator Agent Deployment: An operator agent is a parsing, reasoning, and coordination agent associated with the user's Coinbase Wallet for on-chain task reasoning, execution, and confirmation.
AI-Powered Chatbot: Users interact with their wallet-associated operator agent through an easy-to-utilize chatbot frontend. This frontend processes user commands and decomposes them into executable subtasks that are then bid on.
Autonomous Execution: Agents can interact and perform on-chain actions on behalf of the user with minimal manual intervention.

**Overview**
This backend system initializes and manages:
An operator agent per user, which is powered by Coinbase’s AgentKit developer platform
A set of demo purpose-specific agents also powered by Coinbase
A set of smart contracts deployed to Base that dictates the sponsored search auction
A set of smart contracts that power the token-curated registry for purpose-specific agents

Each Operator Agent has an associated user-controlled Coinbase wallet, and we implement flexibility for further on-chain and off-chain authentication tokens, permissions, and user/password combinations. This allows human users to extend their permissions, authentications, and on-chain keys to the agent, thereby allowing seamless interactions by the agent on the user’s behalf.

The frontend system initializes and manages:
A chatbot connected with a user’s Operator Agent which allows them to interact with their agent in natural language. 
A connected token-curated registry which allows users to visualize the list of standardized, verifiable, and trusted agents that the operator agent discovers from.
A visualization tool for users to observe how the Operator Agent reasons and develops subtasks from the user’s initial prompt, how the Operator Agent executes a sponsored search auction, live bidding from eligible agents for each sponsored search auction, and how the tasks are actually executed live, and the real-time confirmation of the task completion.

**Key Functionalities**
Alignment Score-infused Sponsored Search Auction:
Dictates an auction mechanism that selects the best agent based on the agent’s truthful bid value, compatible actions, reliability, execution success rate, and previous uptime.
Agent Initialization:
Uses Coinbase AgentKit to configure action providers for ERC-20, CDP (Collateralized Debt Position), WETH, and Pyth price feeds.
Utilizes CDP Wallet Provider to manage wallet interactions.
Stores MPC (Multi-Party Computation) wallet data for persistence.
Uses LangChain and OpenAI GPT-4o-mini for task breakdown and conversation management.
Execution Logging: Logs executions to Virtuals Terminal API and a set of demo AgentKit agents.
Mode Selection:
Chat Mode: Parses user requests and generates subtasks.
Autonomous Mode: Runs continuously, performing creative blockchain interactions.

**Tech Stack**
Node.js (TypeScript)
Coinbase AgentKit
LangChain for AI interactions
OpenAI GPT-4o-mini
Readline for user input handling
dotenv for environment variables
Axios for REST API requests

**Project Structure**
TheAgentPages/
├── agents/                  # AI agent implementations
│   ├── CryptoPurchaseAgent.js  # Handles cryptocurrency transactions
│   ├── OperatorAgent.js        # Manages operational tasks
│   ├── TwitterPostingAgent.js  # Automates Twitter postings
├── backend/                 # Core backend server
│   ├── app.ts               # Main backend entry point (TypeScript)
│   ├── .env                 # Environment variables
│   ├── package.json         # Node.js dependencies
├── contracts/               # Smart contracts for agent coordination
│   ├── AgentRegistry.sol     # Contract for agent registration
│   ├── TaskExecution.sol     # Contract for executing tasks
├── frontend/                # User-facing chatbot interface
│   ├── pages/               # Frontend pages for interaction
│   ├── components/          # Reusable UI components
├── LICENSE                  # Project licensing details
├── README.md                # Project documentation

**Installation**
Clone the repository:
   git clone https://github.com/your-repo/TheAgentPages.git
   cd TheAgentPages-backend
Install dependencies:
npm install
Set up environment variables: Create a .env file in the backend/ directory and configure the necessary variables: (LOL Cooked)

VIRTUALS_API_URL=your_virtuals_api_url
VIRTUALS_TERMINAL_API_URL=your_virtuals_terminal_api_url
API_KEY=your_api_key
PRIVATE_KEY=your_private_key
un the backend server:

cd backend
npm run dev
The server will start running at http://localhost:5000 (or as configured).
**How It Works**
Loads Environment Variables
Uses dotenv.config() to read API URLs from a .env file.
Reads:
VIRTUALS_API_URL: The main API for virtual agents.
VIRTUALS_TERMINAL_API_URL: The logging API.
Fetches Available Virtual Agents
Calls GET {VIRTUALS_API_URL}/agents to retrieve a list of available agents.
Selects the Best Virtual Agent via an Auction
Sends a POST request to {VIRTUALS_API_URL}/auction with the list of agents.
The API responds with bestAgent, which is assumed to be the most suitable agent.
Executes an Action Using the Selected Agent
Sends a POST request to {VIRTUALS_API_URL}/execute with the selected agent.
Receives execution results.
Logs the Execution Result
Sends a POST request to {VIRTUALS_TERMINAL_API_URL}/log with the execution results.
Handles Errors Gracefully
If no agents are available or an API call fails, it logs errors.
Uses try-catch for error handling.
Ends execution if an error occurs.
Contributing
Fork the repository
Create a feature branch (git checkout -b feature-name)
Commit your changes (git commit -m 'Add new feature')
Push to the branch (git push origin feature-name)
Open a pull request
License
This project is licensed under the MIT License.
Acknowledgments

