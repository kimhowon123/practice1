import 'package:flutter/material.dart';
import 'package:practice1/detail.dart';

class UpcomingMovies extends StatefulWidget {
  final List upcoming;

  const UpcomingMovies({Key? key, required this.upcoming}) : super(key: key);

  @override
  State<UpcomingMovies> createState() => UpcomingMoviesState();
}

class UpcomingMoviesState extends State<UpcomingMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('개봉 예정',style: TextStyle(fontSize:20, fontWeight: FontWeight.bold,),),
          SizedBox(height: 20,), //글자와 포스터 사이 간격
          Container(height: 180,
          child: ListView.builder(
            itemCount: widget.upcoming.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(name: widget.upcoming[index]['title'],
                  bannerurl: 'https://image.tmdb.org/t/p/w500'+widget.upcoming[index]['backdrop_path'],
                  posterurl: 'https://image.tmdb.org/t/p/w500'+widget.upcoming[index]['poster_path'],
                  description: widget.upcoming[index]['overview'],
                  vote: widget.upcoming[index]['vote_average'].toString(),
                  launch_on: widget.upcoming[index]['release_date'], 
                  )
                  ));
                },
                title: Row(
                  children: [
                    SizedBox(width: 45,
                    height: 69,
                    child: Image.network('https://image.tmdb.org/t/p/w500'+widget.upcoming[index]['poster_path']),
                    ),
                    Flexible(
                      child: Column(children: [
                        Text(widget.upcoming[index]['title']!=null?
                        widget.upcoming[index]['title']:'Loading',),
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
                    ),
                  ],
                
                ),
              );
            }),
            )],
            ),
      
    );
  }
}