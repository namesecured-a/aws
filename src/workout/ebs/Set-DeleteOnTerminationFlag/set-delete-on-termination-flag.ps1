#requires -PSEdition Core

aws ec2 modify-instance-attribute --instance-id i-0b86a0cd5bd37742b --block-device-mappings ./set-delete-on-termination-flag.json