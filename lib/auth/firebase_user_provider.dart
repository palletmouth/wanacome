import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class WanacomeFirebaseUser {
  WanacomeFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

WanacomeFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<WanacomeFirebaseUser> wanacomeFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<WanacomeFirebaseUser>(
      (user) {
        currentUser = WanacomeFirebaseUser(user);
        return currentUser!;
      },
    );
