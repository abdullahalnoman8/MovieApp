import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/pages/movie_detail_page.dart';
import 'package:ninjaid/pages/search_movies.dart';

void main() {
  /*runApp(MaterialApp(
      home: NinjaCard()
  ));*/
  runApp(MovieApp());
}

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final List<Movie> movies = [topGun, aBeautifulMind, theImitationGame];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Movie App'),
          backgroundColor: Colors.indigo[500],
          elevation: 0.0,
          centerTitle: false,
        ),
        body: new ListView.separated(
          itemCount: 3,
          itemBuilder: (context, index) => ListTile(
            title: Text(movies[index].title),
            subtitle: Text(
                'Directed by ${movies[index].director} in ${movies[index].year}'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MovieDetailPage(movies[index])));
            },
            leading: Image.network(movies[index].imageUrl),
          ),
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 1.0,
              indent: 0,
              endIndent: 0,
              color: ((index + 1) % 2) == 0
                  ? Colors.grey[350]
                  : Colors.amberAccent[350],
              height: 6,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SearchMovie()),
          ),
          child: Icon(
            Icons.add,
            color: Colors.indigo[300],
          ),
        ),
      );
}

/*class NinjaCard extends StatefulWidget {
  @override
  _NinjaCardState createState() => _NinjaCardState();
}*/

/*
class _NinjaCardState extends State<NinjaCard> {
  int ninjaLevel = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Ninja Id Card'),
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              ninjaLevel += 1;
            });
          },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/pic.jpg'),
                radius: 50.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[800],
            ),
            Text('Name'
              ,style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0,),
            Text('Chun-li'
              ,style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30.0,),
            Text('Curret Ninja Level'
              ,style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0,),
            Text('$ninjaLevel'
              ,style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30.0,),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],

                ),
                SizedBox(width: 10.0,),
                Text(
                  'abcdefdfd@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,

                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
*/

/*class NinjaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Ninja Id Card'),
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/pic.jpg'),
                radius: 50.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[800],
            ),
            Text('Name'
              ,style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0,),
            Text('Chun-li'
              ,style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30.0,),
            Text('Curret Ninja Level'
              ,style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0,),
            Text('8'
              ,style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30.0,),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],

                ),
                SizedBox(width: 10.0,),
                Text(
                  'abcdefdfd@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,

                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}*/
