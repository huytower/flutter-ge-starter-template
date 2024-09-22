import 'package:flutter/material.dart';

class SectionDesWidget extends StatelessWidget {
  const SectionDesWidget({Key? key, required this.des}) : super(key: key);

  final String des;

  @override
  Widget build(c) => ConstrainedBox(
      constraints: const BoxConstraints(),
      child: SizedBox(
        width: double.infinity,
        child: RichText(
          text: TextSpan(
              style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400), text: des),
          maxLines: 1,
          textAlign: TextAlign.start,
        ),
      ));
}
