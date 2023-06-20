import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool hasBorder;

  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20.0,
      // backgroundColor: Palette.facebookBlue,
      child: CircleAvatar(
        radius: hasBorder ? 17.0 : 20.0,
        backgroundColor: Colors.grey[200],
        backgroundImage: CachedNetworkImageProvider(imageUrl),
      ),
    );
  }
}
