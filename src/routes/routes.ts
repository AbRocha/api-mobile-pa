import { Router } from "express";
import jwt from 'jsonwebtoken'
import bcrypt from 'bcrypt'
import prisma from "../prisma";

const routes = Router()

routes.get("/", (req, res) => {
    res.send("")

})

routes.post('/user/login', async (req, res) => {
    console.log('Recebi');
    
    if (!req.body || !req.body.email || !req.body.password) return res.status(400).json({
        success: false,
        error: 'Missing Data',
        messageToUser: 'Não foi possivel realizar o login.'
    })

    const { email, password } = req.body

    const userTryingLogin = await prisma.user.findFirst({ select: { id: true, password: true, name: true, studentId: true }, where: { email: email } })

    if (userTryingLogin === null) return res.status(404).json({
        success: false,
        error: 'User not found',
        messageToUser: 'Este email não está registrado em nossas base de dados.'
    })


    if (!bcrypt.compareSync(password, userTryingLogin.password)) return res.status(401).json({
        success: false,
        error: 'Password incorrect',
        messageToUser: 'Senha Incorreta.'
    })

    const token = jwt.sign({
        user: {
            id: userTryingLogin.id,
            name: userTryingLogin.name,
            studentId: userTryingLogin.studentId
        }
    }, 'secret', { expiresIn: '1d' })


    return res.status(200).json({
        success: true, 
        token: token
    })
})

routes.post('/user/register', (req, res) => {
    const pass = bcrypt.hashSync('pass', 10)

    prisma.user.create({ 
        data: {
            name: 'Abyner',
            email: 'admin@pa.com',
            password: pass,
            photo: '',
            phoneNumber: '911 111 111',
            acessType: 3,
            studentId: null
        }
    }).then().catch((err) => res.status(400).json(err))

    return res.status(201)
})


export default routes