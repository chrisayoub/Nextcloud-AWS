# Instance
resource "aws_instance" "instance" {
  ami                         = "ami-097d364f9d45f05c7"
  instance_type               = "t2.micro"
  monitoring                  = false
  key_name                    = "${aws_key_pair.deployer.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.sg.id}"]
  associate_public_ip_address = true

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = false
  }

  tags {
    "Name" = "${var.name}"
  }

  volume_tags {
    "Name" = "${var.name}"
  }
}

resource "aws_key_pair" "deployer" {
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
