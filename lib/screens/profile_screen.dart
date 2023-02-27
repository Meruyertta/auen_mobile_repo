import 'package:auen/core/models/user_model.dart';
import 'package:auen/data/api_client.dart';
import 'package:auen/data/http_service.dart';
import 'package:auen/style/colors/app_colors.dart';
import 'package:auen/style/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ApiClient _apiClient=ApiClient();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // name=UserModel.fromJson(HttpService.fetchUserData() as Map<String, dynamic>).name??'';
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              height: h,
              color: AppColors.mainBackgroundBlack,
            ),
            Container(
                color: AppColors.accentColorDarkPink,
                height: h * 0.2,
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: w * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Positioned(
              left: h * 0.03,
              top: h * 0.14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/image/avatar.jpg"),
                  ),
                  FutureBuilder<UserModel>(
                    future: _apiClient.getUser(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if(snapshot.hasData){
                        UserModel user=snapshot.data;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name??'',
                              style: mainTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                             Text(
                              user.email??'',
                              style: mainTextStyle,
                            ),
                            Row(
                              children: const [
                                Text(
                                  '2 Followers',
                                  style: mainTextStyle,
                                ),
                                Text(
                                  ' - ',
                                  style: mainTextStyle,
                                ),
                                Text(
                                  '1 Following',
                                  style: mainTextStyle,
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
