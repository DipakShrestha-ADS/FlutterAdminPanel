import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sized_context/sized_context.dart';
import 'package:weplay_admin/bloc/drawer/animations/drawer_resize_bloc.dart';
import 'package:weplay_admin/view/components/custom_scroll_bar.dart';
import 'package:weplay_admin/view/viewUtils/strings.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';
import 'package:weplay_admin/view/viewUtils/themes.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool twoColumnMode = false;

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    AppTheme theme = RepositoryProvider.of<AppTheme>(context);
    double columnBreakPt = PageBreaks.TabletLandscape - 100;
    twoColumnMode = context.widthPx > columnBreakPt;
    return Container(
      color: theme.surface,
      child: CustomScrollBar(
        isAlwaysShown: false,
        scrollController: scrollController,
        child: CustomScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 161.0,
              backgroundColor: theme.accent1Dark,
              leading: BlocBuilder<DrawerResizeBloc, bool>(
                builder: (context, shouldResize) {
                  return IconButton(
                    icon: Icon(
                      !twoColumnMode
                          ? Icons.menu
                          : !shouldResize
                              ? Icons.menu_open
                              : Icons.zoom_out_map,
                      color: theme.surface,
                    ),
                    tooltip: twoColumnMode
                        ? !shouldResize
                            ? 'Shrink Menu'
                            : 'Expand Menu'
                        : 'Open Menu',
                    onPressed: () {
                      if (twoColumnMode) {
                        BlocProvider.of<DrawerResizeBloc>(context).add(!shouldResize);
                      } else {
                        BlocProvider.of<DrawerResizeBloc>(context).add(false);
                        Scaffold.of(context).openDrawer();
                      }
                    },
                  );
                },
              ),
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  '${S.TITLE_DASHBOARD}',
                  style: TextStyles.lato,
                ),
                collapseMode: CollapseMode.parallax,
                stretchModes: [StretchMode.blurBackground],
                background: Image.asset(
                  'assets/weplay_horizontal_logo.png',
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.srcATop,
                  color: theme.accent1DarkTransparent,
                ),
              ),
              pinned: true,
              actions: <Widget>[
                IconButton(
                  icon: Image.asset('assets/weplay_horizontal_logo.png'),
                  tooltip: "Weplay Nepal",
                  onPressed: () {},
                )
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 1200,
                    color: Colors.black12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
