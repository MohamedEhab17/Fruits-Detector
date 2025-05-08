import 'dart:io';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fruits_detector/core/services/image_classifier.dart';
import 'package:fruits_detector/features/camera/widgets/camera_preview_with_result.dart';
import 'package:fruits_detector/features/camera/widgets/select_image_button.dart';

class CameraView extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraView({super.key, required this.cameras});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController? _controller;
  late ImageClassifier _classifier;
  bool _isLoaded = false;
  String _result = "";
  bool isPredicting = false; // Add this flag to track loading state

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    _classifier = ImageClassifier(); 

    _controller = CameraController(
      widget.cameras[0],
      ResolutionPreset.ultraHigh,
    );
    await _controller!.initialize();

    if (mounted) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  Future<void> _captureAndPredict() async {
    if (_controller == null ||
        !_controller!.value.isInitialized ||
        isPredicting) {
      return;
    }

    setState(() {
      isPredicting = true;
    });

    try {
      final XFile file = await _controller!.takePicture();
      final result = await _classifier.predict(File(file.path));

      if (result.containsKey('error')) {
        throw result['error'];
      }

      setState(() {
        _result = '${result['class']} (${result['confidence']}%)';
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    } finally {
      setState(() {
        isPredicting = false;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null ||
        !_controller!.value.isInitialized ||
        !_isLoaded) {
      return const Scaffold(
        body: Center(child: SpinKitThreeBounce(color: Colors.blue, size: 50.0)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Fruit Classifier'.tr())),
      body: Column(
        children: [
          Expanded(
            child: CameraPreviewWithResult(
              controller: _controller!,
              result: _result,
            ),
          ),
          const SizedBox(height: 20),
          PredictButton(
            isLoading: isPredicting,
            onPressed: isPredicting ? null : _captureAndPredict,
            icon: Icons.circle,
            repeat: true,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
