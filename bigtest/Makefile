.PHONY = makedistro

makedistro:
	@zip cool_program -r . -x Makefile move_distro_script

movedistrotoserver: makedistro
	@scp /home/jenkins/git/QA/bigtest/cool_program.zip jenkins@10.0.10.11:/home/jenkins/

unziponserver : movedistrotoserver
	@ssh jenkins@10.0.10.11 'mkdir /home/jenkins/cool_python_program ; \
        unzip -o /home/jenkins/cool_program.zip -d /home/jenkins/cool_python_program/'

runonserver: unziponserver
	@ssh jenkins@10.0.10.11 'python /home/jenkins/cool_python_program/main.py'

removefromserver: unziponserver
	@ssh jenkins@10.0.10.11 'rm -r /home/jenkins/cool_python_program/ ; \
	rm /home/jenkins/cool_program.zip'

