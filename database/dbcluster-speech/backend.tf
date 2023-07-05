terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "frankspeech"

    workspaces {
      prefix = "mysql-speech-"
    }
  }
}
