import 'package:auen/core/widgets/album_stack_widget.dart';
import 'package:auen/style/constants.dart';
import 'package:card_swiper/card_swiper.dart';
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
        title: const Text(
          "Search",
          style: appBarTextStyle,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: w * 0.9,
              // height: h * 0.05,
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xFF4E5359),
                    filled: true,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    // suffixIcon: Icon(Icons.camera_alt)
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: h * 0.35,
            // ),
            // Expanded(child: AlbumStackWidget())
            // Swiper(
            //   itemCount: 3,
            //   pagination: const SwiperPagination(),
            //   control: const SwiperControl(),
            //   itemBuilder: (BuildContext context, int index) {
            //     return Image.network(
            //         "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8N3x8fGVufDB8fHx8&w=1000&q=80",
            //         fit: BoxFit.fill,
            //     );
            //   },
            // ),

            // Column(
            //   children: const [
            //     Text(
            //       "Search SoundCloud",
            //       style: TextStyle(
            //           color: Colors.white,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 18),
            //     ),
            //     Text(
            //       "Find artists, tracks, albums, and playlists",
            //       style: TextStyle(
            //         color: Colors.white70,
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
