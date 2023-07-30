class Category {
  final String name;
  final String imageUrl;
  final List<Subcategory> subcategories;

  Category(
      {required this.name,
      required this.imageUrl,
      required this.subcategories});
}

class Subcategory {
  final String name;

  Subcategory({required this.name});
}

final List<Category> categories = [
  Category(
    name: 'Electronics',
    imageUrl: 'https://thenounproject.com/api/private/icons/5730093/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0',
    subcategories: [
      Subcategory(name: 'Mobiles'),
      Subcategory(name: 'Laptops'),
      Subcategory(name: 'Cameras'),
    ],
  ),
  Category(
    name: 'Fashion',
    imageUrl: 'https://thenounproject.com/api/private/icons/2999643/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0',
    subcategories: [
      Subcategory(name: 'Men'),
      Subcategory(name: 'Women'),
      Subcategory(name: 'Kids'),
    ],
  ),
  Category(
    name: 'Home & Kitchen',
    imageUrl: 'https://thenounproject.com/api/private/icons/3822738/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0',
    subcategories: [
      Subcategory(name: 'Furniture'),
      Subcategory(name: 'Appliances'),
      Subcategory(name: 'Decor'),
    ],
  ),
  Category(
    name: 'Books',
    imageUrl: 'https://thenounproject.com/api/private/icons/4569901/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0',
    subcategories: [
      Subcategory(name: 'Fiction'),
      Subcategory(name: 'Non-fiction'),
      Subcategory(name: 'Self-help'),
    ],
  ),
  Category(
    name: 'Sports',
    imageUrl: 'https://thenounproject.com/api/private/icons/1843319/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0',
    subcategories: [
      Subcategory(name: 'Football'),
      Subcategory(name: 'Basketball'),
      Subcategory(name: 'Tennis'),
    ],
  ),
  Category(
    name: 'Beauty',
    imageUrl: 'https://thenounproject.com/api/private/icons/2399567/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0',
    subcategories: [
      Subcategory(name: 'Skincare'),
      Subcategory(name: 'Makeup'),
      Subcategory(name: 'Haircare'),
    ],
  ),
  Category(
    name: 'Toys',
    imageUrl: 'https://thenounproject.com/api/private/icons/3048930/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0',
    subcategories: [
      Subcategory(name: 'Action Figures'),
      Subcategory(name: 'Board Games'),
      Subcategory(name: 'Puzzles'),
    ],
  ),
  Category(
    name: 'Jewelry',
    imageUrl: 'https://thenounproject.com/api/private/icons/854950/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0',
    subcategories: [
      Subcategory(name: 'Earrings'),
      Subcategory(name: 'Necklaces'),
      Subcategory(name: 'Bracelets'),
    ],
  ),
  Category(
    name: 'Fitness',
    imageUrl: 'https://thenounproject.com/api/private/icons/5835727/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0',
    subcategories: [
      Subcategory(name: 'Exercise Equipment'),
      Subcategory(name: 'Yoga'),
      Subcategory(name: 'Fitness Apparel'),
    ],
  ),
  Category(
    name: 'Grocery',
    imageUrl: 'https://thenounproject.com/api/private/icons/5840163/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0',
    subcategories: [
      Subcategory(name: 'Fresh Produce'),
      Subcategory(name: 'Dairy'),
      Subcategory(name: 'Canned Goods'),
    ],
  ),
];
