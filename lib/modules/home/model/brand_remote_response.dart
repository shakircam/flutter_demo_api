
class BrandRemoteResponse{
  BrandRemoteResponse({
    this.data,});

  BrandRemoteResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.companyId,
    this.genericId,
    this.name,
    this.form,
    this.strength,
    this.price,
    this.packsize,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    genericId = json['generic_id'];
    name = json['name'];
    form = json['form'];
    strength = json['strength'];
    price = json['price'];
    packsize = json['packsize'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  int? companyId;
  int? genericId;
  String? name;
  String? form;
  String? strength;
  String? price;
  String? packsize;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['generic_id'] = genericId;
    map['name'] = name;
    map['form'] = form;
    map['strength'] = strength;
    map['price'] = price;
    map['packsize'] = packsize;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}