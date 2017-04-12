resource "aws_route53_record" "www" {
   
  zone_id = "${aws_route53_zone.domain.zone_id}"
  #(Required) The ID of the hosted zone to contain this record.
   
  name = "www.domain.tld"
  #(Required) The name of the record.
   
  type = "A"
  #(Required) The record type.
   
  ttl = "300"
  #(Required for non-alias records) The TTL of the record.
   
  records = ["${aws_eip.lb.public_ip}"]
  #(Required for non-alias records) A string list of records.

  #set_identifier
  #(Optional) Unique identifier to differentiate records with routing policies from one another. Required if using failover, geolocation, latency, or weighted routing policies documented below.
  
  #health_check_id
  #(Optional) The health check the record should be associated with.
  
  #alias
  #(Optional) An alias block. Conflicts with ttl & records. Alias record documented below.
  
  #failover_routing_policy
  #(Optional) A block indicating the routing behavior when associated health check fails. Conflicts with any other routing policy. Documented below.
  
  #geolocation_routing_policy
  #(Optional) A block indicating a routing policy based on the geolocation of the requestor. Conflicts with any other routing policy. Documented below.
  
  #latency_routing_policy
  #(Optional) A block indicating a routing policy based on the latency between the requestor and an AWS region. Conflicts with any other routing policy. Documented below.
  
  #weighted_routing_policy
  #(Optional) A block indicating a weighted routing policy. Conflicts with any other routing policy. Documented below.

}
