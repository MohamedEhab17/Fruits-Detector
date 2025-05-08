import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_detector/features/home/view_model/home_cubit.dart';
import 'package:fruits_detector/features/home/widgets/camera_image_card_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/fruits_logo.png',
                    width: 80,
                    height: 80,
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, size: 30),
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Fruits Detector'.tr(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              BlocBuilder<HomeCubit, List<String>>(
                builder: (context, cardImages) {
                  return SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(cardImages[index], fit: BoxFit.cover);
                      },
                      itemCount: cardImages.length,
                      pagination: SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                          color: Colors.white,
                          activeColor: Colors.grey[400],
                        ),
                      ),
                      autoplay: true,
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CameraImageCardWidget(
                    text: 'Take a New Photo'.tr(),
                    color: const Color.fromARGB(255, 150, 109, 94),
                    cameraIcon: true,
                    onTap: () => Navigator.pushNamed(context, '/cameraDetector'),
                  ),
                  CameraImageCardWidget(
                    text: 'Choose From Gallery'.tr(),
                    color: const Color.fromARGB(255, 89, 148, 175),
                    cameraIcon: false,
                    onTap: () => Navigator.pushNamed(context, '/galleryDetector'),
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
