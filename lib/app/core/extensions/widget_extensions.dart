import 'package:flutter/material.dart';
import 'package:photo_separator/app/core/helpers/constants/constants.dart';

// Widget Extensions
extension WidgetExtension on Widget? {
  /// With custom height and width
  SizedBox withSize({double width = 0.0, double height = 0.0}) {
    return SizedBox(height: height, width: width, child: this);
  }

  /// With custom width
  SizedBox withWidth(double width) => SizedBox(width: width, child: this);

  /// With custom height
  SizedBox withHeight(double height) => SizedBox(height: height, child: this);

  /// return padding top
  Padding paddingTop(double? top) {
    return Padding(
        padding: EdgeInsets.only(top: top ?? defaultPadding), child: this);
  }

  /// return padding left
  Padding paddingLeft(double? left) {
    return Padding(
        padding: EdgeInsets.only(left: left ?? defaultPadding), child: this);
  }

  /// return padding right
  Padding paddingRight(double? right) {
    return Padding(
        padding: EdgeInsets.only(right: right ?? defaultPadding), child: this);
  }

  /// return padding bottom
  Padding paddingBottom(double? bottom) {
    return Padding(
        padding: EdgeInsets.only(bottom: bottom ?? defaultPadding),
        child: this);
  }

  /// return padding all
  Padding paddingAll(double? padding) {
    return Padding(
        padding: EdgeInsets.all(padding ?? defaultPadding), child: this);
  }

  /// return custom padding from each side
  Padding paddingOnly({
    double top = 0.0,
    double left = 0.0,
    double bottom = 0.0,
    double right = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  /// return padding symmetric
  Padding paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  /// set visibility
  Widget visible(bool visible, {Widget? defaultWidget}) {
    return visible ? this! : (defaultWidget ?? const SizedBox());
  }

  /// add custom corner radius each side
  ClipRRect cornerRadiusWithClipRRectOnly({
    int bottomLeft = 0,
    int bottomRight = 0,
    int topLeft = 0,
    int topRight = 0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft.toDouble()),
        bottomRight: Radius.circular(bottomRight.toDouble()),
        topLeft: Radius.circular(topLeft.toDouble()),
        topRight: Radius.circular(topRight.toDouble()),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }
}
