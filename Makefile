.PHONY= add commit push ifstate
message = "adding some things my friends"
file = "."
branch = "master"
foo = ${shell whoami}

add: 
	@git add ${file}

commit: add
	@git commit -m '${message}'

push: commit
	@git push origin "${branch}"


ifstate:
ifeq (${var1},${var2})
	@echo "yeet"
else
	@echo "you suck"
endif
	@echo ${var1}
	@echo ${var2}

ifdefstate:
ifdef var3
	@echo "aboslute lad"
else
	@echo "define it ya lazy shit"
endif

test:
	@echo "you are ${foo}"
	${info "doin things"}
