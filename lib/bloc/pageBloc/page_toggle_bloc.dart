import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weplay_admin/model/page/page_toggle_model.dart';

class PageToggleBloc extends Bloc<PageToggleModel, PageToggleModel> {
  PageToggleBloc() : super(PageToggleModel(position: 0));

  @override
  Stream<PageToggleModel> mapEventToState(PageToggleModel event) async* {
    yield event;
  }
}
