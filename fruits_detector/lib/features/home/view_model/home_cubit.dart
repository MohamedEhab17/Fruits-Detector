import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<List<String>> {
  HomeCubit() : super([
    'assets/images/card_image1.png',
    'assets/images/card_image2.png',
  ]);

}
