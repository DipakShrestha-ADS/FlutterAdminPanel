import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';
import 'package:weplay_admin/view/viewUtils/themes.dart';

class SearchField extends StatelessWidget {
  SearchField({
    Key key,
    @required this.twoColumnMode,
    @required this.theme,
    this.labelText,
    this.onChanged,
    this.onSubmitted,
    this.attribute,
  }) : super(key: key);
  final bool twoColumnMode;
  final AppTheme theme;
  final Function(dynamic) onSubmitted;
  final Function(dynamic) onChanged;
  final String labelText;
  final String attribute;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: twoColumnMode ? 300 : 150,
      child: FormBuilderTextField(
        attribute: attribute ?? "search",
        autofocus: false,
        autovalidateMode: AutovalidateMode.disabled,
        onFieldSubmitted: onSubmitted,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText ?? 'Search',
          labelStyle: TextStyles.Footnote.copyWith(
            fontSize: FontSizes.s14,
            color: theme.surface,
            wordSpacing: 2,
          ),
          icon: Icon(
            Icons.search,
            color: theme.surface,
          ),
          border: InputBorder.none,
        ),
        style: TextStyles.Footnote.copyWith(
          fontSize: FontSizes.s16,
          color: theme.surface,
        ),
      ),
    );
  }
}
