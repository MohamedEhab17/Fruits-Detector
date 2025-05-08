import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({
    super.key,
    required this.title,
    this.hasTrailing = true,
  });
  final String title;
  final bool hasTrailing;
  String get imagePath {
    switch (title) {
      case 'Feedback':
        return 'assets/images/settings_icons/feedback.png';
      case 'Share With Friends':
        return 'assets/images/settings_icons/share.png';
      case 'Privacy Policy':
        return 'assets/images/settings_icons/privacy_and_policy.png';
      case 'Terms of Service':
        return 'assets/images/settings_icons/terms-of-use.png';
      default:
        return 'assets/images/settings_icons/version.png';
    }
  }

  void openEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'mohamedehap172004@gmail.com',
      queryParameters: {'subject': 'Feedback about the app'},
    );
    await launchUrl(emailLaunchUri);
  }

  void shareWithFriends() async {
    final Uri url = Uri.parse(
      'https://play.google.com/store/apps/details?id=com.example.fruits_detector',
    );
    await launchUrl(url);
  }

  void privacyPolicy() async {
    final Uri url = Uri.parse(
      'https://www.privacypolicies.com/live/7849e9af-c143-45ba-a46c-4e7a6b34e97d',
    );
    await launchUrl(url);
  }

  void termsOfService() async {
    final Uri url = Uri.parse(
      'https://eager-cardboard-027.notion.site/Terms-of-Service-1dd7a5a4cfa480b686bbd22f92cf9cc3',
    );
    await launchUrl(url);
  }

  void Function()? get tapFun {
    switch (title) {
      case 'Feedback':
        return openEmail;
      case 'Share With Friends':
        return shareWithFriends;
      case 'Privacy Policy':
        return privacyPolicy;
      case 'Terms of Service':
        return termsOfService;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 60,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          color:
              Theme.of(context).cardColor == Colors.white
                  ? Colors.black
                  : Colors.white,
        ),
      ),
      title: Text(
        title.tr(),
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing:
          hasTrailing ? const Icon(Icons.arrow_forward_ios) : SizedBox.shrink(),
      onTap: tapFun,
    );
  }
}
