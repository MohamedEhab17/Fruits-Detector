import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_detector/features/camera/view_model/image_predictor_cubit.dart';
import 'package:fruits_detector/features/camera/widgets/prediction_result.dart';
import 'package:fruits_detector/features/camera/widgets/select_image_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      // Pass the picked image to the ImagePredictorCubit for prediction
      context.read<ImagePredictorCubit>().predictImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick From Gallery'.tr())),
      body: BlocBuilder<ImagePredictorCubit, ImagePredictorState>(
        builder: (context, state) {
          final String result =
              state is ImagePredictorSuccess ? state.result : "";
          final bool isPredicting = state is ImagePredictorLoading;

          return Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: Center(
                  child:
                      _selectedImage == null
                          ? Text(
                            'No image selected.'.tr(),
                            style: const TextStyle(fontSize: 18),
                          )
                          : Image.file(_selectedImage!),
                ),
              ),
              const SizedBox(height: 20),
              if (result.isNotEmpty) PredictionResult(result: result),

              const SizedBox(height: 20),
              PredictButton(
                isLoading: isPredicting,
                onPressed: _pickImage,
                icon: Icons.photo,
                animate: true,
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
