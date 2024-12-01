import 'package:flutter/material.dart';

import 'app_color.dart';
import 'responsive.dart';
import 'string_constants.dart';
import 'text_widget.dart';

class TicketCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Center(
      child: ClipPath(
        clipper: TicketClipper(),
        child: Container(
          color: Colors.yellow[100],
          height: responsive.height(0.3),
          width: responsive.width(0.8),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Icon(Icons.info, size: 36, color: Colors.blue),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(StringConstants.sbiOffer,color: AppColors.blackColor
                      ,fontWeight: FontWeight.bold,fontSize:
                      responsive.width(0.04),),
                    TextWidget(StringConstants.sbiDetails,color: AppColors.blackColor
                      ,fontWeight: FontWeight.normal,fontSize:
                      responsive.width(0.03),),
                    TextWidget(StringConstants.nCR,color: AppColors.lightTextColor
                      ,fontWeight: FontWeight.w500,fontSize:
                      responsive.width(0.03),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.moveTo(0, 0);

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height / 2 - 10);
    path.arcToPoint(
      Offset(size.width, size.height / 2 + 10),
      radius: Radius.circular(10),
      clockwise: false,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height / 2 + 10);
    path.arcToPoint(
      Offset(0, size.height / 2 - 10),
      radius: Radius.circular(10),
      clockwise: false,
    );
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}