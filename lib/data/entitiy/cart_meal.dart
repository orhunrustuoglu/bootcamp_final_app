class CartMeal {
  final int id, price, amount;
  final String name, imgName, userName;

  CartMeal(
      {required this.id,
      required this.name,
      required this.imgName,
      required this.price,
      required this.amount,
      required this.userName});

  factory CartMeal.fromJson(Map<dynamic, dynamic> json) {
    return CartMeal(
        id: int.parse(json["sepet_yemek_id"]),
        name: json["yemek_adi"],
        imgName: json["yemek_resim_adi"],
        price: int.parse(json["yemek_fiyat"]),
        amount: int.parse(json["yemek_siparis_adet"]),
        userName: json["kullanici_adi"]);
  }
}
