import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_integrador_bomberos/screens/dashboard_screen.dart';
import 'package:proyecto_integrador_bomberos/screens/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  ); // <----
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
          print("contraseña válida");

          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);

          progressBar(context, "Iniciando sesión");

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
            msg: "Ingrese una contraseña de al menos 6 carácteres",
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
          msg: "Ingrese un correo valido",
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
        message = 'An account already exists with that email';
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
//  LOGIN CON GOOGLE
  signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    
    if (gUser == null) {
      print("Inicio de sesión cancelado");
      return; // Si el usuario cancela, simplemente salimos de la función
    }

    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    progressBar(context, "Iniciando sesión...");

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    User user = userCredential.user!;

    // Cerrar el Progress Bar
    Navigator.of(context).pop();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  } catch (e) {
    print("Error en Google Sign-In: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error al iniciar sesión con Google: $e")),
    );
  }
}

Future<void> signout({required BuildContext context}) async {
    progressBar(context, "Cerrando sesión");
    try {
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.signOut();

      // Cerrar el Progress Bar
      Navigator.of(context).pop();

      // Opcional: Mostrar un mensaje indicando que la sesión se ha cerrado
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Has cerrado sesión exitosamente")),
      );

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen()));
    } catch (e) {
      // Manejo de errores
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al cerrar sesión: $e")),
      );
    }
  }

  //  LOGIN CON EMAIL Y PASS
  Future<void> signin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      if (emailRegExp.hasMatch(email)) {
        print('Correo válido');
        if (password.length >= 6) {
          print("contraseña válida");

          progressBar(context, "Iniciando sesión");

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
            msg: "Ingrese una contraseña de al menos 6 carácteres.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 14.0,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: "Ingrese un correo válido.",
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
        message = 'No se encontró un usuario asociado al correo.';
      } else if (e.code == 'wrong-password') {
        message = 'Contraseña incorrecta.';
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
