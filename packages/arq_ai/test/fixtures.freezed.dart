// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fixtures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddInput implements DiagnosticableTreeMixin {

 int get a; int get b;
/// Create a copy of AddInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddInputCopyWith<AddInput> get copyWith => _$AddInputCopyWithImpl<AddInput>(this as AddInput, _$identity);

  /// Serializes this AddInput to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as AddInput;
  properties
    ..add(DiagnosticsProperty('type', 'AddInput'))
    ..add(DiagnosticsProperty('a', _this.a))..add(DiagnosticsProperty('b', _this.b));
}

@override
bool operator ==(Object other) {
  final _this = this as AddInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddInput&&(identical(other.a, _this.a) || other.a == _this.a)&&(identical(other.b, _this.b) || other.b == _this.b));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AddInput;
  return Object.hash(runtimeType,_this.a,_this.b);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as AddInput;
  return 'AddInput(a: ${_this.a}, b: ${_this.b})';
}


}

/// @nodoc
abstract mixin class $AddInputCopyWith<$Res>  {
  factory $AddInputCopyWith(AddInput value, $Res Function(AddInput) _then) = _$AddInputCopyWithImpl;
@useResult
$Res call({
 int a, int b
});




}
/// @nodoc
class _$AddInputCopyWithImpl<$Res>
    implements $AddInputCopyWith<$Res> {
  _$AddInputCopyWithImpl(this._self, this._then);

  final AddInput _self;
  final $Res Function(AddInput) _then;

/// Create a copy of AddInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? a = null,Object? b = null,}) {
  return _then(AddInput(
a: null == a ? _self.a : a // ignore: cast_nullable_to_non_nullable
as int,b: null == b ? _self.b : b // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AddInput].
extension AddInputPatterns on AddInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddInput value)  $default,){
final _that = this;
switch (_that) {
case _AddInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddInput value)?  $default,){
final _that = this;
switch (_that) {
case _AddInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int a,  int b)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddInput() when $default != null:
return $default(_that.a,_that.b);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int a,  int b)  $default,) {final _that = this;
switch (_that) {
case _AddInput():
return $default(_that.a,_that.b);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int a,  int b)?  $default,) {final _that = this;
switch (_that) {
case _AddInput() when $default != null:
return $default(_that.a,_that.b);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(createJsonSchema: true)
class _AddInput with DiagnosticableTreeMixin implements AddInput {
  const _AddInput({required this.a, required this.b});
  factory _AddInput.fromJson(Map<String, dynamic> json) => _$AddInputFromJson(json);

@override final  int a;
@override final  int b;

/// Create a copy of AddInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddInputCopyWith<_AddInput> get copyWith => __$AddInputCopyWithImpl<_AddInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddInputToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'AddInput'))
    ..add(DiagnosticsProperty('a', a))..add(DiagnosticsProperty('b', b));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddInput&&(identical(other.a, a) || other.a == a)&&(identical(other.b, b) || other.b == b));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,a,b);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'AddInput(a: $a, b: $b)';
}


}

/// @nodoc
abstract mixin class _$AddInputCopyWith<$Res> implements $AddInputCopyWith<$Res> {
  factory _$AddInputCopyWith(_AddInput value, $Res Function(_AddInput) _then) = __$AddInputCopyWithImpl;
@override @useResult
$Res call({
 int a, int b
});




}
/// @nodoc
class __$AddInputCopyWithImpl<$Res>
    implements _$AddInputCopyWith<$Res> {
  __$AddInputCopyWithImpl(this._self, this._then);

  final _AddInput _self;
  final $Res Function(_AddInput) _then;

/// Create a copy of AddInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? a = null,Object? b = null,}) {
  return _then(_AddInput(
a: null == a ? _self.a : a // ignore: cast_nullable_to_non_nullable
as int,b: null == b ? _self.b : b // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Sum implements DiagnosticableTreeMixin {

 int get sum;
/// Create a copy of Sum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SumCopyWith<Sum> get copyWith => _$SumCopyWithImpl<Sum>(this as Sum, _$identity);

  /// Serializes this Sum to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as Sum;
  properties
    ..add(DiagnosticsProperty('type', 'Sum'))
    ..add(DiagnosticsProperty('sum', _this.sum));
}

@override
bool operator ==(Object other) {
  final _this = this as Sum;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sum&&(identical(other.sum, _this.sum) || other.sum == _this.sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Sum;
  return Object.hash(runtimeType,_this.sum);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as Sum;
  return 'Sum(sum: ${_this.sum})';
}


}

/// @nodoc
abstract mixin class $SumCopyWith<$Res>  {
  factory $SumCopyWith(Sum value, $Res Function(Sum) _then) = _$SumCopyWithImpl;
@useResult
$Res call({
 int sum
});




}
/// @nodoc
class _$SumCopyWithImpl<$Res>
    implements $SumCopyWith<$Res> {
  _$SumCopyWithImpl(this._self, this._then);

  final Sum _self;
  final $Res Function(Sum) _then;

/// Create a copy of Sum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sum = null,}) {
  return _then(Sum(
sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Sum].
extension SumPatterns on Sum {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sum value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sum() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sum value)  $default,){
final _that = this;
switch (_that) {
case _Sum():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sum value)?  $default,){
final _that = this;
switch (_that) {
case _Sum() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sum() when $default != null:
return $default(_that.sum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sum)  $default,) {final _that = this;
switch (_that) {
case _Sum():
return $default(_that.sum);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sum)?  $default,) {final _that = this;
switch (_that) {
case _Sum() when $default != null:
return $default(_that.sum);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sum with DiagnosticableTreeMixin implements Sum {
  const _Sum({required this.sum});
  factory _Sum.fromJson(Map<String, dynamic> json) => _$SumFromJson(json);

@override final  int sum;

/// Create a copy of Sum
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SumCopyWith<_Sum> get copyWith => __$SumCopyWithImpl<_Sum>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SumToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'Sum'))
    ..add(DiagnosticsProperty('sum', sum));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sum&&(identical(other.sum, sum) || other.sum == sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sum);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'Sum(sum: $sum)';
}


}

/// @nodoc
abstract mixin class _$SumCopyWith<$Res> implements $SumCopyWith<$Res> {
  factory _$SumCopyWith(_Sum value, $Res Function(_Sum) _then) = __$SumCopyWithImpl;
@override @useResult
$Res call({
 int sum
});




}
/// @nodoc
class __$SumCopyWithImpl<$Res>
    implements _$SumCopyWith<$Res> {
  __$SumCopyWithImpl(this._self, this._then);

  final _Sum _self;
  final $Res Function(_Sum) _then;

/// Create a copy of Sum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sum = null,}) {
  return _then(_Sum(
sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Empty implements DiagnosticableTreeMixin {



  /// Serializes this Empty to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'Empty'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Empty);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'Empty()';
}


}

/// @nodoc
class $EmptyCopyWith<$Res>  {
$EmptyCopyWith(Empty _, $Res Function(Empty) __);
}


/// Adds pattern-matching-related methods to [Empty].
extension EmptyPatterns on Empty {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Empty value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Empty() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Empty value)  $default,){
final _that = this;
switch (_that) {
case _Empty():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Empty value)?  $default,){
final _that = this;
switch (_that) {
case _Empty() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function()?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Empty() when $default != null:
return $default();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function()  $default,) {final _that = this;
switch (_that) {
case _Empty():
return $default();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function()?  $default,) {final _that = this;
switch (_that) {
case _Empty() when $default != null:
return $default();case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(createJsonSchema: true)
class _Empty with DiagnosticableTreeMixin implements Empty {
  const _Empty();
  factory _Empty.fromJson(Map<String, dynamic> json) => _$EmptyFromJson(json);




@override
Map<String, dynamic> toJson() {
  return _$EmptyToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'Empty'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Empty);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'Empty()';
}


}




// dart format on
