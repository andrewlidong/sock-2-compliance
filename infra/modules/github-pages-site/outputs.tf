output "repo_full_name" {
  description = "owner/name of the managed repo."
  value       = github_repository.this.full_name
}

output "repo_url" {
  description = "Web URL of the repo."
  value       = github_repository.this.html_url
}

output "pages_url" {
  description = "Web URL of the GitHub Pages site, once available."
  value       = try(github_repository.this.pages[0].html_url, null)
}

output "pages_status" {
  description = "GitHub Pages build status."
  value       = try(github_repository.this.pages[0].status, null)
}
