module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.3.0"

  name                   = "single-instance"
  ami                    = "ami-0aaa636894689fa47"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Name        = "module-project"
    Environment = "dev"
  }
}