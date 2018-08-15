.PHONY = makedistro movedistrotoserver

NAME = test-service
INSTALL_LOCATION = /opt/${NAME}
SERVICE_SCRIPT = /etc/systemd/system/${NAME}.service

installservice:
	@cp ${NAME}.service ${SERVICE_SCRIPT}
	@mkdir -p ${INSTALL_LOCATION}
	@cp app.py ${INSTALL_LOCATION} 
	@cp dab.py ${INSTALL_LOCATION}
	@systemctl daemon-reload
	@systemctl enable ${NAME}
	
uninstallservice:
	@rm -rf ${INSTALL_LOCATION}
	@rm -rf ${SERVICE_SCRIPT}

add:	
	@git add .

commit: add
	@git commit -m "addin things"

push: commit
	@git push origin master

