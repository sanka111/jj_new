#Provision VPC
module "vpc" {
    source = "./modules/vpc"
    common_tags = local.common_tags
}

###Provision Bation
module "ec2" {
    source = "./modules/ec2"
    private_subnets_ids = module.vpc.private_subnets
    vpc_id = module.vpc.vpc_id 
    common_tags = local.common_tags
    cidr_blocks = module.vpc.vpc_cidr_block
}

#####Provision EKS
##module "eks" {
##    source = "./modules/eks"
##    eks_reagion = var.aws_region
##    eks_subnets = module.vpc.private_subnets
##    vpc_id = module.vpc.vpc_id
##    cidr_blocks = module.vpc.vpc_cidr_block
##    common_tags = local.common_tags
##}
##
###Provision EFS
##module "efs" {
##    source = "./modules/efs"
##    core_subnet_ids = module.vpc.private_subnets
##    vpc_id = module.vpc.vpc_id
##    common_tags = local.common_tags
##}
##
###Provision RDS
##module "prod_rds" {
##    source = "./modules/rds"
##    db_subnet_ids = module.vpc.database_subnets
##    vpc_id = module.vpc.vpc_id
##    common_tags = local.common_tags
##    depends_on = [ module.vpc ]
##    cidr_blocks = module.vpc.vpc_cidr_block
##}
##
###S3 Bucket
##module "s3_bucket" {
##    source = "./modules/s3"
##}
##
###Cloudfront
##module "cloudfront" {
##    source = "./modules/cloudfront"
##    s3_reagion = var.aws_region
##    bucket_domain = module.s3_bucket.bucket_domain
##    depends_on = [ module.s3_bucket ]
##}

/*
module "ecr" {
    source = "./modules/ecr"
    common_tags = local.common_tags
}
*/