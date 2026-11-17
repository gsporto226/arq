// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_unavailable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
AppUnavailable _$AppUnavailableFromJson(
  Map<String, dynamic> json
) {
        switch (json['code']) {
                  case 'offline':
          return Offline.fromJson(
            json
          );
                case 'no_clients':
          return NoClients.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'code',
  'AppUnavailable',
  'Invalid union type "${json['code']}"!'
);
        }
      
}

/// @nodoc
mixin _$AppUnavailable {



  /// Serializes this AppUnavailable to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUnavailable);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppUnavailable()';
}


}

/// @nodoc
class $AppUnavailableCopyWith<$Res>  {
$AppUnavailableCopyWith(AppUnavailable _, $Res Function(AppUnavailable) __);
}


/// Adds pattern-matching-related methods to [AppUnavailable].
extension AppUnavailablePatterns on AppUnavailable {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Offline value)?  offline,TResult Function( NoClients value)?  noClients,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Offline() when offline != null:
return offline(_that);case NoClients() when noClients != null:
return noClients(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Offline value)  offline,required TResult Function( NoClients value)  noClients,}){
final _that = this;
switch (_that) {
case Offline():
return offline(_that);case NoClients():
return noClients(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Offline value)?  offline,TResult? Function( NoClients value)?  noClients,}){
final _that = this;
switch (_that) {
case Offline() when offline != null:
return offline(_that);case NoClients() when noClients != null:
return noClients(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  offline,TResult Function()?  noClients,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Offline() when offline != null:
return offline();case NoClients() when noClients != null:
return noClients();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  offline,required TResult Function()  noClients,}) {final _that = this;
switch (_that) {
case Offline():
return offline();case NoClients():
return noClients();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  offline,TResult? Function()?  noClients,}) {final _that = this;
switch (_that) {
case Offline() when offline != null:
return offline();case NoClients() when noClients != null:
return noClients();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class Offline implements AppUnavailable {
  const Offline({ String? $type}): $type = $type ?? 'offline';
  factory Offline.fromJson(Map<String, dynamic> json) => _$OfflineFromJson(json);



@JsonKey(name: 'code')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$OfflineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Offline);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppUnavailable.offline()';
}


}




/// @nodoc
@JsonSerializable()

class NoClients implements AppUnavailable {
  const NoClients({ String? $type}): $type = $type ?? 'no_clients';
  factory NoClients.fromJson(Map<String, dynamic> json) => _$NoClientsFromJson(json);



@JsonKey(name: 'code')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$NoClientsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NoClients);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppUnavailable.noClients()';
}


}




// dart format on
