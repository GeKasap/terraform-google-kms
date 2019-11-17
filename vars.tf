variable "name" {
  type = string
  description = "The ID of the key and keyring"
}

variable "project" {
  type = string
  description = "The project name"
  default = ""
}
variable "location" {
  type = string
  description = "The location"
  default = ""
}

variable "service_account" {
  type = list(string)
  description = "The list of service accounts that will use this key"
  default = []
}


