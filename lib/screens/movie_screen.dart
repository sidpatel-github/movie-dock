import 'package:flutter/material.dart';
import 'package:movie_dock/models/circular_clipper.dart';
import 'package:movie_dock/models/movie_model.dart';
import 'package:movie_dock/widgets/content_scroll.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;

  const MovieScreen({this.movie});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: widget.movie.imageUrl,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage(widget.movie.imageUrl),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                    color: Colors.black,
                    iconSize: 30,
                  ),
                  Image.asset(
                    'assets/images/netflix_logo.png',
                    fit: BoxFit.cover,
                    // alignment: FractionalOffset.center,
                    height: 80.0,
                    // width: 150,
                    // height: 50,
                    // scale: .08,
                    // width: double.infinity,
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () => print('Add to Favorites'),
                    color: Colors.black,
                    iconSize: 30,
                  ),
                ],
              ),
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(10.0),
                    elevation: 15.0,
                    onPressed: () => print('Play Video'),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow,
                      size: 60.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 20.0,
                child: IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 40.0,
                  color: Colors.black,
                  onPressed: () => print('Add'),
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 20.0,
                child: IconButton(
                  icon: Icon(Icons.share),
                  iconSize: 40.0,
                  color: Colors.black,
                  onPressed: () => print('Share'),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.movie.title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.movie.categories,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 12.0),
                Text(
                  '⭐ ⭐ ⭐ ⭐',
                  style: TextStyle(fontSize: 25.0),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Year',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.movie.year.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Country',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.movie.country.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Length',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          '${widget.movie.length.toString()} min',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25.0),
                Container(
                  height: 120.0,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.movie.description,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ContentScroll(
            images: widget.movie.screenshots,
            title: 'Screenshots',
            imageHeight: 200.0,
            imageWidth: 250.0,
          )
        ],
      ),
    );
  }
}
