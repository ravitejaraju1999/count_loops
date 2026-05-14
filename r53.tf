resource "aws_route53_record" "roboshop" {
  count   = length(var.instances) # it returns count value dynamically based on length of list
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}" #mongodb.raviteja.store
  type    = "A"
  ttl     = 300
  records = [aws_instance.terraform[count.index].private_ip] # it returns private ip of each instance based on count index
  allow_overwrite = true
}