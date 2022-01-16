SHELL:=/bin/bash
include .env

.PHONY: all clean validate test docs format

all: validate test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) -chdir=modules/http init && $(TERRAFORM) -chdir=modules/http validate && \
		$(TERRAFORM) -chdir=modules/cloudmap init && $(TERRAFORM) -chdir=modules/cloudmap validate && \
		$(TERRAFORM) -chdir=modules/loadbalancer init && $(TERRAFORM) -chdir=modules/loadbalancer validate && \
		$(TERRAFORM) -chdir=modules/lambda init && $(TERRAFORM) -chdir=modules/lambda validate && \
		$(TERRAFORM) -chdir=modules/kinesis init && $(TERRAFORM) -chdir=modules/kinesis validate

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
