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
	go build -o ~/.terraform.d/plugins/github.com/petr-stupka/azfoundation/0.0.1/linux_amd64/terraform-provider-azfoundation

test: generate build
	cd ./examples && terraform init -upgrade -get-plugins=true && terraform apply -auto-approve

plan: generate build
	cd ./examples && terraform init -upgrade -get-plugins=true && terraform plan

apply:
	cd ./examples && terraform apply -auto-approve

destroy:
	cd ./examples && terraform destroy -auto-approve
