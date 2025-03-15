import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_integrador_bomberos/screens/dashboard_screen.dart';
import 'package:proyecto_integrador_bomberos/screens/login_screen.dart';

class AuthService {
  //static final GoogleSignIn _googleSignIn = GoogleSignIn(); // <----
  RegExp emailRegExp =
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  //  REGISTER CON EMAIL Y PASS
  Future<void> signup(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      if (emailRegExp.hasMatch(email)) {
        print('Correo válido');
        if (password.length >= 6) {
          print("contrasena valida");

          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);

          progressBar(context, "Iniciando sesion");

          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          User user = userCredential.user!;

          // Agregar usuario a Firestore
          // await _addUserToFirestore(user);

          // Cerrar el Progress Bar
          Navigator.of(context).pop();

          await Future.delayed(const Duration(seconds: 1));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const DashboardScreen()));
        } else {
          Navigator.of(context, rootNavigator: true).pop();

          Fluttertoast.showToast(
            msg: "Ingrese una contrasena de al menos 6 caracteres.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 14.0,
          );
        }
      } else {
        Navigator.of(context, rootNavigator: true).pop();

        Fluttertoast.showToast(
          msg: "Ingrese un correo valido.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 14.0,
        );
      }
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      } else {
        message = 'Error: ${e.message}';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Ocurrió un error inesperado: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  progressBar(BuildContext context, String cadena) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // No permite cerrar el diálogo tocando fuera de él
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text(cadena),
            ],
          ),
        );
      },
    );
  }

/*
  Future<void> _addUserToFirestore(User user) async {
    try {
      // Referencia a la colección "usuarios" en Firestore
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      // Crear un nuevo documento en Firestore con el ID del usuario de Firebase
      await users.doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'name': user.displayName ?? 'Sin nombre',
        'photoUrl': user.photoURL ?? '',
        'createdAt': Timestamp.now(),
      });

      print("Usuario agregado a Firestore.");
    } catch (e) {
      print("Error al agregar el usuario a Firestore: $e");
    }
  }*/

  //  LOGIN CON EMAIL Y PASS
  Future<void> signin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      if (emailRegExp.hasMatch(email)) {
        print('Correo válido');
        if (password.length >= 6) {
          print("contrasena valida");

          progressBar(context, "Iniciando sesion");

          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          User user = userCredential.user!;

          await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);

          // Agregar usuario a Firestore
          // await _addUserToFirestore(user);

          // Cerrar el Progress Bar
          Navigator.of(context).pop();

          await Future.delayed(const Duration(seconds: 1));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const DashboardScreen()));
        } else {
          Fluttertoast.showToast(
            msg: "Ingrese una contrasena de al menos 6 caracteres.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 14.0,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: "Ingrese un correo valido.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 14.0,
        );
      }
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No se encontro un usuario asociado al correo.';
      } else if (e.code == 'wrong-password') {
        message = 'Contrasena incorrecta.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }
}
