import 'package:flutter/material.dart';
import 'package:practice1/nowplaying_movies.dart';
import 'package:practice1/popular_movies.dart';
import 'package:practice1/toprated_movies.dart';
import 'package:practice1/upcoming_movies.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'movies',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List nowplaying_movies = [];
  List toprated_movies = [];
  List popular_movies = [];
  List upcoming_movies = [];
  String api = '4997aa3d5b054b5704cca6ea91622e6c';
  String accesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OTk3YWEzZDViMDU0YjU3MDRjY2E2ZWE5MTYyMmU2YyIsInN1YiI6IjYxYjgxNDE3ZDE0NDQzMDA5MmNkMDAyNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ug8zyQ-OR9NbxinX1rYYfnjiniK9RXODeCuZdHOdo4o';
  
@override
void initState() {
  loadmovies();
  super.initState();
}

  loadmovies()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(api, accesstoken),
    logConfig: ConfigLogger(showErrorLogs: true, showLogs: true));
    Map popularresult = await tmdbWithCustomLogs.v3.movies.getPouplar();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map upcomingresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map nowplayingresult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();

  setState(() {
    nowplaying_movies = nowplayingresult['results'];
    toprated_movies = topratedresult['results'];
    popular_movies = popularresult['results'];
    upcoming_movies = upcomingresult['results'];
  });
  print(nowplaying_movies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          NowPlayingMovies(nowplaying:nowplaying_movies),
          UpcomingMovies(upcoming:upcoming_movies),
          PopularMovies(popular: popular_movies),
          TopratedMovies(toprated: toprated_movies),
          ListTile(
            title: Row(children: [
              SizedBox(
                width: 100,
              )
            ],),
          )
          ],
          ),
    );
  }
}

