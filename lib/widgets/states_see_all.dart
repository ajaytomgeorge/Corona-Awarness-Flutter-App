import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tour_app/models/states_model.dart';
import 'package:tour_app/services/fetch_stateslist.dart';


class StatesSeeAll extends StatefulWidget {
  @override
  _StatesSeeAllState createState() => _StatesSeeAllState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;
 
  Debouncer({this.milliseconds});
 
  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
 

class _StatesSeeAllState extends State<StatesSeeAll> {
  List<IndianState> indianstates = List();
  List<IndianState> filteredindianstates = List();
  final _debouncer = Debouncer(milliseconds: 100);

@override
void initState() {
  super.initState();
  Services.getIndianStates().then((statesFromServer) {
    setState(() {
      indianstates = statesFromServer;
      filteredindianstates=indianstates;
    });
  });
}
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Filter by name or email',
            ),
            onChanged: (string) {
            _debouncer.run(() {
                setState(() {
                  filteredindianstates = indianstates
                      .where((u) => (u.name
                              .toLowerCase()
                              .contains(string.toLowerCase()) ||
                          u.key.toLowerCase().contains(string.toLowerCase())))
                      .toList();
                });
              });
            },
          ),
            Expanded(
  child: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: filteredindianstates.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        filteredindianstates[index].name,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        filteredindianstates[index].key.toLowerCase(),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
  ),
),
        ],
      ),
          ),
    );
  }}
