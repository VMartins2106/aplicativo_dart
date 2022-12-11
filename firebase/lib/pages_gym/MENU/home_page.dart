import 'package:firebase/autentication/auth.dart';
import 'package:firebase/pages_gym/MENU/like.dart';
import 'package:firebase/pages_gym/MENU/PROFILE/profile.dart';
import 'package:firebase/pages_gym/MENU/INFO/info.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../app_routes_notification.dart';

class HomePage extends StatelessWidget {

  bool sair=false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(!sair){
          return false;
        }
        return true;
      },
      child: Scaffold(
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 20),
            child: GNav(
            backgroundColor: Colors.white,
            color: Colors.black,
            tabBorderRadius: 70,
            tabBackgroundColor: Colors.blue.withOpacity(0.1),
            activeColor: Colors.blue,
            gap: 8,
            padding: EdgeInsets.all(16),
            onTabChange: (index) {
              print(index);
              if(index==0){
                //NAVEGAR PARA HOME
              } else if (index==1){
                //NAVEGAR PARA LIKES
              } else if (index==2){
                //NAVEGAR PARA TREINOS
                Navigator.of(context).pushNamed(
                  AppRoutes.TREINADORES,
                ); 
              } else if (index==3){
                //NAVEGAR PARA PROFILE
                Navigator.of(context).pushNamed(
                  AppRoutes.PROFILE,
                );  
              } 
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Inicio',
              ),
              GButton(
                icon: Icons.tips_and_updates,
                text: 'Dicas',
              ),
              GButton(
                icon: IconData(0xe28d, fontFamily: 'MaterialIcons'),
                text: 'Treinos',
              ),
              GButton(
                icon: Icons.person,
                text: 'Perfil',
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 50,
              child: Text(
                "Bem vindo usuário",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                    fontSize: 20,
                ),
              textAlign: TextAlign.center,
              ),
            ),
            /*MaterialButton(
              color: Colors.blue,
              onPressed: () {
                /*Navigator.of(context).pushNamed(
                  AppRoutes.TREINADORES,
                );*/
              },
              child: Text("Começar MEU objetivo!"),
            ),*/
          ],
        ),
      ),
    ),
    );
  }
}