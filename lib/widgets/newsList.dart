import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tour_app/models/newsArticle.dart';
import 'package:tour_app/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsList extends StatefulWidget {
  @override
  createState() => NewsListState();
}

class NewsListState extends State<NewsList> {
  Future<void> _launched;
  List<NewsArticle> _newsArticles = List<NewsArticle>();

  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
  }

  void _populateNewsArticles() {
    Webservice().load(NewsArticle.all).then((newsArticles) => {
          setState(() => {_newsArticles = newsArticles})
        });
  }

  Future<void> _launchInWebViewOrVC(String url) async {
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

  List<String> title_company_split(string) {
    return string.split(" - ");
  }

  Widget _buildItemsForListView(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => setState(() {
          _launched = _launchInWebViewOrVC(_newsArticles[index].url);
        }),
        child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                height: 75.0,
                width: 75.0,
                image: _newsArticles[index].urlToImage == null
                    ? AssetImage('assets/images/news.jpg')
                    : NetworkImage(_newsArticles[index].urlToImage),
                //image: AssetImage(Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL),
                fit: BoxFit.cover,
              ),
            ),
            //_newsArticles[index].urlToImage == null ? Image.asset(Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL) : Image.network(_newsArticles[index].urlToImage),
            subtitle: RichText(
              text: TextSpan(
                text: title_company_split(_newsArticles[index].title)[0],
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                children: <TextSpan>[
                  TextSpan(text: ' - '),
                  TextSpan(
                    text: title_company_split(_newsArticles[index].title)[1],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            )

            /*Text(
              _newsArticles[index].title, 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                )
                ),
                
            trailing:IconButton(
              icon: Icon(
              FontAwesomeIcons.solidNewspaper,
              size: 15.0,
              color: Colors.blue,
              ),
              onPressed: () => setState(() {
                      _launched = _launchInWebViewOrVC(_newsArticles[index].url);
                    }),
       
              ),    */

            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                'News',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                'powered by newsapi.org',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: _newsArticles.length,
            itemBuilder: _buildItemsForListView,
          ),
        ));
  }
}
