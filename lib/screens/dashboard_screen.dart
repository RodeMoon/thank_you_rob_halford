import 'package:flutter/material.dart';

import 'login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Clave para el Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    //  TEMA PRINCIPAL
    final defaultColorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      key: _scaffoldKey,
      // Asigna la clave al Scaffold
      appBar: AppBar(
        backgroundColor: defaultColorScheme.primary,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Abre el drawer
          },
          icon: Icon(
            Icons.menu,
            color: defaultColorScheme.onPrimary,
          ),
        ),
        title: Text(
          "APP Bomberos",
          style: TextStyle(color: defaultColorScheme.onPrimary),
        ),
        actions: [
          /*GestureDetector(
            onTap: () {},
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.ads_click_sharp,
                  //color: defaultColorScheme.onPrimary,
                ),
              ),
            ),
          ),*/
        ],
      ),
      drawer: myDrawer(),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return const Column(
            children: [
              ListTile(
                leading: Icon(Icons.file_copy),
                title: Text('Reporte'),
                subtitle: Text('Reporte #'),
                trailing: Icon(Icons.edit_note),
              ),
              Divider(
                thickness: 0.5,
                endIndent: 25,
                indent: 25,
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: defaultColorScheme.primary,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  Widget myDrawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                //child: selectedImage != null ? Image.file(selectedImage!) : const Image(image: AssetImage("assets/pfp.jpg"))),
                child: const Image(image: AssetImage("assets/pfp.jpg"))),
            accountName: const Text("sun&moon"),
            accountEmail: const Text("zenwol@gmail.com"),
          ),
          ListTile(
            onTap: () {
              //Navigator.pushNamed(context, "/movies");
            },
            title: const Text("Perfil"),
            //subtitle: const Text("lorem ipsum"),
            leading: const Icon(Icons.person),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
          ),
          ListTile(
            onTap: () {
              //Navigator.pushNamed(context, "/preferences_drawer");
            },
            title: const Text("Preferencias"),
            subtitle: const Text("Tema / Fuente"),
            leading: const Icon(Icons.room_preferences),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
          ),
          const Padding(
              padding: EdgeInsets.all(8),
              child: Divider(
                height: 2,
              )),
          ListTile(
            onTap: () {
              /*print(
                  "Custom theme enabled (logout): ${GlobalValues.customThemeEnabled.value}");*/
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  ModalRoute.withName("/login"));
            },
            title: const Text("Cerrar Sesión"),
            //subtitle: const Text("Tema / Fuente"),
            leading: const Icon(Icons.logout),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
          ),
        ],
      ),
    );
  }
}
