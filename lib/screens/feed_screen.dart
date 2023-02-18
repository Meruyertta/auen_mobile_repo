import 'package:auen/style/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Feed",
          style: appBarTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/image/user.png"),
              ),
              Text(
                "Meyrsan posted a track",
                style: feedPageTextStyle,
              ),
              Text(
                "-",
                style: feedPageTextStyle,
              ),
              Text(
                "2mo",
                style: feedPageTextStyle,
              )
            ],
          ),
          Container(
            height: h * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png"),
                    fit: BoxFit.fill)),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        Text(
                          "2",
                          style: feedPageTextStyle,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                        Text(
                          "3",
                          style: feedPageTextStyle,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.swap_horiz,
                          color: Colors.white,
                        ),
                        Text(
                          "1",
                          style: feedPageTextStyle,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Icon(
                CupertinoIcons.ellipsis,
                color: Colors.white,
              )),
            ],
          )
        ],
      ),
    );
  }
}
