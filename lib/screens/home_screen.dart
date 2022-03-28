import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tour_app/models/guidlines.dart';
import 'package:tour_app/widgets/destination_carousel.dart';
import 'package:tour_app/widgets/hotel_carousel.dart';
import 'package:tour_app/widgets/newsList.dart';
import 'package:url_launcher/url_launcher.dart';
class HomeScreen extends StatefulWidget {
  final List<Guidlines> guidlines;

  HomeScreen ({ Key key, this.guidlines });
   
   //ActivityScreen({Key key, this.title, this.activity}) : super(key: key); 

  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex =0;
  int _currentTab=0;
  List<IconData> _icons=[
    FontAwesomeIcons.home,
    FontAwesomeIcons.newspaper,
    FontAwesomeIcons.map,
    FontAwesomeIcons.notesMedical

  ];

   Future _navigatenewsList() {
     _selectedIndex=0;
      var push = Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => NewsList()
                              
                            ),
                        
                        );
            return push;   
   }


  Future<void> _launchInWebViewWithJavaScript(String url) async {
    _selectedIndex=0;
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: false,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }


    

  Widget _buildIcon(int index){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        setState((){
          _selectedIndex=index;

        });
        _selectedIndex==1?_navigatenewsList()
                  :print(_selectedIndex);

        _selectedIndex==2?_launchInWebViewWithJavaScript('https://www.covid19india.org/')
                  :print(_selectedIndex);

        _selectedIndex==3?_launchInWebViewWithJavaScript('https://www.mohfw.gov.in/')
                  :print(_selectedIndex);

    
      },

      child: Container(
        height: 60.0,
        width: 60.0,
        decoration:BoxDecoration(
          color:_selectedIndex==index
            ?Theme.of(context).accentColor
            :Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child:Icon(
          _icons[index],
          size:25.0,
          color:_selectedIndex==index
              ?Theme.of(context).primaryColor
              :Color(0xFFB4C1C4),

        ),
        ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: ListView(
          padding:EdgeInsets.symmetric(vertical:30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left:20.0,right: 100.0),
              child: Text(
                //'What would you like to find',
                'Humanity will fight this...',
                style:TextStyle(
                  fontSize:30.0,
                  fontWeight:FontWeight.bold,
                )
              ),
            ),
            SizedBox(height:20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map
                    ((MapEntry map) =>_buildIcon(map.key),
                    )
                    .toList(),
            ),
            SizedBox(height: 20.0),
            //SeeAllCities()
            DestinationCarousel(),
            //SizedBox(height: 20.0),
            HotelCarousel(guidlines:widget.guidlines),
          ],
        ))
      
    );
  }
}