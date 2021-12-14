import 'package:flutter/material.dart';
import 'package:http/http.dart';
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
  List a =[];
  String api = ''; //api key
  String accesstoken = ''; //accesstoken
  
@override
void initState() {
  loadmovies();
  super.initState();
}

  loadmovies()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(api, accesstoken),
    logConfig: ConfigLogger(showErrorLogs: true, showLogs: true));
    Map popularresult = await tmdbWithCustomLogs.v3.movies.getPouplar(language: 'ko-KR');
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated(language: 'ko-KR');
    Map upcomingresult = await tmdbWithCustomLogs.v3.movies.getUpcoming(language: 'ko-KR');
    Map nowplayingresult = await tmdbWithCustomLogs.v3.movies.getNowPlaying(language: 'ko-KR');

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

