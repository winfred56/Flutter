import '../../../../core/user/domain/entities/user.dart';
import '../../../../shared/usecase/usecase.dart';
import '../../domain/use_cases/retrieve_profile.dart';

class ProfileBloc{
  /// Constructor
  ProfileBloc({
    required this.profile
});

  final RetrieveProfile profile;

  Future<User>retrieveProfile(String documentID)async {
    final result = await profile(StringParams(documentID));
    return result.fold((failure) => User.initial(), (user) => user);
  }
}