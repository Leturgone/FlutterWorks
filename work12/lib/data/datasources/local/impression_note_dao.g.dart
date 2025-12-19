// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'impression_note_dao.dart';

// ignore_for_file: type=lint
class $ImpressionNotesTableTable extends ImpressionNotesTable
    with TableInfo<$ImpressionNotesTableTable, ImpressionNotesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImpressionNotesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, image, description, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'impression_notes_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ImpressionNotesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ImpressionNotesTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ImpressionNotesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ImpressionNotesTableTable createAlias(String alias) {
    return $ImpressionNotesTableTable(attachedDatabase, alias);
  }
}

class ImpressionNotesTableData extends DataClass
    implements Insertable<ImpressionNotesTableData> {
  final int id;
  final String image;
  final String description;
  final DateTime createdAt;
  const ImpressionNotesTableData({
    required this.id,
    required this.image,
    required this.description,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['image'] = Variable<String>(image);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ImpressionNotesTableCompanion toCompanion(bool nullToAbsent) {
    return ImpressionNotesTableCompanion(
      id: Value(id),
      image: Value(image),
      description: Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory ImpressionNotesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ImpressionNotesTableData(
      id: serializer.fromJson<int>(json['id']),
      image: serializer.fromJson<String>(json['image']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'image': serializer.toJson<String>(image),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ImpressionNotesTableData copyWith({
    int? id,
    String? image,
    String? description,
    DateTime? createdAt,
  }) => ImpressionNotesTableData(
    id: id ?? this.id,
    image: image ?? this.image,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
  );
  ImpressionNotesTableData copyWithCompanion(
    ImpressionNotesTableCompanion data,
  ) {
    return ImpressionNotesTableData(
      id: data.id.present ? data.id.value : this.id,
      image: data.image.present ? data.image.value : this.image,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ImpressionNotesTableData(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, image, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImpressionNotesTableData &&
          other.id == this.id &&
          other.image == this.image &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class ImpressionNotesTableCompanion
    extends UpdateCompanion<ImpressionNotesTableData> {
  final Value<int> id;
  final Value<String> image;
  final Value<String> description;
  final Value<DateTime> createdAt;
  const ImpressionNotesTableCompanion({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ImpressionNotesTableCompanion.insert({
    this.id = const Value.absent(),
    required String image,
    required String description,
    this.createdAt = const Value.absent(),
  }) : image = Value(image),
       description = Value(description);
  static Insertable<ImpressionNotesTableData> custom({
    Expression<int>? id,
    Expression<String>? image,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ImpressionNotesTableCompanion copyWith({
    Value<int>? id,
    Value<String>? image,
    Value<String>? description,
    Value<DateTime>? createdAt,
  }) {
    return ImpressionNotesTableCompanion(
      id: id ?? this.id,
      image: image ?? this.image,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImpressionNotesTableCompanion(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$ImpressionNoteDatabase extends GeneratedDatabase {
  _$ImpressionNoteDatabase(QueryExecutor e) : super(e);
  $ImpressionNoteDatabaseManager get managers =>
      $ImpressionNoteDatabaseManager(this);
  late final $ImpressionNotesTableTable impressionNotesTable =
      $ImpressionNotesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [impressionNotesTable];
}

typedef $$ImpressionNotesTableTableCreateCompanionBuilder =
    ImpressionNotesTableCompanion Function({
      Value<int> id,
      required String image,
      required String description,
      Value<DateTime> createdAt,
    });
typedef $$ImpressionNotesTableTableUpdateCompanionBuilder =
    ImpressionNotesTableCompanion Function({
      Value<int> id,
      Value<String> image,
      Value<String> description,
      Value<DateTime> createdAt,
    });

class $$ImpressionNotesTableTableFilterComposer
    extends Composer<_$ImpressionNoteDatabase, $ImpressionNotesTableTable> {
  $$ImpressionNotesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ImpressionNotesTableTableOrderingComposer
    extends Composer<_$ImpressionNoteDatabase, $ImpressionNotesTableTable> {
  $$ImpressionNotesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ImpressionNotesTableTableAnnotationComposer
    extends Composer<_$ImpressionNoteDatabase, $ImpressionNotesTableTable> {
  $$ImpressionNotesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ImpressionNotesTableTableTableManager
    extends
        RootTableManager<
          _$ImpressionNoteDatabase,
          $ImpressionNotesTableTable,
          ImpressionNotesTableData,
          $$ImpressionNotesTableTableFilterComposer,
          $$ImpressionNotesTableTableOrderingComposer,
          $$ImpressionNotesTableTableAnnotationComposer,
          $$ImpressionNotesTableTableCreateCompanionBuilder,
          $$ImpressionNotesTableTableUpdateCompanionBuilder,
          (
            ImpressionNotesTableData,
            BaseReferences<
              _$ImpressionNoteDatabase,
              $ImpressionNotesTableTable,
              ImpressionNotesTableData
            >,
          ),
          ImpressionNotesTableData,
          PrefetchHooks Function()
        > {
  $$ImpressionNotesTableTableTableManager(
    _$ImpressionNoteDatabase db,
    $ImpressionNotesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImpressionNotesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImpressionNotesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ImpressionNotesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ImpressionNotesTableCompanion(
                id: id,
                image: image,
                description: description,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String image,
                required String description,
                Value<DateTime> createdAt = const Value.absent(),
              }) => ImpressionNotesTableCompanion.insert(
                id: id,
                image: image,
                description: description,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ImpressionNotesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ImpressionNoteDatabase,
      $ImpressionNotesTableTable,
      ImpressionNotesTableData,
      $$ImpressionNotesTableTableFilterComposer,
      $$ImpressionNotesTableTableOrderingComposer,
      $$ImpressionNotesTableTableAnnotationComposer,
      $$ImpressionNotesTableTableCreateCompanionBuilder,
      $$ImpressionNotesTableTableUpdateCompanionBuilder,
      (
        ImpressionNotesTableData,
        BaseReferences<
          _$ImpressionNoteDatabase,
          $ImpressionNotesTableTable,
          ImpressionNotesTableData
        >,
      ),
      ImpressionNotesTableData,
      PrefetchHooks Function()
    >;

class $ImpressionNoteDatabaseManager {
  final _$ImpressionNoteDatabase _db;
  $ImpressionNoteDatabaseManager(this._db);
  $$ImpressionNotesTableTableTableManager get impressionNotesTable =>
      $$ImpressionNotesTableTableTableManager(_db, _db.impressionNotesTable);
}
