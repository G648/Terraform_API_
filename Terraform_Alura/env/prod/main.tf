module "aws-prod" {
    source = "../../infra"
    instancia = "t1.micro"
    regiao_aws = "us-east-1"
    chave = "key-prod"
}