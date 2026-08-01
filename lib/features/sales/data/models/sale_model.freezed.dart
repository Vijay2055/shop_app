// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SaleModel {

 String get id; String get invoiceNumber; String? get customerId; String get saleType; String get status; double get subtotal; double get discountAmount; double get vatAmount; double get grandTotal; double get paidAmount; double get dueAmount; String get paymentStatus; String? get note; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleModelCopyWith<SaleModel> get copyWith => _$SaleModelCopyWithImpl<SaleModel>(this as SaleModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.saleType, saleType) || other.saleType == saleType)&&(identical(other.status, status) || other.status == status)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.vatAmount, vatAmount) || other.vatAmount == vatAmount)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.dueAmount, dueAmount) || other.dueAmount == dueAmount)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,customerId,saleType,status,subtotal,discountAmount,vatAmount,grandTotal,paidAmount,dueAmount,paymentStatus,note,createdAt,updatedAt);

@override
String toString() {
  return 'SaleModel(id: $id, invoiceNumber: $invoiceNumber, customerId: $customerId, saleType: $saleType, status: $status, subtotal: $subtotal, discountAmount: $discountAmount, vatAmount: $vatAmount, grandTotal: $grandTotal, paidAmount: $paidAmount, dueAmount: $dueAmount, paymentStatus: $paymentStatus, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SaleModelCopyWith<$Res>  {
  factory $SaleModelCopyWith(SaleModel value, $Res Function(SaleModel) _then) = _$SaleModelCopyWithImpl;
@useResult
$Res call({
 String id, String invoiceNumber, String? customerId, String saleType, String status, double subtotal, double discountAmount, double vatAmount, double grandTotal, double paidAmount, double dueAmount, String paymentStatus, String? note, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$SaleModelCopyWithImpl<$Res>
    implements $SaleModelCopyWith<$Res> {
  _$SaleModelCopyWithImpl(this._self, this._then);

  final SaleModel _self;
  final $Res Function(SaleModel) _then;

/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? invoiceNumber = null,Object? customerId = freezed,Object? saleType = null,Object? status = null,Object? subtotal = null,Object? discountAmount = null,Object? vatAmount = null,Object? grandTotal = null,Object? paidAmount = null,Object? dueAmount = null,Object? paymentStatus = null,Object? note = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,saleType: null == saleType ? _self.saleType : saleType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,vatAmount: null == vatAmount ? _self.vatAmount : vatAmount // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,dueAmount: null == dueAmount ? _self.dueAmount : dueAmount // ignore: cast_nullable_to_non_nullable
as double,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleModel].
extension SaleModelPatterns on SaleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleModel value)  $default,){
final _that = this;
switch (_that) {
case _SaleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleModel value)?  $default,){
final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String invoiceNumber,  String? customerId,  String saleType,  String status,  double subtotal,  double discountAmount,  double vatAmount,  double grandTotal,  double paidAmount,  double dueAmount,  String paymentStatus,  String? note,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.customerId,_that.saleType,_that.status,_that.subtotal,_that.discountAmount,_that.vatAmount,_that.grandTotal,_that.paidAmount,_that.dueAmount,_that.paymentStatus,_that.note,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String invoiceNumber,  String? customerId,  String saleType,  String status,  double subtotal,  double discountAmount,  double vatAmount,  double grandTotal,  double paidAmount,  double dueAmount,  String paymentStatus,  String? note,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SaleModel():
return $default(_that.id,_that.invoiceNumber,_that.customerId,_that.saleType,_that.status,_that.subtotal,_that.discountAmount,_that.vatAmount,_that.grandTotal,_that.paidAmount,_that.dueAmount,_that.paymentStatus,_that.note,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String invoiceNumber,  String? customerId,  String saleType,  String status,  double subtotal,  double discountAmount,  double vatAmount,  double grandTotal,  double paidAmount,  double dueAmount,  String paymentStatus,  String? note,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.customerId,_that.saleType,_that.status,_that.subtotal,_that.discountAmount,_that.vatAmount,_that.grandTotal,_that.paidAmount,_that.dueAmount,_that.paymentStatus,_that.note,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _SaleModel implements SaleModel {
  const _SaleModel({required this.id, required this.invoiceNumber, this.customerId, required this.saleType, required this.status, required this.subtotal, required this.discountAmount, required this.vatAmount, required this.grandTotal, required this.paidAmount, required this.dueAmount, required this.paymentStatus, this.note, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String invoiceNumber;
@override final  String? customerId;
@override final  String saleType;
@override final  String status;
@override final  double subtotal;
@override final  double discountAmount;
@override final  double vatAmount;
@override final  double grandTotal;
@override final  double paidAmount;
@override final  double dueAmount;
@override final  String paymentStatus;
@override final  String? note;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleModelCopyWith<_SaleModel> get copyWith => __$SaleModelCopyWithImpl<_SaleModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.saleType, saleType) || other.saleType == saleType)&&(identical(other.status, status) || other.status == status)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.vatAmount, vatAmount) || other.vatAmount == vatAmount)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.dueAmount, dueAmount) || other.dueAmount == dueAmount)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,customerId,saleType,status,subtotal,discountAmount,vatAmount,grandTotal,paidAmount,dueAmount,paymentStatus,note,createdAt,updatedAt);

@override
String toString() {
  return 'SaleModel(id: $id, invoiceNumber: $invoiceNumber, customerId: $customerId, saleType: $saleType, status: $status, subtotal: $subtotal, discountAmount: $discountAmount, vatAmount: $vatAmount, grandTotal: $grandTotal, paidAmount: $paidAmount, dueAmount: $dueAmount, paymentStatus: $paymentStatus, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SaleModelCopyWith<$Res> implements $SaleModelCopyWith<$Res> {
  factory _$SaleModelCopyWith(_SaleModel value, $Res Function(_SaleModel) _then) = __$SaleModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String invoiceNumber, String? customerId, String saleType, String status, double subtotal, double discountAmount, double vatAmount, double grandTotal, double paidAmount, double dueAmount, String paymentStatus, String? note, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$SaleModelCopyWithImpl<$Res>
    implements _$SaleModelCopyWith<$Res> {
  __$SaleModelCopyWithImpl(this._self, this._then);

  final _SaleModel _self;
  final $Res Function(_SaleModel) _then;

/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? invoiceNumber = null,Object? customerId = freezed,Object? saleType = null,Object? status = null,Object? subtotal = null,Object? discountAmount = null,Object? vatAmount = null,Object? grandTotal = null,Object? paidAmount = null,Object? dueAmount = null,Object? paymentStatus = null,Object? note = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_SaleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,saleType: null == saleType ? _self.saleType : saleType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,vatAmount: null == vatAmount ? _self.vatAmount : vatAmount // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,dueAmount: null == dueAmount ? _self.dueAmount : dueAmount // ignore: cast_nullable_to_non_nullable
as double,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
