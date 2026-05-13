# infra

Terraform + Terragrunt for the GitHub repo and Pages site that hosts the slides.

```
infra/
├── terragrunt.hcl                       # root: provider + backend
├── slides/
│   └── terragrunt.hcl                   # one unit per site
└── modules/
    └── github-pages-site/               # reusable module
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        └── versions.tf
```

## Prerequisites

- Terraform >= 1.6
- Terragrunt >= 0.55
- A GitHub token with `repo` scope:
  ```sh
  export GITHUB_TOKEN=$(gh auth token)
  ```

## First time: import the existing repo

The `http-sockets` repo already exists, so we import it into Terraform state
instead of letting Terraform try to create a duplicate.

```sh
cd infra/slides
terragrunt init
terragrunt import github_repository.this http-sockets
```

## Plan and apply

```sh
terragrunt plan
terragrunt apply
```

The first apply will:

1. Flip the repo from private to **public** (required for free-plan Pages).
2. Enable GitHub Pages, serving from `main` at the root path.
3. Apply the configured description, homepage URL, and topics.

The slides will be live at <https://andrewlidong.github.io/http-sockets/slides/>
within a minute or two of the apply finishing.

## Common operations

| Task                       | Command                                 |
| -------------------------- | --------------------------------------- |
| Preview changes            | `terragrunt plan`                       |
| Apply changes              | `terragrunt apply`                      |
| Inspect outputs            | `terragrunt output`                     |
| Take repo private again    | Set `visibility = "private"`, apply     |
| Change Pages source branch | Set `pages_branch`, apply               |

## State

State is stored locally next to each unit (`infra/slides/terraform.tfstate`).
It can contain sensitive data, so it is gitignored at the repo root.

If you want to share state across machines, switch the `remote_state` block
in the root `terragrunt.hcl` to an S3 / GCS / Terraform Cloud backend.

## Safety

The `github_repository.this` resource has `lifecycle.prevent_destroy = true`
so a stray `terragrunt destroy` cannot delete the repo. Remove it temporarily
if you ever need to tear the repo down.
