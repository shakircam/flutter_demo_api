import 'package:dio/dio.dart';

import 'package:flutter_demo/core/base/base_remote_source.dart';
import 'package:flutter_demo/modules/home/model/brand_query_param.dart';
import 'package:flutter_demo/modules/home/model/brand_remote_response.dart';

import '../../network/dio_provider.dart';
import 'drug_remote_data_source.dart';

class DrugRemoteDataSourceImp extends BaseRemoteSource implements DrugRemoteDataSource{
  @override
  Future<BrandRemoteResponse> getBrandList(BrandQueryParam queryParam) {
    var endpoint = "${DioProvider.baseUrl}api/drugs/brands";
    var dioCall = dioClient.get(endpoint, queryParameters: queryParam.toJson());

    try{
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseBrandResponse(response));
    }catch (e){
      rethrow;
    }
  }

  BrandRemoteResponse _parseBrandResponse(Response<dynamic> response) {
    return BrandRemoteResponse.fromJson(response.data);
  }

}