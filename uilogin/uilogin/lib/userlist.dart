import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uilogin/create_user.dart';
import 'package:uilogin/firebase_options.dart';
import 'package:uilogin/userlist.dart';

class userlist extends StatefulWidget {
  const userlist({super.key});

  @override
  State<userlist> createState() => _userlistState();
}

class _userlistState extends State<userlist> {
  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance;
    CollectionReference collectionReference =_firestore.collection("kullanıcılarlistesi"); 
   // DocumentReference documentReference1 = _firestore.collection("kullanıcılarlistesi").doc('7c8hFXrMt8r5YBkKKNXY'); 

    return Scaffold(
        backgroundColor: Colors.indigo[50],
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: const Text("Kullanıcı Listesi"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(children: [

              StreamBuilder<QuerySnapshot>( 
                stream:collectionReference.snapshots() ,    
                builder:(BuildContext context,AsyncSnapshot asyncSnapshot){ 


                List<DocumentSnapshot> ListOfDocumantSnapshot=asyncSnapshot.data.docs;
                return Flexible(
                  child: ListView.builder(
                    itemCount: ListOfDocumantSnapshot.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text('${ListOfDocumantSnapshot[index].data()}',style: TextStyle(fontSize: 24),),
                          subtitle: Text('${ListOfDocumantSnapshot[index].data()}',style: TextStyle(fontSize: 16),),
                          trailing: IconButton(
                            iconSize: 40,
                            color: Colors.red[900],
                            icon: Icon(Icons.delete), onPressed: ()async { 
                           await ListOfDocumantSnapshot[index].reference.delete();
                           },),
                      
                        ),
                      );
                      
                      
                      
                      
                    },
                    ),
                );


              },
            ),

            
          ]),
        ),
        /*
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Kullanıcıları Getir'),
          icon: const Icon(Icons.person),
        )*/
        );
        
  }
  
}
