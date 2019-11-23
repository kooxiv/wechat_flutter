import 'package:flutter/material.dart';
import 'package:dim_example/tools/wechat_flutter.dart';

class MyConversationView extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String content;
  final Widget time;
  final bool isBorder;

  MyConversationView({
    this.imageUrl,
    this.title,
    this.content,
    this.time,
    this.isBorder = true,
  });

  @override
  _MyConversationViewState createState() => _MyConversationViewState();
}

class _MyConversationViewState extends State<MyConversationView> {
  @override
  Widget build(BuildContext context) {
    var row = new Row(
      children: <Widget>[
        new Space(width: mainSpace),
        new Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                widget.title ?? '',
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.normal),
              ),
              new SizedBox(height: 2.0),
              new Text(
                widget.content ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: mainTextColor, fontSize: 14.0),
              ),
            ],
          ),
        ),
        new Space(width: mainSpace),
        new Container(
          width: 35.0,
          child: new Column(
            children: [
              widget.time,
              new Icon(Icons.flag, color: Colors.transparent),
            ],
          ),
        )
      ],
    );

    return new Container(
      padding: EdgeInsets.only(left: 18.0),
      color: Colors.white,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new ImageView(
              img: widget.imageUrl,
              height: 50.0,
              width: 50.0,
              fit: BoxFit.cover),
          new Container(
            padding: EdgeInsets.only(right: 18.0, top: 12.0, bottom: 12.0),
            width: winWidth(context) - 68,
            decoration: BoxDecoration(
              border: widget.isBorder
                  ? Border(
                      top: BorderSide(color: lineColor, width: 0.2),
                    )
                  : null,
            ),
            child: row,
          )
        ],
      ),
    );
  }
}
