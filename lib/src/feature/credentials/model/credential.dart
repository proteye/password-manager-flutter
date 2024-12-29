import 'package:json_annotation/json_annotation.dart';

part 'credential.g.dart';

@JsonSerializable()
class Credential {
  Credential({
    required this.password,
    required this.createDate,
    required this.updateDate,
    this.id,
    this.name = '',
    this.url = '',
    this.username = '',
    this.comment = '',
    this.color = '',
    this.abbr = '',
  });

  Credential.create({
    required String password,
    int? id,
    String name = '',
    String url = '',
    String username = '',
    String comment = '',
    String color = '',
    String abbr = '',
  }) : this(
          id: id,
          password: password,
          name: name,
          url: url,
          username: username,
          comment: comment,
          color: color,
          abbr: abbr,
          createDate: DateTime.now(),
          updateDate: DateTime.now(),
        );

  Credential.empty()
      : this(
          id: null,
          password: '',
          createDate: DateTime.now(),
          updateDate: DateTime.now(),
        );

  /// Connect the generated [_$CredentialFromJson] function to the `fromJson`
  /// factory.
  factory Credential.fromJson(Map<String, dynamic> json) =>
      _$CredentialFromJson(json);

  /// Unique ID.
  int? id;

  /// Name of resource.
  String name;

  /// URL of resource.
  String url;

  /// Username.
  String username;

  /// Password.
  String password;

  /// Commentary.
  String comment;

  /// User color.
  String color;

  /// Abbreviation.
  String abbr;

  /// Date of creation.
  final DateTime createDate;

  /// Date of last update.
  final DateTime updateDate;

  /// Connect the generated [_$CredentialToJson] function to the `toJson`
  /// method.
  Map<String, dynamic> toJson() => _$CredentialToJson(this);

  /// Credential model version.
  static const int version = 1;

  @override
  String toString() {
    return '''Credential(id: $id, name: $name, url: $url, username: $username, password: $password, comment: $comment, color: $color, abbr: $abbr, createDate: $createDate, updateDate: $updateDate)''';
  }
}
