import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:posts/services/auth_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepoImpl authRepo;
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    var result = await authRepo.loginUser(email: email, password: password);
    result.fold((l) {
      emit(AuthFailure(errMessage: l.errMessage));
    }, (r) {
      emit(AuthSuccess());
    });
  }

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(AuthLoading());
    var result = await authRepo.registerUser(email: email, password: password);
    result.fold((l) {
      emit(AuthFailure(errMessage: l.errMessage));
    }, (r) {
      emit(AuthSuccess());
    });
  }

  Future<void> signOutUser() async {
    emit(AuthLoading());
    var result = await authRepo.signOutUser();
    result.fold((l) {
      emit(AuthFailure(errMessage: l.errMessage));
    }, (r) {
      emit(AuthSuccess());
    });
  }
}
