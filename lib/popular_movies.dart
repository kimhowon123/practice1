import 'package:flutter/material.dart';

class PopularMovies extends StatefulWidget {
  final List popular;

  const PopularMovies({Key? key, required this.popular}) : super(key: key);

  @override
  State<PopularMovies> createState() => PopularMoviesState();
}

class PopularMoviesState extends State<PopularMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('인기',style: TextStyle(fontSize:24, fontWeight: FontWeight.bold,),),
          SizedBox(height: 20,),
          Container(height: 180,
          child: ListView.builder(
            itemCount: widget.popular.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: (){

                },
                title: Row(
                  children: [
                    SizedBox(
                      width: 45,
                      height: 69,
                    child: Image.network('https://image.tmdb.org/t/p/w500'+widget.popular[index]['poster_path']),
                    ),
                    Flexible(
                      child: Column(children: [
                        Text(widget.popular[index]['title']!=null?
                        widget.popular[index]['title']:'Loading',),
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