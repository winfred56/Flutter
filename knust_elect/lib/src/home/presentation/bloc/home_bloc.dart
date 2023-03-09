import 'package:knust_elect/core/student/domain/entities/student.dart';

import '../../../../core/student/domain/use_cases/authenticated.dart';
import '../../../../core/student/domain/use_cases/logout.dart';
import '../../../../core/student/domain/use_cases/verification.dart';
import '../../../../shared/usecase/usecase.dart';

class HomeBloc {
  /// Constructor
  const HomeBloc(
      {required this.authenticatedUser,
      required this.logoutUser,
      required this.verification});

  final AuthenticatedStudent authenticatedUser;
  final LogoutStudent logoutUser;
  final Verification verification;

  /// Get an authenticated user account
  Future<Student> getAuthenticatedUser() async {
    final result = await authenticatedUser(NoParams());
    return result.fold((failure) => Student.initial(), (student) => student);
  }

  /// Logs out a user
  Future<String?> logOUt() async {
    final result = await logoutUser(NoParams());
    return result.fold((failure) => failure.toString(), (user) => null);
  }

  /// Verify [User] email address
  Future<String?> verifyEmail() async {
    final result = await verification(NoParams());
    return result.fold((failure) => failure.message, (success) => null);
  }
}
