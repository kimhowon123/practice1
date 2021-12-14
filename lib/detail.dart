import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;
  const Detail({ Key? key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch_on, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            Image.network(bannerurl, fit: BoxFit.cover,),
              Container(
                child: Row(
                  children: [Container(
                    margin: EdgeInsets.all(5),
                    height: 159,
                    width: 104,
                    child: Image.network(posterurl),
                  ),
                    Container(
                      child: Column(
                        children: [Text(name!=null?name:'Not Loaded', style: TextStyle(fontSize: 12),),
                        Text(launch_on+' 발매', style: TextStyle(fontSize: 11, height: 2),),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 13,
                                ),
                                Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 13,
                                ),
                                Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 13,
                                ),
                                Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 13,
                                ),
                                Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 13,
                                ),
                                Text(vote, style: TextStyle(fontSize: 12),)
                  ],
                ),
                        ],
                      ),
                    ),
           ],
        ),
              ),
              SizedBox(height: 24),
                  Text("개요", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                  SizedBox(height: 16),
                  Container(
                    child: Text(description, style: TextStyle(fontSize: 14, letterSpacing: 2)),
                  ),
                  SizedBox(height: 24,),
                  Text("주요 출연진", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
          ],
      ),
    );  
  }
}