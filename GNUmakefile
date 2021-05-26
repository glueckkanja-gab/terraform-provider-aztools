#default: testacc
#
## Run acceptance tests
#.PHONY: testacc
#testacc:
#	TF_ACC=1 go test ./... -v $(TESTARGS) -timeout 120m

# Dev
default: test

generate:
	go generate
	go fmt

build:
	go build -o ~/.terraform.d/plugins/github.com/glueckkanja-gab/aztools/0.1.0/linux_amd64/terraform-provider-aztools

test: generate build
	cd ./examples && rm -f .terraform.lock.hcl && terraform init -upgrade && TF_REATTACH_PROVIDERS='{"registry.terraform.io/my-org/my-provider":{"Protocol":"grpc","Pid":3382870,"Test":true,"Addr":{"Network":"unix","String":"/tmp/plugin713096927"}}}' terraform apply -auto-approve

plan: generate build
	cd ./examples && rm -f .terraform.lock.hcl && terraform init -upgrade && terraform plan

apply:
	cd ./examples && terraform apply -auto-approve

destroy:
	cd ./examples && terraform destroy -auto-approve
