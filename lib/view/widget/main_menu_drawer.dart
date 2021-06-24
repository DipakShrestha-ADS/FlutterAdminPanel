import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sized_context/sized_context.dart';
import 'package:weplay_admin/bloc/drawer/animations/drawer_resize_bloc.dart';
import 'package:weplay_admin/bloc/drawer/main_menu_with_sub_menu_expansion_change_bloc.dart';
import 'package:weplay_admin/bloc/pageBloc/page_toggle_bloc.dart';
import 'package:weplay_admin/model/menuDrawer/main_menu_expansion_sub_menu_model.dart';
import 'package:weplay_admin/model/page/page_toggle_model.dart';
import 'package:weplay_admin/view/components/custom_scroll_bar.dart';
import 'package:weplay_admin/view/components/drawer_expansion_list_tile.dart';
import 'package:weplay_admin/view/components/drawer_list_tile.dart';
import 'package:weplay_admin/view/components/logo_main.dart';
import 'package:weplay_admin/view/viewUtils/arrays.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';
import 'package:weplay_admin/view/viewUtils/themes.dart';

class MainMenuDrawer extends StatefulWidget {
  final BuildContext parentContext;
  const MainMenuDrawer({Key key, @required this.parentContext}) : super(key: key);
  @override
  _MainMenuDrawerState createState() => _MainMenuDrawerState();
}

class _MainMenuDrawerState extends State<MainMenuDrawer> {
  ScrollController scrollController = ScrollController();
  bool twoColumnMode = false;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = Provider.of<AppTheme>(context);
    double columnBreakPt = PageBreaks.TabletLandscape - 100;
    twoColumnMode = context.widthPx > columnBreakPt;
    return Drawer(
      key: GlobalKey<DrawerControllerState>(),
      elevation: twoColumnMode ? 0 : 10,
      child: Container(
        child: Column(
          children: <Widget>[
            BlocBuilder<DrawerResizeBloc, bool>(
              builder: (context, isResized) {
                return DrawerHeader(
                  decoration: BoxDecoration(
                    color: theme.accent1Dark,
                  ),
                  padding: EdgeInsets.only(
                    bottom: 0,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleLogoMain(
                          width: isResized ? 50 : 60.0,
                          height: isResized ? 50 : 60.0,
                          backgroundColor: theme.bg2,
                          padding: const EdgeInsets.all(3.0),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        isResized
                            ? Text(
                                'WP',
                                style: TextStyles.CalloutFocus.copyWith(
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              )
                            : TyperAnimatedTextKit(
                                onTap: () {},
                                text: [
                                  'We Play Admin',
                                  'Admin Dashboard',
                                  'Admin WePlay',
                                ],
                                textStyle: TextStyles.CalloutFocus.copyWith(
                                  color: Colors.white,
                                  fontSize: FontSizes.s16,
                                ),
                                speed: Duration(
                                  milliseconds: 200,
                                ),
                                textAlign: TextAlign.start,
                                alignment: AlignmentDirectional.topStart, // or Alignment.topLeft
                              ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: BlocBuilder<DrawerResizeBloc, bool>(
                builder: (context, isResize) {
                  return CustomScrollBar(
                    isAlwaysShown: false,
                    scrollController: scrollController,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      controller: scrollController,
                      children: [
                        ...Arrays().generateMainMenuModelList().map(
                          (model) {
                            return BlocBuilder<PageToggleBloc, PageToggleModel>(
                              builder: (context, pageToggleModel) {
                                if (model.childMenuList.length == 0) {
                                  return DrawerListTile(
                                    isResize: isResize,
                                    isSelected: pageToggleModel.position == model.position,
                                    onTap: () {
                                      BlocProvider.of<PageToggleBloc>(context).add(PageToggleModel(
                                        position: model.position,
                                      ));
                                    },
                                    iconData: model.iconData,
                                    title: model.title,
                                  );
                                }
                                return BlocBuilder<MainMenuWithSubMenuExpansionChangeBloc, MainMenuExpansionSubMenuModel>(
                                  builder: (context, expansionModel) {
                                    IconData tIconData = Icons.arrow_upward;
                                    if (expansionModel != null) {
                                      if (expansionModel.positionMapIsExpand.containsKey(model.position)) {
                                        if (!expansionModel.positionMapIsExpand[model.position]) {
                                          tIconData = Icons.arrow_downward;
                                        } else {
                                          tIconData = Icons.arrow_upward;
                                        }
                                      }
                                    }

                                    return DrawerExpansionListTile(
                                      isResize: isResize,
                                      model: model,
                                      trailingIconData: tIconData,
                                      pageToggleModel: pageToggleModel,
                                      theme: theme,
                                      onTapChildMenu: (subMenuPos) {
                                        BlocProvider.of<PageToggleBloc>(context).add(PageToggleModel(
                                          position: model.position,
                                          hasSubMenu: true,
                                          subMenuPosition: subMenuPos,
                                        ));
                                      },
                                      onExpansionChange: (isExpand) {
                                        BlocProvider.of<MainMenuWithSubMenuExpansionChangeBloc>(context).add(MainMenuExpansionSubMenuModel(
                                          position: model.position,
                                          isExpand: isExpand,
                                        ));
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ).toList(),
                        // Container(
                        //   child: Tooltip(
                        //     message: '${S.TITLE_SETUP}',
                        //     child: ListTile(
                        //       //leading: const Icon(Icons.settings_applications_outlined),
                        //       title: Text(
                        //         '${S.TITLE_SETUP}',
                        //         style: TextStyles.H1.copyWith(
                        //           fontSize: isResize ? FontSizes.s12 : FontSizes.s16,
                        //         ),
                        //         overflow: TextOverflow.ellipsis,
                        //       ),
                        //       mouseCursor: SystemMouseCursors.forbidden,
                        //       onTap: () {},
                        //     ),
                        //   ),
                        // ),
                        // Divider(),
                        // ...Arrays().generateSetupMenuModelList().map((model) {
                        //   return DrawerListTile(
                        //     isResize: isResize,
                        //     onTap: () {},
                        //     iconData: model.iconData,
                        //     iconText: model.position == 3 ? 'Rs' : null,
                        //     title: model.title,
                        //   );
                        // }).toList(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
