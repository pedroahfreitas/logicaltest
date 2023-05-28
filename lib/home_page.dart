import 'package:flutter/material.dart';
import 'package:logicaltestmain_main/loginpage.dart';

import 'curiosidades.dart';
import 'dialogs.dart';
import 'register/model/register_model.dart';
import 'register/staps/one_page.dart';
import 'signuppage.dart';
import 'validation.dart';

main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Validation validar = Validation();
  final Routes = TextEditingController();
  late RegisterModel registerModel;

  bool tappedYes = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Math', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Form(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  child: Image.asset('assets/images/logo.png'),
                  width: 400,
                  height: 400,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Background color
                  ),
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final action = await ViewDialogs.yesOrNoDialog(
            context,
            'Cadastrar',
            'Deseja cadastrar para salvar seu progresso?',
          );
          if (action == ViewDialogsAction.yes) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignupPage()));
          }
          if (action == ViewDialogsAction.no) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => OnePage()));
            // setState(() => tappedYes = false);
          }
        },
        label: const Text('PLAY'),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Maths Testes de Lógica'),
                accountEmail: Text('logicalmaths@mail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo1.png'),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.announcement),
                title: const Text("Cadastro"),
                subtitle: const Text("cadastre-se aqui..."),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.cloud),
                title: const Text("Desafios"),
                subtitle: const Text("lista de desafios..."),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnePage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text("Curiosidades"),
                subtitle: const Text("veja detalhes sobre logica..."),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CuriosidadesPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Login"),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
