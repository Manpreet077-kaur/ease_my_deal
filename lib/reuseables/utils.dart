import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_color.dart';
import 'responsive.dart';
import 'string_constants.dart';
import 'text_widget.dart';

class UIData {
  static Widget imageView(
      {required String image, double? width, double? height, Color? color,BoxFit? fit}) {
    return Image.asset(
      "assets/images/$image",
      width: width,
      height: height,
      color: color,
      fit:fit ,
    );
  }
  static Widget commonTitle(
      {required String name}) {
    return Row(
      children: [
        TextWidget(name,fontSize: 18,fontWeight: FontWeight.w500,),
        const Spacer(),
        TextWidget(StringConstants.seeAll,fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.lightTextColor,),
      ],
    );
  }

  static Widget buildContainer(String text,BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF006E78), Color(0xFF013066)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: UIData.imageView(image: 'sofa.png', fit: BoxFit.cover,)
              ),
              const SizedBox(width: 12,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    const Text(
                     StringConstants.flat15Off,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.yellow,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.freeDelivery,
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        Text(
                         StringConstants.designOptions,
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        Text(
                          StringConstants.designOptions,
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    commonContainer(child: const Text(
                      StringConstants.buyNow,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),context: context,color:AppColors.whiteColor ,borderRadius: BorderRadius.zero)

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  static Widget cardWidget(){
    return Card(color: AppColors.whiteColorG.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Container(padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.location_on_outlined),
              const SizedBox(width: 8,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(StringConstants.deliveryTo,fontSize: 10,fontWeight: FontWeight.normal,color: AppColors.lightTextColor,),
                  TextWidget("201301",fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.blackColor,),
                ],
              ),
              Spacer(),
              const Icon(Icons.search),
              const Icon(Icons.favorite_outline),
              const Icon(Icons.shopping_cart_checkout_sharp),

            ],
          ),
        ) );
  }
 static Widget colorContainer(String text,Color color,BuildContext context){
   final responsive = Responsive(context);
   return Container(height: responsive.height(0.02),
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: color,
      ),
      child: TextWidget(text,
        fontWeight: FontWeight.w500,fontSize: 8,textAlign: TextAlign.center,
        color: AppColors.whiteColor,
      ),
    );
  }
static Widget commonContainer(
      {Color? color,BorderRadiusGeometry? borderRadius, required Widget child, required BuildContext context}){
   final responsive = Responsive(context);
   return Container(
     padding: responsive.paddingAll(6),
     decoration: BoxDecoration(
       color: color??AppColors.blueColor,
       borderRadius: borderRadius??BorderRadius.circular(12),
     ),
     child: child
   );
  }

}


