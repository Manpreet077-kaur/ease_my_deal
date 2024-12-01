
import 'package:ease_my_deal/reuseables/string_constants.dart';

class CateGoryModel{
  String imageUrl;
  String title;
  String subTitle;

  CateGoryModel({required this.imageUrl,required this.title,required this.subTitle});
}
List<CateGoryModel> testItems = [
  CateGoryModel(imageUrl: 'ic_living.png', title: StringConstants.livingRoom, subTitle: StringConstants.priceDrop,),
  CateGoryModel(imageUrl: 'ic_bed.png', title: StringConstants.bedroom, subTitle: StringConstants.priceDrop,),
  CateGoryModel(imageUrl: 'ic_storage.png', title: StringConstants.storage, subTitle:"",),
  CateGoryModel(imageUrl: 'ic_study.png', title: StringConstants.studyNew, subTitle: "",),
  CateGoryModel(imageUrl: 'ic_bed.png', title: StringConstants.dining, subTitle: "",),
  CateGoryModel(imageUrl: 'ic_table.png', title: StringConstants.tables, subTitle: "",),
  CateGoryModel(imageUrl: 'ic_chair.png', title: StringConstants.chairs, subTitle: "",),
  CateGoryModel(imageUrl: 'ic_z.png', title: StringConstants.zRated, subTitle: StringConstants.new_,),
];
List<CateGoryModel> dealsL = [
  CateGoryModel(imageUrl: 'sofa.png', title: StringConstants.product1, subTitle: StringConstants.discount1,),
  CateGoryModel(imageUrl: 'sofa.png', title: StringConstants.product2, subTitle: StringConstants.discount2,),
  CateGoryModel(imageUrl: 'sofa.png', title: StringConstants.product1, subTitle: StringConstants.discount1,),
  CateGoryModel(imageUrl: 'sofa.png', title: StringConstants.product2, subTitle: StringConstants.discount2,),
];
final List<String> sliderItems = [
  StringConstants.freeDelivery,
  StringConstants.designOptions,
  StringConstants.freeInstallation,
  StringConstants.freeDelivery,
];
