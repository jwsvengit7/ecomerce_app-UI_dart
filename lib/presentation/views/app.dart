import 'package:flutter/material.dart';
import 'package:light_height_ecomerce_app/components/reusedcomponents.dart';
import 'package:light_height_ecomerce_app/domain/model/Product.dart';
import 'package:light_height_ecomerce_app/domain/repositories/ProductRepository.dart';
import 'package:light_height_ecomerce_app/presentation/viewsTemplate/AllProduct.dart';
import 'package:light_height_ecomerce_app/presentation/viewsTemplate/BuildAppView.dart';
import 'package:light_height_ecomerce_app/presentation/viewsTemplate/Drawers.dart';
import 'package:light_height_ecomerce_app/presentation/viewsTemplate/ProductView.dart';
import 'package:light_height_ecomerce_app/presentation/viewsTemplate/footer.dart';
import 'dart:async';
class App extends StatefulWidget {
  AppState createState() => AppState();
}

class AppState extends State<App> {
  List<String> images = [
    "assets/adds1.png",
    "assets/bg2.jpeg",
    "assets/bg3.jpeg"
  ];
  final PageController _pageController = PageController(viewportFraction: 0.9);
  String selectedFilter = 'All';
  bool isAscending = true;
  final searchController = TextEditingController();
   int currentPage = 0;
  int count =4;
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
     late Timer _timer;
@override
void initState(){
  super.initState();
     _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        if (currentPage < images.length - 1) {
          currentPage++;
        } else {
          currentPage = 0;
        }
        _pageController.animateToPage(
          currentPage,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  
  }



  List<Product> getFilteredAndSortedProducts() {
List<Product> filteredProducts = ProductRepositories.products;

  if (selectedFilter != null && selectedFilter != 'All') {
    filteredProducts = ProductRepositories.products
      .where((product) {
        print(product.category == selectedFilter);
        return product.category == selectedFilter;
      })
      .toList();

    if (filteredProducts.isEmpty) {
      return [];
    }
  }

    filteredProducts = filteredProducts
    .where((product) =>
        product.name.toLowerCase().contains(searchController.text?.toLowerCase() ?? ''))
    .toList();

    filteredProducts.sort((a, b) {
      return isAscending
          ? a.amount.compareTo(b.amount)
          : b.amount.compareTo(a.amount);
    });

    return filteredProducts;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       key: _scaffoldKey,
        drawer:  const Drawer(child: Drawers(),),
      appBar: AppBar(
     
        
        excludeHeaderSemantics: false,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        actions: [
          
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   SizedBox(
                 width: 40,
                    height: 40,
                child: InkWell(
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  
                ),
              ),
                  Image.asset(
                    "assets/ic_launcher.png",
                    width: 120,
                    height: 150,
                  ),
               
                  Icon(Icons.notification_add),
                ],
              ),
            ),
          )
        ],
      ),
      body:  Stack(
     children: [
        
          SingleChildScrollView(
          child: Column(
            children: [
              Positioned(
               
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10.0),
                  child:  AllProductView(product: ProductRepositories.products)
                ),
              ),
          SingleChildScrollView(
              child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputFieldSearch(hintText: "Search", controller: searchController),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: PageView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return BuildAppView(index: index, image: images[index]);
                    },
                     onPageChanged: (int index) {
          setState(() {
            currentPage = index;
          });
                     }
                  ),
                ),
                buildFilterDropdown(),
                
                buildSortButton(),
                
                ProductView(product: getFilteredAndSortedProducts()),
           
          
        
              ],
            ),
          ),
            
          ),
            
            ]
          ),
        ),
      ]),bottomNavigationBar: Footer(),
    );


    
  }

      Widget buildFilterDropdown() {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Filter: '),
                DropdownButton<String>(
                  value: selectedFilter,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFilter = newValue!;
                    });
                  },
                  items: <String>[
                    'All',
                    'Electronics',
                   'School Items',
                    'Accessories','House Kit'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget buildSortButton() {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Sort:'),
              IconButton(
                icon: Icon(
                  isAscending ? Icons.arrow_upward : Icons.arrow_downward,
                ),
                onPressed: () {
                  setState(() {
                    isAscending = !isAscending;
                 
                  });
                },
              ),
            ],
          ),
        ),
      );
    }

   

  @override
  void dispose() {
        _timer.cancel(); 
    _pageController.dispose();
    searchController.dispose();
    super.dispose();
  }
}
