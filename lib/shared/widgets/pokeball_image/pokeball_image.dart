import 'package:flutter/material.dart';

class PokeballImage extends StatelessWidget {
  const PokeballImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [
            Colors.white.withOpacity(0.3),
            Colors.white.withOpacity(0.0),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(bounds);
      },
      child: Image.asset(
        'assets/patterns/pokeball.png',
        width: 100,
        height: 100,
        fit: BoxFit.fill,
      ),
    );
  }
}
