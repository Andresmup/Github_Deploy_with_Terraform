variable "github_token" {
  description = "Personal access token"
}

variable "nombre_usuario" {
  description = "Nombre de usuario"
}

variable "nombre_repositorio" {
  description = "Nombre del repositorio a crear"
}

variable "descripcion_repositorio" {
  description = "Descripcion repo default"
  default     = "Repositorio creado desde terraform"
}