class UserModel {
  final int id;
  final String name;
  final String email;
  final bool active;
  final String token;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.active,
      required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    try {
      return UserModel(
          id: json['id'],
          name: json['name'],
          email: json['email'],
          active: json['active'],
          token: json['token']);
    } catch (error, stack) {
      throw FormatException(
          'Invalid format format for user model $error \n $stack', json);
    }
  }
}
