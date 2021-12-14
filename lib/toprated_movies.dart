import 'package:flutter/material.dart';
import 'package:practice1/detail.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TopratedMovies extends StatefulWidget {
  final List toprated;

  const TopratedMovies({Key? key, required this.toprated}) : super(key: key);

  @override
  State<TopratedMovies> createState() => TopratedMoviesState();
}

class TopratedMoviesState extends State<TopratedMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('높은 평점',style: TextStyle(fontSize:20, fontWeight: FontWeight.bold,),),
          SizedBox(height: 20,),
          Container(height: 180,
          child: ListView.builder(
            itemCount: widget.toprated.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(name: widget.toprated[index]['title'],
                  bannerurl: 'https://image.tmdb.org/t/p/w500'+widget.toprated[index]['backdrop_path'],
                  posterurl: 'https://image.tmdb.org/t/p/w500'+widget.toprated[index]['poster_path'],
                  description: widget.toprated[index]['overview'],
                  vote: widget.toprated[index]['vote_average'].toString(),
                  launch_on: widget.toprated[index]['release_date'],
                  )
                  ));
                },
                title: Row(
                  children: [
                    SizedBox(
                      width: 45,
                      height: 69,
                    child: Image.network('https://image.tmdb.org/t/p/w500'+widget.toprated[index]['poster_path']),
                    ),
                    Flexible(
                      child: Column(children: [
                        Text(widget.toprated[index]['title']!=null?
                        widget.toprated[index]['title']:'Loading'),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                                    Icons.star,
                                      color: Colors.yellow,
                                      size: 9,
                                    ),
                                    Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 9,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 9,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 9,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 9,
                                ),
                        ],
                      ),
                      ],),
                    )
                  ],
                
                ),
              );
            }),
            )],
            ),
      
    );
  }
}