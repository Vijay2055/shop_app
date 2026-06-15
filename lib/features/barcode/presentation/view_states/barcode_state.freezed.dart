// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barcode_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BarcodeState {

 List<BarcodeItem> get items; String get searchQuery; BarcodeLayout get layout;
/// Create a copy of BarcodeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BarcodeStateCopyWith<BarcodeState> get copyWith => _$BarcodeStateCopyWithImpl<BarcodeState>(this as BarcodeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BarcodeState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.layout, layout) || other.layout == layout));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),searchQuery,layout);

@override
String toString() {
  return 'BarcodeState(items: $items, searchQuery: $searchQuery, layout: $layout)';
}


}

/// @nodoc
abstract mixin class $BarcodeStateCopyWith<$Res>  {
  factory $BarcodeStateCopyWith(BarcodeState value, $Res Function(BarcodeState) _then) = _$BarcodeStateCopyWithImpl;
@useResult
$Res call({
 List<BarcodeItem> items, String searchQuery, BarcodeLayout layout
});




}
/// @nodoc
class _$BarcodeStateCopyWithImpl<$Res>
    implements $BarcodeStateCopyWith<$Res> {
  _$BarcodeStateCopyWithImpl(this._self, this._then);

  final BarcodeState _self;
  final $Res Function(BarcodeState) _then;

/// Create a copy of BarcodeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? searchQuery = null,Object? layout = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<BarcodeItem>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,layout: null == layout ? _self.layout : layout // ignore: cast_nullable_to_non_nullable
as BarcodeLayout,
  ));
}

}


/// Adds pattern-matching-related methods to [BarcodeState].
extension BarcodeStatePatterns on BarcodeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BarcodeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BarcodeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BarcodeState value)  $default,){
final _that = this;
switch (_that) {
case _BarcodeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BarcodeState value)?  $default,){
final _that = this;
switch (_that) {
case _BarcodeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BarcodeItem> items,  String searchQuery,  BarcodeLayout layout)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BarcodeState() when $default != null:
return $default(_that.items,_that.searchQuery,_that.layout);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BarcodeItem> items,  String searchQuery,  BarcodeLayout layout)  $default,) {final _that = this;
switch (_that) {
case _BarcodeState():
return $default(_that.items,_that.searchQuery,_that.layout);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BarcodeItem> items,  String searchQuery,  BarcodeLayout layout)?  $default,) {final _that = this;
switch (_that) {
case _BarcodeState() when $default != null:
return $default(_that.items,_that.searchQuery,_that.layout);case _:
  return null;

}
}

}

/// @nodoc


class _BarcodeState implements BarcodeState {
  const _BarcodeState({final  List<BarcodeItem> items = const [], this.searchQuery = '', this.layout = BarcodeLayout.single}): _items = items;
  

 final  List<BarcodeItem> _items;
@override@JsonKey() List<BarcodeItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  BarcodeLayout layout;

/// Create a copy of BarcodeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BarcodeStateCopyWith<_BarcodeState> get copyWith => __$BarcodeStateCopyWithImpl<_BarcodeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BarcodeState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.layout, layout) || other.layout == layout));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),searchQuery,layout);

@override
String toString() {
  return 'BarcodeState(items: $items, searchQuery: $searchQuery, layout: $layout)';
}


}

/// @nodoc
abstract mixin class _$BarcodeStateCopyWith<$Res> implements $BarcodeStateCopyWith<$Res> {
  factory _$BarcodeStateCopyWith(_BarcodeState value, $Res Function(_BarcodeState) _then) = __$BarcodeStateCopyWithImpl;
@override @useResult
$Res call({
 List<BarcodeItem> items, String searchQuery, BarcodeLayout layout
});




}
/// @nodoc
class __$BarcodeStateCopyWithImpl<$Res>
    implements _$BarcodeStateCopyWith<$Res> {
  __$BarcodeStateCopyWithImpl(this._self, this._then);

  final _BarcodeState _self;
  final $Res Function(_BarcodeState) _then;

/// Create a copy of BarcodeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? searchQuery = null,Object? layout = null,}) {
  return _then(_BarcodeState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BarcodeItem>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,layout: null == layout ? _self.layout : layout // ignore: cast_nullable_to_non_nullable
as BarcodeLayout,
  ));
}


}

// dart format on
