# ---------------------------------------------------------------------------------------------------------------------
# Privider
# ---------------------------------------------------------------------------------------------------------------------
provider "aws" {
    profile   = "${var.profile}"
    region    = "${var.region}"
}

# ---------------------------------------------------------------------------------------------------------------------
# Base Infrastructure
# ---------------------------------------------------------------------------------------------------------------------
module "networking" {
    source = "github.com/jnonino/networking-terraform-module//aws?ref=1.0.0"
    name_preffix    = "${var.name_preffix}"
    profile         = "${var.profile}"
    region          = "${var.region}"
    vpc_cidr_block  = "${var.vpc_cidr_block}"
    availability_zones                          = [ "${var.availability_zones}" ]
    public_subnets_cidrs_per_availability_zone  = [ "${var.public_subnets_cidrs_per_availability_zone}" ]
    private_subnets_cidrs_per_availability_zone = [ "${var.private_subnets_cidrs_per_availability_zone}" ]
}

# ---------------------------------------------------------------------------------------------------------------------
# Jenkins
# ---------------------------------------------------------------------------------------------------------------------