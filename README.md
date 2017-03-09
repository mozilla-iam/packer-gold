# packer-gold

This packer file is meant to be the base AMI for use with ansible container
at Mozilla.  It will use Amazon Linux as the base and install latest versions of
docker, ansible-container, and docker compose.

## Running Packer

Image testing should be done in infosec-dev and then released to prod.

There are two scripts: build-dev.sh and build-prod.sh respectively. 
