variable "aws_region" {
  description = "AWS 리전"
  type        = string
  default     = "ap-northeast-2"
}

variable "environment" {
  description = "배포 환경"
  # ...
  type    = string
  default = "dev"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment는 dev, staging, prod 중 하나여야 함."
  }
}

variable "vpc_cidr" {
  description = "VPC CIDR 블록"
  # ...
  type    = string
  default = "172.31.0.0/16"
}

variable "public_subnets" {
  description = "Public Subnet 정의"
  type = map(object({
    cidr = string
    az   = string
  }))
  default = {
    "2a" = { cidr = "172.31.1.0/24", az = "ap-northeast-2a" }
    "2c" = { cidr = "172.31.2.0/24", az = "ap-northeast-2c" }
  }
}


variable "private_subnets" {
  description = "Private Subnet 정의"
  type = map(object({
    cidr = string
    az   = string
  }))
  default = {
    "2a" = { cidr = "172.31.3.0/24", az = "ap-northeast-2a" }
    "2c" = { cidr = "172.31.4.0/24", az = "ap-northeast-2c" }
  }
}

variable "public_ingress_ports" {
  description = "Public SG의 ingress 포트 목록"
  type        = list(number)
  default     = [22, 80, 8080]
}
# TODO-1: ec2_instance_type
# - type: string
# - default: "t3.micro"
variable "ec2_instance_type" {
  description = "EC2 인스턴스 타입"
  type        = string
  default     = "t3.micro"
}

# TODO-2: rds_instance_class
# - type: string
# - default: "db.t3.micro"
variable "rds_instance_class" {
  description = "RDS 인스턴스 클래스"
  type        = string
  default     = "db.t3.micro"
}

# TODO-3: rds_engine_version
# - type: string
# - default: "8.0.37"
variable "rds_engine_version" {
  description = "MySQL 엔진 버전"
  type        = string
  default     = "8.0.45"
}

# TODO-4: rds_allocated_storage
# - type: number
# - default: 20
variable "rds_allocated_storage" {
  description = "RDS 초기 스토리지 (GB)"
  type        = number
  default     = 20
}
