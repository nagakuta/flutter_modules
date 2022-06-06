import 'package:auth_service/src/client.dart';
import 'package:auth_service/src/method/apple.dart';
import 'package:auth_service/src/method/facebook.dart';
import 'package:auth_service/src/method/google.dart';
import 'package:auth_service/src/method/twitter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:twitter_login/entity/auth_result.dart';

@GenerateMocks(
  <Type>[
    GoogleAuthClient,
    AccessToken,
    FacebookAuthClient,
    AppleAuthClient,
    TwitterAuthClient,
    AuthClient,
    AuthCredential,
    UserCredential,
    GoogleSignInAuthentication,
    GoogleSignInAccount,
    LoginResult,
    AuthorizationCredentialAppleID,
    AuthResult,
  ],
)
void main() {}
