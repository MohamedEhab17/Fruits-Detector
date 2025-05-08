import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialServices extends StatelessWidget {
  const SocialServices({
    super.key,
    required this.image,
    required this.url,
  });
  final String image;
  final String url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      },
      child: SizedBox(
        height: 50,
        width: 50,
        child: Image(
          image: AssetImage(image),
        ),
      ),
    );
  }
}