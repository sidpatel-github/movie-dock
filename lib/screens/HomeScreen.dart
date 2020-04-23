import 'package:flutter/material.dart';
import 'package:movie_dock/models/movie_model.dart';
import 'package:movie_dock/widgets/content_scroll.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _movieSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (ctx, widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.4) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0, 3.0),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Center(
                child: Hero(
                  tag: movies[index].imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage(movies[index].imageUrl),
                      height: 220.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 50.0,
            bottom: 40.0,
            child: Container(
              width: 250.0,
              child: Text(
                movies[index].title.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Image.asset(
            'assets/images/netflix_logo.png',
            fit: BoxFit.cover,
            // alignment: FractionalOffset.center,
            height: 80.0,
            // width: 150,
            // height: 50,
            // scale: .08,
            // width: double.infinity,
          ),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 10.0),
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          onPressed: () => print('appbar icon clicked'),
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            onPressed: () => print('Search'),
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.black,
          ),
        ],
      ),

      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: movies.length,
              itemBuilder: (ctx, i) {
                return _movieSelector(i);
              },
            ),
          ),
          Container(
            height: 90.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: labels.length,
              padding: EdgeInsets.symmetric(horizontal: 30),
              itemBuilder: (ctx, i) => Container(
                margin: EdgeInsets.all(10.0),
                width: 160.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFD45253),
                      Color(0xFF9E1F28),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF9E1F28),
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    labels[i].toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.8,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ContentScroll(
            images: myList,
            title: 'My favorites',
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
          SizedBox(height: 10.0),
          ContentScroll(
            images: popular,
            title: 'Trending',
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //     child: Container(
      //       height: 50.0,
      //     ),
      //     // color: Colors.black,
      //     shape: const CircularNotchedRectangle()),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: FloatingActionButton(
      //   elevation: 0,
      //   onPressed: () {},
      // ),
    );
  }
}
