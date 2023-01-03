import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user.dart';

/// Access user data stored locally
abstract class UserLocalDatabase {
  /// returns a user model
  Future<User> retrieve();

  /// Saves a user model
  Future<void> save(User user);

  /// Retrieves the user authentication state
  Future<bool> authenticationStatus();

  Future<void> delete(User user);
}


class UserLocalDatabaseImpl implements UserLocalDatabase{
  final SharedPreferences sharedPreferences;
  UserLocalDatabaseImpl({required this.sharedPreferences});

  @override
  Future<bool> authenticationStatus() {
    // TODO: implement authenticationStatus
    throw UnimplementedError();
  }

  @override
  Future<User> retrieve() async {
    SharedPreferences getUser = await SharedPreferences.getInstance();
    final result = getUser.getString('user');
    return User.fromJson(jsonDecode(result!));
  }

  @override
  Future<void> save(User user) async {
    SharedPreferences results = await SharedPreferences.getInstance();
    results.setString('user', jsonEncode(user.toJson()));
  }

  @override
  Future<void> delete(User user) async {
    SharedPreferences results = await SharedPreferences.getInstance();
    await results.remove('user');
  }
  
}