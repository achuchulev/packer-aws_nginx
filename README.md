# Example of new AMI creation on AWS with Packer that have nginx built-in

### Prerequisits

* packer
* AWS account

### Set your access key and id as environment variables, so we don't need to pass them in through the command line:

 `export AWS_ACCESS_KEY_ID=MYACCESSKEYID`
 `export AWS_SECRET_ACCESS_KEY=MYSECRETACCESSKEY`

### Build new AMI with command:

`packer build template.json`

### Nginx is built-in
