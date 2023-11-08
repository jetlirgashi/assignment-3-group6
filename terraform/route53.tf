data "aws_route53_zone" "appstellar-training" {
  name = "appstellar.training"
}
resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.appstellar-training.zone_id
  name    = "jetlir-assignment3.${data.aws_route53_zone.appstellar-training.name}"
  type    = "A"

  alias {
    name                   = data.aws_lb.this.dns_name
    zone_id                = data.aws_lb.this.zone_id
    evaluate_target_health = true
  }

}
data "aws_lb" "this" {
  tags = {
    Name        = "devops-training"
    Environment = "dev"
  }
}