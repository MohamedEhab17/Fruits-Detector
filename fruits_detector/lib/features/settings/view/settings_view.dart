import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_detector/core/services/app_info_helper.dart';
import 'package:fruits_detector/features/settings/view_model/setting_cubit.dart';
import 'package:fruits_detector/features/settings/widgets/setting_list_tile.dart';
import 'package:fruits_detector/features/settings/widgets/setting_switch_list_tile.dart';
import 'package:fruits_detector/features/settings/widgets/social_services.dart';
import 'package:fruits_detector/features/theme/view_model/theme_cubit.dart';
import 'package:fruits_detector/features/theme/view_model/theme_state.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'.tr())),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingListTile(title: 'Feedback'),
            SettingListTile(title: 'Share With Friends'),
            SettingListTile(title: 'Privacy Policy'),
            SettingListTile(title: 'Terms of Service'),
            SettingListTile(
              title: 'Version ${AppInfoHelper().version}',
              hasTrailing: false,
            ),
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                final isDark = state.themeMode == ThemeMode.dark;
                return SettingSwitchListTile(
                  title: isDark ? 'Dark Mode'.tr() : 'Light Mode',
                  value: isDark,
                  onChanged: (_) {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  activeImage: 'assets/images/settings_icons/light-mode.png',
                  inactiveImage: 'assets/images/settings_icons/dark-mode.png',
                );
              },
            ),
            BlocConsumer<SettingsCubit, String>(
              listener: (context, state) {
                if (state == 'ar') {
                  context.setLocale(const Locale('ar'));
                } else {
                  context.setLocale(const Locale('en'));
                }
              },
              builder: (context, state) {
                return SettingSwitchListTile(
                  title: state == 'ar' ? 'العربية' : 'English',
                  value: state == 'ar',
                  onChanged: (value) {
                    context.read<SettingsCubit>().toggleLanguage();
                  },
                  activeImage: 'assets/images/settings_icons/translation.png',
                  inactiveImage: 'assets/images/settings_icons/translation.png',
                );
              },
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (
                  int i = 0;
                  i < context.read<SettingsCubit>().socialImages.length;
                  i++
                )
                  SocialServices(
                    image:
                        context.read<SettingsCubit>().socialImages[i]['image']!,
                    url: context.read<SettingsCubit>().socialImages[i]['url']!,
                  ),
              ],
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Developed by : '.tr(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Mohamed Ehab'.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
