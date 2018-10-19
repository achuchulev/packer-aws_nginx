# Bake AMI on AWS with Packer that have nginx built-in. A kitchen-ec2 test is included

### Prerequisits

* packer
* kitchen
* AWS account

## Bake AMI

#### Export your AWS access and security keys as environment variables:

```
export AWS_ACCESS_KEY_ID=MYACCESSKEYID
export AWS_SECRET_ACCESS_KEY=MYSECRETACCESSKEY
```

#### Clone repository locally:

`git clone https://github.com/achuchulev/packer-aws_nginx.git`

#### Go to the directory containing template.json file:

`cd packer-aws_nginx/`

#### Update _template.json_ to specify the AWS region where the AMI is going to be stored

`"region": "us-east-2"`

### Start build:

```
packer validate template.json
packer build template.json
```

* packer template: [template.json](https://github.com/achuchulev/packer-aws_nginx/blob/master/template.json)

* nginx deploy script: [nginx.sh](https://github.com/achuchulev/packer-aws_nginx/blob/master/nginx.sh)


## Test the AMI

### Prerequisits

#### Update _.kitchen.yml_ configuration file with the name of your existing AWS key pair and the AWS region where the AMI has been created

```
aws_ssh_key_id: put_the_name_of_your_aws_key_pair
region: us-east-2
```

### You will need to install EC2 drivers and the AWS SDK for Ruby v2

```
gem install aws-sdk
gem install ec2
```

### Run test

Run `kitchen list` to verify that AMI is ready to be tested

Run `kitchen test` to check that nginx server is installed


* kitchen-ec2 checks: [nginx_check.rb](https://github.com/achuchulev/packer-aws_nginx/blob/master/test/integration/default/nginx_check.rb)
