import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:weplay_admin/view/viewUtils/themes.dart';

class SignatureField extends StatelessWidget {
  final String labelText;
  final Uint8List initialValue;
  final double height;
  final bool readOnly;
  final SignatureController controller = SignatureController();
  SignatureField({
    @required this.labelText,
    this.initialValue,
    this.height = 200,
    this.readOnly = false,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return initialValue == null
        ? FormBuilderSignaturePad(
            decoration: InputDecoration(labelText: labelText),
            attribute: 'signature',
            height: height,
            readOnly: false,
            controller: controller,
            validators: [
              FormBuilderValidators.required(),
            ],
            clearButtonText: 'Re-Sign',
            backgroundColor: theme.surface,
          )
        : FormBuilderSignaturePad(
            decoration: InputDecoration(labelText: labelText),
            attribute: 'signature',
            height: height,
            readOnly: false,
            initialValue: initialValue,
            valueTransformer: (value) {
              if (value == null) {
                return initialValue;
              }
              return value;
            },
            clearButtonText: 'Re-Sign',
            backgroundColor: theme.surface,
          );
  }
}
