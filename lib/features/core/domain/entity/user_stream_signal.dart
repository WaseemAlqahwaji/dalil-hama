import 'package:dalil_hama/features/user/domain/user.dart';

class UserStreamSignal {
  User? user;
  bool withPush;

  UserStreamSignal({this.user, required this.withPush});
}
