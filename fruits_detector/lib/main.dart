import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_detector/features/camera/view/camera_view.dart';
import 'package:fruits_detector/features/camera/view/gallery_view.dart';
import 'package:fruits_detector/features/camera/view_model/image_predictor_cubit.dart';
import 'package:fruits_detector/core/services/app_info_helper.dart';
import 'package:fruits_detector/features/settings/view_model/setting_cubit.dart';
import 'package:fruits_detector/features/theme/view_model/theme_cubit.dart';
import 'package:fruits_detector/features/theme/view_model/theme_state.dart';
import 'package:fruits_detector/features/home/home_view.dart';
import 'package:fruits_detector/core/services/image_classifier.dart';
import 'package:fruits_detector/features/settings/view/settings_view.dart';
import 'package:fruits_detector/features/splash/splash_view.dart';
import 'package:fruits_detector/core/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppInfoHelper().init();
  final cameras = await availableCameras();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(
          create: (context) => ImagePredictorCubit(ImageClassifier()),
        ),
        BlocProvider(create: (context) => SettingsCubit()),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        saveLocale: true,
        child: MyApp(cameras: cameras),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routes: {
            '/homeView': (context) => HomeView(),
            '/settings': (context) => const SettingsView(),
            '/cameraDetector': (context) => CameraView(cameras: cameras),
            '/galleryDetector': (context) => GalleryScreen(),
          },
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: state.themeMode,
          home: SplashView(),
          // home: CameraScreen(cameras: cameras),
        );
      },
    );
  }
}
