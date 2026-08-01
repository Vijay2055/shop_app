// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SaleItemModel {

 String get id; String get saleId; String get productId; String get variantId; String get productName; String get sku; String get barcode; String? get color; String get variant; double get costPrice; double get sellingPrice; double get mrp; double get vatPercent; double get discountPercent; int get quantity; double get lineTotal;
/// Create a copy of SaleItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleItemModelCopyWith<SaleItemModel> get copyWith => _$SaleItemModelCopyWithImpl<SaleItemModel>(this as SaleItemModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.saleId, saleId) || other.saleId == saleId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.color, color) || other.color == color)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.mrp, mrp) || other.mrp == mrp)&&(identical(other.vatPercent, vatPercent) || other.vatPercent == vatPercent)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal));
}


@override
int get hashCode => Object.hash(runtimeType,id,saleId,productId,variantId,productName,sku,barcode,color,variant,costPrice,sellingPrice,mrp,vatPercent,discountPercent,quantity,lineTotal);

@override
String toString() {
  return 'SaleItemModel(id: $id, saleId: $saleId, productId: $productId, variantId: $variantId, productName: $productName, sku: $sku, barcode: $barcode, color: $color, variant: $variant, costPrice: $costPrice, sellingPrice: $sellingPrice, mrp: $mrp, vatPercent: $vatPercent, discountPercent: $discountPercent, quantity: $quantity, lineTotal: $lineTotal)';
}


}

/// @nodoc
abstract mixin class $SaleItemModelCopyWith<$Res>  {
  factory $SaleItemModelCopyWith(SaleItemModel value, $Res Function(SaleItemModel) _then) = _$SaleItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String saleId, String productId, String variantId, String productName, String sku, String barcode, String? color, String variant, double costPrice, double sellingPrice, double mrp, double vatPercent, double discountPercent, int quantity, double lineTotal
});




}
/// @nodoc
class _$SaleItemModelCopyWithImpl<$Res>
    implements $SaleItemModelCopyWith<$Res> {
  _$SaleItemModelCopyWithImpl(this._self, this._then);

  final SaleItemModel _self;
  final $Res Function(SaleItemModel) _then;

/// Create a copy of SaleItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? saleId = null,Object? productId = null,Object? variantId = null,Object? productName = null,Object? sku = null,Object? barcode = null,Object? color = freezed,Object? variant = null,Object? costPrice = null,Object? sellingPrice = null,Object? mrp = null,Object? vatPercent = null,Object? discountPercent = null,Object? quantity = null,Object? lineTotal = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,saleId: null == saleId ? _self.saleId : saleId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as double,mrp: null == mrp ? _self.mrp : mrp // ignore: cast_nullable_to_non_nullable
as double,vatPercent: null == vatPercent ? _self.vatPercent : vatPercent // ignore: cast_nullable_to_non_nullable
as double,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleItemModel].
extension SaleItemModelPatterns on SaleItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleItemModel value)  $default,){
final _that = this;
switch (_that) {
case _SaleItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _SaleItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String saleId,  String productId,  String variantId,  String productName,  String sku,  String barcode,  String? color,  String variant,  double costPrice,  double sellingPrice,  double mrp,  double vatPercent,  double discountPercent,  int quantity,  double lineTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleItemModel() when $default != null:
return $default(_that.id,_that.saleId,_that.productId,_that.variantId,_that.productName,_that.sku,_that.barcode,_that.color,_that.variant,_that.costPrice,_that.sellingPrice,_that.mrp,_that.vatPercent,_that.discountPercent,_that.quantity,_that.lineTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String saleId,  String productId,  String variantId,  String productName,  String sku,  String barcode,  String? color,  String variant,  double costPrice,  double sellingPrice,  double mrp,  double vatPercent,  double discountPercent,  int quantity,  double lineTotal)  $default,) {final _that = this;
switch (_that) {
case _SaleItemModel():
return $default(_that.id,_that.saleId,_that.productId,_that.variantId,_that.productName,_that.sku,_that.barcode,_that.color,_that.variant,_that.costPrice,_that.sellingPrice,_that.mrp,_that.vatPercent,_that.discountPercent,_that.quantity,_that.lineTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String saleId,  String productId,  String variantId,  String productName,  String sku,  String barcode,  String? color,  String variant,  double costPrice,  double sellingPrice,  double mrp,  double vatPercent,  double discountPercent,  int quantity,  double lineTotal)?  $default,) {final _that = this;
switch (_that) {
case _SaleItemModel() when $default != null:
return $default(_that.id,_that.saleId,_that.productId,_that.variantId,_that.productName,_that.sku,_that.barcode,_that.color,_that.variant,_that.costPrice,_that.sellingPrice,_that.mrp,_that.vatPercent,_that.discountPercent,_that.quantity,_that.lineTotal);case _:
  return null;

}
}

}

/// @nodoc


class _SaleItemModel implements SaleItemModel {
  const _SaleItemModel({required this.id, required this.saleId, required this.productId, required this.variantId, required this.productName, required this.sku, required this.barcode, this.color, required this.variant, required this.costPrice, required this.sellingPrice, required this.mrp, required this.vatPercent, required this.discountPercent, required this.quantity, required this.lineTotal});
  

@override final  String id;
@override final  String saleId;
@override final  String productId;
@override final  String variantId;
@override final  String productName;
@override final  String sku;
@override final  String barcode;
@override final  String? color;
@override final  String variant;
@override final  double costPrice;
@override final  double sellingPrice;
@override final  double mrp;
@override final  double vatPercent;
@override final  double discountPercent;
@override final  int quantity;
@override final  double lineTotal;

/// Create a copy of SaleItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleItemModelCopyWith<_SaleItemModel> get copyWith => __$SaleItemModelCopyWithImpl<_SaleItemModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.saleId, saleId) || other.saleId == saleId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.color, color) || other.color == color)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.mrp, mrp) || other.mrp == mrp)&&(identical(other.vatPercent, vatPercent) || other.vatPercent == vatPercent)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal));
}


@override
int get hashCode => Object.hash(runtimeType,id,saleId,productId,variantId,productName,sku,barcode,color,variant,costPrice,sellingPrice,mrp,vatPercent,discountPercent,quantity,lineTotal);

@override
String toString() {
  return 'SaleItemModel(id: $id, saleId: $saleId, productId: $productId, variantId: $variantId, productName: $productName, sku: $sku, barcode: $barcode, color: $color, variant: $variant, costPrice: $costPrice, sellingPrice: $sellingPrice, mrp: $mrp, vatPercent: $vatPercent, discountPercent: $discountPercent, quantity: $quantity, lineTotal: $lineTotal)';
}


}

/// @nodoc
abstract mixin class _$SaleItemModelCopyWith<$Res> implements $SaleItemModelCopyWith<$Res> {
  factory _$SaleItemModelCopyWith(_SaleItemModel value, $Res Function(_SaleItemModel) _then) = __$SaleItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String saleId, String productId, String variantId, String productName, String sku, String barcode, String? color, String variant, double costPrice, double sellingPrice, double mrp, double vatPercent, double discountPercent, int quantity, double lineTotal
});




}
/// @nodoc
class __$SaleItemModelCopyWithImpl<$Res>
    implements _$SaleItemModelCopyWith<$Res> {
  __$SaleItemModelCopyWithImpl(this._self, this._then);

  final _SaleItemModel _self;
  final $Res Function(_SaleItemModel) _then;

/// Create a copy of SaleItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? saleId = null,Object? productId = null,Object? variantId = null,Object? productName = null,Object? sku = null,Object? barcode = null,Object? color = freezed,Object? variant = null,Object? costPrice = null,Object? sellingPrice = null,Object? mrp = null,Object? vatPercent = null,Object? discountPercent = null,Object? quantity = null,Object? lineTotal = null,}) {
  return _then(_SaleItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,saleId: null == saleId ? _self.saleId : saleId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as double,mrp: null == mrp ? _self.mrp : mrp // ignore: cast_nullable_to_non_nullable
as double,vatPercent: null == vatPercent ? _self.vatPercent : vatPercent // ignore: cast_nullable_to_non_nullable
as double,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
