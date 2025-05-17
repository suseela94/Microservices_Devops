provider "aws"
{
  alias  = "us_east_1"
  region = "us-east-1"
}

resource "aws_ecrpublic_repository" "foo" {

  repository_name = "microservices"

  tags = {
    env = "dev"
    env = "staging"
    env = "prod"
         }
}
