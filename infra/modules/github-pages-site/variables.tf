variable "github_owner" {
  description = "GitHub user or organization that owns the repository."
  type        = string
}

variable "repo_name" {
  description = "Name of the GitHub repository."
  type        = string
}

variable "description" {
  description = "Repository description shown on the GitHub page."
  type        = string
  default     = ""
}

variable "visibility" {
  description = "Repository visibility. Must be 'public' for GitHub Pages on the free plan."
  type        = string
  default     = "public"

  validation {
    condition     = contains(["public", "private", "internal"], var.visibility)
    error_message = "visibility must be one of: public, private, internal."
  }
}

variable "homepage_url" {
  description = "Optional homepage URL surfaced on the repo page."
  type        = string
  default     = ""
}

variable "topics" {
  description = "Repository topics (GitHub-side tags)."
  type        = list(string)
  default     = []
}

variable "pages_branch" {
  description = "Branch GitHub Pages serves from."
  type        = string
  default     = "main"
}

variable "pages_path" {
  description = "Path within the branch GitHub Pages serves from. Must be '/' or '/docs'."
  type        = string
  default     = "/"

  validation {
    condition     = contains(["/", "/docs"], var.pages_path)
    error_message = "pages_path must be '/' or '/docs'."
  }
}

variable "has_issues" {
  description = "Enable issues on the repo."
  type        = bool
  default     = true
}

variable "has_wiki" {
  description = "Enable wiki on the repo."
  type        = bool
  default     = false
}

variable "has_projects" {
  description = "Enable projects on the repo."
  type        = bool
  default     = false
}
