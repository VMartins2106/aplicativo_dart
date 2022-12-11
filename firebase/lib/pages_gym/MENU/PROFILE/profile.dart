import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../autentication/auth.dart';
import '../../../app_routes_notification.dart';
import 'package:firebase/autentication/auth.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Query dbRef = FirebaseDatabase.instance.ref().child('Usuários');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Usuários');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              Image.asset("assets/imagens/profile.jpg",
              width: double.maxFinite,
              height: 554,
              ),
              Positioned(
                top: 260,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 45),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 120),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.EDIT_PROFILE,
                              );
                            },
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.blueAccent.withOpacity(0.1),
                              ),
                              child: const Icon (Icons.person),
                            ),
                            title: Text(
                              "Editar informações pessoais", 
                              style: TextStyle(color: Colors.blueGrey
                              ),
                            ),
                            trailing: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              child: const Icon (Icons.arrow_right),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 190),
                          child: ListTile(
                            onTap: () {

                            },
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.blueAccent.withOpacity(0.1),
                              ),
                              child: const Icon (Icons.settings),
                            ),
                            title: Text(
                              "Configurações adicionais", 
                              style: TextStyle(color: Colors.blueGrey
                              ),
                            ),
                            trailing: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              child: const Icon (Icons.arrow_right),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 260),
                          child: ListTile(
                            onTap: () {
                            },
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.blueAccent.withOpacity(0.1),
                              ),
                              child: const Icon (Icons.workspace_premium),
                            ),
                            title: Text(
                              "Assinatura premium", 
                              style: TextStyle(color: Colors.blueGrey
                              ),
                            ),
                            trailing: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              child: const Icon (Icons.arrow_right),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 330),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.FETCH
                              );
                            },
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.blueAccent.withOpacity(0.1),
                              ),
                              child: const Icon (Icons.settings),
                            ),
                            title: Text(
                              "LISTA DE USUÁRIOS", 
                              style: TextStyle(color: Colors.blueGrey
                              ),
                            ),
                            trailing: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              child: const Icon (Icons.arrow_right),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 440),
                          child: ListTile(
                            onTap: (() {
                              context.read<AuthService>().logout();
                              Navigator.of(context).pushNamed(
                                AppRoutes.HOME
                              );
                            }),
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.blueAccent.withOpacity(0.1),
                              ),
                              child: const Icon (Icons.logout),
                            ),
                            title: Text(
                              "Sair do aplicativo", 
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
              Positioned(
                top: 200,
                left: 40,
                child: Container(
                  width: 320,
                  height: 200,
                  decoration: BoxDecoration(
                    boxShadow:[ 
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 2),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 210),
                child: Column(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: AssetImage("assets/imagens/profile-picture.jpg"),
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Center(
                        child: Text(
                          "Victor Martins", 
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "User ID: -NIORpZ3HhoU2NkJHmcP", 
                        style: TextStyle(
                          fontSize: 14, 
                          color: Color.fromARGB(255, 119, 116, 116)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ), 
        ),
    );
  }
}