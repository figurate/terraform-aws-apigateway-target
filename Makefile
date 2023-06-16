SHELL:=/bin/bash
include .env

VERSION=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

.PHONY: all clean validate test diagram docs format release

all: test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init -upgrade && $(TERRAFORM) validate && \
		$(TERRAFORM) -chdir=modules/appconfig init -upgrade && $(TERRAFORM) -chdir=modules/appconfig validate && \
		$(TERRAFORM) -chdir=modules/eventbridge init -upgrade && $(TERRAFORM) -chdir=modules/eventbridge validate && \
		$(TERRAFORM) -chdir=modules/http init -upgrade && $(TERRAFORM) -chdir=modules/http validate && \
		$(TERRAFORM) -chdir=modules/cloudmap init -upgrade && $(TERRAFORM) -chdir=modules/cloudmap validate && \
		$(TERRAFORM) -chdir=modules/loadbalancer init -upgrade && $(TERRAFORM) -chdir=modules/loadbalancer validate && \
		$(TERRAFORM) -chdir=modules/lambda init -upgrade && $(TERRAFORM) -chdir=modules/lambda validate && \
		$(TERRAFORM) -chdir=modules/kinesis init -upgrade && $(TERRAFORM) -chdir=modules/kinesis validate && \
		$(TERRAFORM) -chdir=modules/sqs init -upgrade && $(TERRAFORM) -chdir=modules/sqs validate && \
		$(TERRAFORM) -chdir=modules/stepfunction init -upgrade && $(TERRAFORM) -chdir=modules/stepfunction validate

test: validate
	$(CHECKOV) -d /work
	$(TFSEC) /work

diagram:
	$(DIAGRAMS) diagram.py

docs: diagram
	docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./ >./README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/appconfig >./modules/appconfig/README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/eventbridge >./modules/eventbridge/README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/http >./modules/http/README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/cloudmap >./modules/cloudmap/README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/loadbalancer >./modules/loadbalancer/README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/lambda >./modules/lambda/README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/kinesis >./modules/kinesis/README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/sqs >./modules/sqs/README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/stepfunction >./modules/stepfunction/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/appconfig && \
		$(TERRAFORM) fmt -list=true ./modules/eventbridge && \
		$(TERRAFORM) fmt -list=true ./modules/http && \
		$(TERRAFORM) fmt -list=true ./modules/cloudmap && \
		$(TERRAFORM) fmt -list=true ./modules/loadbalancer && \
		$(TERRAFORM) fmt -list=true ./modules/lambda && \
		$(TERRAFORM) fmt -list=true ./modules/kinesis && \
		$(TERRAFORM) fmt -list=true ./modules/sqs && \
		$(TERRAFORM) fmt -list=true ./modules/stepfunction

release: test
	git tag $(VERSION) && git push --tags
