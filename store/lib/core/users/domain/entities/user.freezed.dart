// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$User {


@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  String email,  String phoneNumber)  $default,{required TResult Function()  initial,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  String email,  String phoneNumber)?  $default,{TResult? Function()?  initial,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  String email,  String phoneNumber)?  $default,{TResult Function()?  initial,required TResult orElse(),}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,{required TResult Function( '',
  ) value)  initial,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,{TResult? Function( '',
  ) value)?  initial,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{TResult Function( '',
  ) value)?  initial,required TResult orElse(),}) => throw _privateConstructorUsedError;


}

/// @nodoc
abstract class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) then) = _$UserCopyWithImpl<$Res, User>;



}

/// @nodoc
class _$UserCopyWithImpl<$Res,$Val extends User> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;



}


/// @nodoc
abstract class _$$_UserCopyWith<$Res>  {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) = __$$_UserCopyWithImpl<$Res>;
@useResult
$Res call({
 String id, String username, String email, String phoneNumber
});



}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User> implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? email = null,Object? phoneNumber = null,}) {
  return _then(_$_User(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _value.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _value.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _value.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _$_User  implements _User {
   _$_User({required this.id, required this.username, required this.email, required this.phoneNumber});

  

///  Firebase documentID -> [id]
@override final  String id;
/// Firebase user.displayName -> [displayName]
@override final  String username;
/// Email associated with the user
@override final  String email;
/// Phone number for Sign in
@override final  String phoneNumber;

@override
String toString() {
  return 'User(id: $id, username: $username, email: $email, phoneNumber: $phoneNumber)';
}


@override
bool operator ==(dynamic other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$_User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,id,username,email,phoneNumber);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$_UserCopyWith<_$_User> get copyWith => __$$_UserCopyWithImpl<_$_User>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  String email,  String phoneNumber)  $default,{required TResult Function()  initial,}) {
  return $default(id,username,email,phoneNumber);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  String email,  String phoneNumber)?  $default,{TResult? Function()?  initial,}) {
  return $default?.call(id,username,email,phoneNumber);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  String email,  String phoneNumber)?  $default,{TResult Function()?  initial,required TResult orElse(),}) {
  if ($default != null) {
    return $default(id,username,email,phoneNumber);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,{required TResult Function( '',
  ) value)  initial,}) {
  return $default(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,{TResult? Function( '',
  ) value)?  initial,}) {
  return $default?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{TResult Function( '',
  ) value)?  initial,required TResult orElse(),}) {
  if ($default != null) {
    return $default(this);
  }
  return orElse();
}

}


abstract class _User implements User {
   factory _User({required final  String id, required final  String username, required final  String email, required final  String phoneNumber}) = _$_User;
  

  

///  Firebase documentID -> [id]
 String get id;/// Firebase user.displayName -> [displayName]
 String get username;/// Email associated with the user
 String get email;/// Phone number for Sign in
 String get phoneNumber;
@JsonKey(ignore: true)
_$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$$'',
  )CopyWith<$Res>  {
  factory _$$'',
  )CopyWith(_$'',
  ) value, $Res Function(_$'',
  )) then) = __$$'',
  )CopyWithImpl<$Res>;



}

/// @nodoc
class __$$'',
  )CopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$'',
  )> implements _$$'',
  )CopyWith<$Res> {
  __$$'',
  )CopyWithImpl(_$'',
  ) _value, $Res Function(_$'',
  )) _then)
      : super(_value, _then);





}

/// @nodoc


class _$'',
  )  implements '',
  ) {
   _$'',
  )();

  



@override
String toString() {
  return 'User.initial()';
}


@override
bool operator ==(dynamic other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$'',
  ));
}


@override
int get hashCode => runtimeType.hashCode;


@override
@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  String email,  String phoneNumber)  $default,{required TResult Function()  initial,}) {
  return initial();
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  String email,  String phoneNumber)?  $default,{TResult? Function()?  initial,}) {
  return initial?.call();
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  String email,  String phoneNumber)?  $default,{TResult Function()?  initial,required TResult orElse(),}) {
  if (initial != null) {
    return initial();
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,{required TResult Function( '',
  ) value)  initial,}) {
  return initial(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,{TResult? Function( '',
  ) value)?  initial,}) {
  return initial?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{TResult Function( '',
  ) value)?  initial,required TResult orElse(),}) {
  if (initial != null) {
    return initial(this);
  }
  return orElse();
}

}


abstract class '',
  ) implements User {
   factory '',
  )() = _$'',
  );
  

  



}
