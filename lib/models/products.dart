import 'package:masysecommerce/models/sqldatabase.dart';
import 'package:sqflite/sqflite.dart';

class Product {
  final String title;
  final String image;
  final double rating;
  final double price;
  final double discountedPrice;

  Product({
    required this.title,
    required this.image,
    required this.rating,
    required this.price,
    required this.discountedPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'rating': rating,
      'price': price,
      'discountedPrice': discountedPrice,
    };
  }

  static Product fromMap(Map<String, dynamic> map) {
    return Product(
      title: map['title'],
      image: map['image'],
      rating: map['rating'],
      price: map['price'],
      discountedPrice: map['discountedPrice'],
    );
  }

  static List<Product> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => fromMap(map)).toList();
  }

  static List<Map<String, dynamic>> toList(List<Product> products) {
    return products.map((product) => product.toMap()).toList();
  }
  Future<void> save() async {
    final db = await DatabaseHelper.database;
    await db.insert(
      DatabaseHelper.tableName,
      toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Product>> getProducts() async {
    final db = await DatabaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(DatabaseHelper.tableName);
    return List.generate(maps.length, (index) => fromMap(maps[index]));
  }

  Future<void> update() async {
    final db = await DatabaseHelper.database;
    await db.update(
      DatabaseHelper.tableName,
      toMap(),
      where: 'title = ?',
      whereArgs: [title],
    );
  }

  Future<void> delete() async {
    final db = await DatabaseHelper.database;
    await db.delete(
      DatabaseHelper.tableName,
      where: 'title = ?',
      whereArgs: [title],
    );
  }
}

final List<Product> products = [
  Product(
    title: 'Masys Shoes',
    image:
    'https://www.befunky.com/images/wp/wp-2017-09-Background-Remover-1.jpg?auto=avif,webp&format=jpg&width=944',
    rating: 3.8,
    price: 299.99,
    discountedPrice: 245.99,
  ),
  Product(
    title: 'Masys Eyeglasses',
    image:
    'https://expertphotography.b-cdn.net/wp-content/uploads/2021/04/product-photography-natural-1.jpg',
    rating: 4.0,
    price: 499.99,
    discountedPrice: 399.99,
  ),
  Product(
    title: 'Masys Shoes',
    image:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrUmazJoB0KPWnHcimfxnFY417QnEx0pki5A&usqp=CAU',
    rating: 4.7,
    price: 645.99,
    discountedPrice: 545.99,
  ),
];
