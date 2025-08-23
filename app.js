// --- app.js ---
// Este archivo crea un servidor web simple con Node.js y Express.

const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('¡Hola, Mundo desde mi primer contenedor Docker!');
});

app.listen(port, () => {
  console.log(`La aplicación está escuchando en http://localhost:${port}`);
});
