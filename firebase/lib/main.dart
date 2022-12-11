import 'package:firebase/pages_gym/CRUD/cadastro.dart';
import 'package:firebase/pages_gym/MENU/INFO/info.dart';
import 'package:firebase/pages_gym/MENU/PROFILE/edit_profile.dart';
import 'package:firebase/pages_gym/MENU/TREINO/LEGENDS/treino_breier.dart';
import 'package:firebase/pages_gym/MENU/TREINO/LEGENDS/treino_ronnie.dart';
import 'package:firebase/pages_gym/MENU/home_page.dart';
import 'package:firebase/pages_gym/MENU/PROFILE/profile.dart';
import 'package:firebase/pages_gym/CRUD/recuperar_senha.dart';
import 'package:firebase/pages_gym/CRUD/welcome.dart';
import 'package:firebase/pages_gym/MENU/PROFILE/fetch_data.dart';
import 'package:firebase/pages_gym/MENU/TREINO/treinadores.dart';
import 'package:firebase/pages_gym/MENU/TREINO/LEGENDS/treino_johann.dart';
import 'package:firebase/app_routes_notification.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'autentication/auth.dart';
import 'pages_gym/MENU/TREINO/LEGENDS/treino_bambam.dart';
import 'pages_gym/MENU/TREINO/LEGENDS/treino_eddie.dart';
import 'pages_gym/MENU/TREINO/LEGENDS/treino_jay.dart';
import 'pages_gym/MENU/TREINO/LEGENDS/treino_arnold.dart';
import 'pages_gym/MENU/TREINO/LEGENDS/treino_zyzz.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthService(),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
          primarySwatch: Colors.blue,
       ),
        routes: {
          AppRoutes.HOME:(_) => WelcomePage(),
          AppRoutes.SIGNUP: (_) => Cadastrar(),
          AppRoutes.RESET_PASSWORD: (_) => ResetPassword(),
          AppRoutes.TELA_INICIAL: (_) => HomePage(),
          AppRoutes.PROFILE: (_) => ProfilePage(),
          AppRoutes.FETCH: (_) => FetchData(),
          AppRoutes.EDIT_PROFILE: (_) => EditProfile(),
          AppRoutes.TREINADORES: (_) => Treinadores(),
          AppRoutes.TREINO_JOHANN: (_) => TreinoJohann(),
          AppRoutes.TREINO_RONNIE: (_) => TreinoRonnie(),
          AppRoutes.TREINO_BREIER: (_) => TreinoBreier(),
          AppRoutes.TREINO_ZYZZ: (_) => TreinoZyzz(),
          AppRoutes.TREINO_EDDIE: (_) => TreinoEddie(),
          AppRoutes.TREINO_JAY: (_) => TreinoJay(),
          AppRoutes.TREINO_ARNOLD: (_) => TreinoArnold(),
          AppRoutes.TREINO_BAMBAM: (_) => TreinoBambam(),
          AppRoutes.INFO: (_) => InfoPage(),
        },
      ),
    );
  }
}