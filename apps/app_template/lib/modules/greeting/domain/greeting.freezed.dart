// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'greeting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Greeting {

 String get text;
/// Create a copy of Greeting
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GreetingCopyWith<Greeting> get copyWith => _$GreetingCopyWithImpl<Greeting>(this as Greeting, _$identity);

  /// Serializes this Greeting to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Greeting;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Greeting&&(identical(other.text, _this.text) || other.text == _this.text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Greeting;
  return Object.hash(runtimeType,_this.text);
}

@override
String toString() {
  final _this = this as Greeting;
  return 'Greeting(text: ${_this.text})';
}


}

/// @nodoc
abstract mixin class $GreetingCopyWith<$Res>  {
  factory $GreetingCopyWith(Greeting value, $Res Function(Greeting) _then) = _$GreetingCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$GreetingCopyWithImpl<$Res>
    implements $GreetingCopyWith<$Res> {
  _$GreetingCopyWithImpl(this._self, this._then);

  final Greeting _self;
  final $Res Function(Greeting) _then;

/// Create a copy of Greeting
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,}) {
  return _then(Greeting(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Greeting].
extension GreetingPatterns on Greeting {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Greeting value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Greeting() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Greeting value)  $default,){
final _that = this;
switch (_that) {
case _Greeting():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Greeting value)?  $default,){
final _that = this;
switch (_that) {
case _Greeting() when $default != null:
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
case _Greeting() when $default != null:
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
case _Greeting():
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
case _Greeting() when $default != null:
return $default(_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Greeting implements Greeting {
  const _Greeting({required this.text});
  factory _Greeting.fromJson(Map<String, dynamic> json) => _$GreetingFromJson(json);

@override final  String text;

/// Create a copy of Greeting
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GreetingCopyWith<_Greeting> get copyWith => __$GreetingCopyWithImpl<_Greeting>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GreetingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Greeting&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'Greeting(text: $text)';
}


}

/// @nodoc
abstract mixin class _$GreetingCopyWith<$Res> implements $GreetingCopyWith<$Res> {
  factory _$GreetingCopyWith(_Greeting value, $Res Function(_Greeting) _then) = __$GreetingCopyWithImpl;
@override @useResult
$Res call({
 String text
});




}
/// @nodoc
class __$GreetingCopyWithImpl<$Res>
    implements _$GreetingCopyWith<$Res> {
  __$GreetingCopyWithImpl(this._self, this._then);

  final _Greeting _self;
  final $Res Function(_Greeting) _then;

/// Create a copy of Greeting
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_Greeting(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

GreetingError _$GreetingErrorFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'empty':
          return GreetingEmpty.fromJson(
            json
          );
                case 'noSource':
          return GreetingNoSource.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'GreetingError',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$GreetingError {



  /// Serializes this GreetingError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GreetingError);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'GreetingError()';
}


}

/// @nodoc
class $GreetingErrorCopyWith<$Res>  {
$GreetingErrorCopyWith(GreetingError _, $Res Function(GreetingError) __);
}


/// Adds pattern-matching-related methods to [GreetingError].
extension GreetingErrorPatterns on GreetingError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GreetingEmpty value)?  empty,TResult Function( GreetingNoSource value)?  noSource,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GreetingEmpty() when empty != null:
return empty(_that);case GreetingNoSource() when noSource != null:
return noSource(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GreetingEmpty value)  empty,required TResult Function( GreetingNoSource value)  noSource,}){
final _that = this;
switch (_that) {
case GreetingEmpty():
return empty(_that);case GreetingNoSource():
return noSource(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GreetingEmpty value)?  empty,TResult? Function( GreetingNoSource value)?  noSource,}){
final _that = this;
switch (_that) {
case GreetingEmpty() when empty != null:
return empty(_that);case GreetingNoSource() when noSource != null:
return noSource(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  empty,TResult Function()?  noSource,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GreetingEmpty() when empty != null:
return empty();case GreetingNoSource() when noSource != null:
return noSource();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  empty,required TResult Function()  noSource,}) {final _that = this;
switch (_that) {
case GreetingEmpty():
return empty();case GreetingNoSource():
return noSource();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  empty,TResult? Function()?  noSource,}) {final _that = this;
switch (_that) {
case GreetingEmpty() when empty != null:
return empty();case GreetingNoSource() when noSource != null:
return noSource();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GreetingEmpty implements GreetingError {
  const GreetingEmpty({ String? $type}): $type = $type ?? 'empty';
  factory GreetingEmpty.fromJson(Map<String, dynamic> json) => _$GreetingEmptyFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$GreetingEmptyToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GreetingEmpty);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'GreetingError.empty()';
}


}




/// @nodoc
@JsonSerializable()

class GreetingNoSource implements GreetingError {
  const GreetingNoSource({ String? $type}): $type = $type ?? 'noSource';
  factory GreetingNoSource.fromJson(Map<String, dynamic> json) => _$GreetingNoSourceFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$GreetingNoSourceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GreetingNoSource);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'GreetingError.noSource()';
}


}




// dart format on
