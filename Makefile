.PHONY: help
help: ## Display help message
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: deploy
deploy: ## Deploy cEOS-Lab Topology
	@echo -e "\n############### \e[1;30;42mStarting cEOS-Lab topology\e[0m ###############\n"
	@sudo containerlab deploy -t topology.yaml
	@echo -e "\n############### \e[1;30;42mcEOS-Lab Topology\e[0m ###############\n"
	@sudo containerlab inspect -t topology.yaml
	@echo -e "\n############### \e[1;30;42mcEOS-Lab Deployment Complete\e[0m ###############\n"


.PHONY: build
build: ## Build AVD cEOS-Lab Configuration
	@echo -e "\n############### \e[1;30;42mGenerating switch configuration\e[0m ###############\n"
	@ansible-playbook playbooks/fabric-build-config.yaml --flush-cache

.PHONY: provision
provision: ## Provision AVD cEOS-Lab Configuration
	@echo -e "\n############### \e[1;30;42mDeploying switch configuration\e[0m ###############\n"
	@ansible-playbook playbooks/fabric-provision-config.yaml --flush-cache

.PHONY: snapshot
snapshot: ## Snapshot AVD cEOS-Lab Status
	@echo -e "\n############### \e[1;30;42mSnapshot switch status\e[0m ###############\n"
	@ansible-playbook playbooks/fabric-snapshot.yaml --flush-cache

.PHONY: validate
validate: ## Validate AVD cEOS-Lab Status
	@echo -e "\n############### \e[1;30;42mValidateswitch status\e[0m ###############\n"
	@ansible-playbook playbooks/fabric-validate.yaml

.PHONY: destroy
destroy: ## Delete cEOS-Lab Deployment and AVD generated config and documentation
	@echo -e "\n############### \e[1;30;42mWiping nodes and deleting AVD configuration\e[0m ###############\n"
	@sudo containerlab destroy -t topology.yaml --cleanup
	@rm -rf .topology.yaml.bak config_backup/ snapshots/ reports/ documentation/ intended/ custom_anta_catalogs/