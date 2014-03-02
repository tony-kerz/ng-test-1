proxy = (require 'http-proxy').createProxyServer(target: 'localhost:3000')

module.exports = require('./mixin') ->
  class Proxiable
    proxy: (server) ->
      server.all @root, (req, res) ->
        proxy.web req, res
