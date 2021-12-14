import 'package:flutter/material.dart';
import 'package:practice1/showing.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
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
  Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
  Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
  Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
  
  setState(() {
    trendingmovies = trendingresult['results'];
    topratedmovies = topratedresult['results'];
    tv = tvresult['results'];
  });
  print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TrendingMovies(trending:trendingmovies)],
          ),
      
    );
  }
}

