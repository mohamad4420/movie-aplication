import 'package:flutter/material.dart';
import '../../model/models.dart';
import './widgets/widgets.dart';

final List<String> imgList = [
  'https://m.media-amazon.com/images/M/MV5BOGE4MmVjMDgtMzIzYy00NjEwLWJlODMtMDI1MGY2ZDlhMzE2XkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_QL75_UX280_CR0,0,280,414_.jpg',
  'https://m.media-amazon.com/images/M/MV5BZDhlMzY0ZGItZTcyNS00ZTAxLWIyMmYtZGQ2ODg5OWZiYmJkXkEyXkFqcGdeQXVyODkzNTgxMDg@._V1_QL75_UX380_CR0,0,380,562_.jpg',
  'https://m.media-amazon.com/images/M/MV5BNTkwOTE1ZDYtODQ3Yy00YTYwLTg0YWQtYmVkNmFjNGZlYmRiXkEyXkFqcGdeQXVyNTc4MjczMTM@._V1_QL75_UX380_CR0,0,380,562_.jpg',
  'https://m.media-amazon.com/images/M/MV5BNjRmNDI5MjMtMmFhZi00YzcwLWI4ZGItMGI2MjI0N2Q3YmIwXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_QL75_UX380_CR0,0,380,562_.jpg',
  'https://m.media-amazon.com/images/M/MV5BODcwNWE3OTMtMDc3MS00NDFjLWE1OTAtNDU3NjgxODMxY2UyXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_QL75_UX380_CR0,4,380,562_.jpg',
  'https://m.media-amazon.com/images/M/MV5BNTAzYTlkMWEtOTNjZC00ZDU0LWI5ODUtYTRmYzY0MTAzYWZlXkEyXkFqcGdeQXVyMzgxODM4NjM@._V1_QL75_UX380_CR0,4,380,562_.jpg'
];

class MySlider extends StatefulWidget {
  _MySliderState createState() => _MySliderState();
}

class SliderItem extends StatelessWidget {
  final String name;
  final String fetchUrl;
  SliderItem({this.name, this.fetchUrl});
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              name,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.start,
            ),
          ),
          MySlider(),
        ],
      ),
    );
  }
}

class _MySliderState extends State<MySlider> {
  Widget build(BuildContext context) {
    FetchApi fetchApi = FetchApi();
    return FutureBuilder(
        future: fetchApi.fetchVid("MovieUbdate"),
        builder: (context, snapshot) {
          var vids = snapshot.data;
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          else {
            return Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vids.length,
                  itemBuilder: (context, index) {
                    return MyCard(img: vids[index].poster);
                  }),
            );
          }
        });
  }
}