import 'dart:ffi';

import 'package:club_house_ui/models/data.dart';
import 'package:club_house_ui/widgets/user_profil_img.dart';
import 'package:flutter/material.dart';

class RoomUserProfile extends StatelessWidget {
  final String imageURL;
  final String name;
  final int size;
  final bool isNew;
  final bool isMuted;
  const RoomUserProfile(
      {super.key,
      required this.imageURL,
      required this.name,
      this.size = 50,
      this.isNew = false,
      this.isMuted = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              child: Stack(
            children: [
              UserProfilImage(imgURL: currentUser.imageURL, size:90),
              if (true)
                Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Text("🎉"),
                    )),
              if (true)
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ], color: Colors.white, shape: BoxShape.circle),
                      child: Text("🎙"),
                    )),
            ],
          )),
        ),
        Flexible(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
