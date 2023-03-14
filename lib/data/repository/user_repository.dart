import 'package:firebase_auth/firebase_auth.dart';
import 'package:kardusinfo_todo/domain/repository/user_repository.dart';

class UserRepositoryImplementation implements UserRepository{
  @override
  Future<void> signInUser(String email, String password) {
    // TODO: implement signInUser
    throw UnimplementedError();
  }

  @override
  Future<void> signOutUser() {
    // TODO: implement signOutUser
    throw UnimplementedError();
  }

  @override
  Future<void> signUpUser(String email, String password) {
    // TODO: implement signUpUser
    throw UnimplementedError();
  }

  @override
  Future<User?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

}