import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weplay_admin/view/viewUtils/themes.dart';
import 'package:weplay_admin/view/we_play_admin_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.fromType(ThemeType.TiffinBlue);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => theme,
        ),
      ],
      child: MaterialApp(
        title: "Weplay Admin",
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        theme: theme.themeData,
        home: WePlayAdminHome(),
      ),
    );
  }
}
