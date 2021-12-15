.PHONY: deploy-rocket
deploy-rocket:
	@ansible-playbook -i playbooks/inventory playbooks/rocket_chat.yml -v --become

.PHONY: personal-server
personal-server:
	@ansible-playbook -i playbooks/inventory playbooks/personal_server.yml -v

.PHONY: personal-server-local
personal-server-local:
	@ansible-playbook -i playbooks/inventory playbooks/personal_server.yml -v \
		--ssh-common-args="-i  ./tmp/.vagrant/machines/default/libvirt/private_key -l vagrant" \
		-e github_token=${GITHUB_TOKEN} \
		-e dropbox_refresh_token=${DROPBOX_REFRESH_TOKEN} \
		-e dropbox_credentials=${DROPBOX_CREDENTIALS} \
		-e blogs_bot_token=${BLOGS_BOT_TOKEN} \
		-e blogs_channel=${BLOGS_CHANNEL} \
		-e telegram_channel=${TELEGRAM_CHANNEL} \
		-e telegram_bot_token=${TELEGRAM__BOT_TOKEN}

.PHONY: local-environment
local-environment:
	@ansible-playbook -i playbooks/inventory playbooks/local_environment.yml -vK

.PHONY: local-environment-vm
local-environment-vm:
	@ansible-playbook -i playbooks/inventory playbooks/local_environment_vm.yml -v \
		--ssh-common-args="-i  ./tmp/.vagrant/machines/default/libvirt/private_key -l vagrant"
