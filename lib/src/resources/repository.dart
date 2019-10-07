import '../models/user_model.dart';
import 'user_provider.dart';

class Repository {
  final _userProvider = UserProvider();

  Future<bool> register(String username, String id, String password) => _userProvider.register(username, id, password);
  Future<bool> signIn(String id, String password) => _userProvider.signIn(id, password);
  Future<void> signOut() => _userProvider.signOut();

  Future<bool> isSignIn() => _userProvider.isSignedIn();
  
  Future<List<Inquiry>> fetchInquiries() => _userProvider.fetchInquiries();
}