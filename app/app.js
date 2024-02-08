const express = require('express')
const bunyan = require("bunyan");
const uuid = require("uuid");

const log = bunyan.createLogger({
    name: "app",
    serializers: bunyan.stdSerializers,
  });

const app = express()
const port = process.env.PORT || 8080;

function getRandomNumber(min, max) {
    return Math.floor(Math.random() * (max - min) + min);
}

app.use((req, res, next) => {
    req.log = log.child({ req_id: uuid.v4() }, true);
    req.log.info({ req });
    res.on("finish", () => req.log.info({ res }));
    next();
  }); 

app.get('/', (req, res) => {
  res.send('Hello World!')
})
  
app.get('/rolldice', (req, res) => {
  res.send(getRandomNumber(1, 6).toString());
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
