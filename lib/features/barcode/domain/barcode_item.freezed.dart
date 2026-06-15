// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barcode_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BarcodeItem {

 Product get product; int get quantity;
/// Create a copy of BarcodeItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BarcodeItemCopyWith<BarcodeItem> get copyWith => _$BarcodeItemCopyWithImpl<BarcodeItem>(this as BarcodeItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BarcodeItem&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity);

@override
String toString() {
  return 'BarcodeItem(product: $product, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $BarcodeItemCopyWith<$Res>  {
  factory $BarcodeItemCopyWith(BarcodeItem value, $Res Function(BarcodeItem) _then) = _$BarcodeItemCopyWithImpl;
@useResult
$Res call({
 Product product, int quantity
});




}
/// @nodoc
class _$BarcodeItemCopyWithImpl<$Res>
    implements $BarcodeItemCopyWith<$Res> {
  _$BarcodeItemCopyWithImpl(this._self, this._then);

  final BarcodeItem _self;
  final $Res Function(BarcodeItem) _then;

/// Create a copy of BarcodeItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BarcodeItem].
extension BarcodeItemPatterns on BarcodeItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BarcodeItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BarcodeItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BarcodeItem value)  $default,){
final _that = this;
switch (_that) {
case _BarcodeItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BarcodeItem value)?  $default,){
final _that = this;
switch (_that) {
case _BarcodeItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Product product,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BarcodeItem() when $default != null:
return $default(_that.product,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Product product,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _BarcodeItem():
return $default(_that.product,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Product product,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _BarcodeItem() when $default != null:
return $default(_that.product,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc


class _BarcodeItem implements BarcodeItem {
  const _BarcodeItem({required this.product, this.quantity = 1});
  

@override final  Product product;
@override@JsonKey() final  int quantity;

/// Create a copy of BarcodeItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BarcodeItemCopyWith<_BarcodeItem> get copyWith => __$BarcodeItemCopyWithImpl<_BarcodeItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BarcodeItem&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity);

@override
String toString() {
  return 'BarcodeItem(product: $product, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$BarcodeItemCopyWith<$Res> implements $BarcodeItemCopyWith<$Res> {
  factory _$BarcodeItemCopyWith(_BarcodeItem value, $Res Function(_BarcodeItem) _then) = __$BarcodeItemCopyWithImpl;
@override @useResult
$Res call({
 Product product, int quantity
});




}
/// @nodoc
class __$BarcodeItemCopyWithImpl<$Res>
    implements _$BarcodeItemCopyWith<$Res> {
  __$BarcodeItemCopyWithImpl(this._self, this._then);

  final _BarcodeItem _self;
  final $Res Function(_BarcodeItem) _then;

/// Create a copy of BarcodeItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = null,Object? quantity = null,}) {
  return _then(_BarcodeItem(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
