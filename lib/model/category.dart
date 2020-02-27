class CategoryModel {
  String status;
  Data data;

  CategoryModel({this.status, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Info> info;

  Data({this.info});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['info'] != null) {
      info = new List<Info>();
      json['info'].forEach((v) {
        info.add(new Info.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  int mallCategoryId;
  String mallCategoryName;
  List<BxMallSubDto> bxMallSubDto;
  String comments;
  String image;

  Info(
      {this.mallCategoryId,
      this.mallCategoryName,
      this.bxMallSubDto,
      this.comments,
      this.image});

  Info.fromJson(Map<String, dynamic> json) {
    mallCategoryId = json['mallCategoryId'];
    mallCategoryName = json['mallCategoryName'];
    if (json['bxMallSubDto'] != null) {
      bxMallSubDto = new List<BxMallSubDto>();
      json['bxMallSubDto'].forEach((v) {
        bxMallSubDto.add(new BxMallSubDto.fromJson(v));
      });
    }
    comments = json['comments'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallCategoryName'] = this.mallCategoryName;
    if (this.bxMallSubDto != null) {
      data['bxMallSubDto'] = this.bxMallSubDto.map((v) => v.toJson()).toList();
    }
    data['comments'] = this.comments;
    data['image'] = this.image;
    return data;
  }
}

class BxMallSubDto {
  String comments;
  int mallSubId;
  String mallSubName;
  int mallCategoryId;

  BxMallSubDto(
      {this.comments, this.mallSubId, this.mallSubName, this.mallCategoryId});

  BxMallSubDto.fromJson(Map<String, dynamic> json) {
    comments = json['comments'];
    mallSubId = json['mallSubId'];
    mallSubName = json['mallSubName'];
    mallCategoryId = json['mallCategoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comments'] = this.comments;
    data['mallSubId'] = this.mallSubId;
    data['mallSubName'] = this.mallSubName;
    data['mallCategoryId'] = this.mallCategoryId;
    return data;
  }
}
