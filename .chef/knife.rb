# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "dlee19"
client_key               "#{current_dir}/dlee19.pem"
validation_client_name   "devin-validator"
validation_key           "#{current_dir}/devin-validator.pem"
chef_server_url          "https://ec2-52-23-204-242.compute-1.amazonaws.com/organizations/devin"
cookbook_path            ["#{current_dir}/../cookbooks"]

# Amazon AWS
knife[:aws_credential_file] = "~/aws.txt"