// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Products _$$_ProductsFromJson(Map<String, dynamic> json) => _$_Products(
      id: json['id'] as String,
      productName: json['productName'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      details: json['details'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$$_ProductsToJson(_$_Products instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'details': instance.details,
      'photo': instance.photo,
    };
