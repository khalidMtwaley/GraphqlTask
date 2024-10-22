import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, this.padding, required this.child});
  final EdgeInsetsGeometry? padding;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the container
        borderRadius: BorderRadius.circular(4), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Slight shadow color
            offset: Offset(0, 0), // Evenly spread the shadow in all directions
            blurRadius: 5.0, // Smaller blur for a softer shadow
            spreadRadius: 1.0, // Controls the size of the shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
