import 'package:flutter/material.dart';

extension ElevatedButtonWithLoading on ElevatedButton {
  static ElevatedButton createWithLoading({
    required VoidCallback? onPressed,
    Widget? child,
    required ValueNotifier<bool> isLoading,
  }) {
    return ElevatedButton(
      onPressed: isLoading.value ? null : onPressed,
      child: ValueListenableBuilder<bool>(
        valueListenable: isLoading,
        builder: (context, loading, child) {
          return loading
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ))
              : DefaultTextStyle.merge(child: child ?? Container());
        },
        child: child,
      ),
    );
  }
}
