import 'package:auen/core/models/audio_model.dart';
import 'package:auen/data/api_client.dart';
import 'package:auen/features/player_arguments.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

import '../router/router.dart';
import '../style/colors/app_colors.dart';
import '../style/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ApiClient _apiClient = ApiClient();

  late bool showAll;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showAll = false;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    List<String> songs = [
      '1503',
      'Whatsapp',
      'В манерах',
      'По пятам',
      'Свела с ума',
    ];

    // 'Aitarym kop','Bari de onay','Esimde bari','Intro','Garyshka'
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home",
          style: appBarTextStyle,
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: CustomScrollView(
          slivers: [
            // Other Sliver Widgets
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: h * 0.8,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.05, right: w * 0.05, top: h * 0.02),
                          child: Image.asset(
                              "assets/image/main_screen_asset.jpg")),
                      SizedBox(
                        height: h * 0.05,
                      ),
                      Column(
                        children: [
                          Text(
                            "This Month's ",
                            style: mainPageSectionHeaderTextStyle.copyWith(
                                color: Colors.white),
                          ),
                          Text("Record Breaking Albums!",
                              style: mainPageSectionHeaderTextStyle),
                          // RichText(
                          //   text: TextSpan(
                          //     // style: DefaultTextStyle.of(context).style,
                          //     children: const <TextSpan>[
                          //       TextSpan(text: "This Month's ", style: TextStyle(fontWeight: FontWeight.bold)),
                          //       TextSpan(text: 'Record Breaking Albums!', style: TextStyle(fontWeight: FontWeight.bold)),
                          //
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: h * 0.03,
                          ),

                          Text(
                            "Выходные, Карман , Колёса, Москва любит, Не твоё, Ок, окand many more...",
                            style: TextStyle(color: AppColors.colorGrey),
                          ),
                          SizedBox(
                            height: h * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomButton(
                                text: 'Listen Now',
                              ),
                              CustomButton(
                                text: 'Add to Queue',
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Top Music",
                        style: TextStyle(
                            color: AppColors.accentColorPink, fontSize: 16),
                      ),
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: FutureBuilder<List<AudioModel>?>(
                                      future: _apiClient.getAudioList(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<dynamic> snapshot) {
                                        if (snapshot.hasData) {
                                          List<AudioModel> audioList =
                                              snapshot.data;
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              for (var i = 0;
                                                  i < (audioList.length);
                                                  i++)
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pushNamed(
                                                      context,
                                                      AppRouter.player,
                                                      arguments: PlayerArguments.name(
                                                          "https://kajohny.pythonanywhere.com" +
                                                              (audioList[i]
                                                                      .musicLink ??
                                                                  ''),
                                                          audioList[i].title ??
                                                              '',
                                                          audioList[i]
                                                                  .authorName ??
                                                              ''),
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            child: Image.network(
                                                                "https://kajohny.pythonanywhere.com/static/"+(audioList[i].albumImage??'')
                                                            ),
                                                            width: w * 0.1,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                audioList[i]
                                                                        .title ??
                                                                    '',
                                                                style:
                                                                    mainPageTextStyle,
                                                              ),
                                                              Text(
                                                                audioList[i]
                                                                        .authorName ??
                                                                    '',
                                                                style:
                                                                    mainPageTextStyle,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Icon(
                                                        Icons.favorite_border,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                            ],
                                          );
                                        }
                                        return CircularProgressIndicator();
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.06,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          showAll = true;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: CustomButton(
                              text: 'See All',
                            ))
                            // Text('See all', style: mainPageTextStyle,)
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                ///SUPPORT PAGE
                // Container(
                //   child: Column(
                //     children: [
                //       Text("AUEN Music Platform", style: mainPageSectionHeaderTextStyle,),
                //       SizedBox(height: h*0.02,),
                //       Text("Our product is a music player called AUEN. AUEN allows users to listen to music over the Internet from a website. The aim of the project is to create an alternative to such applications as Spotify, Yandex Music, Apple Music, etc. The site will feature mostly Kazakh artists. Not only modern performers, but also old, already forgotten, to remember and popularize our cool and soulful songs.",
                //       style: mainPageTextStyle,
                //       textAlign: TextAlign.center,
                //       )
                //     ],
                //   ),
                // ),
                // SizedBox(height: h*0.04,),
                // Container(
                //   child: Column(
                //     children: [
                //       Text("Download our app", style: mainPageSectionHeaderTextStyle,),
                //       SizedBox(height: h*0.02,),
                //       Text("Go Mobile with our app. \nListen to your favourite songs at just one click. \nDownload Now !",
                //       style: mainPageTextStyle, textAlign: TextAlign.center,
                //       ),
                //       SizedBox(height:h*0.01),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           Container(
                //               height: h*0.1,
                //               width: w*0.3,
                //               child: Image.asset("assets/image/main_screen_google_play.jpg")),
                //           Container(
                //               height: h*0.1,
                //               width: w*0.3,
                //               child: Image.asset("assets/image/main_screen_app_store.jpg")),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
                // Container(
                //   child: Column(
                //     children: [
                //       Text("Subscribe", style: mainPageSectionHeaderTextStyle,),
                //       SizedBox(height: h*0.02,),
                //       Text("Subscribe to our newsletter and get latest updates and offers.",
                //         style: mainPageTextStyle, textAlign: TextAlign.center,
                //       ),
                //       SizedBox(height:h*0.01),
                //         CustomTextField(hintText: 'Enter Your Name',),
                //       SizedBox(height: h*0.02,),
                //       CustomTextField(hintText: 'Enter Your Email',),
                //       SizedBox(height: h*0.02,),
                //       CustomButton(text: "Sign Me Up",)
                //     ],
                //   ),
                // ),
                ///SUPPORT PAGE
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    this.text = "Listen Now",
    Key? key,
  }) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(fontSize: 16.0),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accentColorDarkerPinkButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )));
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.hintText = 'Enter Your Email',
    Key? key,
  }) : super(key: key);

  String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
