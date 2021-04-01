terraform {
  backend "remote" {
    organization = "your_TFC_org"

    workspaces {
      name = "your_TFC_workspace"
    }
  }
}