import 'package:flutter/material.dart';
import 'package:flutter_learn/DouBan/Model/home_model.dart';
import 'package:flutter_learn/DouBan/NetWork/home_request.dart';

class MJHomeContent extends StatefulWidget {
  @override
  _MJHomeContentState createState() => _MJHomeContentState();
}

class _MJHomeContentState extends State<MJHomeContent> {
  final List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();
    HomeRequest.requestMovieList().then((value) {
      setState(() {
        movies.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("${movies[index].title}"),
          leading: Image.network("${movies[index].imageUrl}"),
        );
      },
    );
  }
}
