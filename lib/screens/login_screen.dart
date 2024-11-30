import 'package:flutter/material.dart';
import 'package:proyecto_integrador_bomberos/components/my_button.dart';
import 'package:proyecto_integrador_bomberos/components/my_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final txtUserController = TextEditingController();
  final txtpWDController = TextEditingController();

  void signInUser() {
    Navigator.pushNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con GIF
          Image.asset(
            'assets/background.gif', // GIF
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Image.asset(
                    "assets/fireman_hat.png",
                    width: 200,
                  ),
                  const SizedBox(height: 50),
                  const Text('¡Bienvenido!',
                      style: TextStyle(
                        fontFamily: 'NexaDemo',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 32,
                      )),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: txtUserController,
                    obscureText: false,
                    hintText: 'Usuario',
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: txtpWDController,
                    hintText: 'Contraseña',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '¿Olvidó su contraseña?',
                          style: TextStyle(
                            fontFamily: 'NexaDemo',
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 75),
                  MyButton(onTap: signInUser),
                  const SizedBox(height: 50),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('¿No está registrado?'),
                      SizedBox(width: 4),
                      Text(
                        'Regístrese ahora',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
