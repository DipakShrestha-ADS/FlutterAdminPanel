import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerResizeBloc extends Bloc<bool, bool> {
  DrawerResizeBloc() : super(false);

  @override
  Stream<bool> mapEventToState(bool event) async* {
    yield event;
  }
}
