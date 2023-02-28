// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AudioModel _$$_AudioModelFromJson(Map<String, dynamic> json) =>
    _$_AudioModel(
      id: json['id'] as int,
      title: json['music_title'] as String?,
      authorName: json['author_name'] as String?,
      albumImage: json['album_img'] as String?,
      musicLink: json['music_source'] as String?,
    );

Map<String, dynamic> _$$_AudioModelToJson(_$_AudioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'music_title': instance.title,
      'author_name': instance.authorName,
      'album_img': instance.albumImage,
      'music_source': instance.musicLink,
    };
