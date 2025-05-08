import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_detector/core/services/image_classifier.dart';
part 'image_predictor_state.dart';

class ImagePredictorCubit extends Cubit<ImagePredictorState> {
  final ImageClassifier classifier;

  ImagePredictorCubit(this.classifier) : super(ImagePredictorInitial());

  Future<void> predictImage(File imageFile) async {
    try {
      emit(ImagePredictorLoading());
      final result = await classifier.predict(imageFile);

      if (result.containsKey('error')) {
        emit(ImagePredictorError(result['error']));
      } else {
        final className = result['class'];
        final confidence = result['confidence'];
        emit(ImagePredictorSuccess('$className ($confidence%)'));
      }
    } catch (e) {
      emit(ImagePredictorError(e.toString()));
    }
  }

  void reset() {
    emit(ImagePredictorInitial());
  }
}
