data "aws_route53_zone" "appstellar-training" {
  name = "appstellar.training"
}
resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.appstellar-training.zone_id
  name    = "jetlir-assignment3.${data.aws_route53_zone.appstellar-training.name}"
  type    = "A"
  ttl     = 300
  records = [data.aws_lb.this.dns_name]
}
data "aws_lb" "this" {
  tags = {
    Name        = "devops-training"
    Environment = "dev"
  }
}