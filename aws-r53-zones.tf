resource "aws_route53_zone" "domain_pub" {
  count = "${var.aws_r53_zone_pub}"
  name  = "${var.aws_r53_zone_pub_name}"
}
resource "aws_route53_zone" "domain_prv" {
  count   = "${var.aws_r53_zone_prv}"
  name    = "${var.aws_r53_zone_prv_name}"
}

/*
resource "aws_route53_zone" "domain_pub" {
  count = "${var.aws_r53_zone_pub}"
  name  = "domain.tld"
  #(Required) This is the name of the hosted zone.
  
  comment = ""
  #(Optional) A comment for the hosted zone. Defaults to 'Managed by Terraform'.
  
  tags = {}
  #(Optional) A mapping of tags to assign to the zone.
  
  vpc_id = ""
  #(Optional) The VPC to associate with a private hosted zone. Specifying vpc_id will create a private hosted zone. Conflicts w/ delegation_set_id as delegation sets can only be used for public zones.
  
  vpc_region = ""
  #(Optional) The VPC's region. Defaults to the region of the AWS provider.
  
  delegation_set_id = ""
  #(Optional) The ID of the reusable delgation set whose NS records you want to assign to the hosted zone. Conflicts w/ vpc_id as delegation sets can only be used for public zones.
  
  force_destroy = "true"
  #(Optional) Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone.
}
*/
