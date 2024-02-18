import 'package:club_house_ui/models/data.dart';
import 'package:flutter/material.dart';

class UserProfilImage extends StatelessWidget {
  final String imgURL;
  final double size;

  const UserProfilImage({
    super.key,
    required this.imgURL,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size/2 - size/10),
      child: Image.network(
        currentUser.imageURL,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
