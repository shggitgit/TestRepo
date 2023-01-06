terraform {

        backend "s3" {
	profile = "lambdauser"
        bucket = "p-2026-bucket"
        key = "terraform.tfstate"
        region =  "us-east-2"
        }
}


resource "aws_dynamodb_table" "base_dynamo_table" {
  name           = "a-${var.EnvironmentType}-${var.table_name}"
  billing_mode   = var.billing_mode
  read_capacity  = var.read_attribute
  write_capacity = var.write_attribute
  hash_key       = var.table_attribute

  attribute {
    name = var.table_attribute
    type = var.attribute_type
  }

 point_in_time_recovery {
    enabled = var.enable_point_in_time_recovery
  }

  tags = local.tags

}
