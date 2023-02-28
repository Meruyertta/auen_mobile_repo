import 'package:auen/data/http_service.dart';
import 'package:auen/router/router.dart';
import 'package:auen/style/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../style/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  late bool openProfile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openProfile = false;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    List<String> sections = [
      'Liked Tracks',
      'Playlists',
      'Albums',
      'Following',
      'Stations'
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Library",
          style: appBarTextStyle,
        ),
        actions: [
          Icon(Icons.settings),
          SizedBox(
            width: w * 0.03,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.profile);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: CircleAvatar(
                radius: 11.5,
                backgroundImage: AssetImage("assets/image/user.png"),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Column(
              children: [
                for (var i in sections)
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, AppRouter.player);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              i,
                              style: appBarTextStyle,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.05,
                      )
                    ],
                  )
                // SizedBox(height: h*0.1,)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recently played",
                  style: appBarTextStyle.copyWith(fontSize: 24),
                ),
                Text(
                  "Your recently played content will show up here",
                  style: appBarTextStyle.copyWith(color: Colors.white70),
                )
              ],
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Listening history",
                      style: appBarTextStyle.copyWith(fontSize: 24),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: h * 0.05,
            ),
            InkWell(
              onTap: () async {
                const storage = FlutterSecureStorage();
                await storage.delete(key: 'email');
                Navigator.pushReplacementNamed(context, AppRouter.login);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Log out",
                        style: appBarTextStyle.copyWith(
                            fontSize: 24, color: AppColors.accentColorPink),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
