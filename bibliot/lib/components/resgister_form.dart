import 'package:bibliot/routes/app.routes.dart';
import 'package:bibliot/services/user_service.dart';
import 'package:flutter/material.dart';

class ResgisterForm extends StatefulWidget {
  const ResgisterForm({super.key});

  @override
  State<ResgisterForm> createState() => _ResgisterFormState();
}

class _ResgisterFormState extends State<ResgisterForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  bool isLoading = false;

    void _register() async {  
  setState(() => isLoading = true);

  try {
    await UserService.register(
      nameController.text,
      emailController.text,
      senhaController.text,
    );
    if(nameController.text.isEmpty || emailController.text.isEmpty || senhaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha todos os campos')),
      );
      return;
    }else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário cadastrado com sucesso')),
      );
    }
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);

  } catch (e) {
    print(e);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erro ao cadastrar usuário')),
    );
  }
 setState(() => isLoading = false);
    }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                color: const Color.fromARGB(255, 240, 246, 239),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                     
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          
                          Text(
                            'Casdastrar-se',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: nameController,
                        onSubmitted: (null),
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: emailController,
                        onSubmitted: (null),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      TextField(
                        controller: senhaController,
                        onSubmitted: (null),
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          prefixIcon: Icon(Icons.lock),
                      
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          
                        ),
                        
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF17A7A8),
                          minimumSize: Size(300, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ), // Cantos bem arredondados
                          ),
                        ),
                        onPressed: isLoading ? null : () => _register(),
                        child: Text(
                          'Castrar-se',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
