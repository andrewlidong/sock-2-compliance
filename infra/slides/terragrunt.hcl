include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../modules/github-pages-site"
}

inputs = {
  github_owner = "andrewlidong"
  repo_name    = "http-sockets"
  description  = "Slides for the Recurse Center socks talk."
  homepage_url = "https://andrewlidong.github.io/http-sockets/slides/"

  # Public is required for GitHub Pages on the free plan.
  visibility = "public"

  pages_branch = "main"
  pages_path   = "/"

  topics = [
    "slides",
    "reveal-js",
    "socks",
    "non-programming-talk",
  ]
}
