import 'package:cinemax/core/helpers/database_helper.dart';
import 'package:cinemax/core/widgets/custom_snackbar.dart';
import 'package:cinemax/features/auth/data/models/register_request_model.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/routing/routes.dart';

class RegisterRepo{
  static Future<List<Map<String, dynamic>>> getUsersByEmail(String email) async {
    final db = await DatabaseHelper().db;
    final result= await db!.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result;
  }

  static Future<void> register(RegisterRequestModel registerInputDataModel,context,) async {
    await DatabaseHelper().insert(
       values: registerInputDataModel.toJson(), table: 'users'
    ).then((value){
      customSnackBar(context,'Success Register');
      Navigator.pushNamedAndRemoveUntil(context, Routes.layoutView,(route) => false);
    }).catchError((error){
      customSnackBar(context, 'Failed to register,please try again');
    });
  }
}