import 'package:meta/meta.dart';

/// User id type.
typedef UserId = String;

/// {@template user}
/// The user entry model.
/// {@endtemplate}
@immutable
sealed class User with _UserPatternMatching, _UserShortcuts {
  /// {@macro user}
  const User._();

  /// {@macro user}
  @literal
  const factory User.unauthenticated({
    required bool isRegistered,
  }) = UnauthenticatedUser;

  /// {@macro user}
  const factory User.authenticated({
    required UserId id,
    String masterPassword,
    String pinCode,
  }) = AuthenticatedUser;

  /// {@macro user}
  factory User.fromJson(Map<String, Object?> json) => switch (json['id']) {
        final UserId id => AuthenticatedUser(
            id: id,
            masterPassword: (json['masterPassword'] ?? '').toString(),
            pinCode: (json['pinCode'] ?? '').toString(),
          ),
        _ => const UnauthenticatedUser(isRegistered: false),
      };

  /// The user's id.
  abstract final UserId? id;

  /// User master password.
  abstract final String masterPassword;

  /// User pin code.
  abstract final String pinCode;

  Map<String, Object?> toJson();
}

/// {@macro user}
///
/// Unauthenticated user.
class UnauthenticatedUser extends User {
  /// {@macro user}
  const UnauthenticatedUser({
    required this.isRegistered,
  }) : super._();

  /// {@macro user}
  // ignore: avoid_unused_constructor_parameters
  factory UnauthenticatedUser.fromJson(Map<String, Object?> json) =>
      const UnauthenticatedUser(isRegistered: false);

  @override
  bool get isAuthenticated => false;

  @override
  @nonVirtual
  final bool isRegistered;

  @override
  UserId? get id => null;

  @override
  String get masterPassword => '';

  @override
  String get pinCode => '';

  @override
  Map<String, Object?> toJson() => <String, Object?>{
        'type': 'user',
        'status': 'unauthenticated',
        'authenticated': false,
        'id': null,
      };

  @override
  T map<T>({
    required T Function(UnauthenticatedUser user) unauthenticated,
    required T Function(AuthenticatedUser user) authenticated,
  }) =>
      unauthenticated(this);

  @override
  User copyWith({
    UserId? id,
    String? masterPassword,
    String? pinCode,
  }) =>
      id != null && masterPassword != null
          ? AuthenticatedUser(
              id: id,
              masterPassword: masterPassword,
              pinCode: pinCode ?? '',
            )
          : UnauthenticatedUser(isRegistered: isRegistered);

  @override
  int get hashCode => -1;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is UnauthenticatedUser && id == other.id;

  @override
  String toString() => 'UnauthenticatedUser{}';
}

/// {@macro user}
final class AuthenticatedUser extends User {
  /// {@macro user}
  const AuthenticatedUser({
    required this.id,
    this.masterPassword = '',
    this.pinCode = '',
  }) : super._();

  /// {@macro user}
  factory AuthenticatedUser.fromJson(Map<String, Object?> json) {
    if (json.isEmpty) throw FormatException('Json is empty', json);
    if (json
        case <String, Object?>{
          'id': final UserId id,
          'masterPassword': final String masterPassword,
          'pinCode': final String pinCode,
        }) {
      return AuthenticatedUser(
        id: id,
        masterPassword: masterPassword,
        pinCode: pinCode,
      );
    }
    throw FormatException('Invalid json format', json);
  }

  @override
  @nonVirtual
  bool get isAuthenticated => true;

  @override
  @nonVirtual
  bool get isRegistered => true;

  @override
  @nonVirtual
  final UserId id;

  @override
  @nonVirtual
  final String masterPassword;

  @override
  @nonVirtual
  final String pinCode;

  @override
  Map<String, Object?> toJson() => <String, Object?>{
        'type': 'user',
        'status': 'authenticated',
        'authenticated': true,
        'id': id,
      };

  @override
  T map<T>({
    required T Function(UnauthenticatedUser user) unauthenticated,
    required T Function(AuthenticatedUser user) authenticated,
  }) =>
      authenticated(this);

  @override
  AuthenticatedUser copyWith({
    UserId? id,
    String? masterPassword,
    String? pinCode,
  }) =>
      AuthenticatedUser(
        id: id ?? this.id,
        masterPassword: masterPassword ?? this.masterPassword,
        pinCode: pinCode ?? this.pinCode,
      );

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AuthenticatedUser && id == other.id;

  @override
  String toString() => 'AuthenticatedUser{id: $id}';
}

mixin _UserPatternMatching {
  /// Pattern matching on [User] subclasses.
  T map<T>({
    required T Function(UnauthenticatedUser user) unauthenticated,
    required T Function(AuthenticatedUser user) authenticated,
  });

  /// Pattern matching on [User] subclasses.
  T maybeMap<T>({
    required T Function() orElse,
    T Function(UnauthenticatedUser user)? unauthenticated,
    T Function(AuthenticatedUser user)? authenticated,
  }) =>
      map<T>(
        unauthenticated: (user) => unauthenticated?.call(user) ?? orElse(),
        authenticated: (user) => authenticated?.call(user) ?? orElse(),
      );

  /// Pattern matching on [User] subclasses.
  T? mapOrNull<T>({
    T Function(UnauthenticatedUser user)? unauthenticated,
    T Function(AuthenticatedUser user)? authenticated,
  }) =>
      map<T?>(
        unauthenticated: (user) => unauthenticated?.call(user),
        authenticated: (user) => authenticated?.call(user),
      );
}

mixin _UserShortcuts on _UserPatternMatching {
  /// User is authenticated.
  bool get isAuthenticated;

  /// User is not authenticated.
  bool get isNotAuthenticated => !isAuthenticated;

  /// User is registered.
  bool get isRegistered;

  /// User is not registered.
  bool get isNotRegistered => !isRegistered;

  /// Copy with new values.
  User copyWith({
    UserId? id,
    String? masterPassword,
    String? pinCode,
  });
}
