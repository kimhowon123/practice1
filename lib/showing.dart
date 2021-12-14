import 'package:flutter/material.dart';

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
          Text('현재 상영중',style: TextStyle(fontSize:24, fontWeight: FontWeight.bold,),),
          Container(height: 270,
          child: ListView.builder(itemCount: nowplaying.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){

                },
                child: Container(width: 140,
                child: Column(
                  children: [
                    SizedBox(height: 20,), //글자와 영화 포스터 사이의 간격
                    Container(
                      height: 200,
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
                      nowplaying[index]['title']:'Loading'),)
                  ],
                ),
                ),
              );
            }),
            )],
            ),
      
    );
  }
}