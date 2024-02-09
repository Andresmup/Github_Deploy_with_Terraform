variable "github_token" {
  description = "Personal access token"
}

variable "nombre_organizacion" {
  description = "Nombre organizacion"
}


variable "nombre_administrador" {
  description = "Nombre administrador"
  default     = "Administrador"
}

variable "nombre_admin_team" {
  description = "Nombre admin team"
  default     = "Admin team"
}


variable "nombre_dev1_team" {
  description = "Nombre dev team"
  default     = "Dev 1 team"
}

variable "nombre_dev2_team" {
  description = "Nombre dev team"
  default     = "Dev 2 team"
}

variable "nombre_testing_team" {
  description = "Nombre testing team"
  default     = "Testing team"
}

variable "nombre_repositorio_default" {
  description = "Nombre repo default"
  default     = "MainProject"
}

variable "descripcion_repositorio_default" {
  description = "Descripcion repo default"
  default     = "Main Project"
}