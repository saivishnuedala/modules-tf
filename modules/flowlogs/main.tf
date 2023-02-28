
resource "aws_flow_log" "devflowlogs" {
  log_destination      = var.aws_s3_bucket.s3-11.id
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = var.aws_vpc.play.id
}