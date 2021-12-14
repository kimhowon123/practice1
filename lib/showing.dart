import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('현재 상영중',style: TextStyle(fontSize:24, fontWeight: FontWeight.bold,),),
          Container(height: 270,
          child: ListView.builder(itemCount: trending.length,
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
                        'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                      )
                      )
                      ),
                    ),
                    Container(child: Text(
                      trending[index]['title']!=null?
                      trending[index]['title']:'Loading'),)
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