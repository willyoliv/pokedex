import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonType extends StatefulWidget {
  final String keyFilter;
  final String urlImage;
  final Color color;
  final Color shadow;
  final Function togglePressed;
  bool? pressed;
  IconButtonType({
    Key? key,
    required this.keyFilter,
    required this.urlImage,
    required this.color,
    required this.shadow,
    required this.togglePressed,
    this.pressed,
  }) : super(key: key);

  @override
  _IconButtonTypeState createState() => _IconButtonTypeState();
}

class _IconButtonTypeState extends State<IconButtonType>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.pressed = !widget.pressed!;
          widget.togglePressed(widget.keyFilter, widget.pressed);
        });
      },
      child: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.pressed! ? widget.color : Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            if (widget.pressed!)
              BoxShadow(
                color: widget.shadow,
                offset: const Offset(0.0, 10.0),
                blurRadius: 20,
                spreadRadius: 0,
              ),
          ],
        ),
        child: SvgPicture.asset(
          widget.urlImage,
          color: widget.pressed! ? Colors.white : widget.color,
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}
