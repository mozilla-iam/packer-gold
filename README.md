# packer-gold

This packer file is meant to be the base AMI for use with ansible container
at Mozilla.  It will use Amazon Linux as the base and install latest versions of
docker, ansible-container, and docker compose.

## Running Packer

1. MFA with the desired account.  Any old call will do.
 * `export AWS_DEFAULT_PROFILE=infosec-dev-admin`
 * `aws s3 ls`

2. ./build-dev.sh
