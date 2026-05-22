data "aws_vpc" "sandbox" {
  filter {
    name   = "tag:Name"
    values = ["sandbox-vpc"]
  }
}

data "aws_subnet" "public_a" {
  filter {
    name   = "tag:Name"
    values = ["sandbox-public-a"]
  }

  vpc_id = data.aws_vpc.sandbox.id
}
