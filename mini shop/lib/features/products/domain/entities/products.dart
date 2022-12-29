import 'package:freezed_annotation/freezed_annotation.dart';

part 'products.freezed.dart';

part 'products.g.dart';


// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class Products with _$Products {
  /// Constructor
  factory Products({
    ///  Firebase documentID -> [id]
    required String id,

    /// Product name
    required String productName,

    /// $Price
    required double productPrice,

    /// Info about product
    required String details,

    /// Profile image associated to the user
    required String photo,
  }) = _Products;

  /// Converts json to dart object
  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  /// Initial User dummy data
  factory Products.initial() => Products(
      id: '',
      productName: '',
      productPrice: 0.00,
      details: '',
      photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjQuWoYxxguqd9waQVKj8XOIwBScGgTKqcEQ&usqp=CAU');
}
