import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pitch/Providers/globalData.dart';
import 'package:pitch/Screens/AllIdeasScreen.dart';
import 'package:pitch/Screens/allIdeas.dart';
import 'package:pitch/Screens/pitch.dart';
import 'package:pitch/Widgets/drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = '/homescreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 

  List<String> names = [];

  @override
  Widget build(BuildContext context) {
    final isnew = Provider.of<Global>(context, listen: false).isnewuser;
    print('isnew :$isnew');
    final fireauth = FirebaseAuth.instance;
    print(fireauth.currentUser.email);
    print(fireauth.currentUser.uid);

    final app = Firebase.app();
    print('appname : ${app.name}');
    print('homescrren build method');
    final mediaquery = MediaQuery.of(context);

    /*appBar: AppBar(
        title: Text(
          'Pitch Your Idea',
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          FloatingActionButton(onPressed: () {
            names.clear();
            final firestore = FirebaseFirestore.instance;
            firestore
                .collection('users/Q2YD3nY5MJ9Jcv7DyEbr/Info')
                .snapshots()
                .listen((data) {
              for (int i = 0; i < data.docs.length; i++) {
                setState(() {
                  names.add(data.docs[i]['name']);
                });
                print(data.docs[i]['name']);
              }
            });
          }),
        ],
      ),*/
    //drawer: Drawers(),

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                focusColor: Colors.green,
                hoverColor: Colors.amber,
                splashColor: Theme.of(context).primaryColor,
                onTap: ()
                    //async
                    {
                  Navigator.of(context).pushNamed(Pitch.routename);
                },
                /*bool f = true;
                  var fut = await showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: Text('Heading'),
                          content: Text('Do you want to go to next page'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                f = true;
                                Navigator.of(context).pop(true);
                              },
                              child: Text('Yes'),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  f = false;
                                  Navigator.of(context).pop(false);
                                },
                                child: Text('No')),
                          ],
                        );
                      });
                  print(fut);
                  if (fut == true) {*/

                // } else
                // return;

                child: Stack(
                  children: [
                    Container(
                      height: mediaquery.size.height * 0.3,

                      width: mediaquery.size.width * 1,

                      margin: EdgeInsets.all(7),

                      //alignment: Alignment.center,

                      //padding: EdgeInsets.all(3),

                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.black54,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:
                            Image.asset('assets/pitch.jpg', fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                        width: 300,
                        color: Colors.black54,
                        child: FittedBox(
                            child: Text('Tap to pitch your idea',
                                style: TextStyle(color: Colors.white)))),
                  ],
                  alignment: Alignment.center,
                  fit: StackFit.loose,
                ),
              ),
              SizedBox(height: 15),
              // Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AllIdeasScreen.routename);
                  },
                  child: Text(
                    'Click to Browse All Ideas',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  )),

              //width: double.infinity,
              Container(
                  color:
                      //Colors.white70,
                      Color.fromRGBO(222, 184, 135, 1),
                  child: AllIdeas()),
            ],
          ),
        ),
      ),
    );
  }
}
