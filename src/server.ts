import express from 'express'
import routes from './routes/routes'
const app = express()

app.use(express.json())
app.use(routes)

app.listen(3332, () => console.log('Servidor Online http://localhost:3332'))