import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weplay_admin/model/menuDrawer/main_menu_expansion_sub_menu_model.dart';

class MainMenuWithSubMenuExpansionChangeBloc extends Bloc<MainMenuExpansionSubMenuModel, MainMenuExpansionSubMenuModel> {
  MainMenuWithSubMenuExpansionChangeBloc() : super(null);

  @override
  Stream<MainMenuExpansionSubMenuModel> mapEventToState(MainMenuExpansionSubMenuModel event) async* {
    MainMenuExpansionSubMenuModel stateTemp = state;
    if (event == null) {
      yield null;
    } else {
      if (state == null) {
        yield MainMenuExpansionSubMenuModel(
          positionMapIsExpand: {event.position: event.isExpand},
        );
      } else {
        if (stateTemp.positionMapIsExpand.containsKey(event.position)) {
          stateTemp.positionMapIsExpand.update(event.position, (value) => event.isExpand);
        } else {
          stateTemp.positionMapIsExpand.putIfAbsent(event.position, () => event.isExpand);
        }
        yield stateTemp;
        yield MainMenuExpansionSubMenuModel(
          positionMapIsExpand: stateTemp.positionMapIsExpand,
        );
      }
    }
  }
}
