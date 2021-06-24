import 'package:flutter/material.dart';
import 'package:weplay_admin/model/menuDrawer/main_menu_model.dart';
import 'package:weplay_admin/model/page/page_toggle_model.dart';
import 'package:weplay_admin/view/components/drawer_list_tile.dart';
import 'package:weplay_admin/view/viewUtils/arrays.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';
import 'package:weplay_admin/view/viewUtils/themes.dart';

class DrawerExpansionListTile extends StatelessWidget {
  final bool isResize;
  final MainMenuModel model;
  final PageToggleModel pageToggleModel;
  final AppTheme theme;
  final void Function(int) onTapChildMenu;
  final void Function(bool) onExpansionChange;
  final IconData trailingIconData;

  DrawerExpansionListTile({
    @required this.isResize,
    @required this.model,
    @required this.pageToggleModel,
    @required this.theme,
    @required this.onTapChildMenu,
    @required this.onExpansionChange,
    @required this.trailingIconData,
  });
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: isResize
          ? Container(
              height: 0,
              width: 0,
            )
          : Tooltip(
              message: model.title,
              child: Text(
                model.title,
                style: TextStyles.Btn.copyWith(
                  color: theme.txt,
                  fontSize: FontSizes.s16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
      leading: Icon(
        model.iconData,
      ),
      backgroundColor: Colors.white54,
      trailing: isResize
          ? Container(
              height: 0,
              width: 0,
            )
          : Icon(
              trailingIconData,
            ),
      initiallyExpanded: true,
      onExpansionChanged: onExpansionChange,
      children: [
        ...Arrays().generateSubMenuModelList(model.childMenuList, model.childIconList).map((subModel) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isResize ? 0 : 20,
            ),
            child: DrawerListTile(
              isResize: isResize,
              isDense: true,
              isSelected: model.position == pageToggleModel.position && subModel.position == pageToggleModel.subMenuPosition,
              onTap: () {
                onTapChildMenu(subModel.position);
              },
              iconData: model.iconData,
              title: subModel.title,
            ),
          );
        }).toList(),
      ],
    );
  }
}
