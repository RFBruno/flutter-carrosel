// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {
  final String imageUrl;
  final bool activePage;
  const SlideTile({
    Key? key,
    required this.imageUrl,
    required this.activePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double top = activePage ? 50 : 150;
    final double blur = activePage ? 30 : 0;
    final double offset = activePage ? 20 : 0;


    return AnimatedContainer(
      duration: const Duration( milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin : EdgeInsets.only(top: top, bottom: 100, right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            blurRadius: blur,
            offset: Offset(offset, offset)
          )
        ]
      ),
    );
  }
}
