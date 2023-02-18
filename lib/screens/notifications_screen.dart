import 'package:auen/screens/main_screen.dart';
import 'package:flutter/material.dart';

import '../style/constants.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
          "Notifications",
          style: appBarTextStyle,
        ),
        leading: Icon(
          Icons.arrow_back_ios
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Later", style: mainTextStyle,),
              ],
            ),
            SizedBox(height: h*0.04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage("assets/image/user.png"),
                ),
                Text("bloodkatana followed you", style: mainTextStyleGrey,),
                CustomButton(text: "Follow",)
              ],
            )
          ],
        ),
      ),
    );
  }
}
