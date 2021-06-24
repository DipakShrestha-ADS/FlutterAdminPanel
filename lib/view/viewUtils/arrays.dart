import 'package:flutter/material.dart';
import 'package:weplay_admin/model/menuDrawer/main_menu_model.dart';
import 'package:weplay_admin/model/menuDrawer/sub_menu_model.dart';
import 'package:weplay_admin/view/viewUtils/strings.dart';

class Arrays {
  List<String> getMainMenuList() {
    return [
      S.TITLE_DASHBOARD,
      S.TITLE_USER_MANAGEMENT,
      S.TITLE_SPORTS_MANAGEMENT,
      S.TITLE_CUSTOMER_MANAGEMENT,
      S.TITLE_VENUE_MANAGEMENT,
    ];
  }

  List<List<String>> getSubMenuList() {
    return [
      [],
      [
        'User Profile',
        'Role',
        'Permission',
      ],
      [],
      [
        'Sub menu 1',
        'Sub menu 2',
        'Sub menu 3',
      ],
      [],
    ];
  }

  List<List<IconData>> getSubMenuIconList() {
    return [
      [],
      [
        Icons.dashboard,
        Icons.people_outline,
        Icons.sports,
      ],
      [],
      [
        Icons.dashboard,
        Icons.people_outline,
        Icons.sports,
      ],
      [],
    ];
  }

  List<IconData> getMainMenuIconList() {
    return [
      Icons.dashboard,
      Icons.people_outline,
      Icons.sports,
      Icons.perm_identity,
      Icons.workspaces_filled,
    ];
  }

  List<String> getSetupMenuList() {
    return [
      S.TITLE_SETTINGS,
    ];
  }

  List<String> getMonthList() {
    return [
      S.MNTH_BAISHAK,
      S.MNTH_JESTHA,
      S.MNTH_ASHADH,
      S.MNTH_SHRAWAN,
      S.MNTH_BHADRA,
      S.MNTH_ASHWIN,
      S.MNTH_KARTIK,
      S.MNTH_MANGSIR,
      S.MNTH_POUSH,
      S.MNTH_MAGH,
      S.MNTH_FALGUN,
      S.MNTH_CHAITRA,
    ];
  }

  List<IconData> getSetupMenuIconList() {
    return [
      Icons.settings,
    ];
  }

  List<SubMenuModel> generateSubMenuModelList(List<String> childList, List<IconData> iconDataList) {
    return Iterable<int>.generate(childList.length).map((position) {
      return SubMenuModel(
        title: childList[position],
        iconData: iconDataList[position],
        position: position,
      );
    }).toList();
  }

  List<MainMenuModel> generateMainMenuModelList() {
    return Iterable<int>.generate(getMainMenuList().length).map((position) {
      return MainMenuModel(
        title: getMainMenuList()[position],
        iconData: getMainMenuIconList()[position],
        position: position,
        childMenuList: getSubMenuList()[position],
        childIconList: getSubMenuIconList()[position],
      );
    }).toList();
  }

  List<MainMenuModel> generateSetupMenuModelList() {
    return Iterable<int>.generate(getSetupMenuList().length).map((position) {
      return MainMenuModel(
        title: getSetupMenuList()[position],
        iconData: getSetupMenuIconList()[position],
        position: position,
      );
    }).toList();
  }
}
