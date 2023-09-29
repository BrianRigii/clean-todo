import 'package:clean_todo/features/auth/data/models/user_model.dart';


extension UserModelMapper on UserModel{
  User get toEntity => User(id: id, appMetadata: appMetadata, userMetadata: userMetadata, aud: aud, createdAt: createdAt)
}