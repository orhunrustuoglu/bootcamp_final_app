import 'package:bootcamp_final_app/data/entitiy/cart_meal.dart';
import 'package:bootcamp_final_app/data/repo/my_cart_repository.dart';
import 'package:bootcamp_final_app/data/repo/snackbar_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealDetailsPageCubit extends Cubit<bool> {
  MealDetailsPageCubit() : super(false);

  var cMRepo = MyCartRepository();

  Future<void> addToCart(CartMeal cartMeal) async {
    await cMRepo.addToCart(cartMeal);
  }

  void getOrderConfirmed() {
    cMRepo.confirmCurrentOrder();
    print(cMRepo.getOrderConfirmed);
    emit(cMRepo.getOrderConfirmed);
  }

  // void showActiveOrderExistsSnackbar(BuildContext context) {
  //   SnackbarRepository.showActiveOrderExistsSnackbar(context);
  // }
}
