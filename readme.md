# Chalice Boilerplate

## Dependencies
1. Chalice
1. Terraform

## create virtualenv
1. `python3 -m virtualenv venv`
1. `. venv/bin/activate`

## install chalice
Currenty, only my fork of chalice works `https://github.com/djaney/chalice`.
Still trying to get my PR approved.
### Install

```bash
pip install -e git+git@github.com:djaney/chalice.git#egg=chalice
```

## Directory structure
```text
root
  |-- Makefile - the main makefile configuration
  |-- Makefile.sub - makefile for subdirectories, this will be automatiocally copied during "init"
  |-- requirements.txt - shared requredments file for all chalice instances (do not include chalice here)
  |-- <subdirectores> - every chalice instance has their own directories
```

## AWS Credentials
~/.aws/config
```text
[<profile>]
region=<region>
```
~/.aws/credentials
```text
[<profile>]
aws_access_key_id=XXX
aws_secret_access_key=XXX
```

## Create chalice instance
1. `bin/new <name>` will create a folder with chalice

## Terraform

Plan
```bash
AWS_PROFILE=<profile> make plan
```