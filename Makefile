.PHONY: deploy-rocket
deploy-rocket:
	@ansible-playbook -i playbooks/inventory playbooks/rocket_chat.yml -v --become
