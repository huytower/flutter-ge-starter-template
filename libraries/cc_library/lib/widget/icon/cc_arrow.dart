import 'package:flutter/material.dart';

class CcArrowRight extends StatelessWidget {
  const CcArrowRight({Key? key}) : super(key: key);

  @override
  Center build(c) => const Center(
        child: SizedBox(
          width: 25,
          child: Icon(
            Icons.skip_next,
            color: Colors.black,
            size: 15,
          ),
        ),
      );
}
