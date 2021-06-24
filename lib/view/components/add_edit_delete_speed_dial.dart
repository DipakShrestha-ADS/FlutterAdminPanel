import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:weplay_admin/view/viewUtils/themes.dart';

class AddEditDeleteSpeedDial extends StatelessWidget {
  AddEditDeleteSpeedDial({
    Key key,
    @required this.onAdd,
    @required this.onEdit,
    @required this.onDelete,
    @required this.addLabel,
    @required this.editLabel,
    @required this.deleteLabel,
    this.onClose,
    this.onOpen,
  }) : super(key: key);
  final Function() onAdd;
  final Function() onEdit;
  final Function() onDelete;
  final Function() onOpen;
  final Function() onClose;
  final String addLabel;
  final String editLabel;
  final String deleteLabel;
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      // child: Icon(Icons.add),
      onOpen: onOpen,
      onClose: onClose,
      curve: Curves.bounceIn,
      heroTag: "$addLabel $editLabel $deleteLabel",
      overlayOpacity: 0,
      children: [
        SpeedDialChild(
          child: Icon(
            Icons.delete,
            color: theme.surface,
          ),
          backgroundColor: theme.error,
          onTap: onDelete,
          label: '$deleteLabel',
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: theme.surface,
          ),
          labelBackgroundColor: theme.error,
        ),
        SpeedDialChild(
          child: Icon(
            Icons.edit,
            color: theme.surface,
          ),
          backgroundColor: theme.accent1Dark,
          onTap: onEdit,
          label: '$editLabel',
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: theme.surface,
          ),
          labelBackgroundColor: theme.accent1Dark,
        ),
        SpeedDialChild(
          child: Icon(
            Icons.add,
            color: theme.surface,
          ),
          backgroundColor: theme.accent3,
          onTap: onAdd,
          label: '$addLabel',
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: theme.surface,
          ),
          labelBackgroundColor: theme.accent3,
        ),
      ],
    );
  }
}
