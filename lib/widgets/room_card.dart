import 'package:club_house_ui/models/room.dart';
import 'package:club_house_ui/roomscreen.dart';
import 'package:club_house_ui/widgets/user_profil_img.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  const RoomCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          fullscreenDialog: true, builder: (_) => RoomScreen(room: room))),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${room.club}🏡".toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                ),
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 120,
                      child: Stack(
                        children: [
                          UserProfilImage(
                              imgURL: room.speakers[0].imageURL, size: 48),
                          Positioned(
                              left: 24,
                              top: 26,
                              child: UserProfilImage(
                                  imgURL: room.speakers[1].imageURL, size: 48)),
                        ],
                      ),
                    )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...room.speakers.map((e) =>
                                  Text("${e.firstName} ${e.lastName}🎙")),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Text.rich(TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.people,
                                      color:
                                          Color.fromRGBO(158, 158, 158, 0.726),
                                    )),
                                    TextSpan(
                                        text:
                                            " ${room.speakers.length + room.followedBySpeakers.length + room.others.length}")
                                  ])),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text.rich(TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.person,
                                      color:
                                          Color.fromRGBO(158, 158, 158, 0.726),
                                    )),
                                    TextSpan(text: " ${room.speakers.length}")
                                  ])),
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
