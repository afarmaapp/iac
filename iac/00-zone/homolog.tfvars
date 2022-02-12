region           = "us-east-1"
team             = "afarma"
dns              = "${local.zones[terraform.workspace]}"
alternative_names = ["*.${local.zones[terraform.workspace]}"]