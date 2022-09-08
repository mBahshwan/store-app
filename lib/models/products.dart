class Product {
  final int? id, price;
  final String? title, subTitle, description, image;

  Product(
      {this.id,
      this.price,
      this.title,
      this.subTitle,
      this.description,
      this.image});
}

// list of products
List<Product> products = [
  Product(
    id: 1,
    price: 59,
    title: "Wireless headphones ",
    subTitle: "High sound quality",
    image: "images/airpod.png",
    description:
        "Lorem Epsom Dollar Sit Amit ,Consectator Adipa Skinning Aliyet,Sit Do Ayosmod Tempur Ankaidediontiot Labori at Dollar Magna Alikiwa.",
  ),
  Product(
    id: 2,
    price: 1099,
    title: "Mobile device",
    subTitle: "Mobile has become powerful",
    image: "images/mobile.png",
    description:
        "Lorem Epsom Dollar Sit Amit ,Consectator Adaiba Skinning Aliyet ,Sete do Yosmod Tempur Ankaidediontiot Laburi at Dollar Magna Alikiwa.",
  ),
  Product(
    id: 3,
    price: 39,
    title: "Three-dimensional glasses",
    subTitle: "To take you to the virtual world",
    image: "images/class.png",
    description:
        "Lorem Epsom Dollar Sit Amit ,Consectator Adaiba Skinning Aliyet ,Sete do Yosmod Tempur Ankaidediontiot Laburi at Dollar Magna Alikiwa.",
  ),
  Product(
    id: 4,
    price: 56,
    title: "Headphones",
    subTitle: "For long listening hours",
    image: "images/headset.png",
    description:
        "Lorem Epsom Dollar Sit Amit ,Consectator Adaiba Skinning Aliyet ,Sete do Yosmod Tempur Ankaidediontiot Laburi at Dollar Magna Alikiwa.",
  ),
  Product(
    id: 5,
    price: 68,
    title: "Voice Recorder",
    subTitle: "Record important moments around you",
    image: "images/speaker.png",
    description:
        "Lorem Epsom Dollar Sit Amit ,Consectator Adaiba Skinning Aliyet ,Sete do Yosmod Tempur Ankaidediontiot Laburi at Dollar Magna Alikiwa.",
  ),
  Product(
    id: 6,
    price: 39,
    title: "Computer Cameras",
    subTitle: "High quality and image resolution",
    image: "images/camera.png",
    description:
        "Lorem Epsom Dollar Sit Amit ,Consectator Adaiba Skinning Aliyet ,Sete do Yosmod Tempur Ankaidediontiot Laburi at Dollar Magna Alikiwa.",
  ),
];
