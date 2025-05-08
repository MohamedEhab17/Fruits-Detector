import 'package:flutter/material.dart';

class CameraImageCardWidget extends StatelessWidget {
  const CameraImageCardWidget({
    super.key,
    required this.text,
    required this.cameraIcon,
    required this.color,
    this.onTap,
  });
  final String text;
  final bool cameraIcon;
  final Color color;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // width: 200,
          height: 220,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withValues(alpha: 0.3),
                blurRadius: 20,
                spreadRadius: 1,
                offset: const Offset(2, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 50,
            children: [
              Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[700],
                  border: Border.all(color: Colors.white, width: 1),
                ),

                child: Image(
                  image: AssetImage(
                    cameraIcon
                        ? 'assets/images/camera.png'
                        : 'assets/images/gallery.png',
                  ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
