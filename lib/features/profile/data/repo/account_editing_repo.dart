import 'package:cinemax/core/api_service/constant.dart';
import 'package:cinemax/core/helpers/cache_helper.dart';
import 'package:cinemax/core/helpers/database_helper.dart';
import 'package:cinemax/features/auth/data/models/register_request_model.dart';

class AccountEditingRepo {
  static Future<Map<String, dynamic>> getUserByEmail() async {
    final db = await DatabaseHelper().db;
    final result = await db!.query(
      'users',
      where: 'email = ?',
      whereArgs: [CacheHelper.getData(key: 'token')],
    );
    return result.first;
  }

  static Future<RegisterRequestModel> fetchUserData() async {
    final user = await getUserByEmail();
    RegisterRequestModel registerRequestModel =
        RegisterRequestModel.fromJson(user);
    return registerRequestModel;
  }

  static Future updateUserData(RegisterRequestModel registerRequestModel) async {
    final db = await DatabaseHelper().db;
    await db?.update('users',{
      'email':registerRequestModel.email,
      'firstName' :registerRequestModel.firstName,
      'lastName': registerRequestModel.lastName,
      'password' :registerRequestModel.password,
    }, where: 'email = ?',
        whereArgs: [email]);
  }
}
