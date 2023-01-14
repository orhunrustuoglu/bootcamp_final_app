import 'package:bootcamp_final_app/data/entitiy/cart_meal.dart';
import 'package:bootcamp_final_app/data/repo/my_cart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealDetailsPageCubit extends Cubit<void> {
  MealDetailsPageCubit() : super(0);

  var cMRepo = MyCartRepository();

  Future<void> addToCart(CartMeal cartMeal) async {
    await cMRepo.addToCart(cartMeal);
  }
}
