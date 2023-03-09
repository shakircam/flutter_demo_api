
import '../../../core/values/app_values.dart';

class BrandQueryParam{
  String limit;
  String page;
  String date;

  BrandQueryParam({
    this.limit = AppValues.defaultDataSize,
    this.page = AppValues.defaultPage,
    this.date = AppValues.defaultDate,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['limit'] = limit;
    data['page'] = page;
    data['date'] = date;

    return data;
  }
}