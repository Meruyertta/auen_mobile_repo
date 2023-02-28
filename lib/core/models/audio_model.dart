import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_model.freezed.dart';
part 'audio_model.g.dart';

@freezed
class AudioModel with _$AudioModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory AudioModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'music_title') String? title,
    @JsonKey(name: 'author_name') String? authorName,
    @JsonKey(name: 'album_img') String? albumImage,
    @JsonKey(name: 'music_source') String? musicLink,
  }) = _AudioModel;

  factory AudioModel.fromJson(Map<String, dynamic> json) =>
      _$AudioModelFromJson(json);
}
