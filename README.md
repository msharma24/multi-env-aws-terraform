# multi-env-aws-terraform

### Description
This reposiroty is to demo Terraform deployment across multiple AWS environments - dev / prod. 
The Project uses a wrapper script called `run_terraform.sh` which will target the configuration in the `env/{env_name}` directory.
#### Usage
1. Assume the AWS Credentials for your dev environment and execute the `run_terraform.sh` script.

`./run_terraform.sh dev` - This will target the `env/dev` and will init and print the terraform plan . If you need to deploy the config , re-run the wrapper script with `deploy` argument - `./run_terraform.sh dev deploy` this will apply the config.


2 . Repeat the same steps for `prod` environment.


3 . This workflow can easily be integrated in your choice of CICD Vendor - AzureDevOps, GitLab etc..


### P.S Update the `backend.conf` with your S3 backend information.