# Infraestructura Terraform

## Prerrequisito
`gcloud` autenticado con una cuenta `@zapata.com.mx`.

## Bootstrap (solo la primera vez)
Crear bucket remoto para `tfstate`:

```bash
gcloud storage buckets create gs://zapata-bi-dev-tfstate \
  --project=zapata-bi-dev \
  --location=US \
  --uniform-bucket-level-access
```

## Inicializar
```bash
terraform init
```

## Planear
```bash
terraform plan -var-file=terraform.tfvars
```

## Aplicar
```bash
terraform apply -var-file=terraform.tfvars
```

## Advertencia
Nunca correr `terraform apply` en `main` directamente; siempre desde una rama de feature con PR aprobado.
