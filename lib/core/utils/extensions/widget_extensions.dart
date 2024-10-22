import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

extension WidgetExtensions on Widget {
  Widget visible(bool visible, {Widget? fallback}) {
    return visible ? this : (fallback ?? const SizedBox.shrink());
  }

  /// add custom corner radius each side
  ClipRRect cornerRadiusWithClipRRectOnly({
    double bottomLeft = 0,
    double bottomRight = 0,
    double topLeft = 0,
    double topRight = 0,
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

  /// add corner radius
  ClipRRect cornerRadiusWithClipRRect(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  ClipRRect cornerRadiusWithClipRRectTop(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius), topRight: Radius.circular(radius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  ClipRRect cornerRadiusWithClipRRectBottom(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  ClipRRect cornerRadiusWithClipRRectOnlyWithBorder({
    double bottomLeft = 0,
    double bottomRight = 0,
    double topLeft = 0,
    double topRight = 0,
    Color? borderColor,
    double borderWidth = 1,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft.toDouble()),
        bottomRight: Radius.circular(bottomRight.toDouble()),
        topLeft: Radius.circular(topLeft.toDouble()),
        topRight: Radius.circular(topRight.toDouble()),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: borderColor ?? Colors.transparent, width: borderWidth),
        ),
        child: this,
      ),
    );
  }

  /// set parent widget in center
  Widget center(
      {double? heightFactor, double? widthFactor, bool enabled = true}) {
    return enabled
        ? Center(
            heightFactor: heightFactor, widthFactor: widthFactor, child: this)
        : this;
  }

  /// add tap to parent widget
  Widget onTap(
    void Function()? function, {
    Color? splashColor,
    Color? hoverColor,
    Color? highlightColor,
    BorderRadius? borderRadius,
  }) {
    return InkWell(
      onTap: function,
      splashColor: splashColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      borderRadius: borderRadius,
      // overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: this,
    );
  }

  /// Wrap with ShaderMask widget
  Widget withShaderMask(List<Color> colors,
      {BlendMode blendMode = BlendMode.srcATop}) {
    return withShaderMaskGradient(LinearGradient(colors: colors),
        blendMode: blendMode);
  }

  /// Wrap with ShaderMask widget Gradient
  Widget withShaderMaskGradient(Gradient gradient,
      {BlendMode blendMode = BlendMode.srcATop}) {
    return ShaderMask(
        shaderCallback: (rect) => gradient.createShader(rect),
        blendMode: blendMode,
        child: this);
  }

  /// Validate given widget is not null and returns given value if null.
  Widget validate({Widget value = const SizedBox()}) => this;

  Widget buildWhen(bool value) => value ? this : const SizedBox.shrink();

  Widget withTooltip({required String msg}) =>
      Tooltip(message: msg, child: this);

  Widget withSafeArea(
      {EdgeInsets? minimum, bool top = true, bool bottom = true}) {
    return SafeArea(
        minimum: minimum ?? EdgeInsets.zero,
        top: top,
        bottom: bottom,
        child: this);
  }

  Widget withShimmer({
    Duration duration = const Duration(seconds: 1),
    Color baseColor = Colors.grey,
    Color highlightColor = Colors.grey,
    bool buildWhen = true,
  }) {
    if (!buildWhen) return this;
    if (this is SizedBox) {
      return SizedBox(
        width: (this as SizedBox).width,
        height: (this as SizedBox).height,
        child: Shimmer.fromColors(
          period: duration,
          baseColor: baseColor.withOpacity(0.1),
          highlightColor: highlightColor.withOpacity(0.25),
          child: this,
        ),
      );
    } else if (this is CircleAvatar) {
      return CircleAvatar(
        radius: (this as CircleAvatar).radius,
        backgroundColor: Colors.transparent,
        child: Shimmer.fromColors(
          period: duration,
          baseColor: baseColor.withOpacity(0.1),
          highlightColor: highlightColor.withOpacity(0.25),
          child: this,
        ),
      );
    } else {
      return Shimmer.fromColors(
        period: duration,
        baseColor: baseColor.withOpacity(0.1),
        highlightColor: highlightColor.withOpacity(0.25),
        child: this,
      );
    }
  }
}

extension PaddingExtension on Widget {
  /// return padding top
  Padding paddingTop(double top) {
    return Padding(padding: EdgeInsets.only(top: top), child: this);
  }

  /// return padding left
  Padding paddingLeft(double left) {
    return Padding(padding: EdgeInsets.only(left: left), child: this);
  }

  /// return padding Directional
  Padding paddingStart(double start) {
    return Padding(
        padding: EdgeInsetsDirectional.only(start: start), child: this);
  }

  Padding paddingEnd(double end) {
    return Padding(padding: EdgeInsetsDirectional.only(end: end), child: this);
  }

  /// return padding right
  Padding paddingRight(double right) {
    return Padding(padding: EdgeInsets.only(right: right), child: this);
  }

  /// return padding bottom
  Padding paddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom), child: this);
  }

  /// return padding all
  Padding paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  /// return padding Symmetric
  Padding paddingSymmetric(double horizontal, double vertical) {
    return Padding(
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this);
  }

  Padding paddingVertical(double padding) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: padding), child: this);
  }

  Padding paddingHorizontal(double padding) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding), child: this);
  }

  /// return custom padding from each side
  Padding paddingOnly(
      {double top = 0.0,
      double left = 0.0,
      double bottom = 0.0,
      double right = 0.0}) {
    return Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom), child: this);
  }

  Padding paddingDirectionalOnly(
      {double top = 0.0,
      double start = 0.0,
      double bottom = 0.0,
      double end = 0.0}) {
    return Padding(
        padding: EdgeInsetsDirectional.only(
            top: top, bottom: bottom, start: start, end: end),
        child: this);
  }

  Padding paddingDirectionalAll({double padding = 0}) {
    return Padding(padding: EdgeInsetsDirectional.all(padding), child: this);
  }
}
