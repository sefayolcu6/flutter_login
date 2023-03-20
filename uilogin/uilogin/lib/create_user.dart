import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Create_User extends StatefulWidget {
  const Create_User({super.key});

  @override
  State<Create_User> createState() => _Create_UserState();
}

class _Create_UserState extends State<Create_User> {


  @override
  Widget build(BuildContext context) {
        final _firestore=FirebaseFirestore.instance; 
    CollectionReference collectionReference=_firestore.collection("kullanıcılarlistesi"); //querysnapshot döner
    DocumentReference documentReference = collectionReference.doc('7c8hFXrMt8r5YBkKKNXY'); //documentsnapshot döner
      TextEditingController namecontroller=TextEditingController();
  TextEditingController surnamecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
    return Scaffold(
        backgroundColor: Colors.indigo[50],
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text("Kullanıcı Oluştur"),
          centerTitle: true,
        ),
        body: Column(
          children: [
           const Padding(
              padding:  EdgeInsets.all(8.0),
              child:  Text(
                "HOŞ GELDİNİZ..",
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                 controller:namecontroller,
                decoration:  InputDecoration(
                  hintText: " İsim",
                     suffixIcon: IconButton(
                    onPressed: namecontroller.clear,
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                 controller:surnamecontroller,
                decoration: InputDecoration(
                  hintText: " Soyisim",
                    suffixIcon: IconButton(
                    onPressed: surnamecontroller.clear,
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                 controller:emailcontroller,
                decoration:  InputDecoration(
                  hintText: " Mail Adresi",
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
                controller:passwordcontroller,
                decoration:  InputDecoration(
                  hintText: " Şifre",
                  suffixIcon: IconButton(
                    onPressed: passwordcontroller.clear,
                    icon: Icon(Icons.clear),
                  ),                  
                ),
              ),
            ),
            ElevatedButton(
              
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[900]),
                onPressed: () async {

          Map<String,dynamic> infodata=
          {
            'name':namecontroller.text,
            'surname':surnamecontroller.text,
            'email':emailcontroller.text,
            'password':passwordcontroller.text
          };
         await collectionReference.doc(namecontroller.text).set(infodata); //oluşacak dökümanın auto Id ismi
          //set metodu map bir veri bekler ona oluşturduğumuz controller ları verdik.
        },
                child: Text("Kullanıcı Kaydet")),
          ],
        ));
  }
}
