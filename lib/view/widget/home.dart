import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sized_context/sized_context.dart';
import 'package:weplay_admin/bloc/drawer/animations/drawer_resize_bloc.dart';
import 'package:weplay_admin/bloc/pageBloc/page_toggle_bloc.dart';
import 'package:weplay_admin/model/page/page_toggle_model.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';
import 'package:weplay_admin/view/widget/dashboard.dart';
import 'package:weplay_admin/view/widget/main_menu_drawer.dart';
import 'package:weplay_admin/view/widget/userManagement/user_management.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  ScrollController controller = ScrollController();
  int numItems = 1000;
  bool twoColumnMode = false;
  bool makeMenuSizeAsItIs = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Check a breakpoint to see whether we want side:side view or full screen
    double columnBreakPt = PageBreaks.TabletLandscape - 100;
    twoColumnMode = context.widthPx > columnBreakPt;
    double height = context.heightPx;

    double mediuamBreakPoint = PageBreaks.MediumLandscape;
    makeMenuSizeAsItIs = context.widthPx < mediuamBreakPoint && context.widthPx > 900;
    return Scaffold(
      key: GlobalKey<ScaffoldState>(),
      body: Container(
        height: height,
        child: Wrap(
          children: [
            BlocBuilder<DrawerResizeBloc, bool>(
              builder: (context, shouldResize) {
                return FractionallySizedBox(
                  widthFactor: twoColumnMode
                      ? !shouldResize
                          ? 0.25
                          : makeMenuSizeAsItIs
                              ? 0.065
                              : 0.05
                      : 0,
                  child: Container(
                    height: height,
                    child: twoColumnMode
                        ? MainMenuDrawer(
                            parentContext: context,
                          )
                        : Container(),
                  ),
                );
              },
            ),
            BlocBuilder<DrawerResizeBloc, bool>(
              builder: (context, shouldResize) {
                return FractionallySizedBox(
                  widthFactor: twoColumnMode
                      ? !shouldResize
                          ? 0.75
                          : makeMenuSizeAsItIs
                              ? 0.933
                              : 0.95
                      : 1,
                  child: Container(
                    height: height,
                    child: BlocBuilder<PageToggleBloc, PageToggleModel>(
                      builder: (context, pageToggleModel) {
                        if (!pageToggleModel.hasSubMenu) {
                          if (pageToggleModel.position == 0) {
                            return Dashboard();
                          } else {
                            return Container(
                              child: Text('Now Route found'),
                            );
                          }
                        } else {
                          if (pageToggleModel.position == 1) {
                            if (pageToggleModel.subMenuPosition == 0) {
                              return UserManagement();
                            }
                          }
                        }
                        return Container(
                          child: Text('Now Route found'),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      drawer: twoColumnMode
          ? Container()
          : MainMenuDrawer(
              parentContext: context,
            ),
    );
  }
}
