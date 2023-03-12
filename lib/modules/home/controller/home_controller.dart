
import 'package:flutter_demo/core/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../data/repository/brand_repository.dart';
import '../model/brand_query_param.dart';
import '../model/brand_remote_response.dart';
import '../model/brand_ui_data.dart';

class HomeController extends BaseController{
  final BrandRepository _repository =
  Get.find(tag: (BrandRepository).toString());

  final RxList<BrandUiData> _brandListController =
  RxList.empty();

  List<BrandUiData> get brandList =>
      _brandListController.toList();


  void getBrandList() {

    var queryParam = BrandQueryParam();
    var brandService = _repository.getBrandList(queryParam);

    callDataService(
      brandService,
      onSuccess: _handleProjectListResponseSuccess,
    );

  }

  void _handleProjectListResponseSuccess(BrandRemoteResponse response) {
    List<BrandUiData>? repoList = response.data
        ?.map((e) => BrandUiData(
      id: e.id != null ? e.id! : 0,
      companyId: e.companyId ?? 0,
      genericId: e.genericId  ?? 0,
      name: e.name ?? "",
      form: e.form ?? "",
      strength: e.strength ?? "",
      price: e.price ?? "",
      packsize: e.packsize ?? "",
      createdAt: e.createdAt ?? "",
      updatedAt: e.updatedAt ?? "",
      deletedAt: e.deletedAt ?? "",
    ))
        .toList();
    _brandListController(repoList);
  }

}