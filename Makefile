SHELL:=/bin/bash
include .env

.PHONY: all clean validate test docs format

all: validate test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) init modules/http && $(TERRAFORM) validate modules/http && \
		$(TERRAFORM) init modules/cloudmap && $(TERRAFORM) validate modules/cloudmap && \
		$(TERRAFORM) init modules/loadbalancer && $(TERRAFORM) validate modules/loadbalancer && \
		$(TERRAFORM) init modules/lambda && $(TERRAFORM) validate modules/lambda && \
		$(TERRAFORM) init modules/kinesis && $(TERRAFORM) validate modules/kinesis

test: validate
	$(CHECKOV) -d /work && \
		$(CHECKOV) -d /work/modules/http && \
		$(CHECKOV) -d /work/modules/cloudmap && \
		$(CHECKOV) -d /work/modules/loadbalancer && \
		$(CHECKOV) -d /work/modules/lambda && \
		$(CHECKOV) -d /work/modules/kinesis

docs:
	docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./ >./README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/http >./modules/http/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/cloudmap >./modules/cloudmap/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/loadbalancer >./modules/loadbalancer/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/lambda >./modules/lambda/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/kinesis >./modules/kinesis/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/http
		$(TERRAFORM) fmt -list=true ./modules/cloudmap
		$(TERRAFORM) fmt -list=true ./modules/loadbalancer
		$(TERRAFORM) fmt -list=true ./modules/lambda
		$(TERRAFORM) fmt -list=true ./modules/kinesis
