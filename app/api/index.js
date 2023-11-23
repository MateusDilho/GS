const express = require('express')
const mysql2 = require('mysql2');

const PORT = 3000;  //inside docker
const HOST = '0.0.0.0' //Uma forma do docker entender que ele só precisa repassar a porta 3000

const connection = mysql2.createConnection({
  host: 'database-mysql',
  user: 'root',
  password: '123',
  database: 'fiap',
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to database');
});

const app = express()


app.get('/objetivos', (req, res) => {
  const query = `SELECT * FROM Objetivos`;

  connection.query(query, (err, objetivos, fields) => {
    if (err) {
      console.error('Error executing SELECT query:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    // Função para obter indicadores de um objetivo
    const getIndicadores = (objetivo) => {
      return new Promise((resolve, reject) => {
        const indicadoresQuery = `SELECT * FROM Indicadores WHERE id_objetivo = ?`;

        connection.query(indicadoresQuery, [objetivo.id_objetivo], (err, indicadores, fields) => {
          if (err) {
            console.error('Error executing SELECT query for Indicadores:', err);
            reject(err);
            return;
          }

          const objetivoFormatado = {
            id: objetivo.id_objetivo,
            objetivos: {
              global: objetivo.objetivo_global,
              brasil: objetivo.objetivo_brasil,
            },
            indicadores: indicadores.map((indicador) => ({
              id: indicador.id_indicador,
              descricao: indicador.descricao,
            })),
          };

          resolve(objetivoFormatado);
        });
      });
    };

    // Usar Promise.all para esperar por todas as consultas de indicadores
    Promise.all(objetivos.map(getIndicadores))
      .then((resultadosFinais) => {
        res.json(resultadosFinais);
      })
      .catch((error) => {
        console.error('Error:', error);
        res.status(500).send('Internal Server Error');
      });
  });
});


app.get('/indicador/:id', (req, res) => {
  const indicadorId = req.params.id;

  const query = `SELECT * FROM DadosIndicador WHERE id_indicador = ?`;

  connection.query(query, [indicadorId], (err, dadosIndicador, fields) => {
    if (err) {
      console.error('Error executing SELECT query for DadosIndicador:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    res.json(dadosIndicador);
  });
});

app.listen(PORT, HOST, () => {
  console.log(`Server running at http://${HOST}:${PORT}`);
});
