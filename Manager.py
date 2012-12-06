import cherrypy

class Index:
	def index(self):
		return "Hello World"
	index.exposed = True
cherrypy.root = Index()

if __name__ == '__main__':
	cherrypy.config.update({'server.socket_port': 80, })
	cherrypy.server.start()
