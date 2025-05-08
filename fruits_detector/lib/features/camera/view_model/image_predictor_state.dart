part of 'image_predictor_cubit.dart';

abstract class ImagePredictorState {}

class ImagePredictorInitial extends ImagePredictorState {}

class ImagePredictorLoading extends ImagePredictorState {}

class ImagePredictorSuccess extends ImagePredictorState {
  final String result;
  ImagePredictorSuccess(this.result);
}

class ImagePredictorError extends ImagePredictorState {
  final String message;
  ImagePredictorError(this.message);
}
