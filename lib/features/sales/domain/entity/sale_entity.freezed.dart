// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SaleEntity {

 String get id; String get invoiceNumber; String? get customerId; SaleType get saleType; SaleStatus get status; PaymentStatus get paymentStatus; double get subtotal; double get discountAmount; double get vatAmount; double get grandTotal; double get paidAmount; double get dueAmount; String? get note; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of SaleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleEntityCopyWith<SaleEntity> get copyWith => _$SaleEntityCopyWithImpl<SaleEntity>(this as SaleEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.saleType, saleType) || other.saleType == saleType)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.vatAmount, vatAmount) || other.vatAmount == vatAmount)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.dueAmount, dueAmount) || other.dueAmount == dueAmount)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,customerId,saleType,status,paymentStatus,subtotal,discountAmount,vatAmount,grandTotal,paidAmount,dueAmount,note,createdAt,updatedAt);

@override
String toString() {
  return 'SaleEntity(id: $id, invoiceNumber: $invoiceNumber, customerId: $customerId, saleType: $saleType, status: $status, paymentStatus: $paymentStatus, subtotal: $subtotal, discountAmount: $discountAmount, vatAmount: $vatAmount, grandTotal: $grandTotal, paidAmount: $paidAmount, dueAmount: $dueAmount, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SaleEntityCopyWith<$Res>  {
  factory $SaleEntityCopyWith(SaleEntity value, $Res Function(SaleEntity) _then) = _$SaleEntityCopyWithImpl;
@useResult
$Res call({
 String id, String invoiceNumber, String? customerId, SaleType saleType, SaleStatus status, PaymentStatus paymentStatus, double subtotal, double discountAmount, double vatAmount, double grandTotal, double paidAmount, double dueAmount, String? note, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$SaleEntityCopyWithImpl<$Res>
    implements $SaleEntityCopyWith<$Res> {
  _$SaleEntityCopyWithImpl(this._self, this._then);

  final SaleEntity _self;
  final $Res Function(SaleEntity) _then;

/// Create a copy of SaleEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? invoiceNumber = null,Object? customerId = freezed,Object? saleType = null,Object? status = null,Object? paymentStatus = null,Object? subtotal = null,Object? discountAmount = null,Object? vatAmount = null,Object? grandTotal = null,Object? paidAmount = null,Object? dueAmount = null,Object? note = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,saleType: null == saleType ? _self.saleType : saleType // ignore: cast_nullable_to_non_nullable
as SaleType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SaleStatus,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,vatAmount: null == vatAmount ? _self.vatAmount : vatAmount // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,dueAmount: null == dueAmount ? _self.dueAmount : dueAmount // ignore: cast_nullable_to_non_nullable
as double,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleEntity].
extension SaleEntityPatterns on SaleEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleEntity value)  $default,){
final _that = this;
switch (_that) {
case _SaleEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SaleEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String invoiceNumber,  String? customerId,  SaleType saleType,  SaleStatus status,  PaymentStatus paymentStatus,  double subtotal,  double discountAmount,  double vatAmount,  double grandTotal,  double paidAmount,  double dueAmount,  String? note,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleEntity() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.customerId,_that.saleType,_that.status,_that.paymentStatus,_that.subtotal,_that.discountAmount,_that.vatAmount,_that.grandTotal,_that.paidAmount,_that.dueAmount,_that.note,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String invoiceNumber,  String? customerId,  SaleType saleType,  SaleStatus status,  PaymentStatus paymentStatus,  double subtotal,  double discountAmount,  double vatAmount,  double grandTotal,  double paidAmount,  double dueAmount,  String? note,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SaleEntity():
return $default(_that.id,_that.invoiceNumber,_that.customerId,_that.saleType,_that.status,_that.paymentStatus,_that.subtotal,_that.discountAmount,_that.vatAmount,_that.grandTotal,_that.paidAmount,_that.dueAmount,_that.note,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String invoiceNumber,  String? customerId,  SaleType saleType,  SaleStatus status,  PaymentStatus paymentStatus,  double subtotal,  double discountAmount,  double vatAmount,  double grandTotal,  double paidAmount,  double dueAmount,  String? note,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SaleEntity() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.customerId,_that.saleType,_that.status,_that.paymentStatus,_that.subtotal,_that.discountAmount,_that.vatAmount,_that.grandTotal,_that.paidAmount,_that.dueAmount,_that.note,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _SaleEntity implements SaleEntity {
  const _SaleEntity({required this.id, required this.invoiceNumber, this.customerId, required this.saleType, required this.status, required this.paymentStatus, required this.subtotal, this.discountAmount = 0, this.vatAmount = 0, required this.grandTotal, required this.paidAmount, this.dueAmount = 0, this.note, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String invoiceNumber;
@override final  String? customerId;
@override final  SaleType saleType;
@override final  SaleStatus status;
@override final  PaymentStatus paymentStatus;
@override final  double subtotal;
@override@JsonKey() final  double discountAmount;
@override@JsonKey() final  double vatAmount;
@override final  double grandTotal;
@override final  double paidAmount;
@override@JsonKey() final  double dueAmount;
@override final  String? note;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of SaleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleEntityCopyWith<_SaleEntity> get copyWith => __$SaleEntityCopyWithImpl<_SaleEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.saleType, saleType) || other.saleType == saleType)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.vatAmount, vatAmount) || other.vatAmount == vatAmount)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.dueAmount, dueAmount) || other.dueAmount == dueAmount)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,customerId,saleType,status,paymentStatus,subtotal,discountAmount,vatAmount,grandTotal,paidAmount,dueAmount,note,createdAt,updatedAt);

@override
String toString() {
  return 'SaleEntity(id: $id, invoiceNumber: $invoiceNumber, customerId: $customerId, saleType: $saleType, status: $status, paymentStatus: $paymentStatus, subtotal: $subtotal, discountAmount: $discountAmount, vatAmount: $vatAmount, grandTotal: $grandTotal, paidAmount: $paidAmount, dueAmount: $dueAmount, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SaleEntityCopyWith<$Res> implements $SaleEntityCopyWith<$Res> {
  factory _$SaleEntityCopyWith(_SaleEntity value, $Res Function(_SaleEntity) _then) = __$SaleEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String invoiceNumber, String? customerId, SaleType saleType, SaleStatus status, PaymentStatus paymentStatus, double subtotal, double discountAmount, double vatAmount, double grandTotal, double paidAmount, double dueAmount, String? note, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$SaleEntityCopyWithImpl<$Res>
    implements _$SaleEntityCopyWith<$Res> {
  __$SaleEntityCopyWithImpl(this._self, this._then);

  final _SaleEntity _self;
  final $Res Function(_SaleEntity) _then;

/// Create a copy of SaleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? invoiceNumber = null,Object? customerId = freezed,Object? saleType = null,Object? status = null,Object? paymentStatus = null,Object? subtotal = null,Object? discountAmount = null,Object? vatAmount = null,Object? grandTotal = null,Object? paidAmount = null,Object? dueAmount = null,Object? note = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_SaleEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,saleType: null == saleType ? _self.saleType : saleType // ignore: cast_nullable_to_non_nullable
as SaleType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SaleStatus,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,vatAmount: null == vatAmount ? _self.vatAmount : vatAmount // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,dueAmount: null == dueAmount ? _self.dueAmount : dueAmount // ignore: cast_nullable_to_non_nullable
as double,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
