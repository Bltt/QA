.PHONY = makedistro movedistrotoserver

NAME = python-application-server
INSTALL_LOCATION = /opt/${NAME}
SERVICE_SCRIPT = /etc/systemd/system/${NAME}.service

installservice:
	@cp ${NAME}.service ${SERVICE_SCRIPT}
	@mkdir -p ${INSTALL_LOCATION}
	@cp app.py ${INSTALL_LOCATION} 
	@cp dab.py ${INSTALL_LOCATION}
	@systemctl daemon-reload

uninstallservice:
	@rm -rf ${INSTALL_LOCATION}
	@rm -rf ${SERVICE_SCRIPT}

makedistro:
	@zip /home/jenkins/git/QA/cool_program -r Makefile dab.py main.py 

movedistrotoserver: makedistro 
	@scp /home/jenkins/git/QA/cool_program.zip jenkins@10.0.10.11:/home/jenkins/

unziponserver : movedistrotoserver
	@ssh jenkins@10.0.10.11 'mkdir /home/jenkins/cool_python_program ; \
        unzip -o /home/jenkins/cool_program.zip -d /home/jenkins/cool_python_program/'

runonserver: unziponserver
	@ssh jenkins@10.0.10.11 'cd /home/jenkins/cool_python_program/ ; \
	make runpython'

removefromserver:
	@ssh jenkins@10.0.10.11 'rm -r /home/jenkins/cool_python_program/ ; \
	rm /home/jenkins/cool_program.zip'
	rm cool_program.zip

runpython:
	python main.py


add:
	@git add .

commit: add
	@git commit -m "addin things"

push: commit
	@git push origin master

