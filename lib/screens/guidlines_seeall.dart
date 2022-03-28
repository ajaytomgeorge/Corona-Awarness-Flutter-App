import 'package:flutter/material.dart';
import 'package:tour_app/models/guidlines.dart';

class ChoiceCard extends StatelessWidget {
  const ChoiceCard(
      {Key key,
      this.choice,
      this.onTap,
      @required this.item,
      this.selected: false})
      : super(key: key);

  final Guidlines choice;
  final VoidCallback onTap;
  final Guidlines item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
   // TextStyle textStyle = Theme.of(context).textTheme.display1;
    //if (selected)
     // textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return Container(
      
      child: Card(
          color: Colors.white70,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                    image: NetworkImage(choice.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              new Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(choice.title, style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
              ),),
                      ],
                    ),
                    Builder(builder: (context) {
                      if (choice.description != "None") {
                        return Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text(choice.description,
                          style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                      ),),
                        );
                      } else {
                        return Text("  ");
                      }
                    }),
                  ],
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )),
    );
  }
}
