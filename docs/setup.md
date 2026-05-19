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

## Branch protection

Después de que los workflows de GitHub Actions (`ci-infra.yml` y
`ci-general.yml`) corran al menos una vez, configurar la regla de
protección de la rama `main` en:

https://github.com/zapata-dev/BI-Plat/settings/branches

Pasos:

1. Click en **Add branch protection rule**.
2. **Branch name pattern:** `main`
3. Activar **Require a pull request before merging**.
4. Activar **Require status checks to pass before merging** y agregar
   como status checks requeridos (aparecen en el selector después del
   primer run de cada workflow):
   - `Terraform fmt + validate`
   - `Verificar estructura del repo`
5. Activar **Do not allow bypassing the above settings**.
6. Guardar con **Create** / **Save changes**.

A partir de aquí, ningún PR podrá mergearse a `main` sin que ambos
checks estén en verde.
