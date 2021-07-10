import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://m.media-amazon.com/images/M/MV5BOGE4MmVjMDgtMzIzYy00NjEwLWJlODMtMDI1MGY2ZDlhMzE2XkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_QL75_UX280_CR0,0,280,414_.jpg',
  'https://m.media-amazon.com/images/M/MV5BZDhlMzY0ZGItZTcyNS00ZTAxLWIyMmYtZGQ2ODg5OWZiYmJkXkEyXkFqcGdeQXVyODkzNTgxMDg@._V1_QL75_UX380_CR0,0,380,562_.jpg',
  'https://m.media-amazon.com/images/M/MV5BNTkwOTE1ZDYtODQ3Yy00YTYwLTg0YWQtYmVkNmFjNGZlYmRiXkEyXkFqcGdeQXVyNTc4MjczMTM@._V1_QL75_UX380_CR0,0,380,562_.jpg',
  'https://m.media-amazon.com/images/M/MV5BNjRmNDI5MjMtMmFhZi00YzcwLWI4ZGItMGI2MjI0N2Q3YmIwXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_QL75_UX380_CR0,0,380,562_.jpg',
  'https://m.media-amazon.com/images/M/MV5BODcwNWE3OTMtMDc3MS00NDFjLWE1OTAtNDU3NjgxODMxY2UyXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_QL75_UX380_CR0,4,380,562_.jpg',
  'https://m.media-amazon.com/images/M/MV5BNTAzYTlkMWEtOTNjZC00ZDU0LWI5ODUtYTRmYzY0MTAzYWZlXkEyXkFqcGdeQXVyMzgxODM4NjM@._V1_QL75_UX380_CR0,4,380,562_.jpg'
];

class MySliderTest extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width * 0.45,
        margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MyCard(Img: imgList[index]);
            },
            /*separatorBuilder: (context, index) {
              return SizedBox(
                width: 0,
              );
            },*/
            itemCount: imgList.length));
  }
}

class MyCard extends StatelessWidget {
  @required
  final String? Img;
  MyCard({this.Img});

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
      width: MediaQuery.of(context).size.width * 0.29,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image(
          fit: BoxFit.cover,
          image: NetworkImage(Img ?? ''),
        ),
      ),
    );
  }
}
