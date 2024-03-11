import 'package:cinemax/core/api_service/constant.dart';
import 'package:cinemax/core/helpers/cache_helper.dart';
import 'package:cinemax/core/widgets/custom_snackbar.dart';
import 'package:cinemax/features/auth/data/models/register_request_model.dart';
import 'package:cinemax/features/auth/data/repos/register_repo.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  var fNameController = TextEditingController();
  var sNameController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
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

  Future<void> register(context) async {
    isLoadingChange(true);
    final existingUsers =
        await RegisterRepo.getUsersByEmail(emailController.text);
    notifyListeners();
    if (existingUsers.isNotEmpty) {
      isLoadingChange(false);
      customSnackBar(context, 'This Email already exists');
      notifyListeners();
    } else {
      isLoadingChange(true);
      await RegisterRepo.register(
          RegisterRequestModel(
            firstName: fNameController.text,
            lastName: sNameController.text,
            email: emailController.text,
            password: passController.text,
            confirmPassword: confirmPassController.text,
          ),
          context);
      await CacheHelper.saveData(
        key: 'token',
        value: emailController.text,
      );
      email = emailController.text;
      isLoadingChange(false);
      notifyListeners();
    }
  }
}
