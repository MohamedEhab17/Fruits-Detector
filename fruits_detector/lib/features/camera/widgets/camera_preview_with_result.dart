import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPreviewWithResult extends StatelessWidget {
  final CameraController controller;
  final String result;

  const CameraPreviewWithResult({
    super.key,
    required this.controller,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CameraPreview(
        controller,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Result: ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: result,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
