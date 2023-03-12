
import '../../modules/home/model/brand_query_param.dart';
import '../../modules/home/model/brand_remote_response.dart';

abstract class BrandRepository{
  Future<BrandRemoteResponse> getBrandList(
      BrandQueryParam queryParam);
}