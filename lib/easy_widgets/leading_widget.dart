import 'package:flutter/material.dart';

class LeadingImageWidget extends StatelessWidget {
  const LeadingImageWidget({super.key, required this.imgWidget});

  final Widget imgWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Stack(children: [
        Positioned.fill(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:imgWidget ),
        ),
      ]),
    );
  }
}

//EasyCachedNetworkImage(fit: BoxFit.fill, img: img)