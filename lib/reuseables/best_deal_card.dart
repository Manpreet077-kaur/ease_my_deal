import 'package:ease_my_deal/reuseables/app_color.dart';
import 'package:ease_my_deal/reuseables/utils.dart';
import 'package:flutter/material.dart';
import 'responsive.dart';
import 'string_constants.dart';
import 'text_widget.dart';

class BestDealsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: responsive.height(0.02),),
    UIData.imageView(image: "deal.png",height: responsive.height(0.06)),
        SizedBox(height: responsive.height(0.02),),
        TextWidget(StringConstants.bestDeals,color: AppColors.grey,fontWeight: FontWeight.w500,fontSize:
        responsive.width(0.03),),
        SizedBox(height: responsive.height(0.02)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Container(padding: EdgeInsets.symmetric(horizontal: 12),
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFB4C7E7), Color(0xFF829AB1)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.new_releases, size: 36, color: Colors.white),
                      const SizedBox(height: 8),
                      TextWidget(StringConstants.buyBrandNew,color: AppColors.whiteColor
                        ,fontWeight: FontWeight.bold,fontSize:
                      responsive.width(0.04),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            // "Refurbished" Card
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Container(padding: EdgeInsets.symmetric(horizontal: 12),
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFA0D5DB), Color(0xFF57BCC1)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.recycling, size: 36, color: Colors.white),
                      const SizedBox(height: 8),
                      TextWidget(StringConstants.buyRefurbished,color: AppColors.whiteColor
                        ,fontWeight: FontWeight.bold,fontSize:
                        responsive.width(0.04),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
