

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/base_widget_mixin.dart';
import '../../../core/widget/elevated_container.dart';
import '../../../core/widget/ripple.dart';
import '../model/brand_ui_data.dart';

class ItemBrand extends StatelessWidget with BaseWidgetMixin {
  final BrandUiData dataModel;

  ItemBrand({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return ElevatedContainer(
        child: Padding(
          padding: const EdgeInsets.all(AppValues.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Brand ${dataModel.name}',style: labelStyle,),
              const SizedBox(width: AppValues.margin_10),
              Text('Strength ${dataModel.strength}',style: cyanText16,),
              const SizedBox(width: AppValues.margin_10),
              Text('Form ${dataModel.form}'),
              const SizedBox(width: AppValues.margin_10),
            ],
          ),
        ),

    );
  }

  void _onTap() {
   // Get.toNamed(Routes.PROJECT_DETAILS, arguments: dataModel);
  }

}