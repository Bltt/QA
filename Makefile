.PHONY= add commit push
message = "adding some things my friends"
file = "."
branch = "master"

add: 
	@git add ${file}

commit: add
	@git commit -m '${message}'

push: commit
	@git push origin "${branch}"
