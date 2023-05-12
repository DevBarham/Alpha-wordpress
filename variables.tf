variable "db" {
  type        = string
  default     = "alpha"
  description = "Database name"
}

variable "user" {
  type        = string
  default     = "team-alpha"
  description = "Username required"
}

variable "pass" {
  type        = string
  default     = "passy123"
  description = "Password required"
}

variable "theme" {
  type = string
  default = "https://downloads.wordpress.org/theme/oceanwp.3.4.3.zip"
  description = "Provide your custome theme"
}