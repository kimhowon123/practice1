import 'package:flutter/material.dart';
import 'package:practice1/detail.dart';

class NowPlayingMovies extends StatelessWidget {
  final List nowplaying;

  const NowPlayingMovies({Key? key, required this.nowplaying}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('현재 상영중',style: TextStyle(fontSize:20, fontWeight: FontWeight.bold,),),
          Container(height: 270,
          child: ListView.builder(itemCount: nowplaying.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(name: nowplaying[index]['title'],
                  bannerurl: 'https://image.tmdb.org/t/p/w500'+nowplaying[index]['backdrop_path'],
                  posterurl: 'https://image.tmdb.org/t/p/w500'+nowplaying[index]['poster_path'],
                  description: nowplaying[index]['overview'],
                  vote: nowplaying[index]['vote_average'].toString(),
                  launch_on: nowplaying[index]['release_date'], 

                  )
                  )
                  );
                },
                child: nowplaying[index]['title']!=null?Container(width: 140,
                child: Column(
                  children: [
                    SizedBox(height: 20,), //글자와 포스터 사이 간격
                    Container(
                      width: 104,
                      height: 159,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                        image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500'+nowplaying[index]['poster_path']
                      )
                      )
                      ),
                    ),
                    Container(child: Text(
                      nowplaying[index]['title']!=null?
                      nowplaying[index]['title']:'Loading'),
                      ),
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
                  ],
                ),
                ):Container(),
              );
            }),
            )],
            ),
      
    );
  }
}