import 'package:bibliot/pages/home_page.dart';
import 'package:bibliot/pages/toggle_page.dart';
import 'package:bibliot/routes/app.routes.dart';
import 'package:bibliot/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  bool isLoading = false;

  void _login() async {
    setState(() => isLoading = true);

    try {
      final response = await UserService.login(
        emailController.text,
        senhaController.text,
      );

      print(response);

      if (response != null) {
        final box = Hive.box("user");

        box.put("name", response["user"]["name"]);
        box.put("email", response["user"]["email"]);
        box.put("token", response["token"]);

        print(box.get("name"));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TogglePage()),
        );
      }
    } catch (e) {
      print(e);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Email ou senha inválidos')));
    }

    setState(() => isLoading = false);
  }

  bool obscurePass = true;
  void _viewPass() {
    setState(() {
      obscurePass = !obscurePass;
    });
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
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Color(0xFFF122F51),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: emailController,
                        onSubmitted: (null),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF122F51),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Color(0xFFF122F51)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xFFF122F51),
                          ),
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
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF122F51),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                          // Borda quando o campo ganha foco
                          labelText: 'Senha',
                          labelStyle: TextStyle(color: Color(0xFFF122F51)),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFFF122F51),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => _viewPass(),
                            icon: obscurePass == true
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            color: Color(0xFFF122F51),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                        obscureText: obscurePass,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Esqueci minha senha',
                              style: TextStyle(
                                color: Color.fromARGB(255, 125, 166, 148),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF17A7A8),
                          minimumSize: Size(300, 45),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ), // Cantos bem arredondados
                          ),
                        ),
                        onPressed: isLoading ? null : () => _login(),
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ainda não tem uma conta?',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFF122F51),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(
                              context,
                            ).pushNamed(AppRoutes.register),
                            child: Text(
                              'Cadatrar-se agora',

                              style: TextStyle(
                                color: Color.fromARGB(255, 114, 179, 151),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
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
