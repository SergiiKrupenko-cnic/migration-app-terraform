
### project contains:

- 1 public subnets
- 2 Internet getaways
- 2 EC2 instances

### for run you need:

1 installed terraform

2 clone this repository


3 enter your variables in the terraform.tfvars file
```
region               = "eu-central-1"
cidr                 = "10.0.0.0/16"
az                   = "eu-central-1a"
ami                  = "ami-0136e0e4ae41f4fa2"
key_name             = "developer"
public_subnet        = "10.0.101.0/24"
instance_type        = "t2.micro"
allowed_ports        = [ "80", "443", "22"]
```
4 to add AWS credentials 

 run in terminal
```
export AWS_ACCESS_KEY_ID=your_access_key_id
export AWS_SECRET_ACCESS_KEY=your_secret_access_key
export AWS_REGION=your_aws_region
```

5 run Teppaform
```
terraform init
terraform plan
terraform apply
```


