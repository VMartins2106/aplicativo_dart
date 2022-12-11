import 'package:firebase/pages_gym/MENU/TREINO/list_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TreinoBambam extends StatefulWidget {
  const TreinoBambam({super.key});

  @override
  State<TreinoBambam> createState() => _TreinoBambamState();
}

class _TreinoBambamState extends State<TreinoBambam> {
  @override
  Widget build(BuildContext context) {

    final screenMedia = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 5),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Container(
            margin: EdgeInsets.only(
              left: 10, 
              right: 10,
            ),
            height: screenMedia.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/imagens/bambam.jpg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kleber Bambam",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenMedia.width * 0.07
                          ),
                        ),
                        Text(
                          "DickHead",
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
                              "126k",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: screenMedia.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '#8',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: screenMedia.width * 0.07
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Crazy'),
                          Text("Trainer"),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: screenMedia.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '3000+',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: screenMedia.width * 0.07
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Horas'),
                          Text("Treinadas")
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: screenMedia.width * 0.3,
                      height: 95,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '250',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: screenMedia.width * 0.07
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Aulas'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Mais populares',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenMedia.width * 0.05
                  ),
                ),
                Container(
                  height: 140,
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.centerLeft,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: mostPopularBamBam.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        width: screenMedia.width * 0.6,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                mostPopularBamBam[index].classImage,
                                width: screenMedia.width * 0.6,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${mostPopularBamBam[index].className} - ${mostPopularBamBam[index].classDifficult}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        mostPopularBamBam[index].isFav 
                                        ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              mostPopularBamBam[index].isFav = false;
                                            });

                                            showSnackBar(context, mostPopularBamBam[index], false);

                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.red.shade400,
                                          ),
                                        )
                                        :GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              mostPopularBamBam[index].isFav = true;
                                            });

                                            showSnackBar(context, mostPopularBamBam[index], true);

                                          },
                                          child: Icon(
                                            Icons.favorite_outline_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          'View',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Aulas',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenMedia.width * 0.05
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ...allClassesBamBam.map((e) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: 'CLICADO EM ${e}', 
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.grey,
                          fontSize: 17,
                        );
                      },
                      child: Container(
                        width: screenMedia.width * 0.9,
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                e.classImage,
                                width: screenMedia.width * 0.9,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 120,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      '${e.className} - ${e.classDifficult}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold  
                                        ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        e.isFav 
                                        ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            e.isFav = false;
                                          });

                                          showSnackBar(context, e, false);

                                        },
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.red.shade400,
                                        ),
                                      )
                                      :GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            e.isFav = true;
                                          });

                                          showSnackBar(context, e, true);

                                        },
                                        child: Icon(
                                          Icons.favorite_outline_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        'View',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        color: Colors.white,
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
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, ClassList e, bool liked) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            liked ? Icon(
              Icons.favorite_outline_rounded,
              color: Colors.red.shade400,
            ) : Icon(Icons.favorite_outline_rounded, color: Colors.white,),
            SizedBox(
              width: 5,
            ),
            liked ? Text(
              '${e.className} - ${e.classDifficult} curtido',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ) : Text(
              '${e.className} - ${e.classDifficult} descurtido',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}