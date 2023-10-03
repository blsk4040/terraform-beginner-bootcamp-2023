variable "user_uuid" {
  description = "User UUID in a specific format"
  type        = string

  validation {
    condition     = can(regex("^([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$", var.user_uuid))
    error_message = "User UUID must be in the format of a UUID (e.g., 123e4567-e89b-12d3-a456-426655440000)"
  }
}

variable "bucket_name" {
  description = "AWS S3 bucket name"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9.-]{3,255}$", var.bucket_name))
    error_message = "Bucket name must consist of lowercase letters, numbers, hyphens, and periods and be between 3 and 255 characters in length."
  }
}
