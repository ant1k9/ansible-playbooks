.PHONY: deploy-rocket
deploy-rocket:
	@ansible-playbook -i playbooks/inventory playbooks/rocket_chat.yml -v --become

.PHONY: personal-server
personal-server:
	@ansible-playbook -i playbooks/inventory playbooks/personal_server.yml -v --become

.PHONY: personal-server-local
personal-server-local:
	@ansible-playbook -i playbooks/inventory playbooks/personal_server.yml -v --become \
		--ssh-common-args="-i  ./tmp/.vagrant/machines/default/libvirt/private_key -l vagrant"
