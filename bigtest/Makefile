.PHONY = makedistro

makedistro:
	@zip cool_program -r . -x Makefile move_distro_script

movedistrotoserver: makedistro
	./move_distro_script
	@rm cool_program.zip
	
