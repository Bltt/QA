import dab
import random
import time
print("")
print("------ PYTHON PROGRAM ------")
print("")
choice = random.randint(1,4)
dab.dab()
while True:
	f=open("logfile.txt", "a+")
	print("Press enter to continue and exit")
	print("")
	print("Lol syked, you don't get to choose!")
	if choice == 1:
	#	dab.camel()
		f.write("camel dabbed")
	elif choice == 2:
	#	dab.dino()
		f.write("dino dab!")
	elif choice == 3:
	#	dab.pizza()
		f.write("pizzaaaa")
	else:
	#	dab.dab()
		f.write("master dab!")
	time.sleep(5)
	f.write(time.asctime( time.localtime(time.time()) ))
	choice = random.randint(1,4)
	f.close()

