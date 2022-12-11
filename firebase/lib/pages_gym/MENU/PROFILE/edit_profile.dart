import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
       child: Stack(
        children: <Widget>[
          Image.asset("assets/imagens/edit-profile.jpg",
            width: double.maxFinite,
            height: 491,
          ),
           Positioned(
            top: 320,
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
            ),
          ),
          Positioned(
                top: 280,
                left: 20,
                child: Container(
                  width: 360,
                  height: 570,
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
                padding: const EdgeInsets.only(top: 255, left: 130),
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
                  ],
                ),
              ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(top: 325, left: 200),
              child: Container(
                width: 60,
                height: 60,
                child: Icon(Icons.camera_alt_outlined, color: Colors.blueGrey,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow:[ 
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 2),
                      ),
                    ],
                borderRadius: BorderRadius.all(Radius.circular(100))),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 415, left: 40, right: 40),
              child: Column(
                children: [
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("Nome completo"),
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Colors.blue),
                            )
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("Email"),
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Colors.blue),
                            )
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("Telefone"),
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Colors.blue),
                            )
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("Senha"),
                            prefixIcon: Icon(Icons.fingerprint),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Colors.blue),
                            )
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("Endereço"),
                            prefixIcon: Icon(Icons.location_on),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Colors.blue),
                            )
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                        height: 55,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.3, 1],
                            colors: [
                             Color.fromARGB(255, 145, 185, 204),
                             Color.fromARGB(255, 136, 226, 192),
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(32),
                          ),
                        ),
                        child: MaterialButton(
                          child: Text("Salvar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          onPressed: (() {
                            Fluttertoast.showToast(
                                msg: 'Dados salvos!', 
                                toastLength: Toast.LENGTH_SHORT,
                                backgroundColor: Colors.grey,
                                fontSize: 17,
                              );
                            Navigator.pop(context, false);
                          }),
                        ),
                      ),
                      SizedBox(height: 32),
                      ],
                  ),
              ),
                ],
            ),
          ),
      ]),
    ),
    );
  }
}