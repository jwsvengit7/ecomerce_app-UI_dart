
import 'package:flutter/material.dart';
import 'package:light_height_ecomerce_app/domain/model/Product.dart';
import 'package:light_height_ecomerce_app/domain/repositories/ProductRepository.dart';

class AllProductView extends StatefulWidget {
  final List<Product> product;
  const AllProductView({super.key, required this.product});

  @override
  AllProductViewState createState() => AllProductViewState();
}

class AllProductViewState extends State<AllProductView> {
  SizedBox spaceHeight = const SizedBox(height: 20);

  @override
Widget build(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Container(
        height: 200,
        margin: const EdgeInsets.only(bottom: 20, top: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(widget.product.length, (index) {
              final value = widget.product[index];
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      width: 110,
                      height: 170,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  value.image,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            value.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "\$${value.amount}",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    ],
  );
}
}