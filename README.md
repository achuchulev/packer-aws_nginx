# Example of new AMI creation on AWS with Packer that have nginx built-in. A test with kitchen is included to verfy that nginx is present on that box

### Prerequisits

* packer
* AWS account

### Set your access key and id as environment variables, so we don't need to pass them in through the command line:

 `export AWS_ACCESS_KEY_ID=MYACCESSKEYID`
 
 `export AWS_SECRET_ACCESS_KEY=MYSECRETACCESSKEY`

### Build new AMI with command:

`packer build template.json`

### Nginx is built-in using script:

[nginx.sh](https://github.com/achuchulev/packer-aws_nginx/blob/master/nginx.sh)

## Test box to verify that nginx package is installed

### What you will need

* AWS key pair
 * Use that name for the parameter aws_ssh_key_id: <the_name_of_aws_key_pair>

* kitchen

* You will need to install EC2 drivers and the AWS SDK for Ruby v2
 * To install the gems run:

 `gem install aws-sdk`
 `gem install ec2`

### Check if the instance is found

* Run `kitchen list`

 * Output shold look like this: 
 
 Instance             Driver  Provisioner  Verifier  Transport  Last Action    Last Error
 
 default-ubuntu-1404  Ec2     ChefSolo     Inspec    Ssh        <Not Created>  <None>
 
 ### Run the test
 
  `kitchen test`
