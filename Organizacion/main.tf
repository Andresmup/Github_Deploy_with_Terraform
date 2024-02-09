provider "github" {
  token = var.github_token
  owner = var.nombre_organizacion
}

terraform {
  required_version = "~> 1.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}


data "github_user" "administrador" {
  username = var.nombre_administrador
}

resource "github_team" "admin_team" {
  name = var.nombre_admin_team
}

resource "github_team" "dev1_team" {
  name = var.nombre_dev1_team
}

resource "github_team" "dev2_team" {
  name = var.nombre_dev2_team
}

resource "github_team" "testing_team" {
  name = var.nombre_testing_team
}

resource "github_repository" "repositorio" {
  name                 = var.nombre_repositorio_default
  description          = var.descripcion_repositorio_default
  visibility           = "public"
  auto_init            = true
  gitignore_template   = "Terraform" # Add .gitignore terraform template
  has_issues           = true
  allow_auto_merge     = false
  vulnerability_alerts = true


}


resource "github_branch_protection" "proteccion_branch" {
  repository_id = github_repository.repositorio.name

  pattern          = "main"
  enforce_admins   = true
  allows_deletions = true

  required_status_checks {
    strict   = false
    contexts = ["ci/travis"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    restrict_dismissals   = true
    dismissal_restrictions = [
      data.github_user.administrador.node_id,
      github_team.admin_team.node_id,
    ]
  }
}


resource "github_branch" "release" {
  repository = github_repository.repositorio.name
  branch     = "release"

}

resource "github_branch" "develop" {
  repository = github_repository.repositorio.name
  branch     = "develop"

}

resource "github_branch" "testing" {
  repository = github_repository.repositorio.name
  branch     = "testing"

}

resource "github_branch" "dev1" {
  repository = github_repository.repositorio.name
  branch     = "dev1"
}

resource "github_branch" "dev2" {
  repository = github_repository.repositorio.name
  branch     = "dev2"
}

resource "github_team_repository" "admin_team_repo" {
  team_id    = github_team.admin_team.id
  repository = github_repository.repositorio.name
  permission = "admin"
}

resource "github_team_repository" "dev1_team_repo" {
  team_id    = github_team.dev1_team.id
  repository = github_repository.repositorio.name
  permission = "push" # Puedes ajustar los permisos según tus necesidades
}

resource "github_team_repository" "dev2_team_repo" {
  team_id    = github_team.dev2_team.id
  repository = github_repository.repositorio.name
  permission = "push" # Puedes ajustar los permisos según tus necesidades
}

resource "github_team_repository" "testing_team_repo" {
  team_id    = github_team.testing_team.id
  repository = github_repository.repositorio.name
  permission = "pull" # Puedes ajustar los permisos según tus necesidades
}