import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/models/products.dart';
import 'package:ecommerce_app/payment.dart';
import 'package:ecommerce_app/widgets/color_dot.dart';
import 'package:ecommerce_app/widgets/product_image.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Product? product;

  const DetailsScreen({Key? key, this.product}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
          leading: IconButton(
            padding: EdgeInsets.only(right: kDefaultPadding),
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: false,
          title: Text(
            'BACK',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding:
                    EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ProductImage(
                        size: size,
                        image: widget.product!.image,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ColorDot(
                          fillColor: kTextLightColor,
                          isSelected: true,
                        ),
                        ColorDot(
                          fillColor: Colors.blue,
                          isSelected: false,
                        ),
                        ColorDot(
                          fillColor: Colors.red,
                          isSelected: false,
                        ),
                      ],
                    ),
                    Text(
                      widget.product!.title.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      'Price: \$${widget.product!.price}',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 1.5,
                  vertical: kDefaultPadding / 2,
                ),
                child: Text(
                  widget.product!.description.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 19.0),
                ),
              ),
              Center(
                child: MaterialButton(
                  padding:
                      EdgeInsets.symmetric(horizontal: 170.4, vertical: 15),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Payment(
                        name: widget.product!.title.toString(),
                        price: widget.product!.price!.toInt(),
                        description: widget.product!.description.toString(),
                      ),
                    ));
                  },
                  child: Text(
                    "Buy Now !!",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  color: Colors.white,
                ),
              )
            ],
          ),
        ));
  }
}
