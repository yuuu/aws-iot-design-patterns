//  DynamoDB
// --------------------------------------------------
module "dynamodb" {
  source = "../../modules/dynamodb"
  env    = var.env
}

//  IoT Core
// --------------------------------------------------
module "iot" {
  source               = "../../modules/iot"
  env                  = var.env
  topic                = var.iot["topic"]
  table_name           = module.dynamodb.table_name_sensors
  table_arn            = module.dynamodb.table_arn_sensors
}
