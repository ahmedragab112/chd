class ProductEntity {
  List<DataEntity>? data;

  ProductEntity({this.data});
}

class DataEntity {
  String? id;
  String? name;
  String? slug;
  String? description;
  String? type;
  String? model;
  String? rowId;
  String? iso;

  DataEntity(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.type,
      this.model,
      this.rowId,
      this.iso});
}
