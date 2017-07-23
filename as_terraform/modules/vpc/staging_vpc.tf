# Internet VPC
resource "aws_vpc" "staging" {
    cidr_block = "10.3.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "staging"
    }
}

# Subnets
resource "aws_subnet" "staging-pub-us-east-1a" {
    vpc_id = "${aws_vpc.staging.id}"
    cidr_block = "10.3.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"

    tags {
        Name = "staging-pub-us-east-1a-10.3.1"
    }
}
resource "aws_subnet" "staging-pub-us-east-1b" {
    vpc_id = "${aws_vpc.staging.id}"
    cidr_block = "10.3.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1b"

    tags {
        Name = "staging-pub-us-east-1b-10.3.2"
    }
}
resource "aws_subnet" "staging-pub-us-east-1c" {
    vpc_id = "${aws_vpc.staging.id}"
    cidr_block = "10.3.3.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1c"

    tags {
        Name = "staging-pub-us-east-1c-10.3.3"
    }
}
resource "aws_subnet" "staging-pri-us-east-1a" {
    vpc_id = "${aws_vpc.staging.id}"
    cidr_block = "10.3.10.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1a"

    tags {
        Name = "staging-pri-us-east-1c-10.3.10"
    }
}
resource "aws_subnet" "staging-pri-us-east-1b" {
    vpc_id = "${aws_vpc.staging.id}"
    cidr_block = "10.3.11.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1b"

    tags {
        Name = "staging-pri-us-east-1c-10.3.11"
    }
}
resource "aws_subnet" "staging-pri-us-east-1c" {
    vpc_id = "${aws_vpc.staging.id}"
    cidr_block = "10.3.12.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1c"

    tags {
        Name = "staging-pri-us-east-1c-10.3.12"
    }
}

# Internet GW
resource "aws_internet_gateway" "staging-igw" {
    vpc_id = "${aws_vpc.staging.id}"

    tags {
        Name = "staging"
    }
}

# route tables
resource "aws_route_table" "staging-public" {
    vpc_id = "${aws_vpc.staging.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.staging-igw.id}"
    }

    tags {
        Name = "staging-public"
    }
}

# route associations public
resource "aws_route_table_association" "staging-public-1" {
    subnet_id = "${aws_subnet.staging-pub-us-east-1a.id}"
    route_table_id = "${aws_route_table.staging-public.id}"
}
resource "aws_route_table_association" "staging-public-2" {
    subnet_id = "${aws_subnet.staging-pub-us-east-1b.id}"
    route_table_id = "${aws_route_table.staging-public.id}"
}
resource "aws_route_table_association" "staging-public-3" {
    subnet_id = "${aws_subnet.staging-pub-us-east-1c.id}"
    route_table_id = "${aws_route_table.staging-public.id}"
}
