import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase/autentication/auth.dart';
import 'package:validatorless/validatorless.dart';
import '../../app_routes_notification.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:local_auth/local_auth.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
       child: Container(
        width: double.maxFinite,
        height: 900,
        child: Stack(
          children: <Widget>[
            Image.asset("assets/imagens/welcome.jpg",
            width: double.maxFinite,
            height: 490,
            ),
            Positioned(
              top: 340,
              child: Container(
                padding: EdgeInsets.only(left: 40, right: 40, top: 55),
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
                      padding: const EdgeInsets.only(),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  icon: new Icon(Icons.email,
                                  color: Colors.black,),
                                  hintText: "Email",
                                  border: InputBorder.none
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: TextFormField(
                                controller: _senhaController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                  icon: new Icon(Icons.password,
                                  color: Colors.black,),
                                  hintText: "Senha",
                                  //suffixIcon: Icon(Icons.remove_red_eye),
                                  border: InputBorder.none
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 175, bottom: 40),
                      child: RichText(
                        text: new TextSpan(
                          children: [
                            new TextSpan(
                              text: 'Esqueceu sua senha?',
                              style: new TextStyle(color: Colors.blueGrey),
                              recognizer: TapGestureRecognizer()
                              ..onTap = () { 
                                Navigator.of(context).pushNamed(
                                  AppRoutes.RESET_PASSWORD,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
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
                          child: Text("Entrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          onPressed: (() {
                            // MÉTODO PARA AUTENTICAR E LOGAR 
                            
                            if(_emailController.text.isEmpty || _senhaController.text.isEmpty){
                              Fluttertoast.showToast(
                                msg: 'Email ou senha vazios', 
                                toastLength: Toast.LENGTH_SHORT,
                                backgroundColor: Colors.grey,
                                fontSize: 17,
                              );
                            } else if (_senhaController.text.trim().length<6){
                              Fluttertoast.showToast(
                                msg: 'Senha curta demais', 
                                toastLength: Toast.LENGTH_SHORT,
                                backgroundColor: Colors.grey,
                                fontSize: 17,
                              );
                            } else{
                              login();
                            }
                          }
                          ),                          
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: RichText(
                        text: new TextSpan(
                          children: [
                          new TextSpan(
                            text: 'Não tem conta? ',
                            style: new TextStyle(color: Colors.black),
                          ),
                          new TextSpan(
                            text: 'Cadastrar',
                            style: new TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () { 
                                Navigator.of(context).pushNamed(
                                  AppRoutes.SIGNUP,
                                );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Ou se conecte com",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0xFF2f67b1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: MaterialButton(
                          child: Image.asset(
                            "assets/imagens/facebook.png",
                            width: double.maxFinite,
                            height: double.maxFinite,
                          ),
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: 'LOGIN FACEBOOK', 
                                toastLength: Toast.LENGTH_SHORT,
                                backgroundColor: Colors.grey,
                                fontSize: 17,
                              );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0xFF54aeef),
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: MaterialButton(
                          child: Image.asset(
                            "assets/imagens/twitter.png",
                            width: 70,
                            height: double.maxFinite,
                          ),
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: 'LOGIN TWITTER', 
                                toastLength: Toast.LENGTH_SHORT,
                                backgroundColor: Colors.grey,
                                fontSize: 17,
                              );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0xFFde4a36),
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: MaterialButton(
                          child: Image.asset(
                            "assets/imagens/google.png",
                            width: 55,
                            height: double.maxFinite,
                          ),
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: 'LOGIN GOOGLE', 
                                toastLength: Toast.LENGTH_SHORT,
                                backgroundColor: Colors.grey,
                                fontSize: 17,
                              );
                          },
                        ),
                      ),
                    ],
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
  void login() async {
    try{
      await context.read<AuthService>().login(_emailController.text, _senhaController.text);
      Navigator.of(context).pushNamed(
        AppRoutes.TELA_INICIAL,
      );
    } on AuthException catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }

    _emailController.clear();
    _senhaController.clear();
  }
}