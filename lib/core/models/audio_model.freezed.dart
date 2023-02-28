// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AudioModel _$AudioModelFromJson(Map<String, dynamic> json) {
  return _AudioModel.fromJson(json);
}

/// @nodoc
mixin _$AudioModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'music_title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_name')
  String? get authorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'album_img')
  String? get albumImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'music_source')
  String? get musicLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioModelCopyWith<AudioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioModelCopyWith<$Res> {
  factory $AudioModelCopyWith(
          AudioModel value, $Res Function(AudioModel) then) =
      _$AudioModelCopyWithImpl<$Res, AudioModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'music_title') String? title,
      @JsonKey(name: 'author_name') String? authorName,
      @JsonKey(name: 'album_img') String? albumImage,
      @JsonKey(name: 'music_source') String? musicLink});
}

/// @nodoc
class _$AudioModelCopyWithImpl<$Res, $Val extends AudioModel>
    implements $AudioModelCopyWith<$Res> {
  _$AudioModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? authorName = freezed,
    Object? albumImage = freezed,
    Object? musicLink = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      albumImage: freezed == albumImage
          ? _value.albumImage
          : albumImage // ignore: cast_nullable_to_non_nullable
              as String?,
      musicLink: freezed == musicLink
          ? _value.musicLink
          : musicLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AudioModelCopyWith<$Res>
    implements $AudioModelCopyWith<$Res> {
  factory _$$_AudioModelCopyWith(
          _$_AudioModel value, $Res Function(_$_AudioModel) then) =
      __$$_AudioModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'music_title') String? title,
      @JsonKey(name: 'author_name') String? authorName,
      @JsonKey(name: 'album_img') String? albumImage,
      @JsonKey(name: 'music_source') String? musicLink});
}

/// @nodoc
class __$$_AudioModelCopyWithImpl<$Res>
    extends _$AudioModelCopyWithImpl<$Res, _$_AudioModel>
    implements _$$_AudioModelCopyWith<$Res> {
  __$$_AudioModelCopyWithImpl(
      _$_AudioModel _value, $Res Function(_$_AudioModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? authorName = freezed,
    Object? albumImage = freezed,
    Object? musicLink = freezed,
  }) {
    return _then(_$_AudioModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      albumImage: freezed == albumImage
          ? _value.albumImage
          : albumImage // ignore: cast_nullable_to_non_nullable
              as String?,
      musicLink: freezed == musicLink
          ? _value.musicLink
          : musicLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_AudioModel implements _AudioModel {
  const _$_AudioModel(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'music_title') this.title,
      @JsonKey(name: 'author_name') this.authorName,
      @JsonKey(name: 'album_img') this.albumImage,
      @JsonKey(name: 'music_source') this.musicLink});

  factory _$_AudioModel.fromJson(Map<String, dynamic> json) =>
      _$$_AudioModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'music_title')
  final String? title;
  @override
  @JsonKey(name: 'author_name')
  final String? authorName;
  @override
  @JsonKey(name: 'album_img')
  final String? albumImage;
  @override
  @JsonKey(name: 'music_source')
  final String? musicLink;

  @override
  String toString() {
    return 'AudioModel(id: $id, title: $title, authorName: $authorName, albumImage: $albumImage, musicLink: $musicLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.albumImage, albumImage) ||
                other.albumImage == albumImage) &&
            (identical(other.musicLink, musicLink) ||
                other.musicLink == musicLink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, authorName, albumImage, musicLink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioModelCopyWith<_$_AudioModel> get copyWith =>
      __$$_AudioModelCopyWithImpl<_$_AudioModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AudioModelToJson(
      this,
    );
  }
}

abstract class _AudioModel implements AudioModel {
  const factory _AudioModel(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'music_title') final String? title,
      @JsonKey(name: 'author_name') final String? authorName,
      @JsonKey(name: 'album_img') final String? albumImage,
      @JsonKey(name: 'music_source') final String? musicLink}) = _$_AudioModel;

  factory _AudioModel.fromJson(Map<String, dynamic> json) =
      _$_AudioModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'music_title')
  String? get title;
  @override
  @JsonKey(name: 'author_name')
  String? get authorName;
  @override
  @JsonKey(name: 'album_img')
  String? get albumImage;
  @override
  @JsonKey(name: 'music_source')
  String? get musicLink;
  @override
  @JsonKey(ignore: true)
  _$$_AudioModelCopyWith<_$_AudioModel> get copyWith =>
      throw _privateConstructorUsedError;
}
