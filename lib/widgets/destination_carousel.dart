import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tour_app/models/destination_model.dart';
import 'package:tour_app/models/updated_activity_model.dart';
import 'package:tour_app/screens/destination_screen.dart';

class DestinationCarousel extends StatefulWidget {
  //final List<Activity> keralactivities;

  const DestinationCarousel({Key key}) : super(key: key);

  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  List<UpActivity> _upActivityCG = List<UpActivity>();
  List<UpActivity> _upActivity = List<UpActivity>();
  List<UpActivity> _upActivityKL = List<UpActivity>();
  List<UpActivity> _upActivityMH = List<UpActivity>();
  List<UpActivity> _upActivityTN = List<UpActivity>();
  List<UpActivity> _upActivityHR = List<UpActivity>();
  List<UpActivity> _upActivityDL = List<UpActivity>();
  List<UpActivity> _upActivityTL = List<UpActivity>();
  List<UpActivity> _upActivityRJ = List<UpActivity>();
  List<UpActivity> _upActivityJK = List<UpActivity>();
  List<UpActivity> _upActivityKN = List<UpActivity>();
  List<UpActivity> _upActivityAP = List<UpActivity>();
  List<UpActivity> _upActivityUP = List<UpActivity>();
  List<UpActivity> _upActivityWB = List<UpActivity>();
  List<UpActivity> _upActivityPB = List<UpActivity>();
  List<UpActivity> _upActivityLD = List<UpActivity>();
  List<UpActivity> _upActivityOD = List<UpActivity>();
  List<UpActivity> _upActivityAM = List<UpActivity>();
  List<UpActivity> _upActivityGJ = List<UpActivity>();
  List<UpActivity> _upActivityMP = List<UpActivity>();
  List<UpActivity> _upActivityBH = List<UpActivity>();
  List<UpActivity> _upActivityUK = List<UpActivity>();
  List<UpActivity> _upActivityOT = List<UpActivity>();
  List<UpActivity> _upActivityJR = List<UpActivity>();
  List<UpActivity> _upActivityCH = List<UpActivity>();
  List<UpActivity> _upActivityHP = List<UpActivity>();
  List<UpActivity> _upActivityGA = List<UpActivity>();
  List<UpActivity> _upActivityNE = List<UpActivity>();
  String _city = 'Kerala';


  @override
  void initState() {
    super.initState();
    _populateKLActivities();
  }

  void _setCityActivity() {
    switch (_city) {
      case "Central Gov":
        {
          setState(() => {_upActivity = _upActivityCG, print(_upActivity)});
        }
        break;

      case "Kerala":
        {
          setState(() => {_upActivity = _upActivityKL, print(_upActivity)});
        }
        break;

      case "Maharashtra":
        {
          setState(() => {_upActivity = _upActivityMH, print(_upActivity)});
        }
        break;

      case "New Delhi":
        {
          setState(() => {_upActivity = _upActivityDL, print(_upActivity)});
        }
        break;

      case "Tamil Nadu":
        {
          setState(() => {_upActivity = _upActivityTN, print(_upActivity)});
        }
        break;

      case "Haryana":
        {
          setState(() => {_upActivity = _upActivityHR, print(_upActivity)});
        }
        break;

      case "Telangana":
        {
          setState(() => {_upActivity = _upActivityTL, print(_upActivity)});
        }
        break;

      case "Rajasthan":
        {
          setState(() => {_upActivity = _upActivityRJ, print(_upActivity)});
        }
        break;

      case "Jammu and Kashmir":
        {
          setState(() => {_upActivity = _upActivityJK, print(_upActivity)});
        }
        break;

      case "Karnataka":
        {
          setState(() => {_upActivity = _upActivityKN, print(_upActivity)});
        }
        break;

      case "Andhra Pradesh":
        {
          setState(() => {_upActivity = _upActivityAP, print(_upActivity)});
        }
        break;

      case "Uttar Pradesh":
        {
          setState(() => {_upActivity = _upActivityUP, print(_upActivity)});
        }
        break;

      case "West Bengal":
        {
          setState(() => {_upActivity = _upActivityWB, print(_upActivity)});
        }
        break;

      case "Punjab":
        {
          setState(() => {_upActivity = _upActivityPB, print(_upActivity)});
        }
        break;

      case "Ladakh":
        {
          setState(() => {_upActivity = _upActivityLD, print(_upActivity)});
        }
        break;

      case "Odisha":
        {
          setState(() => {_upActivity = _upActivityOD, print(_upActivity)});
        }
        break;
      case "Assam":
        {
          setState(() => {_upActivity = _upActivityAM, print(_upActivity)});
        }
        break;

      case "Madhya Pradesh":
        {
          setState(() => {_upActivity = _upActivityMP, print(_upActivity)});
        }
        break;

      case "Gujarat":
        {
          setState(() => {_upActivity = _upActivityGJ, print(_upActivity)});
        }
        break;

      case "Jharkhand":
        {
          setState(() => {_upActivity = _upActivityJR, print(_upActivity)});
        }
        break;

      case "Chattisgarh":
        {
          setState(() => {_upActivity = _upActivityCH, print(_upActivity)});
        }
        break;

      case "North East":
        {
          setState(() => {_upActivity = _upActivityNE, print(_upActivity)});
        }
        break;

      case "Himachal Pradesh":
        {
          setState(() => {_upActivity = _upActivityHP, print(_upActivity)});
        }
        break;

      case "Goa":
        {
          setState(() => {_upActivity = _upActivityGA, print(_upActivity)});
        }
        break;

      case "Bihar":
        {
          setState(() => {_upActivity = _upActivityBH, print(_upActivity)});
        }
        break;

      case "Uttarakhand":
        {
          setState(() => {_upActivity = _upActivityUK, print(_upActivity)});
        }
        break;

      case "Assam":
        {
          setState(() => {_upActivity = _upActivityAM, print(_upActivity)});
        }
        break;

      case "Others":
        {
          setState(() => {_upActivity = _upActivityOT, print(_upActivity)});
        }
        break;

      default:
        {
          print("Invalid choice");
        }
        break;
    }
  }

  void _populateKLActivities() {
    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/cgactivties.json'))
        .then((upActivity) => {
              setState(() => {_upActivityCG = upActivity})
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/keralaactivites.json'))
        .then((upActivity) => {
              setState(() => {_upActivityKL = upActivity})
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/mhactivities.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityMH = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/apactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityAP = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/dlactivities.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityDL = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/haryanaactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityHR = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/karnatakaactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityKN = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/kashmiractivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityJK = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/ladakhactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityLD = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/odishaactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityOD = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/pbactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityPB = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/rajasthanactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityRJ = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/telganaactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityTL = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/tnactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityTN = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/upactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityUP = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/wbactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityWB = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/amactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityAM = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/bhactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityBH = upActivitys,
                  })
            });
    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/chactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityCH = upActivitys,
                  })
            });
    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/gjactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityGJ = upActivitys,
                  })
            });
    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/otactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityOT = upActivitys,
                  })
            });
    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/hpactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityHP = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/jractivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityJR = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/mpactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityMP = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/neactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityNE = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/gaactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityGA = upActivitys,
                  })
            });

    Webservice()
        .load(aller(
            'https://ajaytomgeorge.github.io/flutterapp/ukactivties.json'))
        .then((upActivitys) => {
              setState(() => {
                    _upActivityUK = upActivitys,
                  })
            });
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
                'States and UTs',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  //letterSpacing:1.5,
                ),
              ),
              GestureDetector(
                onTap: () => print('See All'),
                child: Text(
                  'Scroll Right',
                  style: TextStyle(
                    color: Colors.black,
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
            height: 300.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (BuildContext context, int index) {
                Destination destination = destinations[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                    _city = destination.city;
                    });
                    _setCityActivity();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => new DestinationScreen(
                            destination: destination,
                            activities: _upActivity,
                          ),
                        )).then((value) {
                      setState(() {
                        print("back succesfull");
                      });
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    width: 210.0,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 15.0,
                          child: Container(
                            height: 120.0,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Services ',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: .8,
                                        ),
                                      ),
                                      Text(
                                        destination.description,
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ])),
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
                            child: Stack(children: <Widget>[
                              Hero(
                                tag: destination.imageUrl,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image(
                                    height: 200.0,
                                    width: 200.0,
                                    image: AssetImage(destination.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10.0,
                                bottom: 10.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      destination.city,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    Row(children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.locationArrow,
                                        size: 10.0,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5.0),
                                      Text(
                                        destination.country,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ])
                                  ],
                                ),
                              ),
                            ])),
                      ],
                    ),
                  ),
                );
              },
            ))
      ],
    );
  }
}
