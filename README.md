# Bake AMI on AWS with Packer that have nginx built-in. A kitchen-ec2 test is included

### Prerequisites

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

#### Update _[template.json](https://github.com/achuchulev/packer-aws_nginx/blob/master/template.json)_ to specify the AWS region where the AMI is going to be used

`"region": "us-east-2"`

### Start build:

```
packer validate template.json
packer build template.json
```

## Test the AMI

to check that nginx server is installed, nginx service is enabled and running, default port is tcp 80, configuration file exists at the default location, has right permissions and is owned by root

* Update _.kitchen.yml_ file with the name of your existing AWS key pair and the AWS region where the AMI has been created

```
aws_ssh_key_id: put_the_name_of_your_aws_key_pair
region: us-east-2
```

### on Linux

#### Prerequisites

* You will need to install EC2 drivers and the AWS SDK for Ruby

```
gem install test-kitchen
gem install kitchen-inspec
gem install aws-sdk
gem install ec2
```

#### Run test

Run `kitchen test` 

### on MAC

#### Prerequisit

##### Install rbenv to use ruby version 2.3.1

```
brew install rbenv
rbenv install 2.3.1
rbenv local 2.3.1
rbenv versions
```

##### Add the following lines to your ~/.bash_profile:

```
eval "$(rbenv init -)"
true
export PATH="$HOME/.rbenv/bin:$PATH"
```

##### Reload profile: 

`source ~/.bash_profile`

##### Install bundler

```
gem install bundler
bundle install
```

#### Run the test: 

`bundle exec kitchen test`
