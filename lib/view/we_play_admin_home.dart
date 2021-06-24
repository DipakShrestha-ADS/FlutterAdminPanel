import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weplay_admin/bloc/drawer/animations/drawer_resize_bloc.dart';
import 'package:weplay_admin/bloc/drawer/main_menu_with_sub_menu_expansion_change_bloc.dart';
import 'package:weplay_admin/bloc/pageBloc/page_toggle_bloc.dart';
import 'package:weplay_admin/view/widget/home.dart';

class WePlayAdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DrawerResizeBloc(),
        ),
        BlocProvider(
          create: (_) => PageToggleBloc(),
        ),
        BlocProvider(
          create: (_) => MainMenuWithSubMenuExpansionChangeBloc(),
        ),
      ],
      child: Home(),
    );
  }
}
