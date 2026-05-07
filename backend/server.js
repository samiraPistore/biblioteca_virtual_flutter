import express from "express";
import cors from "cors";
import { generateKey, randomUUID } from "crypto"; // gerar id único e aleatório
import fs, { read } from "fs"; // mexer com o arquivo json para armazenar dados sem db
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';

const app = express();
app.use(cors());
app.use(express.json());

const db_file = "./data.json";

function readData() {
  const data = fs.readFileSync(db_file);
  return JSON.parse(data);
}

function saveData(data) {
  fs.writeFileSync(db_file, JSON.stringify(data, null, 2)); // null e 2 para formatar o json
}

app.post('/register', async (req, res) => {
  try {
    const data = readData();
    const {name, email, senha } = req.body;

    const existingUser = data.users.find(u => u.email === email);

    if (existingUser) {
      return res.status(400).json({ msg: 'Email já está cadastrado!' });
    }

    const hashedSenha = await bcrypt.hash(senha, 10);

    const newUser = {
      id: randomUUID(),
      name: req.body.name,
      email: req.body.email,
      senha: hashedSenha
    };

    data.users.push(newUser);
    saveData(data);

    res.status(201).json({ msg: 'Usuário criado!' });

  } catch (err) {
    console.error(err);
    res.status(500).json({ msg: 'Erro no servidor' });
  }
});

//LOGIN
app.post("/login", async (req, res) => {
  try {
    const data = readData();
    const { email, senha } = req.body;

    const user = data.users.find((u) => u.email === email);

    if (!user) {
      return res.status(401).json({ msg: "Email ou senha incorretos" });
    }

    const senhaValida = await bcrypt.compare(senha, user.senha);

    if (!senhaValida) {
      return res.status(401).json({ msg: "Email ou senha incorretos" });
    }

    const token = jwt.sign(
      {
        id: user.id,
        email: user.email,
      },
      process.env.JWT_SECRET || "minhaChaveSuperSecreta",
      { expiresIn: "1d" }
    );

    return res.json({
      msg: "Login realizado!",
      token,
      user: {
        id: user.id,
        email: user.email,
        name: user.name,
      },
    });

  } catch (err) {
    console.error("Erro no login:", err);
    return res.status(500).json({ msg: "Erro interno no servidor" });
  }
});

//CRUD DE USUÁRIOS

app.get("/users", (req, res) => {
    const data = readData();
    res.json(data.users);
});

app.post("/users", async (req, res)=> {
    const data= readData();
    const newUser = {
        id: randomUUID(),
        name: req.body.name,
        email: req.body.email,
        senha: await bcrypt.hash(req.body.senha, 10),
    };
    data.users.push(newUser);
    saveData(data);
    res.status(201).json(newUser);
});


app.delete("/users/:id", (req, res)=> {
    const data = readData();
    const id = req.params.id;
    const userIndex = data.users.filter((u) => u.id !== id);
    data.users = userIndex;
    saveData(data);
    res.json({ msg: "Usuário deletado com sucesso" });  
});

app.put("/users/:id", (req,res) =>{
    const data = readData();
    const id = req.params.id;

    const index = data.users.findIndex((u)=> u.id === id);

    data.users[index] = {
        ...data.users[index],
        ...req.body,
    };

    saveData(data);
    res.json(data.users[index]);
});

//CRUD DE LIVROS

app.get("/books", (req, res) => {
  const data = readData();
  res.json(data.books);
});

app.post("/books", (req, res) => {
  const data = readData();
  const newBook = {
    id: randomUUID(),
    title: req.body.title,
    author: req.body.author,
    description: req.body.description,
    image: req.body.image,
    genre: req.body.genre,
  };
  data.books.push(newBook);
  saveData(data);
  res.status(201).json(newBook);
});

app.delete("/books/:id", (req, res) => {
  const data = readData();
  const id = req.params.id;

  data.books = data.books.filter((b) => b.id !== id);

  saveData(data);
  res.json({ msg: "Livro deletado com sucesso" });
});

app.put("/books/:id", (req,res) =>{
    const data = readData();
    const id = req.params.id;

    const index = data.books.findIndex((b)=> b.id === id);

    data.books[index] = {
        ...data.books[index],
        ...req.body,
    };

    saveData(data);
    res.json(data.books[index]);
});



//RODA O SERVER
const port = process.env.PORT || 3020;

app.listen(process.env.PORT ?? 3020, "0.0.0.0", () => {
  console.log(`Servidor rodando na porta ${port}`);
});
