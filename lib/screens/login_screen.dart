import 'package:flutter/material.dart';
import 'package:proyecto_integrador_bomberos/components/my_button.dart';
import 'package:proyecto_integrador_bomberos/components/my_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;
    final currentWidth = MediaQuery.of(context).size.width;

    //  Controllers
    final txtUserController = TextEditingController();
    final txtpWDController = TextEditingController();

    //  Iniciar Sesion Metodo
    void signInUser() {
      Navigator.pushNamed(context, "/home");
    }

    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          //  LOGO
          Image.asset(
            "assets/bombero_icon_logo.png",
            width: 200,
          ),
          const SizedBox(
            height: 50,
          ),

          //  SALUDO
          const Text(
            'Bienvenido',
            style: TextStyle(color: Colors.grey, fontSize: 32),
          ),
          const SizedBox(
            height: 25,
          ),

          //  TEXTFIELD USUARIO
          MyTextField(
            controller: txtUserController,
            obscureText: false,
            hintText: 'Usuario',
          ),

          const SizedBox(
            height: 10,
          ),

          //  TEXTFIELD PASSWORD
          MyTextField(
            controller: txtpWDController,
            hintText: 'Contraseña',
            obscureText: true,
          ),

          const SizedBox(
            height: 10,
          ),

          //  OLVIDO CONTRASENA
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('¿Olvidó su contraseña?'),
              ],
            ),
          ),

          const SizedBox(
            height: 75,
          ),

          //  SIGN IN BUTTON
          MyButton(
            onTap: signInUser,
          ),

          const SizedBox(
            height: 50,
          ),

          //  REGISTER BUTTON
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('¿No está registrado?'),
              SizedBox(
                width: 4,
              ),
              Text(
                'Registrece ahora',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    )));
  }
}
