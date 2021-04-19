const express = require('express');
const app = express();
const webport = process.env.WEBPORT || 3000;

const dateUp = Date.now();

app.get('/', (req, res) => {
  const today = new Date();

  res.json({
    date: today,
    up: `${(Date.now() - dateUp)/1000} seg.`,
  });
});

app.listen(webport, () => {
  console.log(`Web service running on port: ${port}`);
  console.log('Press CTRL + C to quit');
});