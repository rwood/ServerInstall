#!/usr/bin/python
import cherrypy
import subprocess

class Index:
	def index(self):
		return """<html>
<head><title>Server Manager</title></head>
<body>
	<ul>
		<li><a href="%(url)s:5001" target="_blank">Downloads</a></li>
		<li><a href="%(url)s:5002" target="_blank">Tv Shows</a></li>
		<li><a href="%(url)s:5003" target="_blank">Movies</a></li>
		<li><a href="%(url)s:5004" target="_blank">Music</a></li>
		<li><a href="http://www.nzbmatrix.com" target="_blank">Search for NZBs</a></li>
		<li><a href="%(url)s/shutdown" onclick="return confirm('Are you sure?');">Shut down the server.</a></li>
	</ul>
</body>
</html>""" % {"url": cherrypy.request.base}
	index.exposed = True
	def shutdown(self):
		subprocess.call(['/home/rwood/ServerInstall/shutdown.sh'])
		return """<html>
<head><title>Server Manager</title></head>
<body>
<h1>Shutting down...</h1>
</body>
</html>"""

	shutdown.exposed = True
	def test(self):
		return cherrypy.request.base
	test.exposed = True

cherrypy.root = Index()
cherrypy.config.update({'server.socket_port': 80, 'server.socket_host': '0.0.0.0', }) 
cherrypy.server.start()
