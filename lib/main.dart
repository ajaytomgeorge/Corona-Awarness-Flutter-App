import 'package:flutter/material.dart';
import 'package:tour_app/models/guidlines.dart';
import 'package:tour_app/services/fetch_imageurl_git.dart';
import 'package:tour_app/screens/home_screen.dart';
import 'package:tour_app/widgets/states_see_all.dart';


void main() => runApp(MyApp(guidlines:fetchGitGuidlineURLS() ));

class MyApp extends StatelessWidget {
  final Future<List<Guidlines>> guidlines; 
  MyApp({Key key, this.guidlines}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coronoa Alerts and Helpline',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: StatesSeeAll(),
      /*
      home: Center(
            child: FutureBuilder<List<Guidlines>>(
               future: guidlines, builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error); 
                  return snapshot.hasData ? HomeScreen(guidlines: snapshot.data)
                  
                  // return the ListView widget : 
                  :Center(child: CircularProgressIndicator()); 
               },
            ),
         )
         */
    );
  }
}
