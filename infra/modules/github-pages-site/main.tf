resource "github_repository" "this" {
  name         = var.repo_name
  description  = var.description
  homepage_url = var.homepage_url
  visibility   = var.visibility
  has_issues   = var.has_issues
  has_wiki     = var.has_wiki
  has_projects = var.has_projects
  auto_init    = false
  topics       = var.topics

  pages {
    source {
      branch = var.pages_branch
      path   = var.pages_path
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}
