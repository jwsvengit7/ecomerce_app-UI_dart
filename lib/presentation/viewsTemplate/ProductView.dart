import 'package:flutter/material.dart';
import 'package:light_height_ecomerce_app/domain/model/Product.dart';
import 'package:light_height_ecomerce_app/domain/repositories/ProductRepository.dart';
import 'package:intl/intl.dart';

class ProductView extends StatefulWidget {
  final List<Product> product;
  const ProductView({super.key, required this.product});
  ProductViewState createState() => ProductViewState();
}

class ProductViewState extends State<ProductView> {
  bool seeAllClicked = false;

  void showAll() {
    setState(() {
      seeAllClicked = true;
    });
    print(seeAllClicked);
  }
  void vewFew(){
       setState(() {
      seeAllClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
    
      if (widget.product.isNotEmpty)
        Padding(
          padding: EdgeInsets.all(20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Hot Deals",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                !seeAllClicked
                    ? InkWell(
                        onTap: () {
                          showAll();
                        },
                        child: const Text(
                          "See All",
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          vewFew();
                        },
                        child: const Text(
                          "View Few",
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ),
                      ),
              ],
            ),
          ),
        ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        itemCount: seeAllClicked ? widget.product.length : (widget.product.length > 0 ? widget.product.length : 1),

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.90,
          ),
        itemBuilder: (BuildContext context, int index) {
  final item = index < widget.product.length ? widget.product[index] : null;

  if (item != null) {
    String formattedAmount =
        NumberFormat.currency(symbol: '\$', decimalDigits: 2)
            .format(item.amount);

    return Card(
      color: Colors.white,
      elevation: 2,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(item.image,
                  width: MediaQuery.of(context).size.width,
                  height: 100),
              Text(
                item.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 10),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      formattedAmount,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(formattedAmount),
                    Container(
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      child: Text("**"),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  } else {
    // Handle the case where item is null (you can return a placeholder or an empty container)
    return Container();
  }
},

        ),
      ),
      if (ProductRepositories.products.isEmpty)
        const Center(
          child: Text("No Product available."),
        ),
    ]);
  }
}
