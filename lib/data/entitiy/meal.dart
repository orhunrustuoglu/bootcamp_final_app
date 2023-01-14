class Meal {
  final int id, price;
  final String name, imgName;

  Meal(
      {required this.id,
      required this.name,
      required this.imgName,
      required this.price});

  factory Meal.fromJson(Map<dynamic, dynamic> json) {
    return Meal(
      id: int.parse(json["yemek_id"]),
      name: json["yemek_adi"],
      imgName: json["yemek_resim_adi"],
      price: int.parse(json["yemek_fiyat"]),
    );
  }
}
