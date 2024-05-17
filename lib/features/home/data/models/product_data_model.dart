import 'package:chdtask/features/home/domain/entities/product_entity.dart';

class ProductDataModel extends ProductEntity {
  int? status;
  String? message;

  ProductDataModel({super.data, this.status, this.message});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
}

class Data extends DataEntity {
  Data(
      {super.id,
      super.name,
      super.slug,
      super.description,
      super.type,
      super.model,
      super.rowId,
      super.iso});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    type = json['type'];
    model = json['model'];
    rowId = json['row_id'];
    iso = json['iso'];
  }
}
