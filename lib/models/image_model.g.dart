// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixelfordImage _$PixelfordImageFromJson(Map<String, dynamic> json) =>
    PixelfordImage(
      author: json['author'] as String,
      url: json['url'] as String,
      id: json['id'] as String,
      urlFullSize: json['download_url'] as String,
    );

Map<String, dynamic> _$PixelfordImageToJson(PixelfordImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'url': instance.url,
      'download_url': instance.urlFullSize,
    };
