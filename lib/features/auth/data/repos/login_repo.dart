import 'package:cinemax/core/helpers/database_helper.dart';
import 'package:cinemax/features/auth/data/models/login_reqeust_model.dart';

class LoginRepo {
  static Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final db = await DatabaseHelper().db;
    final result = await db!.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty ? result.first : null;
  }

  static Future<String> getUserByEmailAndPassword(
      LoginRequestModel loginRequestModel) async {
    final user = await getUserByEmail(loginRequestModel.email);
    if (user != null) {
      if (user['password'] == loginRequestModel.password) {
        return 'Success Login';
      }else{
        return 'Incorrect password';
      }
    }else{
      return 'Incorrect email or password';
    }

  }



}
