import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingSwitchListTile extends StatelessWidget {
  const SettingSwitchListTile({
    super.key,
    required this.title,
    this.onChanged,
    required this.value,
    required this.activeImage,
    required this.inactiveImage,
  });
  final String title;
  final void Function(bool)? onChanged;
  final bool value;
  final String activeImage, inactiveImage;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        title.tr(),
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.amberAccent,
      inactiveTrackColor: Colors.grey,
      inactiveThumbImage: AssetImage(inactiveImage),
      activeThumbImage: AssetImage(activeImage),
    );
  }
}
