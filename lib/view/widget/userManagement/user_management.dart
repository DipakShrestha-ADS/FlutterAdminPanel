import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sized_context/sized_context.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';
import 'package:weplay_admin/view/viewUtils/themes.dart';

class UserManagement extends StatelessWidget {
  bool twoColumnMode;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = RepositoryProvider.of<AppTheme>(context);
    double columnBreakPt = PageBreaks.TabletLandscape - 100;
    twoColumnMode = context.widthPx > columnBreakPt;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.accent1Dark,
        title: Text(
          'User Management',
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
            'User Management',
          ),
        ),
      ),
    );
  }
}
