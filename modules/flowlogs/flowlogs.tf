
resource "aws_flow_log" "flowlogs" {
  log_destination      = var.bucket_id
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = var.vpc_id
}