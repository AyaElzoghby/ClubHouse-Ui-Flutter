import 'dart:math';

import 'package:club_house_ui/models/data.dart';
import 'package:club_house_ui/models/room.dart';
import 'package:club_house_ui/widgets/room_user_profile.dart';
import 'package:club_house_ui/widgets/user_profil_img.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({super.key, required this.room});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 160,
          leading: TextButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back),
            label: Text("Welcome"),
            style: TextButton.styleFrom(
                iconColor: Colors.white,
                foregroundColor: Colors.white,
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_document,
                  color: Colors.white,
                )),
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
        body: Container(
          padding: EdgeInsets.all(10.0),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(35)),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${room.club}🏡".toUpperCase(),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.keyboard_control))
                  ],
                ),
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                ),
              ],
            )),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                children: room.speakers
                    .map(
                      (e) => RoomUserProfile(
                        imageURL: e.imageURL,
                        name: e.firstName,
                        isMuted: Random().nextBool(),
                        isNew: Random().nextBool(),
                      ),
                    )
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "followed by users",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 15,
                    ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.7,
                children: room.followedBySpeakers
                    .map(
                      (e) => RoomUserProfile(
                        imageURL: e.imageURL,
                        name: e.firstName,
                        isMuted: Random().nextBool(),
                        isNew: Random().nextBool(),
                      ),
                    )
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "others in the room",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 15,
                    ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.7,
                children: room.others
                    .map(
                      (e) => RoomUserProfile(
                        imageURL: e.imageURL,
                        name: e.firstName,
                        isMuted: Random().nextBool(),
                        isNew: Random().nextBool(),
                      ),
                    )
                    .toList(),
              ),
            ),
          ]),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "leave Quite",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.back_hand)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
