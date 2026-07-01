// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_variant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductVariantModel {

 String get id;@JsonKey(name: 'product_id') String get productId; String get sku; String get barcode; String? get color; String? get size;@JsonKey(name: 'cost_price') double get costPrice;@JsonKey(name: 'selling_price') double get sellingPrice; double get mrp;@JsonKey(name: 'vat_percent') double get vatPercent;@JsonKey(name: 'discount_percent') double get discountPercent; int get stock;@JsonKey(name: 'minimum_stock') int get minimumStock;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of ProductVariantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductVariantModelCopyWith<ProductVariantModel> get copyWith => _$ProductVariantModelCopyWithImpl<ProductVariantModel>(this as ProductVariantModel, _$identity);

  /// Serializes this ProductVariantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductVariantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.mrp, mrp) || other.mrp == mrp)&&(identical(other.vatPercent, vatPercent) || other.vatPercent == vatPercent)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.minimumStock, minimumStock) || other.minimumStock == minimumStock)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,sku,barcode,color,size,costPrice,sellingPrice,mrp,vatPercent,discountPercent,stock,minimumStock,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'ProductVariantModel(id: $id, productId: $productId, sku: $sku, barcode: $barcode, color: $color, size: $size, costPrice: $costPrice, sellingPrice: $sellingPrice, mrp: $mrp, vatPercent: $vatPercent, discountPercent: $discountPercent, stock: $stock, minimumStock: $minimumStock, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProductVariantModelCopyWith<$Res>  {
  factory $ProductVariantModelCopyWith(ProductVariantModel value, $Res Function(ProductVariantModel) _then) = _$ProductVariantModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'product_id') String productId, String sku, String barcode, String? color, String? size,@JsonKey(name: 'cost_price') double costPrice,@JsonKey(name: 'selling_price') double sellingPrice, double mrp,@JsonKey(name: 'vat_percent') double vatPercent,@JsonKey(name: 'discount_percent') double discountPercent, int stock,@JsonKey(name: 'minimum_stock') int minimumStock,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ProductVariantModelCopyWithImpl<$Res>
    implements $ProductVariantModelCopyWith<$Res> {
  _$ProductVariantModelCopyWithImpl(this._self, this._then);

  final ProductVariantModel _self;
  final $Res Function(ProductVariantModel) _then;

/// Create a copy of ProductVariantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? sku = null,Object? barcode = null,Object? color = freezed,Object? size = freezed,Object? costPrice = null,Object? sellingPrice = null,Object? mrp = null,Object? vatPercent = null,Object? discountPercent = null,Object? stock = null,Object? minimumStock = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String?,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as double,mrp: null == mrp ? _self.mrp : mrp // ignore: cast_nullable_to_non_nullable
as double,vatPercent: null == vatPercent ? _self.vatPercent : vatPercent // ignore: cast_nullable_to_non_nullable
as double,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,minimumStock: null == minimumStock ? _self.minimumStock : minimumStock // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductVariantModel].
extension ProductVariantModelPatterns on ProductVariantModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductVariantModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductVariantModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductVariantModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductVariantModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductVariantModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductVariantModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'product_id')  String productId,  String sku,  String barcode,  String? color,  String? size, @JsonKey(name: 'cost_price')  double costPrice, @JsonKey(name: 'selling_price')  double sellingPrice,  double mrp, @JsonKey(name: 'vat_percent')  double vatPercent, @JsonKey(name: 'discount_percent')  double discountPercent,  int stock, @JsonKey(name: 'minimum_stock')  int minimumStock, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductVariantModel() when $default != null:
return $default(_that.id,_that.productId,_that.sku,_that.barcode,_that.color,_that.size,_that.costPrice,_that.sellingPrice,_that.mrp,_that.vatPercent,_that.discountPercent,_that.stock,_that.minimumStock,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'product_id')  String productId,  String sku,  String barcode,  String? color,  String? size, @JsonKey(name: 'cost_price')  double costPrice, @JsonKey(name: 'selling_price')  double sellingPrice,  double mrp, @JsonKey(name: 'vat_percent')  double vatPercent, @JsonKey(name: 'discount_percent')  double discountPercent,  int stock, @JsonKey(name: 'minimum_stock')  int minimumStock, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProductVariantModel():
return $default(_that.id,_that.productId,_that.sku,_that.barcode,_that.color,_that.size,_that.costPrice,_that.sellingPrice,_that.mrp,_that.vatPercent,_that.discountPercent,_that.stock,_that.minimumStock,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'product_id')  String productId,  String sku,  String barcode,  String? color,  String? size, @JsonKey(name: 'cost_price')  double costPrice, @JsonKey(name: 'selling_price')  double sellingPrice,  double mrp, @JsonKey(name: 'vat_percent')  double vatPercent, @JsonKey(name: 'discount_percent')  double discountPercent,  int stock, @JsonKey(name: 'minimum_stock')  int minimumStock, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProductVariantModel() when $default != null:
return $default(_that.id,_that.productId,_that.sku,_that.barcode,_that.color,_that.size,_that.costPrice,_that.sellingPrice,_that.mrp,_that.vatPercent,_that.discountPercent,_that.stock,_that.minimumStock,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductVariantModel implements ProductVariantModel {
  const _ProductVariantModel({required this.id, @JsonKey(name: 'product_id') required this.productId, required this.sku, required this.barcode, this.color, this.size, @JsonKey(name: 'cost_price') required this.costPrice, @JsonKey(name: 'selling_price') required this.sellingPrice, required this.mrp, @JsonKey(name: 'vat_percent') this.vatPercent = 0, @JsonKey(name: 'discount_percent') this.discountPercent = 0, this.stock = 0, @JsonKey(name: 'minimum_stock') this.minimumStock = 5, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _ProductVariantModel.fromJson(Map<String, dynamic> json) => _$ProductVariantModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'product_id') final  String productId;
@override final  String sku;
@override final  String barcode;
@override final  String? color;
@override final  String? size;
@override@JsonKey(name: 'cost_price') final  double costPrice;
@override@JsonKey(name: 'selling_price') final  double sellingPrice;
@override final  double mrp;
@override@JsonKey(name: 'vat_percent') final  double vatPercent;
@override@JsonKey(name: 'discount_percent') final  double discountPercent;
@override@JsonKey() final  int stock;
@override@JsonKey(name: 'minimum_stock') final  int minimumStock;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of ProductVariantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductVariantModelCopyWith<_ProductVariantModel> get copyWith => __$ProductVariantModelCopyWithImpl<_ProductVariantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductVariantModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductVariantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.mrp, mrp) || other.mrp == mrp)&&(identical(other.vatPercent, vatPercent) || other.vatPercent == vatPercent)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.minimumStock, minimumStock) || other.minimumStock == minimumStock)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,sku,barcode,color,size,costPrice,sellingPrice,mrp,vatPercent,discountPercent,stock,minimumStock,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'ProductVariantModel(id: $id, productId: $productId, sku: $sku, barcode: $barcode, color: $color, size: $size, costPrice: $costPrice, sellingPrice: $sellingPrice, mrp: $mrp, vatPercent: $vatPercent, discountPercent: $discountPercent, stock: $stock, minimumStock: $minimumStock, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProductVariantModelCopyWith<$Res> implements $ProductVariantModelCopyWith<$Res> {
  factory _$ProductVariantModelCopyWith(_ProductVariantModel value, $Res Function(_ProductVariantModel) _then) = __$ProductVariantModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'product_id') String productId, String sku, String barcode, String? color, String? size,@JsonKey(name: 'cost_price') double costPrice,@JsonKey(name: 'selling_price') double sellingPrice, double mrp,@JsonKey(name: 'vat_percent') double vatPercent,@JsonKey(name: 'discount_percent') double discountPercent, int stock,@JsonKey(name: 'minimum_stock') int minimumStock,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$ProductVariantModelCopyWithImpl<$Res>
    implements _$ProductVariantModelCopyWith<$Res> {
  __$ProductVariantModelCopyWithImpl(this._self, this._then);

  final _ProductVariantModel _self;
  final $Res Function(_ProductVariantModel) _then;

/// Create a copy of ProductVariantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? sku = null,Object? barcode = null,Object? color = freezed,Object? size = freezed,Object? costPrice = null,Object? sellingPrice = null,Object? mrp = null,Object? vatPercent = null,Object? discountPercent = null,Object? stock = null,Object? minimumStock = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ProductVariantModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String?,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as double,mrp: null == mrp ? _self.mrp : mrp // ignore: cast_nullable_to_non_nullable
as double,vatPercent: null == vatPercent ? _self.vatPercent : vatPercent // ignore: cast_nullable_to_non_nullable
as double,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,minimumStock: null == minimumStock ? _self.minimumStock : minimumStock // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
