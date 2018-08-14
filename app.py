#!/usr/bin/python

import dab
import random
import time
import SimpleHTTPServer
import SocketServer

PORT = 9090
Handler = SimpleHTTPServer.SimpleHTTPRequestHandler
httpd = SocketServer.TCPServer(("", PORT), Handler)
print("")
print("------ PYTHON PROGRAM ------")
print("")
choice = random.randint(1,4)
dab.dab()
bants = 0
while bants < 5:
	f=open("/home/jenkins/python_app_logfile.txt", "a+")
	print("Press enter to continue and exit")
	print("")
	print("Lol syked, you don't get to choose!")
	if choice == 1:
		dab.camel()
		f.write("camel dabbed")
	elif choice == 2:
		dab.dino()
		f.write("dino dab!")
	elif choice == 3:
		dab.pizza()
		f.write("pizzaaaa")
	else:
		dab.dab()
		f.write("master dab!")
	time.sleep(5)
	f.write(time.asctime( time.localtime(time.time()) ))
	choice = random.randint(1,4)
	f.close()
	bants += 1

httpd.serve_forever()
