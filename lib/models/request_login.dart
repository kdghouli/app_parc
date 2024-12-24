import 'dart:convert';

import 'package:collection/collection.dart';

import 'user.dart';

class RequestLogin {
  String? message;
  String? accessToken;
  String? tokenType;
  User? user;

  RequestLogin({this.message, this.accessToken, this.tokenType, this.user});

  @override
  String toString() {
    return 'RequestLogin(message: $message, accessToken: $accessToken, tokenType: $tokenType, user: $user)';
  }

  factory RequestLogin.fromMap(Map<String, dynamic> data) => RequestLogin(
        message: data['message'] as String?,
        accessToken: data['access_token'] as String?,
        tokenType: data['token_type'] as String?,
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'message': message,
        'access_token': accessToken,
        'token_type': tokenType,
        'user': user?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RequestLogin].
  factory RequestLogin.fromJson(String data) {
    return RequestLogin.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RequestLogin] to a JSON string.
  String toJson() => json.encode(toMap());

  RequestLogin copyWith({
    String? message,
    String? accessToken,
    String? tokenType,
    User? user,
  }) {
    return RequestLogin(
      message: message ?? this.message,
      accessToken: accessToken ?? this.accessToken,
      tokenType: tokenType ?? this.tokenType,
      user: user ?? this.user,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! RequestLogin) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      message.hashCode ^
      accessToken.hashCode ^
      tokenType.hashCode ^
      user.hashCode;
}
