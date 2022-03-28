import 'package:flutter/material.dart';
import 'package:tour_app/models/guidlines.dart';
import 'package:tour_app/widgets/guidlineslist.dart';

class HotelCarousel extends StatefulWidget {
  final List<Guidlines> guidlines;

  HotelCarousel({Key key, this.guidlines}) : super(key: key);

  @override
  _HotelCarouselState createState() => _HotelCarouselState();
}

class _HotelCarouselState extends State<HotelCarousel> {
  void navigateToGuidlinepage() {
    GuidlinessList(guidlines: widget.guidlines);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Guidelines',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          new GuidlinessList(guidlines: widget.guidlines),
                    )),
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 400.0,
          child: ListView.builder(
            //scrollDirection: Axis.horizontal,
            itemCount: widget.guidlines.length,
            itemBuilder: (BuildContext context, int index) {
              Guidlines guidline = widget.guidlines[index];
              return Container(
                  //margin: EdgeInsets.all(10.0),
                  //width: 300.0,
                  height: 280.0,
                  child: new GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 15.0,
                          child: Container(
                            height: 150.0,
                            width: 320.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 250.0,
                              width: 300.0,
                              image: NetworkImage(guidline.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                new GuidlinessList(guidlines: widget.guidlines),
                          ));
                    },
                  ));
            },
          ),
        ),
      ],
    );
  }
}
