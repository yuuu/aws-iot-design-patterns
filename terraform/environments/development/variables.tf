variable "env" {
  type    = string
  default = "development"
}
variable "iot" {
  type = map(any)
  default = {
    topic = "aws-iot-design-patterns/development/*"
  }
}
