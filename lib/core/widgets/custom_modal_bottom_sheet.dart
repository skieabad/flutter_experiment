import 'package:flutter/material.dart';

void showCustomModalBottomSheet({
  required BuildContext context,
  required Widget content,
}) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(34.0)),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(30), child: content),
        ),
      );
    },
  );
}
