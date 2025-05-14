resource "random_id" "project_id" {
  byte_length = 4
  prefix      = "${replace(lower(var.project_name), "/\\s+/", "")}-"
}

resource "google_project" "project" {
  name            = var.project_name
  project_id      = random_id.project_id.hex
  billing_account = var.billing_account
  org_id          = var.organization_id
}

data "google_project" "project" {
  project_id = google_project.project.project_id
}

resource "random_id" "account_id" {
  byte_length = 4
  prefix      = "sa-"
}

resource "google_service_account" "sa" {
  account_id = random_id.account_id.hex
  project    = data.google_project.project.project_id
}

resource "google_service_account_key" "sa_key" {
  service_account_id = google_service_account.sa.account_id
}
