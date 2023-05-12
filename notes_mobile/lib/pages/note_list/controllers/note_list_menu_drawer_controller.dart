import 'package:notes_mobile/data/repositories/auth_repository.dart';

class NoteListMenuDrawerController {
  final _authRepository = AuthRepository();
  Future<void> logout() async {
    await _authRepository.logout();
  }
}
