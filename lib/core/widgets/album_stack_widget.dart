import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlbumStackWidget extends StatelessWidget {
  const AlbumStackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned(
          bottom: 7,
          left: 8,
          child: Card(
            elevation: 10,
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: w * 0.25,
              height: h * 0.18,
              // child: Image.network("https://images.unsplash.com/photo-1621351813579-4ceefec7235c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8eWVsbG93JTIwYWVzdGhldGljfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
            ),
          ),
        ),
        Positioned(
          bottom: 14,
          left: 16,
          child: Card(
            elevation: 10,
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: w * 0.3,
              height: h * 0.18,
              // child: Image.network("https://images.unsplash.com/photo-1621351813579-4ceefec7235c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8eWVsbG93JTIwYWVzdGhldGljfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
            ),
          ),
        ),
        Positioned(
          bottom: 21,
          left: 24,
          child: Card(
            elevation: 10,
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: w * 0.35,
              height: h * 0.18,
              // child: Image.network("https://images.unsplash.com/photo-1621351813579-4ceefec7235c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8eWVsbG93JTIwYWVzdGhldGljfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
            ),
          ),
        ),
      ],
    );
  }
}
