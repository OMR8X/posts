import 'package:dartz/dartz.dart';
import 'package:posts/helpers/errors.dart';
import 'package:posts/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> loginUser(
      {required String email, required String password});
  Future<Either<Failure, bool>> registerUser(
      {required String email, required String password});
  Future<Either<Failure, bool>> signOutUser();
}

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, bool>> loginUser(
      {required String email, required String password}) async {
    try {
      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return right(true);
    } on AuthException catch (error) {
      //
      return left(AuthError(error.message));
    } catch (e) {
      //
      return left(AuthError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> registerUser(
      {required String email, required String password}) async {
    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
      );
      return right(true);
    } on AuthException catch (error) {
      //
      return left(AuthError(error.message));
    } catch (e) {
      //
      return left(AuthError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signOutUser() async {
    try {
      await supabase.auth.signOut();
      return right(true);
    } catch (e) {
      return left(AuthError(e.toString()));
    }
  }
}
