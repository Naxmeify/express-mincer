module.exports = ->
  (req, res, next) ->
    res.locas[name] = action() for name, action in @helper
    next()