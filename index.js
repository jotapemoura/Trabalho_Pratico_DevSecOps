const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Pipeline DevSecOps a funcionar!');
});

app.listen(port, () => {
  console.log(`Servidor ativo na porta ${port}`);
});
