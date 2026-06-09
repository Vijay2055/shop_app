// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final String id;
  final String name;
  const Category({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(id: Value(id), name: Value(name));
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Category copyWith({String? id, String? name}) =>
      Category(id: id ?? this.id, name: name ?? this.name);
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category && other.id == this.id && other.name == this.name);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    required String name,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Category> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
    'stock',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    price,
    name,
    barcode,
    stock,
    categoryId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('stock')) {
      context.handle(
        _stockMeta,
        stock.isAcceptableOrUnknown(data['stock']!, _stockMeta),
      );
    } else if (isInserting) {
      context.missing(_stockMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      )!,
      stock: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final String id;
  final double price;
  final String name;
  final String barcode;
  final int stock;
  final String categoryId;
  const Product({
    required this.id,
    required this.price,
    required this.name,
    required this.barcode,
    required this.stock,
    required this.categoryId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['price'] = Variable<double>(price);
    map['name'] = Variable<String>(name);
    map['barcode'] = Variable<String>(barcode);
    map['stock'] = Variable<int>(stock);
    map['category_id'] = Variable<String>(categoryId);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      price: Value(price),
      name: Value(name),
      barcode: Value(barcode),
      stock: Value(stock),
      categoryId: Value(categoryId),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<String>(json['id']),
      price: serializer.fromJson<double>(json['price']),
      name: serializer.fromJson<String>(json['name']),
      barcode: serializer.fromJson<String>(json['barcode']),
      stock: serializer.fromJson<int>(json['stock']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'price': serializer.toJson<double>(price),
      'name': serializer.toJson<String>(name),
      'barcode': serializer.toJson<String>(barcode),
      'stock': serializer.toJson<int>(stock),
      'categoryId': serializer.toJson<String>(categoryId),
    };
  }

  Product copyWith({
    String? id,
    double? price,
    String? name,
    String? barcode,
    int? stock,
    String? categoryId,
  }) => Product(
    id: id ?? this.id,
    price: price ?? this.price,
    name: name ?? this.name,
    barcode: barcode ?? this.barcode,
    stock: stock ?? this.stock,
    categoryId: categoryId ?? this.categoryId,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      price: data.price.present ? data.price.value : this.price,
      name: data.name.present ? data.name.value : this.name,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      stock: data.stock.present ? data.stock.value : this.stock,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('price: $price, ')
          ..write('name: $name, ')
          ..write('barcode: $barcode, ')
          ..write('stock: $stock, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, price, name, barcode, stock, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.price == this.price &&
          other.name == this.name &&
          other.barcode == this.barcode &&
          other.stock == this.stock &&
          other.categoryId == this.categoryId);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> id;
  final Value<double> price;
  final Value<String> name;
  final Value<String> barcode;
  final Value<int> stock;
  final Value<String> categoryId;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.price = const Value.absent(),
    this.name = const Value.absent(),
    this.barcode = const Value.absent(),
    this.stock = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    required double price,
    required String name,
    required String barcode,
    required int stock,
    required String categoryId,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       price = Value(price),
       name = Value(name),
       barcode = Value(barcode),
       stock = Value(stock),
       categoryId = Value(categoryId);
  static Insertable<Product> custom({
    Expression<String>? id,
    Expression<double>? price,
    Expression<String>? name,
    Expression<String>? barcode,
    Expression<int>? stock,
    Expression<String>? categoryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (price != null) 'price': price,
      if (name != null) 'name': name,
      if (barcode != null) 'barcode': barcode,
      if (stock != null) 'stock': stock,
      if (categoryId != null) 'category_id': categoryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith({
    Value<String>? id,
    Value<double>? price,
    Value<String>? name,
    Value<String>? barcode,
    Value<int>? stock,
    Value<String>? categoryId,
    Value<int>? rowid,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      price: price ?? this.price,
      name: name ?? this.name,
      barcode: barcode ?? this.barcode,
      stock: stock ?? this.stock,
      categoryId: categoryId ?? this.categoryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('price: $price, ')
          ..write('name: $name, ')
          ..write('barcode: $barcode, ')
          ..write('stock: $stock, ')
          ..write('categoryId: $categoryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UdharTableTable extends UdharTable
    with TableInfo<$UdharTableTable, UdharTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UdharTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _customerNameMeta = const VerificationMeta(
    'customerName',
  );
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
    'customer_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mobileNumberMeta = const VerificationMeta(
    'mobileNumber',
  );
  @override
  late final GeneratedColumn<String> mobileNumber = GeneratedColumn<String>(
    'mobile_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    customerName,
    mobileNumber,
    address,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'udhar_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UdharTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_name')) {
      context.handle(
        _customerNameMeta,
        customerName.isAcceptableOrUnknown(
          data['customer_name']!,
          _customerNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_customerNameMeta);
    }
    if (data.containsKey('mobile_number')) {
      context.handle(
        _mobileNumberMeta,
        mobileNumber.isAcceptableOrUnknown(
          data['mobile_number']!,
          _mobileNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mobileNumberMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UdharTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UdharTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      customerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_name'],
      )!,
      mobileNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mobile_number'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
    );
  }

  @override
  $UdharTableTable createAlias(String alias) {
    return $UdharTableTable(attachedDatabase, alias);
  }
}

class UdharTableData extends DataClass implements Insertable<UdharTableData> {
  final int id;
  final String customerName;
  final String mobileNumber;
  final String address;
  const UdharTableData({
    required this.id,
    required this.customerName,
    required this.mobileNumber,
    required this.address,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['customer_name'] = Variable<String>(customerName);
    map['mobile_number'] = Variable<String>(mobileNumber);
    map['address'] = Variable<String>(address);
    return map;
  }

  UdharTableCompanion toCompanion(bool nullToAbsent) {
    return UdharTableCompanion(
      id: Value(id),
      customerName: Value(customerName),
      mobileNumber: Value(mobileNumber),
      address: Value(address),
    );
  }

  factory UdharTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UdharTableData(
      id: serializer.fromJson<int>(json['id']),
      customerName: serializer.fromJson<String>(json['customerName']),
      mobileNumber: serializer.fromJson<String>(json['mobileNumber']),
      address: serializer.fromJson<String>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerName': serializer.toJson<String>(customerName),
      'mobileNumber': serializer.toJson<String>(mobileNumber),
      'address': serializer.toJson<String>(address),
    };
  }

  UdharTableData copyWith({
    int? id,
    String? customerName,
    String? mobileNumber,
    String? address,
  }) => UdharTableData(
    id: id ?? this.id,
    customerName: customerName ?? this.customerName,
    mobileNumber: mobileNumber ?? this.mobileNumber,
    address: address ?? this.address,
  );
  UdharTableData copyWithCompanion(UdharTableCompanion data) {
    return UdharTableData(
      id: data.id.present ? data.id.value : this.id,
      customerName: data.customerName.present
          ? data.customerName.value
          : this.customerName,
      mobileNumber: data.mobileNumber.present
          ? data.mobileNumber.value
          : this.mobileNumber,
      address: data.address.present ? data.address.value : this.address,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UdharTableData(')
          ..write('id: $id, ')
          ..write('customerName: $customerName, ')
          ..write('mobileNumber: $mobileNumber, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, customerName, mobileNumber, address);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UdharTableData &&
          other.id == this.id &&
          other.customerName == this.customerName &&
          other.mobileNumber == this.mobileNumber &&
          other.address == this.address);
}

class UdharTableCompanion extends UpdateCompanion<UdharTableData> {
  final Value<int> id;
  final Value<String> customerName;
  final Value<String> mobileNumber;
  final Value<String> address;
  const UdharTableCompanion({
    this.id = const Value.absent(),
    this.customerName = const Value.absent(),
    this.mobileNumber = const Value.absent(),
    this.address = const Value.absent(),
  });
  UdharTableCompanion.insert({
    this.id = const Value.absent(),
    required String customerName,
    required String mobileNumber,
    required String address,
  }) : customerName = Value(customerName),
       mobileNumber = Value(mobileNumber),
       address = Value(address);
  static Insertable<UdharTableData> custom({
    Expression<int>? id,
    Expression<String>? customerName,
    Expression<String>? mobileNumber,
    Expression<String>? address,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerName != null) 'customer_name': customerName,
      if (mobileNumber != null) 'mobile_number': mobileNumber,
      if (address != null) 'address': address,
    });
  }

  UdharTableCompanion copyWith({
    Value<int>? id,
    Value<String>? customerName,
    Value<String>? mobileNumber,
    Value<String>? address,
  }) {
    return UdharTableCompanion(
      id: id ?? this.id,
      customerName: customerName ?? this.customerName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      address: address ?? this.address,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (mobileNumber.present) {
      map['mobile_number'] = Variable<String>(mobileNumber.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UdharTableCompanion(')
          ..write('id: $id, ')
          ..write('customerName: $customerName, ')
          ..write('mobileNumber: $mobileNumber, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }
}

class $HistoryTableTable extends HistoryTable
    with TableInfo<$HistoryTableTable, HistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _udharIdMeta = const VerificationMeta(
    'udharId',
  );
  @override
  late final GeneratedColumn<int> udharId = GeneratedColumn<int>(
    'udhar_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES udhar_table (id)',
    ),
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
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('completed'),
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, udharId, createdAt, status, total];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'history_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<HistoryTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('udhar_id')) {
      context.handle(
        _udharIdMeta,
        udharId.isAcceptableOrUnknown(data['udhar_id']!, _udharIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoryTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      udharId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}udhar_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total'],
      )!,
    );
  }

  @override
  $HistoryTableTable createAlias(String alias) {
    return $HistoryTableTable(attachedDatabase, alias);
  }
}

class HistoryTableData extends DataClass
    implements Insertable<HistoryTableData> {
  final String id;

  /// Nullable foreign key
  final int? udharId;
  final DateTime createdAt;
  final String status;
  final double total;
  const HistoryTableData({
    required this.id,
    this.udharId,
    required this.createdAt,
    required this.status,
    required this.total,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || udharId != null) {
      map['udhar_id'] = Variable<int>(udharId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['status'] = Variable<String>(status);
    map['total'] = Variable<double>(total);
    return map;
  }

  HistoryTableCompanion toCompanion(bool nullToAbsent) {
    return HistoryTableCompanion(
      id: Value(id),
      udharId: udharId == null && nullToAbsent
          ? const Value.absent()
          : Value(udharId),
      createdAt: Value(createdAt),
      status: Value(status),
      total: Value(total),
    );
  }

  factory HistoryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoryTableData(
      id: serializer.fromJson<String>(json['id']),
      udharId: serializer.fromJson<int?>(json['udharId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      status: serializer.fromJson<String>(json['status']),
      total: serializer.fromJson<double>(json['total']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'udharId': serializer.toJson<int?>(udharId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'status': serializer.toJson<String>(status),
      'total': serializer.toJson<double>(total),
    };
  }

  HistoryTableData copyWith({
    String? id,
    Value<int?> udharId = const Value.absent(),
    DateTime? createdAt,
    String? status,
    double? total,
  }) => HistoryTableData(
    id: id ?? this.id,
    udharId: udharId.present ? udharId.value : this.udharId,
    createdAt: createdAt ?? this.createdAt,
    status: status ?? this.status,
    total: total ?? this.total,
  );
  HistoryTableData copyWithCompanion(HistoryTableCompanion data) {
    return HistoryTableData(
      id: data.id.present ? data.id.value : this.id,
      udharId: data.udharId.present ? data.udharId.value : this.udharId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      status: data.status.present ? data.status.value : this.status,
      total: data.total.present ? data.total.value : this.total,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoryTableData(')
          ..write('id: $id, ')
          ..write('udharId: $udharId, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, udharId, createdAt, status, total);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryTableData &&
          other.id == this.id &&
          other.udharId == this.udharId &&
          other.createdAt == this.createdAt &&
          other.status == this.status &&
          other.total == this.total);
}

class HistoryTableCompanion extends UpdateCompanion<HistoryTableData> {
  final Value<String> id;
  final Value<int?> udharId;
  final Value<DateTime> createdAt;
  final Value<String> status;
  final Value<double> total;
  final Value<int> rowid;
  const HistoryTableCompanion({
    this.id = const Value.absent(),
    this.udharId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.status = const Value.absent(),
    this.total = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HistoryTableCompanion.insert({
    required String id,
    this.udharId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.status = const Value.absent(),
    required double total,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       total = Value(total);
  static Insertable<HistoryTableData> custom({
    Expression<String>? id,
    Expression<int>? udharId,
    Expression<DateTime>? createdAt,
    Expression<String>? status,
    Expression<double>? total,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (udharId != null) 'udhar_id': udharId,
      if (createdAt != null) 'created_at': createdAt,
      if (status != null) 'status': status,
      if (total != null) 'total': total,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HistoryTableCompanion copyWith({
    Value<String>? id,
    Value<int?>? udharId,
    Value<DateTime>? createdAt,
    Value<String>? status,
    Value<double>? total,
    Value<int>? rowid,
  }) {
    return HistoryTableCompanion(
      id: id ?? this.id,
      udharId: udharId ?? this.udharId,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      total: total ?? this.total,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (udharId.present) {
      map['udhar_id'] = Variable<int>(udharId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('udharId: $udharId, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status, ')
          ..write('total: $total, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PurchaseItemTableTable extends PurchaseItemTable
    with TableInfo<$PurchaseItemTableTable, PurchaseItemTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseItemTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _historyIdMeta = const VerificationMeta(
    'historyId',
  );
  @override
  late final GeneratedColumn<String> historyId = GeneratedColumn<String>(
    'history_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES history_table (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productNameMeta = const VerificationMeta(
    'productName',
  );
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
    'product_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceAtPurchaseMeta = const VerificationMeta(
    'priceAtPurchase',
  );
  @override
  late final GeneratedColumn<double> priceAtPurchase = GeneratedColumn<double>(
    'price_at_purchase',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    historyId,
    productId,
    productName,
    priceAtPurchase,
    quantity,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_item_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchaseItemTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('history_id')) {
      context.handle(
        _historyIdMeta,
        historyId.isAcceptableOrUnknown(data['history_id']!, _historyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_historyIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
        _productNameMeta,
        productName.isAcceptableOrUnknown(
          data['product_name']!,
          _productNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('price_at_purchase')) {
      context.handle(
        _priceAtPurchaseMeta,
        priceAtPurchase.isAcceptableOrUnknown(
          data['price_at_purchase']!,
          _priceAtPurchaseMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_priceAtPurchaseMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseItemTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseItemTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      historyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}history_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      productName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_name'],
      )!,
      priceAtPurchase: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price_at_purchase'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
    );
  }

  @override
  $PurchaseItemTableTable createAlias(String alias) {
    return $PurchaseItemTableTable(attachedDatabase, alias);
  }
}

class PurchaseItemTableData extends DataClass
    implements Insertable<PurchaseItemTableData> {
  final int id;

  /// Which history this item belongs to
  final String historyId;
  final String productId;
  final String productName;
  final double priceAtPurchase;
  final int quantity;
  const PurchaseItemTableData({
    required this.id,
    required this.historyId,
    required this.productId,
    required this.productName,
    required this.priceAtPurchase,
    required this.quantity,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['history_id'] = Variable<String>(historyId);
    map['product_id'] = Variable<String>(productId);
    map['product_name'] = Variable<String>(productName);
    map['price_at_purchase'] = Variable<double>(priceAtPurchase);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }

  PurchaseItemTableCompanion toCompanion(bool nullToAbsent) {
    return PurchaseItemTableCompanion(
      id: Value(id),
      historyId: Value(historyId),
      productId: Value(productId),
      productName: Value(productName),
      priceAtPurchase: Value(priceAtPurchase),
      quantity: Value(quantity),
    );
  }

  factory PurchaseItemTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseItemTableData(
      id: serializer.fromJson<int>(json['id']),
      historyId: serializer.fromJson<String>(json['historyId']),
      productId: serializer.fromJson<String>(json['productId']),
      productName: serializer.fromJson<String>(json['productName']),
      priceAtPurchase: serializer.fromJson<double>(json['priceAtPurchase']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'historyId': serializer.toJson<String>(historyId),
      'productId': serializer.toJson<String>(productId),
      'productName': serializer.toJson<String>(productName),
      'priceAtPurchase': serializer.toJson<double>(priceAtPurchase),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  PurchaseItemTableData copyWith({
    int? id,
    String? historyId,
    String? productId,
    String? productName,
    double? priceAtPurchase,
    int? quantity,
  }) => PurchaseItemTableData(
    id: id ?? this.id,
    historyId: historyId ?? this.historyId,
    productId: productId ?? this.productId,
    productName: productName ?? this.productName,
    priceAtPurchase: priceAtPurchase ?? this.priceAtPurchase,
    quantity: quantity ?? this.quantity,
  );
  PurchaseItemTableData copyWithCompanion(PurchaseItemTableCompanion data) {
    return PurchaseItemTableData(
      id: data.id.present ? data.id.value : this.id,
      historyId: data.historyId.present ? data.historyId.value : this.historyId,
      productId: data.productId.present ? data.productId.value : this.productId,
      productName: data.productName.present
          ? data.productName.value
          : this.productName,
      priceAtPurchase: data.priceAtPurchase.present
          ? data.priceAtPurchase.value
          : this.priceAtPurchase,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseItemTableData(')
          ..write('id: $id, ')
          ..write('historyId: $historyId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('priceAtPurchase: $priceAtPurchase, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    historyId,
    productId,
    productName,
    priceAtPurchase,
    quantity,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseItemTableData &&
          other.id == this.id &&
          other.historyId == this.historyId &&
          other.productId == this.productId &&
          other.productName == this.productName &&
          other.priceAtPurchase == this.priceAtPurchase &&
          other.quantity == this.quantity);
}

class PurchaseItemTableCompanion
    extends UpdateCompanion<PurchaseItemTableData> {
  final Value<int> id;
  final Value<String> historyId;
  final Value<String> productId;
  final Value<String> productName;
  final Value<double> priceAtPurchase;
  final Value<int> quantity;
  const PurchaseItemTableCompanion({
    this.id = const Value.absent(),
    this.historyId = const Value.absent(),
    this.productId = const Value.absent(),
    this.productName = const Value.absent(),
    this.priceAtPurchase = const Value.absent(),
    this.quantity = const Value.absent(),
  });
  PurchaseItemTableCompanion.insert({
    this.id = const Value.absent(),
    required String historyId,
    required String productId,
    required String productName,
    required double priceAtPurchase,
    required int quantity,
  }) : historyId = Value(historyId),
       productId = Value(productId),
       productName = Value(productName),
       priceAtPurchase = Value(priceAtPurchase),
       quantity = Value(quantity);
  static Insertable<PurchaseItemTableData> custom({
    Expression<int>? id,
    Expression<String>? historyId,
    Expression<String>? productId,
    Expression<String>? productName,
    Expression<double>? priceAtPurchase,
    Expression<int>? quantity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (historyId != null) 'history_id': historyId,
      if (productId != null) 'product_id': productId,
      if (productName != null) 'product_name': productName,
      if (priceAtPurchase != null) 'price_at_purchase': priceAtPurchase,
      if (quantity != null) 'quantity': quantity,
    });
  }

  PurchaseItemTableCompanion copyWith({
    Value<int>? id,
    Value<String>? historyId,
    Value<String>? productId,
    Value<String>? productName,
    Value<double>? priceAtPurchase,
    Value<int>? quantity,
  }) {
    return PurchaseItemTableCompanion(
      id: id ?? this.id,
      historyId: historyId ?? this.historyId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      priceAtPurchase: priceAtPurchase ?? this.priceAtPurchase,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (historyId.present) {
      map['history_id'] = Variable<String>(historyId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (priceAtPurchase.present) {
      map['price_at_purchase'] = Variable<double>(priceAtPurchase.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseItemTableCompanion(')
          ..write('id: $id, ')
          ..write('historyId: $historyId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('priceAtPurchase: $priceAtPurchase, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }
}

class $CounterTableTable extends CounterTable
    with TableInfo<$CounterTableTable, CounterTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CounterTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentBillNumberMeta = const VerificationMeta(
    'currentBillNumber',
  );
  @override
  late final GeneratedColumn<String> currentBillNumber =
      GeneratedColumn<String>(
        'current_bill_number',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('BILL_001'),
      );
  @override
  List<GeneratedColumn> get $columns => [id, currentBillNumber];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'counter_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CounterTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('current_bill_number')) {
      context.handle(
        _currentBillNumberMeta,
        currentBillNumber.isAcceptableOrUnknown(
          data['current_bill_number']!,
          _currentBillNumberMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CounterTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CounterTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      currentBillNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_bill_number'],
      )!,
    );
  }

  @override
  $CounterTableTable createAlias(String alias) {
    return $CounterTableTable(attachedDatabase, alias);
  }
}

class CounterTableData extends DataClass
    implements Insertable<CounterTableData> {
  final int id;
  final String currentBillNumber;
  const CounterTableData({required this.id, required this.currentBillNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['current_bill_number'] = Variable<String>(currentBillNumber);
    return map;
  }

  CounterTableCompanion toCompanion(bool nullToAbsent) {
    return CounterTableCompanion(
      id: Value(id),
      currentBillNumber: Value(currentBillNumber),
    );
  }

  factory CounterTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CounterTableData(
      id: serializer.fromJson<int>(json['id']),
      currentBillNumber: serializer.fromJson<String>(json['currentBillNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'currentBillNumber': serializer.toJson<String>(currentBillNumber),
    };
  }

  CounterTableData copyWith({int? id, String? currentBillNumber}) =>
      CounterTableData(
        id: id ?? this.id,
        currentBillNumber: currentBillNumber ?? this.currentBillNumber,
      );
  CounterTableData copyWithCompanion(CounterTableCompanion data) {
    return CounterTableData(
      id: data.id.present ? data.id.value : this.id,
      currentBillNumber: data.currentBillNumber.present
          ? data.currentBillNumber.value
          : this.currentBillNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CounterTableData(')
          ..write('id: $id, ')
          ..write('currentBillNumber: $currentBillNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, currentBillNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CounterTableData &&
          other.id == this.id &&
          other.currentBillNumber == this.currentBillNumber);
}

class CounterTableCompanion extends UpdateCompanion<CounterTableData> {
  final Value<int> id;
  final Value<String> currentBillNumber;
  const CounterTableCompanion({
    this.id = const Value.absent(),
    this.currentBillNumber = const Value.absent(),
  });
  CounterTableCompanion.insert({
    this.id = const Value.absent(),
    this.currentBillNumber = const Value.absent(),
  });
  static Insertable<CounterTableData> custom({
    Expression<int>? id,
    Expression<String>? currentBillNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (currentBillNumber != null) 'current_bill_number': currentBillNumber,
    });
  }

  CounterTableCompanion copyWith({
    Value<int>? id,
    Value<String>? currentBillNumber,
  }) {
    return CounterTableCompanion(
      id: id ?? this.id,
      currentBillNumber: currentBillNumber ?? this.currentBillNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (currentBillNumber.present) {
      map['current_bill_number'] = Variable<String>(currentBillNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CounterTableCompanion(')
          ..write('id: $id, ')
          ..write('currentBillNumber: $currentBillNumber')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $UdharTableTable udharTable = $UdharTableTable(this);
  late final $HistoryTableTable historyTable = $HistoryTableTable(this);
  late final $PurchaseItemTableTable purchaseItemTable =
      $PurchaseItemTableTable(this);
  late final $CounterTableTable counterTable = $CounterTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categories,
    products,
    udharTable,
    historyTable,
    purchaseItemTable,
    counterTable,
  ];
}

typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      required String id,
      required String name,
      Value<int> rowid,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> rowid,
    });

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductsTable, List<Product>> _productsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.products,
    aliasName: $_aliasNameGenerator(db.categories.id, db.products.categoryId),
  );

  $$ProductsTableProcessedTableManager get productsRefs {
    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_productsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productsRefs(
    Expression<bool> Function($$ProductsTableFilterComposer f) f,
  ) {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> productsRefs<T extends Object>(
    Expression<T> Function($$ProductsTableAnnotationComposer a) f,
  ) {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, $$CategoriesTableReferences),
          Category,
          PrefetchHooks Function({bool productsRefs})
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion(id: id, name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) =>
                  CategoriesCompanion.insert(id: id, name: name, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (productsRefs) db.products],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productsRefs)
                    await $_getPrefetchedData<
                      Category,
                      $CategoriesTable,
                      Product
                    >(
                      currentTable: table,
                      referencedTable: $$CategoriesTableReferences
                          ._productsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CategoriesTableReferences(
                            db,
                            table,
                            p0,
                          ).productsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.categoryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, $$CategoriesTableReferences),
      Category,
      PrefetchHooks Function({bool productsRefs})
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      required String id,
      required double price,
      required String name,
      required String barcode,
      required int stock,
      required String categoryId,
      Value<int> rowid,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<String> id,
      Value<double> price,
      Value<String> name,
      Value<String> barcode,
      Value<int> stock,
      Value<String> categoryId,
      Value<int> rowid,
    });

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, Product> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias(
        $_aliasNameGenerator(db.products.categoryId, db.categories.id),
      );

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<String>('category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, $$ProductsTableReferences),
          Product,
          PrefetchHooks Function({bool categoryId})
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> barcode = const Value.absent(),
                Value<int> stock = const Value.absent(),
                Value<String> categoryId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                price: price,
                name: name,
                barcode: barcode,
                stock: stock,
                categoryId: categoryId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required double price,
                required String name,
                required String barcode,
                required int stock,
                required String categoryId,
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                price: price,
                name: name,
                barcode: barcode,
                stock: stock,
                categoryId: categoryId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (categoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.categoryId,
                                referencedTable: $$ProductsTableReferences
                                    ._categoryIdTable(db),
                                referencedColumn: $$ProductsTableReferences
                                    ._categoryIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, $$ProductsTableReferences),
      Product,
      PrefetchHooks Function({bool categoryId})
    >;
typedef $$UdharTableTableCreateCompanionBuilder =
    UdharTableCompanion Function({
      Value<int> id,
      required String customerName,
      required String mobileNumber,
      required String address,
    });
typedef $$UdharTableTableUpdateCompanionBuilder =
    UdharTableCompanion Function({
      Value<int> id,
      Value<String> customerName,
      Value<String> mobileNumber,
      Value<String> address,
    });

final class $$UdharTableTableReferences
    extends BaseReferences<_$AppDatabase, $UdharTableTable, UdharTableData> {
  $$UdharTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HistoryTableTable, List<HistoryTableData>>
  _historyTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.historyTable,
    aliasName: $_aliasNameGenerator(db.udharTable.id, db.historyTable.udharId),
  );

  $$HistoryTableTableProcessedTableManager get historyTableRefs {
    final manager = $$HistoryTableTableTableManager(
      $_db,
      $_db.historyTable,
    ).filter((f) => f.udharId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_historyTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UdharTableTableFilterComposer
    extends Composer<_$AppDatabase, $UdharTableTable> {
  $$UdharTableTableFilterComposer({
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

  ColumnFilters<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> historyTableRefs(
    Expression<bool> Function($$HistoryTableTableFilterComposer f) f,
  ) {
    final $$HistoryTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.historyTable,
      getReferencedColumn: (t) => t.udharId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HistoryTableTableFilterComposer(
            $db: $db,
            $table: $db.historyTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UdharTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UdharTableTable> {
  $$UdharTableTableOrderingComposer({
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

  ColumnOrderings<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UdharTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UdharTableTable> {
  $$UdharTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  Expression<T> historyTableRefs<T extends Object>(
    Expression<T> Function($$HistoryTableTableAnnotationComposer a) f,
  ) {
    final $$HistoryTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.historyTable,
      getReferencedColumn: (t) => t.udharId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HistoryTableTableAnnotationComposer(
            $db: $db,
            $table: $db.historyTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UdharTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UdharTableTable,
          UdharTableData,
          $$UdharTableTableFilterComposer,
          $$UdharTableTableOrderingComposer,
          $$UdharTableTableAnnotationComposer,
          $$UdharTableTableCreateCompanionBuilder,
          $$UdharTableTableUpdateCompanionBuilder,
          (UdharTableData, $$UdharTableTableReferences),
          UdharTableData,
          PrefetchHooks Function({bool historyTableRefs})
        > {
  $$UdharTableTableTableManager(_$AppDatabase db, $UdharTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UdharTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UdharTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UdharTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> customerName = const Value.absent(),
                Value<String> mobileNumber = const Value.absent(),
                Value<String> address = const Value.absent(),
              }) => UdharTableCompanion(
                id: id,
                customerName: customerName,
                mobileNumber: mobileNumber,
                address: address,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String customerName,
                required String mobileNumber,
                required String address,
              }) => UdharTableCompanion.insert(
                id: id,
                customerName: customerName,
                mobileNumber: mobileNumber,
                address: address,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UdharTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({historyTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (historyTableRefs) db.historyTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (historyTableRefs)
                    await $_getPrefetchedData<
                      UdharTableData,
                      $UdharTableTable,
                      HistoryTableData
                    >(
                      currentTable: table,
                      referencedTable: $$UdharTableTableReferences
                          ._historyTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UdharTableTableReferences(
                            db,
                            table,
                            p0,
                          ).historyTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.udharId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UdharTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UdharTableTable,
      UdharTableData,
      $$UdharTableTableFilterComposer,
      $$UdharTableTableOrderingComposer,
      $$UdharTableTableAnnotationComposer,
      $$UdharTableTableCreateCompanionBuilder,
      $$UdharTableTableUpdateCompanionBuilder,
      (UdharTableData, $$UdharTableTableReferences),
      UdharTableData,
      PrefetchHooks Function({bool historyTableRefs})
    >;
typedef $$HistoryTableTableCreateCompanionBuilder =
    HistoryTableCompanion Function({
      required String id,
      Value<int?> udharId,
      Value<DateTime> createdAt,
      Value<String> status,
      required double total,
      Value<int> rowid,
    });
typedef $$HistoryTableTableUpdateCompanionBuilder =
    HistoryTableCompanion Function({
      Value<String> id,
      Value<int?> udharId,
      Value<DateTime> createdAt,
      Value<String> status,
      Value<double> total,
      Value<int> rowid,
    });

final class $$HistoryTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $HistoryTableTable, HistoryTableData> {
  $$HistoryTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UdharTableTable _udharIdTable(_$AppDatabase db) =>
      db.udharTable.createAlias(
        $_aliasNameGenerator(db.historyTable.udharId, db.udharTable.id),
      );

  $$UdharTableTableProcessedTableManager? get udharId {
    final $_column = $_itemColumn<int>('udhar_id');
    if ($_column == null) return null;
    final manager = $$UdharTableTableTableManager(
      $_db,
      $_db.udharTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_udharIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $PurchaseItemTableTable,
    List<PurchaseItemTableData>
  >
  _purchaseItemTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.purchaseItemTable,
        aliasName: $_aliasNameGenerator(
          db.historyTable.id,
          db.purchaseItemTable.historyId,
        ),
      );

  $$PurchaseItemTableTableProcessedTableManager get purchaseItemTableRefs {
    final manager = $$PurchaseItemTableTableTableManager(
      $_db,
      $_db.purchaseItemTable,
    ).filter((f) => f.historyId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _purchaseItemTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $HistoryTableTable> {
  $$HistoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  $$UdharTableTableFilterComposer get udharId {
    final $$UdharTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.udharId,
      referencedTable: $db.udharTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UdharTableTableFilterComposer(
            $db: $db,
            $table: $db.udharTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> purchaseItemTableRefs(
    Expression<bool> Function($$PurchaseItemTableTableFilterComposer f) f,
  ) {
    final $$PurchaseItemTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.purchaseItemTable,
      getReferencedColumn: (t) => t.historyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseItemTableTableFilterComposer(
            $db: $db,
            $table: $db.purchaseItemTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoryTableTable> {
  $$HistoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  $$UdharTableTableOrderingComposer get udharId {
    final $$UdharTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.udharId,
      referencedTable: $db.udharTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UdharTableTableOrderingComposer(
            $db: $db,
            $table: $db.udharTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoryTableTable> {
  $$HistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  $$UdharTableTableAnnotationComposer get udharId {
    final $$UdharTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.udharId,
      referencedTable: $db.udharTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UdharTableTableAnnotationComposer(
            $db: $db,
            $table: $db.udharTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> purchaseItemTableRefs<T extends Object>(
    Expression<T> Function($$PurchaseItemTableTableAnnotationComposer a) f,
  ) {
    final $$PurchaseItemTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.purchaseItemTable,
          getReferencedColumn: (t) => t.historyId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseItemTableTableAnnotationComposer(
                $db: $db,
                $table: $db.purchaseItemTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$HistoryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HistoryTableTable,
          HistoryTableData,
          $$HistoryTableTableFilterComposer,
          $$HistoryTableTableOrderingComposer,
          $$HistoryTableTableAnnotationComposer,
          $$HistoryTableTableCreateCompanionBuilder,
          $$HistoryTableTableUpdateCompanionBuilder,
          (HistoryTableData, $$HistoryTableTableReferences),
          HistoryTableData,
          PrefetchHooks Function({bool udharId, bool purchaseItemTableRefs})
        > {
  $$HistoryTableTableTableManager(_$AppDatabase db, $HistoryTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HistoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HistoryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int?> udharId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> total = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HistoryTableCompanion(
                id: id,
                udharId: udharId,
                createdAt: createdAt,
                status: status,
                total: total,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<int?> udharId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                required double total,
                Value<int> rowid = const Value.absent(),
              }) => HistoryTableCompanion.insert(
                id: id,
                udharId: udharId,
                createdAt: createdAt,
                status: status,
                total: total,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HistoryTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({udharId = false, purchaseItemTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (purchaseItemTableRefs) db.purchaseItemTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (udharId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.udharId,
                                    referencedTable:
                                        $$HistoryTableTableReferences
                                            ._udharIdTable(db),
                                    referencedColumn:
                                        $$HistoryTableTableReferences
                                            ._udharIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (purchaseItemTableRefs)
                        await $_getPrefetchedData<
                          HistoryTableData,
                          $HistoryTableTable,
                          PurchaseItemTableData
                        >(
                          currentTable: table,
                          referencedTable: $$HistoryTableTableReferences
                              ._purchaseItemTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HistoryTableTableReferences(
                                db,
                                table,
                                p0,
                              ).purchaseItemTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.historyId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$HistoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HistoryTableTable,
      HistoryTableData,
      $$HistoryTableTableFilterComposer,
      $$HistoryTableTableOrderingComposer,
      $$HistoryTableTableAnnotationComposer,
      $$HistoryTableTableCreateCompanionBuilder,
      $$HistoryTableTableUpdateCompanionBuilder,
      (HistoryTableData, $$HistoryTableTableReferences),
      HistoryTableData,
      PrefetchHooks Function({bool udharId, bool purchaseItemTableRefs})
    >;
typedef $$PurchaseItemTableTableCreateCompanionBuilder =
    PurchaseItemTableCompanion Function({
      Value<int> id,
      required String historyId,
      required String productId,
      required String productName,
      required double priceAtPurchase,
      required int quantity,
    });
typedef $$PurchaseItemTableTableUpdateCompanionBuilder =
    PurchaseItemTableCompanion Function({
      Value<int> id,
      Value<String> historyId,
      Value<String> productId,
      Value<String> productName,
      Value<double> priceAtPurchase,
      Value<int> quantity,
    });

final class $$PurchaseItemTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PurchaseItemTableTable,
          PurchaseItemTableData
        > {
  $$PurchaseItemTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $HistoryTableTable _historyIdTable(_$AppDatabase db) =>
      db.historyTable.createAlias(
        $_aliasNameGenerator(
          db.purchaseItemTable.historyId,
          db.historyTable.id,
        ),
      );

  $$HistoryTableTableProcessedTableManager get historyId {
    final $_column = $_itemColumn<String>('history_id')!;

    final manager = $$HistoryTableTableTableManager(
      $_db,
      $_db.historyTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_historyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PurchaseItemTableTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseItemTableTable> {
  $$PurchaseItemTableTableFilterComposer({
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

  ColumnFilters<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get priceAtPurchase => $composableBuilder(
    column: $table.priceAtPurchase,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  $$HistoryTableTableFilterComposer get historyId {
    final $$HistoryTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.historyId,
      referencedTable: $db.historyTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HistoryTableTableFilterComposer(
            $db: $db,
            $table: $db.historyTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchaseItemTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseItemTableTable> {
  $$PurchaseItemTableTableOrderingComposer({
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

  ColumnOrderings<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get priceAtPurchase => $composableBuilder(
    column: $table.priceAtPurchase,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  $$HistoryTableTableOrderingComposer get historyId {
    final $$HistoryTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.historyId,
      referencedTable: $db.historyTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HistoryTableTableOrderingComposer(
            $db: $db,
            $table: $db.historyTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchaseItemTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseItemTableTable> {
  $$PurchaseItemTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get priceAtPurchase => $composableBuilder(
    column: $table.priceAtPurchase,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  $$HistoryTableTableAnnotationComposer get historyId {
    final $$HistoryTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.historyId,
      referencedTable: $db.historyTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HistoryTableTableAnnotationComposer(
            $db: $db,
            $table: $db.historyTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchaseItemTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PurchaseItemTableTable,
          PurchaseItemTableData,
          $$PurchaseItemTableTableFilterComposer,
          $$PurchaseItemTableTableOrderingComposer,
          $$PurchaseItemTableTableAnnotationComposer,
          $$PurchaseItemTableTableCreateCompanionBuilder,
          $$PurchaseItemTableTableUpdateCompanionBuilder,
          (PurchaseItemTableData, $$PurchaseItemTableTableReferences),
          PurchaseItemTableData,
          PrefetchHooks Function({bool historyId})
        > {
  $$PurchaseItemTableTableTableManager(
    _$AppDatabase db,
    $PurchaseItemTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseItemTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseItemTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseItemTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> historyId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<String> productName = const Value.absent(),
                Value<double> priceAtPurchase = const Value.absent(),
                Value<int> quantity = const Value.absent(),
              }) => PurchaseItemTableCompanion(
                id: id,
                historyId: historyId,
                productId: productId,
                productName: productName,
                priceAtPurchase: priceAtPurchase,
                quantity: quantity,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String historyId,
                required String productId,
                required String productName,
                required double priceAtPurchase,
                required int quantity,
              }) => PurchaseItemTableCompanion.insert(
                id: id,
                historyId: historyId,
                productId: productId,
                productName: productName,
                priceAtPurchase: priceAtPurchase,
                quantity: quantity,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PurchaseItemTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({historyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (historyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.historyId,
                                referencedTable:
                                    $$PurchaseItemTableTableReferences
                                        ._historyIdTable(db),
                                referencedColumn:
                                    $$PurchaseItemTableTableReferences
                                        ._historyIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PurchaseItemTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PurchaseItemTableTable,
      PurchaseItemTableData,
      $$PurchaseItemTableTableFilterComposer,
      $$PurchaseItemTableTableOrderingComposer,
      $$PurchaseItemTableTableAnnotationComposer,
      $$PurchaseItemTableTableCreateCompanionBuilder,
      $$PurchaseItemTableTableUpdateCompanionBuilder,
      (PurchaseItemTableData, $$PurchaseItemTableTableReferences),
      PurchaseItemTableData,
      PrefetchHooks Function({bool historyId})
    >;
typedef $$CounterTableTableCreateCompanionBuilder =
    CounterTableCompanion Function({
      Value<int> id,
      Value<String> currentBillNumber,
    });
typedef $$CounterTableTableUpdateCompanionBuilder =
    CounterTableCompanion Function({
      Value<int> id,
      Value<String> currentBillNumber,
    });

class $$CounterTableTableFilterComposer
    extends Composer<_$AppDatabase, $CounterTableTable> {
  $$CounterTableTableFilterComposer({
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

  ColumnFilters<String> get currentBillNumber => $composableBuilder(
    column: $table.currentBillNumber,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CounterTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CounterTableTable> {
  $$CounterTableTableOrderingComposer({
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

  ColumnOrderings<String> get currentBillNumber => $composableBuilder(
    column: $table.currentBillNumber,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CounterTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CounterTableTable> {
  $$CounterTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get currentBillNumber => $composableBuilder(
    column: $table.currentBillNumber,
    builder: (column) => column,
  );
}

class $$CounterTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CounterTableTable,
          CounterTableData,
          $$CounterTableTableFilterComposer,
          $$CounterTableTableOrderingComposer,
          $$CounterTableTableAnnotationComposer,
          $$CounterTableTableCreateCompanionBuilder,
          $$CounterTableTableUpdateCompanionBuilder,
          (
            CounterTableData,
            BaseReferences<_$AppDatabase, $CounterTableTable, CounterTableData>,
          ),
          CounterTableData,
          PrefetchHooks Function()
        > {
  $$CounterTableTableTableManager(_$AppDatabase db, $CounterTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CounterTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CounterTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CounterTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> currentBillNumber = const Value.absent(),
              }) => CounterTableCompanion(
                id: id,
                currentBillNumber: currentBillNumber,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> currentBillNumber = const Value.absent(),
              }) => CounterTableCompanion.insert(
                id: id,
                currentBillNumber: currentBillNumber,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CounterTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CounterTableTable,
      CounterTableData,
      $$CounterTableTableFilterComposer,
      $$CounterTableTableOrderingComposer,
      $$CounterTableTableAnnotationComposer,
      $$CounterTableTableCreateCompanionBuilder,
      $$CounterTableTableUpdateCompanionBuilder,
      (
        CounterTableData,
        BaseReferences<_$AppDatabase, $CounterTableTable, CounterTableData>,
      ),
      CounterTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$UdharTableTableTableManager get udharTable =>
      $$UdharTableTableTableManager(_db, _db.udharTable);
  $$HistoryTableTableTableManager get historyTable =>
      $$HistoryTableTableTableManager(_db, _db.historyTable);
  $$PurchaseItemTableTableTableManager get purchaseItemTable =>
      $$PurchaseItemTableTableTableManager(_db, _db.purchaseItemTable);
  $$CounterTableTableTableManager get counterTable =>
      $$CounterTableTableTableManager(_db, _db.counterTable);
}
