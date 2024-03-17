import 'package:cinemax/core/api_service/constant.dart';
import 'package:cinemax/core/helpers/cache_helper.dart';
import 'package:cinemax/core/helpers/extensions.dart';
import 'package:cinemax/core/routing/routes.dart';
import 'package:cinemax/core/widgets/custom_snackbar.dart';
import 'package:cinemax/features/auth/data/models/login_reqeust_model.dart';
import 'package:cinemax/features/auth/data/repos/login_repo.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  var passController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isPassword = true;

  void isLoadingChange(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void isPasswordChange() {
    isPassword = !isPassword;
    notifyListeners();
  }

  Future<void> login(BuildContext context, context1) async {
    isLoadingChange(true);
    var message = await LoginRepo.getUserByEmailAndPassword(
      LoginRequestModel(
        email: emailController.text,
        password: passController.text,
      ),
    );
    isLoadingChange(false);
    if (message == 'Success Login') {
      await CacheHelper.saveData(
        key: 'token',
        value: emailController.text,
      );
     email = CacheHelper.getData(key: 'token');
      customSnackBar(context1, message);
      if (context.mounted) {
        context.pushNamedAndRemoveUntil(
          Routes.layoutView,
          predicate: (route) => false,
        );
      }
    } else if (message == 'Incorrect password') {
      customSnackBar(context1, message);
    } else {
      customSnackBar(context1, message);
    }
  }
}
