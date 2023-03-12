

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/values/app_values.dart';
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
      child: Ripple(
        onTap: _onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppValues.padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(dataModel.name),
              const SizedBox(width: AppValues.margin_10),
              Text(dataModel.strength),
              const SizedBox(width: AppValues.margin_10),
              Text(dataModel.form),
              const SizedBox(width: AppValues.margin_10),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap() {
   // Get.toNamed(Routes.PROJECT_DETAILS, arguments: dataModel);
  }

}