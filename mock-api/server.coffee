express   = require('express')
http      = require('http')
path      = require('path')

resources = require('./resources')

server = module.exports = express()

# all environments
server.set('port', process.env.PORT || 8000)
server.use(express.favicon())
server.use(express.logger('dev'))
server.use(express.json())
server.use(express.urlencoded())
server.use(express.methodOverride())
server.use(server.router)
server.use(express.static(path.join(__dirname, 'public')))

# development only
if 'development' is server.get('env')
  server.use(express.errorHandler())

resources(server)


http.createServer(server).listen server.get('port'), ->
  console.log('Express server listening on port ' + server.get('port'))
