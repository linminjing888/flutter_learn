import 'package:flutter/material.dart';
import 'package:flutter_learn/DouBan/Model/home_model.dart';
import 'package:flutter_learn/DouBan/Widgets/dashed_line.dart';
import 'package:flutter_learn/DouBan/Widgets/star_rating.dart';

class MJMovieWidget extends StatelessWidget {
  final MovieItem movie;
  MJMovieWidget(this.movie);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("222");
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 8, color: Colors.black12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildHeader(),
            SizedBox(
              height: 6,
            ),
            buildContent(),
            SizedBox(
              height: 6,
            ),
            buildContentDes(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(3)),
      child: Text(
        "No.${movie.rank}",
        style: TextStyle(fontSize: 18, color: Colors.red),
      ),
    );
  }

  Widget buildContent() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildImage(),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: IntrinsicHeight(
              // 子控件同一个高度
              child: Row(
                children: <Widget>[
                  buildContentInfo(),
                  SizedBox(
                    width: 8,
                  ),
                  buildDashedLine(),
                  SizedBox(
                    width: 8,
                  ),
                  buildContentLove(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        movie.imageUrl,
        height: 150,
      ),
    );
  }

  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildContentTitle(),
          SizedBox(
            height: 6,
          ),
          buildContentRating(),
          SizedBox(
            height: 6,
          ),
          Text("${movie.subTitle}"),
        ],
      ),
    );
  }

  Widget buildContentTitle() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.check_circle_outline,
          color: Colors.red,
        ),
        SizedBox(
          width: 6,
        ),
        Text("${movie.title}"),
      ],
    );
  }

  Widget buildContentRating() {
    return Container(
      width: 100,
      child: MJStarRating(
        rating: double.parse(movie.rating),
        size: 20,
      ),
    );
  }

  Widget buildDashedLine() {
    return Container(
      // height: 100,
      child: MJDashedLine(
        lineAxis: Axis.vertical,
        lineWidth: 1,
        lineHeight: 5,
      ),
    );
  }

  Widget buildContentLove() {
    return Container(
      // height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/wish.png",
            width: 30,
          ),
          Text(
            "想看",
            style: TextStyle(color: Color.fromARGB(255, 235, 170, 60)),
          )
        ],
      ),
    );
  }

  Widget buildContentDes() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(3)),
        child: Text(
          "${movie.des}",
          style: TextStyle(color: Color(0xff666666)),
        ));
  }
}
