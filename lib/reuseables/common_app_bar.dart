import 'package:flutter/material.dart';
import 'responsive.dart';

class CommonScafold extends StatelessWidget {
  Widget? body;
  CommonScafold(
      {super.key,
        this.body});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      body: Container(margin:  responsive.paddingAll(20),
          child: body),
    );
  }
}

