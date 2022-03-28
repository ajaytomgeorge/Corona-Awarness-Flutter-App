import 'package:flutter/material.dart';
import 'package:tour_app/models/Choice.dart';
import 'package:tour_app/models/guidlines.dart';
import 'package:tour_app/screens/guidlines_seeall.dart';

class GuidlinessList extends StatelessWidget {
  final List<Guidlines> guidlines;

  GuidlinessList({Key key, this.guidlines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Covid19 Cards',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blueAccent),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          //padding: const EdgeInsets.all(10.0),
          children: List.generate(guidlines.length, (index) {
            return Container(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: ChoiceCard(
                    choice: guidlines[index], item: guidlines[index]),
              ),
            );
          }),
        ),
      ),
    );
  }
}
