all: create

mars:
	@cd clusters/mars/ && vagrant up

earth:
	@cd clusters/earth/ && vagrant up

create: earth mars
	@cd playbook/ && ansible-playbook -i inventory.ini --tags cilium,metallb,mesh main.yml

destroy:
	@cd clusters/mars/ && vagrant destroy
	@cd clusters/earth/ && vagrant destroy

.PHONY: create