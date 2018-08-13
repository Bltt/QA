.PHONY= test1 test2 add commit push
test_var= "hello my friends"
commit_message= "adding some things my friends"
file= "test_file"

test1:
	@echo "test1"
	@echo "another_friggin_test"

test2: test1
	@echo "lol its the second boi"
	@echo "${test_var}"


add: 
	@git add ${file}

commit: add
	@git commit -m "${commit_message}"

push: commit
	@git push origin master
