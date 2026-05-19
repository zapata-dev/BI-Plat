# Setup

## Prerrequisitos
- Node.js 20+
- Python 3.12+
- gcloud CLI autenticado
- Terraform 1.5+
- Docker Desktop

## Pasos iniciales
1. Clonar el repo
2. Copiar `.env.example` a `.env` y completar valores
3. `cd infra && terraform init`
4. `cd backend && python -m venv .venv && .venv\Scripts\activate && pip install -r requirements.txt`
5. `cd frontend && npm install`
