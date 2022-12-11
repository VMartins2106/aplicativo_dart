import 'package:firebase/pages_gym/MENU/home_page.dart';
import 'package:firebase/pages_gym/MENU/TREINO/payLoad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../../../app_routes_notification.dart';

class Treinadores extends StatefulWidget {
  const Treinadores({super.key});

  @override
  State<Treinadores> createState() => _TreinadoresState();
}

class _TreinadoresState extends State<Treinadores> {

  late final LocalNotificationsService service;

  @override
  void initState() {
    service = LocalNotificationsService();
    service.initialize();
    //LISTENER PARA PAYLOAD NOTIFICATION
    //listenToNotification();
    super.initState();
  }

  double translateX = 0.0;
  double translateY = 0.0;
  double myWidth = 0;

  @override
  Widget build(BuildContext context) {

    bool valor = false;

    final screenMedia = MediaQuery.of(context).size;

    showNotification(){
      setState(() {
        valor = !valor;
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          height: 1680,
          child: Stack(
            children: [
              Image.asset("assets/imagens/olympia.jpg",
                width: double.maxFinite,
                height: 395,
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
                top: 300,
                left: 48,
                child: Container(
                  width: 300,
                  height: 160,
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 37),
                    child: Text(
                      "Os melhores treinadores \n   de todos os tempos!!",
                      style: TextStyle(
                        color: Colors.blueGrey.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 360, left: 140),
                child: Image.asset("assets/imagens/personal.png",
                  width: 90,
                  height: 70,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 430, left: 87),
                child: Text(
                  "Com o premiu você pode ter todos!",
                  style: TextStyle(
                    color: Colors.blueGrey.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 480, left: 16),
                    child: Positioned(
                      top: 470,
                      left: 48,
                      child: Container(
                        width: 360,
                        height: 1100,
                        decoration: BoxDecoration(
                          boxShadow:[ 
                            BoxShadow(
                              color: Colors.blue.shade300.withOpacity(1),
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.TREINO_JOHANN,
                                  ); 
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20, left: 20, right: 8),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: Image.asset(
                                          "assets/imagens/treinador.jpg",
                                          width: 90,
                                          height: 90,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Johann Schatz",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.065
                                              ),
                                            ),
                                            Text(
                                              "Professional trainer",
                                              style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.04,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star_rounded,
                                                  color: Colors.amber,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "83k",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.TREINO_RONNIE,
                                ); 
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0, left: 20, right: 8),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        "assets/imagens/treinador_ronnie.png",
                                        width: 90,
                                        height: 90,
                                        fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Ronnie Coleman",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.065
                                              ),
                                            ),
                                            Text(
                                              "The best of all time",
                                              style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.04,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color: Colors.amber,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "291k",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.TREINO_BREIER,
                                ); 
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0, left: 20, right: 8),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        "assets/imagens/breier.jpg",
                                        width: 90,
                                        height: 90,
                                        fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Breier",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.065
                                              ),
                                            ),
                                            Text(
                                              "Professional aesthetic",
                                              style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.04,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color: Colors.amber,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "137k",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.TREINO_ZYZZ,
                                ); 
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0, left: 20, right: 8),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        "assets/imagens/zyzz.jpg",
                                        width: 90,
                                        height: 90,
                                        fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Eterno Zyzz",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.065
                                              ),
                                            ),
                                            Text(
                                              "Master of aesthetic",
                                              style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.04,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color: Colors.amber,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "451k",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.TREINO_EDDIE,
                                ); 
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0, left: 20, right: 8),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        "assets/imagens/eddie.jpg",
                                        width: 90,
                                        height: 90,
                                        fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Eddie Hall",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.065
                                              ),
                                            ),
                                            Text(
                                              "The beast",
                                              style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.04,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color: Colors.amber,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "281k",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.TREINO_JAY,
                                ); 
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0, left: 20, right: 8),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        "assets/imagens/jay.jpg",
                                        width: 90,
                                        height: 90,
                                        fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Jay Cutler",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.065
                                              ),
                                            ),
                                            Text(
                                              "Quad Stomp",
                                              style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.04,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color: Colors.amber,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "300k",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.TREINO_ARNOLD,
                                ); 
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0, left: 20, right: 8),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        "assets/imagens/arnold.jpg",
                                        width: 90,
                                        height: 90,
                                        fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Daddy Arnold",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.065
                                              ),
                                            ),
                                            Text(
                                              "Mr. Olympia",
                                              style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.04,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color: Colors.amber,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "999k",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.TREINO_BAMBAM,
                                ); 
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0, left: 20, right: 8),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        "assets/imagens/bambam.jpg",
                                        width: 90,
                                        height: 90,
                                        fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Kleber Bambam",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.065
                                              ),
                                            ),
                                            Text(
                                              "Monster Trainer",
                                              style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenMedia.width * 0.04,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color: Colors.amber,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "126k",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                              child: SlideAction(
                                borderRadius: 12,
                                elevation: 0,
                                innerColor: Colors.blue.shade400,
                                outerColor: Colors.blue.shade200,
                                sliderButtonIcon: const Icon( 
                                  Icons.lock_open,
                                  color: Colors.white,
                                ),
                                text: 'Deslize para desbloquear',
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                onSubmit: () async {
                                  
                                  //NOTIFICAÇÃO INSTANTÂNEA: 

                                  await service.showNotification(
                                    id: 0, 
                                    title: 'Notificação teste', 
                                    body: 'Tetse realizado com sucesso',
                                  );


                                  /*NOTIFICAÇÃO AGENDADA:

                                  await service.showScheduleNotification(
                                    id: 0, 
                                    title: 'Notificação teste', 
                                    body: 'Tetse realizado com sucesso',
                                    seconds: 5,
                                  );*/

                                  /*NOTIFICAÇÃO QUE REDIRECIONA A UMA TELA APÓS O CLICK

                                  await service.showNotificationWithPayLoad(
                                    id: 0, 
                                    title: 'Notificação teste', 
                                    body: 'Tetse realizado com sucesso',
                                    payLoad: 'Navegação payLoad'
                                  );*/

                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }

  //MÉTODO PARA REDIRECIONAR PARA OUTRA TELA APÓS CLICAR NA PAYLOAD NOTIFICATION
  /*void listenToNotification() => service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payLoad) {
    if(payLoad != null && payLoad.isNotEmpty){
      print('payload $payLoad');
      
      Navigator.push(context, MaterialPageRoute(builder: (context) => TelaPayLoad()));
    }
  }*/
}