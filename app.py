#!/usr/bin/python
import SimpleHTTPServer
import SocketServer
import time

f=open("/home/jenkins/simple_server_log.txt", "a+")
f.write("Program start - ")
f.write(time.asctime( time.localtime(time.time())))


PORT = 9000

Handler = SimpleHTTPServer.SimpleHTTPRequestHandler

httpd = SocketServer.TCPServer(("", PORT), Handler)

print "serving at port", PORT
httpd.serve_forever()
