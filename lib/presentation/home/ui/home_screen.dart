import 'package:carousel_slider/carousel_slider.dart';
import 'package:ease_my_deal/data/model/category_model.dart';
import 'package:ease_my_deal/presentation/home/cubit/home_cubit.dart';
import 'package:ease_my_deal/reuseables/app_color.dart';
import 'package:ease_my_deal/reuseables/best_deal_card.dart';
import 'package:ease_my_deal/reuseables/common_app_bar.dart';
import 'package:ease_my_deal/reuseables/common_list_view_builder.dart';
import 'package:ease_my_deal/reuseables/responsive.dart';
import 'package:ease_my_deal/reuseables/string_constants.dart';
import 'package:ease_my_deal/reuseables/text_widget.dart';
import 'package:ease_my_deal/reuseables/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../reuseables/offer_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return
      CommonScafold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: responsive.height(0.02),),
            UIData.cardWidget(),
            SizedBox(height: responsive.height(0.02),),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final cubit = context.read<HomeCubit>();
                return Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: sliderItems.length,
                      itemBuilder: (context, index, realIndex) {
                        return UIData.buildContainer(sliderItems[index],context);
                      },
                      options: CarouselOptions(
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        autoPlay: true,animateToClosest: true,
                        onPageChanged: (index, reason) {
                          cubit.updateValue(index);
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: sliderItems.asMap().entries.map((entry) {
                        return GestureDetector(
                          child: Container(
                            width:cubit.currentIndex == entry.key? 20: 6.0,
                            height: 6.0,
                            margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal:2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: cubit.currentIndex == entry.key
                                  ? AppColors.grey
                                  : AppColors.greyLight,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: responsive.height(0.01),),
            TextWidget(StringConstants.buyFurniture,fontWeight: FontWeight.w500,fontSize: responsive.height(0.02),),
            SizedBox(height: responsive.height(0.01),),
            GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,mainAxisExtent: responsive.height(0.10),
            mainAxisSpacing: 20,
          ),
          itemCount: testItems.length,
          itemBuilder: (context, index) {
            final category = testItems[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(category.subTitle.isNotEmpty)...[
                  UIData.colorContainer(category.subTitle,category.subTitle==StringConstants.new_?AppColors.primaryColor:
                  AppColors.yellowDark,context),
                ]else...[
                  Container(height: responsive.height(0.02),)
                ],
                UIData.imageView(image: category.imageUrl,height: responsive.height(0.04),width:responsive.width(0.08) ,fit: BoxFit.cover),
                SizedBox(height: responsive.height(0.02),),
                TextWidget(category.title,
                  fontWeight: FontWeight.w500,fontSize: responsive.width(0.03),textAlign: TextAlign.center,),
              ],
            );
          },
        ),
            SizedBox(height: responsive.height(0.02),),
            BestDealsCard(),
            SizedBox(height: responsive.height(0.02),),
            UIData.commonTitle(name: StringConstants.offersDiscounts),
            SizedBox(height: responsive.height(0.02),),
            HorizontalListView(
              items: [1,2,3,4],
              height: responsive.height(0.15),
              itemBuilder: (context, item) {
                return  TicketCard(

                );
              },
            ),
            SizedBox(height: responsive.height(0.02),),
            Row(
              children: [
                UIData.commonContainer(child: Icon(Icons.percent,color: AppColors.whiteColor,),context: context),
                SizedBox(width: responsive.height(0.01),),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(StringConstants.dealsOfTheDay,fontSize: 18,fontWeight: FontWeight.w500,),
                    TextWidget(StringConstants.toBUY,fontSize: 12,fontWeight: FontWeight.w400,),
                  ],
                ),
                const Spacer(),
                TextWidget(StringConstants.viewAll,fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.lightTextColor,),
              ],
            ),
            SizedBox(height: responsive.height(0.02),),
            HorizontalListView<CateGoryModel>(
              items: dealsL,
              height: responsive.height(0.3),
              itemBuilder: (context, item) {
                return Container(
                  margin: responsive.paddingOnlyRight(12),
                  child: Column(
                    children: [
                     UIData.imageView(image: item.imageUrl,height: responsive.height(0.2),width:  responsive.width(0.3) ),
                      SizedBox(height: responsive.height(0.01),),
                      TextWidget(item.title,
                        fontWeight: FontWeight.w600,fontSize: responsive.width(0.03),textAlign: TextAlign.center,
                      ),
                      SizedBox(height: responsive.height(0.01),),
                      UIData.commonContainer(child:Row(
                        children: [
                          TextWidget("-74% ",
                            fontWeight: FontWeight.w500,fontSize: responsive.width(0.06),textAlign: TextAlign.center,
                          ),
                          TextWidget(item.subTitle,
                            fontWeight: FontWeight.w500,fontSize: responsive.width(0.03),textAlign: TextAlign.center,
                            color: AppColors.blackColor,
                          ),
                        ],
                      ),color: AppColors.yellowDark,borderRadius: BorderRadius.zero, context: context,),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      );

  }
}
