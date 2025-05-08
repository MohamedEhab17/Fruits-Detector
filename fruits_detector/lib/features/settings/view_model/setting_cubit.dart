import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<String> {
  SettingsCubit() : super('en');

  final List<Map<String, String>> socialImages = [
    {
      'image': 'assets/images/social_icons/facebook.png',
      'url':
          'https://www.facebook.com/profile.php?id=100033929641761&mibextid=ZbWKwL',
    },
    {
      'image': 'assets/images/social_icons/instagram.png',
      'url':
          'https://www.instagram.com/mohamebehap_2004?igsh=MTlmc3hkc2J6YnFjcw==',
    },
    {
      'image': 'assets/images/social_icons/linkedin.png',
      'url': 'https://www.linkedin.com/in/mohamed-ehab-017385271/',
    },
    {
      'image': 'assets/images/social_icons/whatsapp.png',
      'url': 'https://wa.me/qr/4WEUBSKUPRULO1',
    },
  ];

  void toggleLanguage() {
    if (state == 'en') {
      emit('ar');
    } else {
      emit('en');
    }
  }
}
