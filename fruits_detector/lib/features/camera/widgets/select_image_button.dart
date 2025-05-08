import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PredictButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final IconData icon;
  final double glowRadius;
  final bool showTwoGlows;
  final bool animate;
  final bool repeat;

  const PredictButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.icon,
    this.glowRadius = 90.0,
    this.showTwoGlows = true,
    this.animate = true,
    this.repeat = false, // camera uses repeat
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SpinKitFadingCircle(color: Colors.blue, size: 50.0)
        : AvatarGlow(
            endRadius: glowRadius,
            glowColor: Colors.blue,
            animate: animate,
            repeat: repeat,
            duration: const Duration(seconds: 2),
            showTwoGlows: showTwoGlows,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: const CircleBorder(
                  side: BorderSide(color: Colors.white, width: 2),
                ),
                padding: const EdgeInsets.all(20),
              ),
              onPressed: onPressed,
              child: Icon(icon, size: 50, color: Colors.white),
            ),
          );
  }
}
