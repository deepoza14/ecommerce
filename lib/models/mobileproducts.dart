class MobileProduct {
  final String name;
  final String brand;
  final String price;
  final String imageUrl;
  final String description;

  MobileProduct({
    required this.name,
    required this.brand,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
}

List<MobileProduct> mobileProducts = [
  MobileProduct(
    name: "iPhone 13 Pro",
    brand: "Apple",
    price: "999.99",
    imageUrl:
        "https://shop.unicornstore.in/uploads/images/medium/e68187c811f826532db69dc4b04a24ad.png",
    description:
        "The iPhone 13 Pro features a stunning Super Retina XDR display, A15 Bionic chip, and a pro-level camera system for capturing amazing photos and videos.",
  ),
  MobileProduct(
    name: "Samsung Galaxy S21 Ultra",
    brand: "Samsung",
    price: "899.99",
    imageUrl: "https://m.media-amazon.com/images/I/91uYwEX1wKL._SY741_.jpg",
    description:
        "The Samsung Galaxy S21 Ultra offers a 6.8-inch Dynamic AMOLED display, powerful Exynos 2100 processor, and an incredible 108MP camera for professional-grade photography.",
  ),
  MobileProduct(
    name: "Google Pixel 6",
    brand: "Google",
    price: "799.99",
    imageUrl:
        "https://img1.gadgetsnow.com/gd/images/products/additional/large/G381894_View_1/mobiles/smartphones/google-pixel-6a-5g-128-gb-charcoal-6-gb-ram-.jpg",
    description:
        "The Google Pixel 6 boasts a 6.4-inch OLED display, Google's custom Tensor chip, and a groundbreaking camera system that delivers stunning low-light photos and videos.",
  ),
  MobileProduct(
    name: "OnePlus 9 Pro",
    brand: "OnePlus",
    price: "899.99",
    imageUrl:
        "https://m.media-amazon.com/images/I/41uC6f6q+BL._SY300_SX300_.jpg",
    description:
        "The OnePlus 9 Pro features a 6.7-inch Fluid AMOLED display, Qualcomm Snapdragon 888 chipset, and Hasselblad partnership for exceptional photography capabilities.",
  ),
  MobileProduct(
    name: "Xiaomi Mi 11",
    brand: "Xiaomi",
    price: "699.99",
    imageUrl: "https://m.media-amazon.com/images/I/71VQXjN6R7S._SX679_.jpg",
    description:
        "The Xiaomi Mi 11 offers a 6.81-inch AMOLED display, Snapdragon 888 processor, and a versatile camera system with a 108MP primary sensor.",
  ),
  MobileProduct(
    name: "Sony Xperia 1 III",
    brand: "Sony",
    price: "1,099.99",
    imageUrl: "https://www.addmecart.com/wp-content/uploads/2023/02/sk709.jpg",
    description:
        "The Sony Xperia 1 III features a 6.5-inch 4K OLED display, Snapdragon 888 chipset, and a professional-grade camera system developed in collaboration with Sony Alpha.",
  ),
];
