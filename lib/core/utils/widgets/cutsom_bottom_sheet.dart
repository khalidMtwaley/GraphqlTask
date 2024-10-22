import 'package:flutter/material.dart';

class CutsomBottomSheet extends StatelessWidget {
  const CutsomBottomSheet({super.key, this.bottomSheetContent});

  final Widget? bottomSheetContent;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom == 0
                ? 16
                : MediaQuery.of(context).viewInsets.bottom),
        child: AbsorbPointer(
          absorbing: false,
          child: SingleChildScrollView(child: bottomSheetContent),
        ));
  }
}
