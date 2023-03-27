import 'package:sof/data/model/user_Item_detail_item_model.dart';

class UserItemModel {
  List<Items>? items;
  bool? hasMore;
  int? quotaMax;
  int? quotaRemaining;

  UserItemModel({this.items, this.hasMore, this.quotaMax, this.quotaRemaining});

  UserItemModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    hasMore = json['has_more'];
    quotaMax = json['quota_max'];
    quotaRemaining = json['quota_remaining'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['has_more'] = this.hasMore;
    data['quota_max'] = this.quotaMax;
    data['quota_remaining'] = this.quotaRemaining;
    return data;
  }
}
