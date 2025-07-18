const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello from AKS deployed via Azure DevOps!');
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
