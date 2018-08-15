.PHONY = install uninstall

NAME = python-systemd-http-server
INSTALL_LOCATION = /opt/${NAME}
SERVICE_SCRIPT = /etc/systemd/system/${NAME}.service

install:
	@sudo cp ${NAME}.service ${SERVICE_SCRIPT}
	@sudo mkdir -p ${INSTALL_LOCATION}
	@sudo cp app.py ${INSTALL_LOCATION}
	@sudo cp -r public ${INSTALL_LOCATION}
	@sudo systemctl daemon-reload

uninstall:
	@rm -rf ${INSTALL_LOCATION}
	@rm -rf ${SERVICE_SCRIPT}

makedistro:
	@zip /home/jenkins/git/QA/cool_program -r Makefile app.py public/ python-systemd-http-server.service 

movedistrotoserver: makedistro
	@scp /home/jenkins/git/QA/cool_program.zip jenkins@10.0.10.11:/home/jenkins/

unziponserver : movedistrotoserver
	@ssh jenkins@10.0.10.11 'mkdir /home/jenkins/cool_python_program ; \
        unzip -o /home/jenkins/cool_program.zip -d /home/jenkins/cool_python_program/'

installonserver: unziponserver
	@ssh jenkins@10.0.10.11 'cd /home/jenkins/cool_python_program/ ; \
        make install ; \
	sudo systemctl start ${NAME}.service'
	ssh jenkins@10.0.10.11 sudo systemctl status ${NAME}.service

removefromserver:
	@ssh jenkins@10.0.10.11 'rm -r /home/jenkins/cool_python_program/ ; \
        sudo systemctl stop ${NAME}.service ; \
	rm /home/jenkins/cool_program.zip'
	rm cool_program.zip
	
