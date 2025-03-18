import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class CustomExpandableFab extends StatelessWidget {
  final Key expandableFabKey;
  final void Function() onScanPressed;
  final void Function() onManualPressed;

  const CustomExpandableFab({
    super.key,
    required this.expandableFabKey,
    required this.onScanPressed,
    required this.onManualPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      key: expandableFabKey,
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.menu),
        shape: const CircleBorder(),
      ),
      closeButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: const Icon(Icons.close),
        fabSize: ExpandableFabSize.small,
        shape: const CircleBorder(),
        backgroundColor: Colors.redAccent,
      ),
      type: ExpandableFabType.up,
      childrenAnimation: ExpandableFabAnimation.none,
      distance: 70,
      overlayStyle: ExpandableFabOverlayStyle(blur: 5),
      children: [
        Row(
          spacing: 20,
          children: [
            Text('Enter manually'),
            FloatingActionButton.small(
              shape: CircleBorder(),
              heroTag: null,
              onPressed: onManualPressed,
              child: Icon(Icons.more),
            ),
          ],
        ),
        Row(
          spacing: 20,
          children: [
            Text('Scan'),
            FloatingActionButton.small(
              shape: CircleBorder(),
              heroTag: null,
              onPressed: onScanPressed,
              child: Icon(Icons.camera_alt),
            ),
          ],
        ),
      ],
    );
  }
}
