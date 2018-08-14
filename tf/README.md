# Terraform

+ `cloudwatch.tf`:
        Automatically creates a EBS snapshot of the instance volume every 14 days
+ `email.tf`: 
        Add specified domain under Simple Email Service with correct verification
+ `iam.tf`:
        Sets IAM roles for Cloudwatch Events and Lambda
+ `instance.tf`:
        Launches free-tier (t2.micro) Ubuntu 18.04 EC2 instance with 
        max free EBS storage (30 GB). Uses default SSH public key as the key-pair
+ `lambda.tf`:
        Lambda that deletes EBS snapshots older than 60 days
+ `main.tf`:
        Sets up AWS provider and other variables with S3 backend
+ `route53.tf`:
        Sets correct Route 53 hosted zone based on domain, with `www` subdomain.
        Outputs the result nameservers
+ `vpc.tf`:
        Uses the default VPC. Adds the correct security group to the VPC.