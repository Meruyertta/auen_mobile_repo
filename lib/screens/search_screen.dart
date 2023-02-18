import 'package:auen/style/constants.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Search", style: appBarTextStyle,),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: w*0.9,
              height: h*0.05,
              child:  const Center(
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xFF4E5359),
                    filled: true,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.search, color: Colors.white,) ,
                    // suffixIcon: Icon(Icons.camera_alt)
                  ),
                ),
              ),
            ),
            SizedBox(height: h*0.35,),
            Column(
              children: [
                Text("Search SoundCloud", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                Text("Find artists, tracks, albums, and playlists", style: TextStyle(color: Colors.white70,), )
              ],
            )
          ],
        ),
      ),
    );
  }
}
