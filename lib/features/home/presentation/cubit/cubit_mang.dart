import 'package:bloc/bloc.dart';

class MyState {
  final int value;
  final String message;

  MyState(this.value, this.message);
}

class MyCubit extends Cubit<MyState> {
  MyCubit() : super(MyState(0, 'Initial State'));

  void changeState() {
    emit(MyState(state.value + 1, 'State Changed'));
  }
}
