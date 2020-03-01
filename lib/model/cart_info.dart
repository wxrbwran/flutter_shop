import 'dart:convert' show json;

class CartInfoModel {
  String goodsId;
  String goodsName;
  int count;
  int price;
  String images;
  bool isCheck;

  CartInfoModel({
    this.goodsId,
    this.goodsName,
    this.count,
    this.price,
    this.images,
    this.isCheck
  });

  static CartInfoModel fromJson(jsonRes) => jsonRes == null
      ? null
      : CartInfoModel(
          goodsId: jsonRes['goodsId'],
          goodsName: jsonRes['goodsName'],
          count: jsonRes['count'],
          price: jsonRes['price'],
          images: jsonRes['images'],
          isCheck: jsonRes['isCheck'],
        );

  Map<String, dynamic> toJson() => {
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'images': images,
        'isCheck': isCheck,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}
