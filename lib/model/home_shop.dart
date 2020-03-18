
import 'dart:convert' show json;

class HomeShopModel {
  String status;
  HomeShopData data;
  HomeShopModel({
    this.status,
    this.data,
  });

  static HomeShopModel fromJson(jsonRes)=>jsonRes == null? null:HomeShopModel(
    status : jsonRes['status'],
    data : HomeShopData.fromJson(jsonRes['data']),);
}

class HomeShopData {

  List<HomeShopSlides> slides;
  List<HomeShopCategory> category;
  String adPicUrl;
  ShopInfo shopInfo;
  List<Recommend> recommend;
  Floor1Pic floor1Pic;
  Floor1 floor1;

    HomeShopData({
      this.slides,
      this.category,
      this.adPicUrl,
      this.shopInfo,
      this.recommend,
      this.floor1Pic,
      this.floor1,
    });

  static HomeShopData fromJson(jsonRes){ if(jsonRes == null) return null;


    List<HomeShopSlides> slides = jsonRes['slides'] is List ? []: null; 
    if(slides!=null) {
 for (var item in jsonRes['slides']) { if (item != null) { slides.add(HomeShopSlides.fromJson(item));  }
    }
    }


    List<HomeShopCategory> category = jsonRes['category'] is List ? []: null; 
    if(category!=null) {
 for (var item in jsonRes['category']) { if (item != null) { category.add(HomeShopCategory.fromJson(item));  }
    }
    }


    List<Recommend> recommend = jsonRes['recommend'] is List ? []: null; 
    if(recommend!=null) {
 for (var item in jsonRes['recommend']) { if (item != null) { recommend.add(Recommend.fromJson(item));  }
    }
    }
return HomeShopData(
 slides:slides,
 category:category,
    adPicUrl : jsonRes['adPicUrl'],
    shopInfo : ShopInfo.fromJson(jsonRes['shopInfo']),
 recommend:recommend,
    floor1Pic : Floor1Pic.fromJson(jsonRes['floor1Pic']),
    floor1 : Floor1.fromJson(jsonRes['floor1']),);}
}

class HomeShopSlides {

  String image;
  String goodsId;

    HomeShopSlides({
this.image,
this.goodsId,
    });

  static HomeShopSlides fromJson(jsonRes)=>jsonRes == null? null:HomeShopSlides(
    image : jsonRes['image'],
    goodsId : jsonRes['goodsId'],);

  Map<String, dynamic> toJson() => {
        'image': image,
        'goodsId': goodsId,
};
  @override
String  toString() {
    return json.encode(this);
  }
}

class HomeShopCategory {

  String mallCategroyName;
  String image;

    HomeShopCategory({
      this.mallCategroyName,
      this.image,
    });

  static HomeShopCategory fromJson(jsonRes)=>jsonRes == null? null:HomeShopCategory(
    mallCategroyName : jsonRes['mallCategroyName'],
    image : jsonRes['image'],);

  Map<String, dynamic> toJson() => {
        'mallCategroyName': mallCategroyName,
        'image': image,
};
  @override
String  toString() {
    return json.encode(this);
  }
}

class ShopInfo {

  String avatar;
  String phone;

    ShopInfo({
this.avatar,
this.phone,
    });

  static ShopInfo fromJson(jsonRes)=>jsonRes == null? null:ShopInfo(
    avatar : jsonRes['avatar'],
    phone : jsonRes['phone'],);

  Map<String, dynamic> toJson() => {
        'avatar': avatar,
        'phone': phone,
};
  @override
String  toString() {
    return json.encode(this);
  }
}

class Recommend {

  String image;
  int price;
  int old_price;

    Recommend({
this.image,
this.price,
this.old_price,
    });

  static Recommend fromJson(jsonRes)=>jsonRes == null? null:Recommend(
    image : jsonRes['image'],
    price : jsonRes['price'],
    old_price : jsonRes['old_price'],);

  Map<String, dynamic> toJson() => {
        'image': image,
        'price': price,
        'old_price': old_price,
};
  @override
String  toString() {
    return json.encode(this);
  }
}

class Floor1Pic {

  String pic;

    Floor1Pic({
this.pic,
    });

  static Floor1Pic fromJson(jsonRes)=>jsonRes == null? null:Floor1Pic(
    pic : jsonRes['pic'],);

  Map<String, dynamic> toJson() => {
        'pic': pic,
};
  @override
String  toString() {
    return json.encode(this);
  }
}

class Floor1 {

  String image3;
  String image1;
  String image4;
  String image2;
  String image0;

    Floor1({
this.image3,
this.image1,
this.image4,
this.image2,
this.image0,
    });

  static Floor1 fromJson(jsonRes)=>jsonRes == null? null:Floor1(
    image3 : jsonRes['image3'],
    image1 : jsonRes['image1'],
    image4 : jsonRes['image4'],
    image2 : jsonRes['image2'],
    image0 : jsonRes['image0'],);

  Map<String, dynamic> toJson() => {
        'image3': image3,
        'image1': image1,
        'image4': image4,
        'image2': image2,
        'image0': image0,
};
  @override
String  toString() {
    return json.encode(this);
  }
}