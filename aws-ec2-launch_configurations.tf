resource "aws_launch_configuration" "node" {
  depends_on = ["aws_iam_role.ec2-instance-profile", "aws_key_pair.app", "template_file.ec2-instance_userdata"]
  
  name = "ec2-lc-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  
  image_id      = "${data.aws_ami.centos7.id}"
  instance_type = "${var.ec2_instance_type}"
  
  key_name              = "${aws_key_pair.app.key_name}"
  iam_instance_profile  = "${aws_iam_instance_profile.node.name}"
  security_groups       = ["${aws_security_group.vpc-prv-ec2-inst.id}", "${aws_security_group.vpc-prv-ec2-inst-bal_offices_access.id}", "${aws_security_group.vpc-prv-ec2-inst-remote_access.id}"]
  
  user_data = "${template_file.ec2-instance_userdata.rendered}"
  
  enable_monitoring = false
  
  root_block_device {
    volume_type           = "gp2"
    volume_size           = "10"
    delete_on_termination = true
  }
}
