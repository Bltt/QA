import dab
import random
print("")
print("------ PYTHON PROGRAM ------")
print("")
choice = random.randint(1,4)

if choice == 1:
	dab.camel()
elif choice == 2:
	dab.dino()
elif choice == 3:
	dab.pizza()
else:
	dab.dab()
