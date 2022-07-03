output "table_name_sensors" {
  value = aws_dynamodb_table.sensors.name
}
output "table_arn_sensors" {
  value = aws_dynamodb_table.sensors.arn
}
