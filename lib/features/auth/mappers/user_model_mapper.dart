import 'package:clean_todo/features/auth/data/models/user_model.dart';
import 'package:clean_todo/features/auth/domain/enitities.dart';

extension UserModelMapper on UserModel {
  User get toEntity => User(name: name, email: email, id: id, active: active);
}
