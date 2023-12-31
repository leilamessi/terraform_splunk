## Ec2 instance 

resource "aws_instance" "ec2-demo" {
    ami = "ami-0bb4c991fa89d4b9b"
    vpc_security_group_ids = [aws_security_group.sg-demo.id]
    instance_type = "t2.micro"
    key_name = "ec2-demo"
    subnet_id = aws_subnet.public_subnet1.id
    user_data =  <<EOF
  #!/bin/bash
sudo yum update -y 
    sudo yum install wget -y  
    sudo cd /opt
    sudo wget -O splunk-9.0.4.1-419ad9369127-Linux-x86_64.tgz "https://download.splunk.com/products/splunk/releases/9.0.4.1/linux/splunk-9.0.4.1-419ad9369127-Linux-x86_64.tgz"
    sudo tar -zxvf splunk-9.0.4.1-419ad9369127-Linux-x86_64.tgz -C /opt
    sudo /opt/splunk/bin/splunk start --accept-license --answer-yes --no-prompt --seed-passwd "abcd1234"
    sudo /opt/splunk/bin/splunk enable boot-start

     EOF

    root_block_device {
    volume_size = 25
    } 
    tags={
        Name = "Terraform splunk"
        env = "Dev"
    }

}