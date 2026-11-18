// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_greeting_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetGreetingInput {

 String get text;
/// Create a copy of SetGreetingInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetGreetingInputCopyWith<SetGreetingInput> get copyWith => _$SetGreetingInputCopyWithImpl<SetGreetingInput>(this as SetGreetingInput, _$identity);

  /// Serializes this SetGreetingInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SetGreetingInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetGreetingInput&&(identical(other.text, _this.text) || other.text == _this.text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SetGreetingInput;
  return Object.hash(runtimeType,_this.text);
}

@override
String toString() {
  final _this = this as SetGreetingInput;
  return 'SetGreetingInput(text: ${_this.text})';
}


}

/// @nodoc
abstract mixin class $SetGreetingInputCopyWith<$Res>  {
  factory $SetGreetingInputCopyWith(SetGreetingInput value, $Res Function(SetGreetingInput) _then) = _$SetGreetingInputCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$SetGreetingInputCopyWithImpl<$Res>
    implements $SetGreetingInputCopyWith<$Res> {
  _$SetGreetingInputCopyWithImpl(this._self, this._then);

  final SetGreetingInput _self;
  final $Res Function(SetGreetingInput) _then;

/// Create a copy of SetGreetingInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,}) {
  return _then(SetGreetingInput(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SetGreetingInput].
extension SetGreetingInputPatterns on SetGreetingInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetGreetingInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetGreetingInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetGreetingInput value)  $default,){
final _that = this;
switch (_that) {
case _SetGreetingInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetGreetingInput value)?  $default,){
final _that = this;
switch (_that) {
case _SetGreetingInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetGreetingInput() when $default != null:
return $default(_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text)  $default,) {final _that = this;
switch (_that) {
case _SetGreetingInput():
return $default(_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text)?  $default,) {final _that = this;
switch (_that) {
case _SetGreetingInput() when $default != null:
return $default(_that.text);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(createJsonSchema: true)
class _SetGreetingInput implements SetGreetingInput {
  const _SetGreetingInput({required this.text});
  factory _SetGreetingInput.fromJson(Map<String, dynamic> json) => _$SetGreetingInputFromJson(json);

@override final  String text;

/// Create a copy of SetGreetingInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetGreetingInputCopyWith<_SetGreetingInput> get copyWith => __$SetGreetingInputCopyWithImpl<_SetGreetingInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetGreetingInputToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetGreetingInput&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'SetGreetingInput(text: $text)';
}


}

/// @nodoc
abstract mixin class _$SetGreetingInputCopyWith<$Res> implements $SetGreetingInputCopyWith<$Res> {
  factory _$SetGreetingInputCopyWith(_SetGreetingInput value, $Res Function(_SetGreetingInput) _then) = __$SetGreetingInputCopyWithImpl;
@override @useResult
$Res call({
 String text
});




}
/// @nodoc
class __$SetGreetingInputCopyWithImpl<$Res>
    implements _$SetGreetingInputCopyWith<$Res> {
  __$SetGreetingInputCopyWithImpl(this._self, this._then);

  final _SetGreetingInput _self;
  final $Res Function(_SetGreetingInput) _then;

/// Create a copy of SetGreetingInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_SetGreetingInput(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
