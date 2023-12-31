class ItemShopModel {
  String itemId;
  String itemName;
  int itemPrice;
  
  ItemShopModel({
    required this.itemId,
    required this.itemName,
    required this.itemPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemId': itemId,
      'itemName': itemName,
      'itemPrice': itemPrice,
    };
  }

  factory ItemShopModel.fromMap(Map<String, dynamic> map) {
    return ItemShopModel(
      itemId: map['itemId'] as String,
      itemName: map['itemName'] as String,
      itemPrice: map['itemPrice'] as int,
    );
  }
}
