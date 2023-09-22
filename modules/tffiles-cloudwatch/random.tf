resource "random_id" "this" {
  keepers = {
    id = var.environment
  }

  byte_length = 4
}
