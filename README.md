# Create AMI on AWS with Packer that have nginx built-in. A kitchen-ec2 test is included

### Prerequisits

* packer
* kitchen
* AWS account

### Set your access key and id as environment variables, so we don't need to pass them in through the command line:

 `export AWS_ACCESS_KEY_ID=MYACCESSKEYID`
 
 `export AWS_SECRET_ACCESS_KEY=MYSECRETACCESSKEY`
 
### Clone repository locally:

`git clone https://github.com/achuchulev/packer-aws_nginx.git`

## Build new AMI

Go to the directory containing template.json file, and run:

```
cd packer-aws_nginx/
packer validate template.json
packer build template.json
```

### Packer Template:

[template.json](https://github.com/achuchulev/packer-aws_nginx/blob/master/template.json)

### Nginx deploy script:

[nginx.sh](https://github.com/achuchulev/packer-aws_nginx/blob/master/nginx.sh)

## Test the AMI

### Prerequisits

* Existing AWS key pair

`aws_ssh_key_id: <the_name_of_your_aws_key_pair>`

* You will need to install EC2 drivers and the AWS SDK for Ruby v2

```
gem install aws-sdk
gem install ec2
```
 
### Run test

Run `kitchen list` to verify that AMI is ready to be tested

Run `kitchen test` to check that nginx server is installed
