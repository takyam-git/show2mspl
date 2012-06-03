exports.actions = (req, res, ss) ->
  req.use('session')
  
  sendPl: () ->
    console.log ss
    ss.mysql 'SHOW PROCESSLIST', (err, rows, fields) ->
      res false
      
      ss.publish.all 'sendPl', rows
    res true
