# 🚀 AI Content Generator - 15-Factor App with Datadog

A complete implementation of the **15-Factor App** methodology using Python, FastAPI, OpenAI API, and **enterprise-grade observability with Datadog**.

## 🏗️ Project Status

🚧 **Actively in development** – Implementing all 15 factors of the modern methodology

## 📋 Tech Stack

- **Backend**: Python 3.11+, FastAPI, Pydantic  
- **Database**: PostgreSQL 15+, Redis 7+  
- **AI**: OpenAI API (GPT-3.5/GPT-4)  
- **Observability**: Datadog (APM, Logs, Metrics, Tracing)  
- **Container**: Docker, Kubernetes  
- **CI/CD**: GitHub Actions  

## 🎯 15 Factors Implemented

- [x] **I. Codebase** – Single Git repo, multiple deploys  
- [x] **II. Dependencies** – `requirements.txt` + Docker  
- [x] **III. Config** – Pydantic Settings + env vars  
- [x] **IV. Backing Services** – PostgreSQL, Redis, OpenAI as URLs  
- [x] **V. Build, Release, Run** – GitHub Actions CI/CD  
- [x] **VI. Processes** – Stateless FastAPI + Redis sessions  
- [x] **VII. Port Binding** – Self-contained with configurable port  
- [x] **VIII. Concurrency** – Kubernetes HPA  
- [x] **IX. Disposability** – Graceful shutdown  
- [x] **X. Dev/Prod Parity** – Docker Compose = Kubernetes  
- [x] **XI. Logs** – Structured JSON logging  
- [x] **XII. Admin Processes** – Kubernetes Jobs + scripts  
- [x] **XIII. API First** – Auto-generated OpenAPI/Swagger  
- [x] **XIV. Telemetry** – Full observability via Datadog  
- [x] **XV. Authentication/Authorization** – JWT + RBAC  

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/brunovicco/ai-content-generator.git
cd ai-content-generator

# Set up environment
cp .env.example .env
# Edit .env with your API keys

# Run with Docker
docker-compose up -d

# Access the application
open http://localhost:8000/api/docs
