variable "aws_instance_type" {
  description = "What type of instence do you want to create"
  type        = string
  validation {
    condition = var.aws_instance_type=="t2.micro" || var.aws_instance_type=="t3.nano" || var.aws_instance_type=="t3.micro"
    error_message = "Instance type must be either t2.micro, t3.nano or t3.micro"
  }
}

variable "ec2_config" {
    type = object({
        volume_size = number
        volume_type = string
    })
    default = {
      volume_size = 20
      volume_type = "gp2"
    }
}

variable "additional_tags" {
  type = map(string)  #expecting a map of string key-value pairs
  default = {}
}