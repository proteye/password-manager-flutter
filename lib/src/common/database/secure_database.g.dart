// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secure_database.dart';

// ignore_for_file: type=lint
class CredentialTbl extends Table
    with TableInfo<CredentialTbl, CredentialTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CredentialTbl(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _jsonDataMeta =
      const VerificationMeta('jsonData');
  late final GeneratedColumn<String> jsonData = GeneratedColumn<String>(
      'json_data', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL CHECK (length(json_data) > 2 AND json_valid(json_data))');
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _metaCreatedAtMeta =
      const VerificationMeta('metaCreatedAt');
  late final GeneratedColumn<int> metaCreatedAt = GeneratedColumn<int>(
      'meta_created_at', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT (strftime(\'%s\', \'now\'))',
      defaultValue: const CustomExpression('strftime(\'%s\', \'now\')'));
  static const VerificationMeta _metaUpdatedAtMeta =
      const VerificationMeta('metaUpdatedAt');
  late final GeneratedColumn<int> metaUpdatedAt = GeneratedColumn<int>(
      'meta_updated_at', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'NOT NULL DEFAULT (strftime(\'%s\', \'now\')) CHECK (meta_updated_at >= meta_created_at)',
      defaultValue: const CustomExpression('strftime(\'%s\', \'now\')'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, jsonData, version, metaCreatedAt, metaUpdatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'credential_tbl';
  @override
  VerificationContext validateIntegrity(Insertable<CredentialTblData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('json_data')) {
      context.handle(_jsonDataMeta,
          jsonData.isAcceptableOrUnknown(data['json_data']!, _jsonDataMeta));
    } else if (isInserting) {
      context.missing(_jsonDataMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('meta_created_at')) {
      context.handle(
          _metaCreatedAtMeta,
          metaCreatedAt.isAcceptableOrUnknown(
              data['meta_created_at']!, _metaCreatedAtMeta));
    }
    if (data.containsKey('meta_updated_at')) {
      context.handle(
          _metaUpdatedAtMeta,
          metaUpdatedAt.isAcceptableOrUnknown(
              data['meta_updated_at']!, _metaUpdatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CredentialTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CredentialTblData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      jsonData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}json_data'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version']),
      metaCreatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}meta_created_at'])!,
      metaUpdatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}meta_updated_at'])!,
    );
  }

  @override
  CredentialTbl createAlias(String alias) {
    return CredentialTbl(attachedDatabase, alias);
  }

  @override
  bool get isStrict => true;
  @override
  bool get dontWriteConstraints => true;
}

class CredentialTblData extends DataClass
    implements Insertable<CredentialTblData> {
  /// Unique ID
  final int id;

  /// JSON data
  final String jsonData;

  /// Credential struct version
  final int? version;

  /// Created date (unixtime in seconds)
  final int metaCreatedAt;

  /// Updated date (unixtime in seconds)
  final int metaUpdatedAt;
  const CredentialTblData(
      {required this.id,
      required this.jsonData,
      this.version,
      required this.metaCreatedAt,
      required this.metaUpdatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['json_data'] = Variable<String>(jsonData);
    if (!nullToAbsent || version != null) {
      map['version'] = Variable<int>(version);
    }
    map['meta_created_at'] = Variable<int>(metaCreatedAt);
    map['meta_updated_at'] = Variable<int>(metaUpdatedAt);
    return map;
  }

  CredentialTblCompanion toCompanion(bool nullToAbsent) {
    return CredentialTblCompanion(
      id: Value(id),
      jsonData: Value(jsonData),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
      metaCreatedAt: Value(metaCreatedAt),
      metaUpdatedAt: Value(metaUpdatedAt),
    );
  }

  factory CredentialTblData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CredentialTblData(
      id: serializer.fromJson<int>(json['id']),
      jsonData: serializer.fromJson<String>(json['json_data']),
      version: serializer.fromJson<int?>(json['version']),
      metaCreatedAt: serializer.fromJson<int>(json['meta_created_at']),
      metaUpdatedAt: serializer.fromJson<int>(json['meta_updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'json_data': serializer.toJson<String>(jsonData),
      'version': serializer.toJson<int?>(version),
      'meta_created_at': serializer.toJson<int>(metaCreatedAt),
      'meta_updated_at': serializer.toJson<int>(metaUpdatedAt),
    };
  }

  CredentialTblData copyWith(
          {int? id,
          String? jsonData,
          Value<int?> version = const Value.absent(),
          int? metaCreatedAt,
          int? metaUpdatedAt}) =>
      CredentialTblData(
        id: id ?? this.id,
        jsonData: jsonData ?? this.jsonData,
        version: version.present ? version.value : this.version,
        metaCreatedAt: metaCreatedAt ?? this.metaCreatedAt,
        metaUpdatedAt: metaUpdatedAt ?? this.metaUpdatedAt,
      );
  CredentialTblData copyWithCompanion(CredentialTblCompanion data) {
    return CredentialTblData(
      id: data.id.present ? data.id.value : this.id,
      jsonData: data.jsonData.present ? data.jsonData.value : this.jsonData,
      version: data.version.present ? data.version.value : this.version,
      metaCreatedAt: data.metaCreatedAt.present
          ? data.metaCreatedAt.value
          : this.metaCreatedAt,
      metaUpdatedAt: data.metaUpdatedAt.present
          ? data.metaUpdatedAt.value
          : this.metaUpdatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CredentialTblData(')
          ..write('id: $id, ')
          ..write('jsonData: $jsonData, ')
          ..write('version: $version, ')
          ..write('metaCreatedAt: $metaCreatedAt, ')
          ..write('metaUpdatedAt: $metaUpdatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, jsonData, version, metaCreatedAt, metaUpdatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CredentialTblData &&
          other.id == this.id &&
          other.jsonData == this.jsonData &&
          other.version == this.version &&
          other.metaCreatedAt == this.metaCreatedAt &&
          other.metaUpdatedAt == this.metaUpdatedAt);
}

class CredentialTblCompanion extends UpdateCompanion<CredentialTblData> {
  final Value<int> id;
  final Value<String> jsonData;
  final Value<int?> version;
  final Value<int> metaCreatedAt;
  final Value<int> metaUpdatedAt;
  const CredentialTblCompanion({
    this.id = const Value.absent(),
    this.jsonData = const Value.absent(),
    this.version = const Value.absent(),
    this.metaCreatedAt = const Value.absent(),
    this.metaUpdatedAt = const Value.absent(),
  });
  CredentialTblCompanion.insert({
    this.id = const Value.absent(),
    required String jsonData,
    this.version = const Value.absent(),
    this.metaCreatedAt = const Value.absent(),
    this.metaUpdatedAt = const Value.absent(),
  }) : jsonData = Value(jsonData);
  static Insertable<CredentialTblData> custom({
    Expression<int>? id,
    Expression<String>? jsonData,
    Expression<int>? version,
    Expression<int>? metaCreatedAt,
    Expression<int>? metaUpdatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (jsonData != null) 'json_data': jsonData,
      if (version != null) 'version': version,
      if (metaCreatedAt != null) 'meta_created_at': metaCreatedAt,
      if (metaUpdatedAt != null) 'meta_updated_at': metaUpdatedAt,
    });
  }

  CredentialTblCompanion copyWith(
      {Value<int>? id,
      Value<String>? jsonData,
      Value<int?>? version,
      Value<int>? metaCreatedAt,
      Value<int>? metaUpdatedAt}) {
    return CredentialTblCompanion(
      id: id ?? this.id,
      jsonData: jsonData ?? this.jsonData,
      version: version ?? this.version,
      metaCreatedAt: metaCreatedAt ?? this.metaCreatedAt,
      metaUpdatedAt: metaUpdatedAt ?? this.metaUpdatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (jsonData.present) {
      map['json_data'] = Variable<String>(jsonData.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (metaCreatedAt.present) {
      map['meta_created_at'] = Variable<int>(metaCreatedAt.value);
    }
    if (metaUpdatedAt.present) {
      map['meta_updated_at'] = Variable<int>(metaUpdatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CredentialTblCompanion(')
          ..write('id: $id, ')
          ..write('jsonData: $jsonData, ')
          ..write('version: $version, ')
          ..write('metaCreatedAt: $metaCreatedAt, ')
          ..write('metaUpdatedAt: $metaUpdatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$SecureDatabase extends GeneratedDatabase {
  _$SecureDatabase(QueryExecutor e) : super(e);
  $SecureDatabaseManager get managers => $SecureDatabaseManager(this);
  late final CredentialTbl credentialTbl = CredentialTbl(this);
  late final Trigger credentialMetaUpdatedAtTrig = Trigger(
      'CREATE TRIGGER IF NOT EXISTS credential_meta_updated_at_trig AFTER UPDATE ON credential_tbl BEGIN UPDATE credential_tbl SET meta_updated_at = strftime(\'%s\', \'now\') WHERE id = NEW.id;END',
      'credential_meta_updated_at_trig');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [credentialTbl, credentialMetaUpdatedAtTrig];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('credential_tbl',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('credential_tbl', kind: UpdateKind.update),
            ],
          ),
        ],
      );
}

typedef $CredentialTblCreateCompanionBuilder = CredentialTblCompanion Function({
  Value<int> id,
  required String jsonData,
  Value<int?> version,
  Value<int> metaCreatedAt,
  Value<int> metaUpdatedAt,
});
typedef $CredentialTblUpdateCompanionBuilder = CredentialTblCompanion Function({
  Value<int> id,
  Value<String> jsonData,
  Value<int?> version,
  Value<int> metaCreatedAt,
  Value<int> metaUpdatedAt,
});

class $CredentialTblFilterComposer
    extends Composer<_$SecureDatabase, CredentialTbl> {
  $CredentialTblFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get jsonData => $composableBuilder(
      column: $table.jsonData, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get metaCreatedAt => $composableBuilder(
      column: $table.metaCreatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get metaUpdatedAt => $composableBuilder(
      column: $table.metaUpdatedAt, builder: (column) => ColumnFilters(column));
}

class $CredentialTblOrderingComposer
    extends Composer<_$SecureDatabase, CredentialTbl> {
  $CredentialTblOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get jsonData => $composableBuilder(
      column: $table.jsonData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get metaCreatedAt => $composableBuilder(
      column: $table.metaCreatedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get metaUpdatedAt => $composableBuilder(
      column: $table.metaUpdatedAt,
      builder: (column) => ColumnOrderings(column));
}

class $CredentialTblAnnotationComposer
    extends Composer<_$SecureDatabase, CredentialTbl> {
  $CredentialTblAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get jsonData =>
      $composableBuilder(column: $table.jsonData, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<int> get metaCreatedAt => $composableBuilder(
      column: $table.metaCreatedAt, builder: (column) => column);

  GeneratedColumn<int> get metaUpdatedAt => $composableBuilder(
      column: $table.metaUpdatedAt, builder: (column) => column);
}

class $CredentialTblTableManager extends RootTableManager<
    _$SecureDatabase,
    CredentialTbl,
    CredentialTblData,
    $CredentialTblFilterComposer,
    $CredentialTblOrderingComposer,
    $CredentialTblAnnotationComposer,
    $CredentialTblCreateCompanionBuilder,
    $CredentialTblUpdateCompanionBuilder,
    (
      CredentialTblData,
      BaseReferences<_$SecureDatabase, CredentialTbl, CredentialTblData>
    ),
    CredentialTblData,
    PrefetchHooks Function()> {
  $CredentialTblTableManager(_$SecureDatabase db, CredentialTbl table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CredentialTblFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CredentialTblOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CredentialTblAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> jsonData = const Value.absent(),
            Value<int?> version = const Value.absent(),
            Value<int> metaCreatedAt = const Value.absent(),
            Value<int> metaUpdatedAt = const Value.absent(),
          }) =>
              CredentialTblCompanion(
            id: id,
            jsonData: jsonData,
            version: version,
            metaCreatedAt: metaCreatedAt,
            metaUpdatedAt: metaUpdatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String jsonData,
            Value<int?> version = const Value.absent(),
            Value<int> metaCreatedAt = const Value.absent(),
            Value<int> metaUpdatedAt = const Value.absent(),
          }) =>
              CredentialTblCompanion.insert(
            id: id,
            jsonData: jsonData,
            version: version,
            metaCreatedAt: metaCreatedAt,
            metaUpdatedAt: metaUpdatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CredentialTblProcessedTableManager = ProcessedTableManager<
    _$SecureDatabase,
    CredentialTbl,
    CredentialTblData,
    $CredentialTblFilterComposer,
    $CredentialTblOrderingComposer,
    $CredentialTblAnnotationComposer,
    $CredentialTblCreateCompanionBuilder,
    $CredentialTblUpdateCompanionBuilder,
    (
      CredentialTblData,
      BaseReferences<_$SecureDatabase, CredentialTbl, CredentialTblData>
    ),
    CredentialTblData,
    PrefetchHooks Function()>;

class $SecureDatabaseManager {
  final _$SecureDatabase _db;
  $SecureDatabaseManager(this._db);
  $CredentialTblTableManager get credentialTbl =>
      $CredentialTblTableManager(_db, _db.credentialTbl);
}
