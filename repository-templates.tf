// Create template
resource "github_repository" "default_template" {
  name        = "github-repository-template"
  description = "The default repository template for Github"

  allow_auto_merge       = true
  allow_merge_commit     = true
  allow_rebase_merge     = false
  allow_squash_merge     = false
  allow_update_branch    = true
  archived               = false
  archive_on_destroy     = true
  auto_init              = false
  delete_branch_on_merge = true
  gitignore_template     = "Terraform"
  has_discussions        = true
  has_issues             = true
  has_projects           = false
  has_wiki               = false
  is_template            = true
  license_template       = "gpl-3.0"
  visibility             = "public"
  vulnerability_alerts   = true
}

resource "github_branch" "default_template_main" {
  repository = github_repository.default_template.name
  branch     = "main"
}

resource "github_branch_default" "default_template_main" {
  repository = github_repository.default_template.name
  branch     = github_branch.default_template_main.branch
}
