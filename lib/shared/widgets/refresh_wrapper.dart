import 'package:flutter/material.dart';

class RefreshWrapper extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final bool showIndicator;

  const RefreshWrapper({
    super.key,
    required this.child,
    required this.onRefresh,
    this.showIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: showIndicator
          ? Stack(
              children: [
                child,
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: LinearProgressIndicator(),
                ),
              ],
            )
          : child,
    );
  }
}
