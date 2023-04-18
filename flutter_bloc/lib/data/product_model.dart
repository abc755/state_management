class Product {
  final int id;
  final String name;
  final String image;

  Product(this.id, this.name, this.image);
}

List<Product> getProducts() {
  List<Product> list = [
    Product(1, 'apple',
        'https://images.unsplash.com/photo-1630563451961-ac2ff27616ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
    Product(2, 'pear',
        'https://images.unsplash.com/photo-1615484477778-ca3b77940c25?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80'),
    Product(3, 'watermelon',
        'https://images.unsplash.com/photo-1582281298055-e25b84a30b0b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=905&q=80'),
  ];
  return list;
}
