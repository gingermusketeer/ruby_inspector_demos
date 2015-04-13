var express = require('express')
var app = express()
var fs = require('fs')

app.get('/hello_world', function (req, res) {
  fs.createReadStream('hello_world.html').pipe(res)
})

app.put('/put', function (req, res) {
  var body = ''
  req.on('data', function (data) {
    body += data.toString()
  })

  req.on('end', function () {
    res.json({
      url: req.url,
      headers: req.headers,
      body: body
    })
  })
})

app.post('/post', function (req, res) {
  console.log('handling request')
  var body = ''
  req.on('data', function (data) {
    console.log('got data')
    body += data.toString()
  })

  req.on('end', function () {
    console.log('end')
    res.json({
      url: req.url,
      headers: req.headers,
      body: body
    })
  })
})

app.listen(9090)
console.log('server listening on http://localhost:9090')
