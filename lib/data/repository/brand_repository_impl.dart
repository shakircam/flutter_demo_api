import 'package:flutter_demo/modules/home/model/brand_query_param.dart';

import 'package:flutter_demo/modules/home/model/brand_remote_response.dart';
import 'package:get/get.dart';

import '../remote/drug_remote_data_source.dart';
import 'brand_repository.dart';

class BrandRepositoryImpl implements BrandRepository {
  final DrugRemoteDataSource _remoteSource =
      Get.find(tag: (DrugRemoteDataSource).toString());

  @override
  Future<BrandRemoteResponse> getBrandList(BrandQueryParam queryParam) {
    return _remoteSource.getBrandList(queryParam);
  }
}
