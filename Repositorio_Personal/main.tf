provider "github" {
  token = var.github_token
  owner = var.nombre_usuario
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

resource "github_repository" "repositorio" {
  name                 = var.nombre_repositorio
  description          = var.descripcion_repositorio
  visibility           = "public"
  auto_init            = true
  gitignore_template   = "Terraform" # Add .gitignore terraform template
  has_issues           = true
  allow_auto_merge     = false
  vulnerability_alerts = true
  has_wiki             = true
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
  branch     = "feature"
}
