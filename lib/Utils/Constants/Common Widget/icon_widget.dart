import 'package:flutter/material.dart';

class IconWidget extends StatefulWidget {
  final String? image;
  final double? height;
  const IconWidget({super.key, this.image, this.height});

  @override
  State<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            widget.image!,
          ),
        ),
      ),
    );
  }
}
