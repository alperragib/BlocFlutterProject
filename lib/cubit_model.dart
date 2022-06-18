import 'package:flutter_bloc/flutter_bloc.dart';

class CubitModel extends Cubit<int> {
  CubitModel() : super(0);

  void sayacArttir() {
    emit(state + 1);
  }

  void sayacAzalt() {
    emit(state - 1);
  }
}
