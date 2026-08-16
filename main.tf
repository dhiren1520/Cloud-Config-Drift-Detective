data "aws vpc" "default" {
  default = true
}
#created security group for golden baseline, need to add rules to allow only SSH from trusted IP
resource "aws_security_group" "golden_sg" {
  name = "golden-security-group"
  description = "Golden baseline - SSH only from trusted IP"
  vpc_id = data.aws_vpc.default.id

  tags = {
    Name = "Golden-Security-Group"
    Project = "Cloud-Configuration-Drift-Detective"
  }
}
resource "aws_vpc_security_group_ingress_rule" "ssh" {
    security_group_id = aws_security_group.golden_sg.id
    description = "Allow SSH from trusted IP"
    cidr_ipv4 = var.my_ip
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
}
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
    security_group_id = aws_security_group.golden_sg.id
    description = "Allow all outbound traffic"
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
}
resource "aws_s3_bucket" "golden_bucket"{
    bucket_prefix="drift-detective-golden-"
    tags={
        Name = "Golden-Baseline-Bucket"
        Project = "Cloud-Configuration-Drift-Detective"
    }
}
resource "aws_s3_bucket_versioning" "golden_bucket_versioning" {
  bucket = aws_s3_bucket.golden_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}