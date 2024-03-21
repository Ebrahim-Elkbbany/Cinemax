import 'package:cinemax/core/helpers/cache_helper.dart';
import 'package:cinemax/core/widgets/custom_snackbar.dart';
import 'package:cinemax/features/auth/data/models/register_request_model.dart';
import 'package:cinemax/features/profile/data/repo/account_editing_repo.dart';
import 'package:flutter/material.dart';

class AccountEditingProvider extends ChangeNotifier {
  var fNameController = TextEditingController();
  var sNameController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
  var emailController = TextEditingController();
  var accountFormKey = GlobalKey<FormState>();
  var passFormKey = GlobalKey<FormState>();
  bool isPassword = true;

  void isPasswordChange() {
    isPassword = !isPassword;
    notifyListeners();
  }

  Future getUserData() async {
    final userData = await AccountEditingRepo.fetchUserData();
    fNameController.text = userData.firstName;
    sNameController.text = userData.lastName;
    emailController.text = userData.email;
    notifyListeners();
  }

  Future updateUserData(context) async {
    CacheHelper.saveData(key:'token', value: emailController.text);
    await AccountEditingRepo.updateUserData(
      firstName: fNameController.text,
      lastName: sNameController.text,
      email: emailController.text,
    );
    customSnackBar(context, 'Updated successfully');
    notifyListeners();
  }

  Future updatePasswordData(context) async {
    CacheHelper.saveData(key:'token', value: emailController.text);
    await AccountEditingRepo.updatePassword(
      confirmPassword: confirmPassController.text,
      password: passController.text
    );
    customSnackBar(context, 'Updated successfully');
    notifyListeners();
  }


}
