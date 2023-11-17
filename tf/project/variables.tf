variable "proj_environment"{
  description = "Project environment"
  type        = string
}


variable "proj_resources"{
  description = "Project resources ( array of urns)"
  type        = list(string)
}

variable "do_token" {
  type        = string
}