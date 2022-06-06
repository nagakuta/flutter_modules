import 'package:auth_service/src/method/apple.dart';
import 'package:auth_service/src/method/facebook.dart';
import 'package:auth_service/src/method/google.dart';
import 'package:auth_service/src/method/twitter.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  <Type>[
    GoogleAuthClient,
    FacebookAuthClient,
    AppleAuthClient,
    TwitterAuthClient,
  ],
)
void main() {}
