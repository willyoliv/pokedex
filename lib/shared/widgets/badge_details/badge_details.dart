import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BadgeDetails extends StatelessWidget {
  final String urlIcon;
  final Color color;
  const BadgeDetails({
    Key? key,
    required this.urlIcon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      padding: const EdgeInsets.symmetric(horizontal: 5.6),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: SvgPicture.asset(
        urlIcon,
        height: 15,
        width: 13.88,
        color: Colors.white,
      ),
    );
  }
}
