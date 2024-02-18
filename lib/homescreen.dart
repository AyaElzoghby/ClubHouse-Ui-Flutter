import 'package:club_house_ui/widgets/room_card.dart';
import 'package:club_house_ui/widgets/user_profil_img.dart';
import 'package:flutter/material.dart';
import 'package:club_house_ui/models/data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.search ,color: Colors.white,)),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.drafts_rounded,color: Colors.white,)),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.calendar_month_outlined,color: Colors.white,)),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.notifications_active,color: Colors.white,)),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: UserProfilImage(
                  imgURL: currentUser.imageURL,
                  size: 34,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              children: [...roomList.map((e) => RoomCard(room: e))],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Theme.of(context).cardColor.withOpacity(0.2),
                      Theme.of(context).scaffoldBackgroundColor,
                    ])),
              ),
            ),
            Positioned(
              bottom:40,
                child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 22,
              ),
              label: Text(
                "Start a Room",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(11),
                backgroundColor: Color.fromRGBO(255, 147, 64, 1),
              ),
            ))
          ],
        ));
  }
}
