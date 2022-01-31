variable "budget-amount" {
  description = "The budget limit amount"
  type        = string
}

variable "notification-threshold-equalto" {
  description = "The budget percentage threshold equalto to trigger an alert"
  type        = number
}

variable "notification-threshold-forecasted" {
  description = "The budget percentage threshold for to trigger an alert"
  type        = number
}

variable "email-address" {
  description = "Email address to recieve budget notifications"
  type        = list(any)
}