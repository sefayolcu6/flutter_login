import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uilogin/create_user.dart';
import 'package:uilogin/firebase_options.dart';
import 'package:uilogin/userlist.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance;
    CollectionReference collectionReference =_firestore.collection("kullanıcılarlistesi"); 
    DocumentReference documentReference = collectionReference.doc('7c8hFXrMt8r5YBkKKNXY'); 
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
  // DocumentReference documentReference1 = _firestore.collection("kullanıcılarlistesi").doc('${emailcontroller}'); 



    return Scaffold(
        backgroundColor: Colors.indigo[50],
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text("Kullanıcı Giriş"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Text(
                "GİRİŞ YAP",
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: "Mail Adresi",
                  suffixIcon: IconButton(
                    onPressed: emailcontroller.clear,
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                controller: passwordcontroller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: passwordcontroller.clear,
                    icon: Icon(Icons.clear),
                  ),
                  hintText: "Şifre",
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[900]),
                onPressed: () {
                  // Widget cancelButton = TextButton(
                  //   child: Text("Cancel"),
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  // );

                  // AlertDialog alert = AlertDialog(
                  //   title: const Text("Uyarı!!"),
                  //   content: const Text("Tebrikler. Başarılı giriş"),
                  //   actions: [
                  //     cancelButton,
                  //   ],
                  // );

                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return alert;
                  //   },
                  // );
                },
                child: Text("Giriş Yap")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[900]),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Create_User()),
                  );
                },
                child: Text("Kullanıcı Oluştur")),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Şifremi Unuttum",
                  style: TextStyle(fontSize: 20, color: Colors.indigo),
                )),
            /*
            ElevatedButton(
                onPressed: ()async {
                  final _firestore2 = await FirebaseFirestore.instance
                      .collection("kullanıcılarlistesi")
                      .where("name", isEqualTo: "sefa")
                      .get();
                  print(_firestore2);
                },
                child: Text("verileri getir")) */
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => userlist()));
          },
          label: const Text('Kullanıcı Listesi'),
          icon: const Icon(Icons.person),
        ));
  }
}
