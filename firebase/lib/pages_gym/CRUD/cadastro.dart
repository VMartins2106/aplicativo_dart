import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../autentication/auth.dart';
import '../../app_routes_notification.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({super.key});

  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {

  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _telefoneController = TextEditingController();

  final databaseRef = FirebaseDatabase.instance.reference();

  @override
  void dispose() {
    // TODO: implement dispose
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _telefoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
       child: Container(
        width: double.maxFinite,
        height: 855,
        child: Stack(
          children: <Widget>[
            Image.asset("assets/imagens/cadastro.jpg",
            width: double.maxFinite,
            height: 411,
            ),
            Positioned(
              top: 340,
              child: Container(
                padding: EdgeInsets.only(left: 40, right: 40, top: 45),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                          "Insira seus dados",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                    Padding(
                      padding:  const EdgeInsets.only(),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _nomeController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                icon: new Icon(Icons.person,
                                color: Colors.black,),
                                hintText: "Nome",
                                border: InputBorder.none
                              ),
                              validator: Validatorless.required("Nome obrigatório"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                icon: new Icon(Icons.email,
                                color: Colors.black,),
                                hintText: "email",
                                border: InputBorder.none
                              ),
                              validator:  Validatorless.required("Email obrigatório"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _senhaController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                icon: new Icon(Icons.password,
                                color: Colors.black,),
                                hintText: "senha",
                                border: InputBorder.none
                              ),
                              validator:  Validatorless.multiple([
                                Validatorless.required("Senha obrigatória"),
                                Validatorless.min(6, "Senha menor que 6 caracteres")
                              ])
                              
                              
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _telefoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                icon: new Icon(Icons.phone,
                                color: Colors.black,),
                                hintText: "telefone",
                                border: InputBorder.none
                              ),
                              validator:  Validatorless.required("telefone obrigatório"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
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
                                  child: Text("Cadastrar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                  onPressed: (() {

                                    var valido = _formKey.currentState?.validate() ?? false;
                                    if(valido){
                                      //CHAMAR CONTROLLERS E SALVAR DADOS
                                      insertDados(
                                        _nomeController.text,
                                        _emailController.text,
                                        _senhaController.text,
                                        _telefoneController.text,
                                      );
                                      Fluttertoast.showToast(
                                        msg: 'Usuário cadastrado', 
                                        toastLength: Toast.LENGTH_SHORT,
                                        backgroundColor: Colors.grey,
                                        fontSize: 17,
                                      );
                                      Navigator.pop(context, false);
                                    }
                                  }
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
  void insertDados(String nome, String email, String senha, String telefone){
    String? key = databaseRef.child("Users").push().key;
    databaseRef.child("Usuários").child(key!).set({
      'nome': nome,
      'email': email,
      'senha': senha,
      'telefone': telefone
    });

    try{
      context.read<AuthService>().registrar(_nomeController.text, _emailController.text, _senhaController.text);
    } on AuthException catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }

    _nomeController.clear();
    _emailController.clear();
    _senhaController.clear();
    _telefoneController.clear();
  }
}