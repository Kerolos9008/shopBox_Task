class Product {
  final int uid;
  final String name;
  final int tag;
  final int sellingPrice;
  final String imageURL;

  Product(
    this.uid,
    this.name,
    this.tag,
    this.sellingPrice,
    this.imageURL,
  );

  factory Product.fromJson(json){
    return Product(
      json['uid'],
      json['name'],
      json['tag'],
      json['selling_price'],
      json['image0']['image_large'],
    );
  }
}
