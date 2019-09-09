# Gogs application

CONFIG="$(shell pwd)/etc/app.ini"

include .env

help:
	@echo ""
	@echo "Usage:"
	@echo "  make [COMMAND]"
	@echo ""
	@echo "Commands:"
	@echo "  clean           Clean all services and volumes"
	@echo "  config-read     Read configuration from server"
	@echo "  install         Automatic installation of Gogs"
	@echo "  logs            Follow log output"
	@echo "  compose-up      Start without automatically filling form"

compose-up:
	@sudo chown 1000 /var/jenkins_home
	@sudo docker-compose up -d

run:
	@docker run --env-file $(shell pwd)/.env --rm -v $(shell pwd)/bin/install.sh:/install.sh --net=host appropriate/curl /bin/sh /install.sh
	@echo "Jenkins initial admin password:"
	@docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

logs:
	@docker-compose logs -f

clean:
	@docker-compose down -v

config-read:
	@docker cp $(shell docker-compose ps -q canopus_gogs_app):/data/gogs/conf/app.ini $(shell pwd)/etc/app.ini
