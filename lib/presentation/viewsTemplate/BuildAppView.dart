import 'package:flutter/cupertino.dart';
import 'package:light_height_ecomerce_app/utils/heightUtils.dart';

class BuildAppView extends StatelessWidget{
  final String image;
    final  int index;

  const BuildAppView({super.key,required this.index,required this.image});
  
  @override
  Widget build(BuildContext context){

    return Center(
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      padding: const EdgeInsets.only(top: 10),
        margin: const EdgeInsets.all( 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
           BoxShadow(
            color:  Color.fromARGB(255, 208, 222, 245),
            blurRadius: 15,
          ),
        ],

        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizeUtils.sizedboxHeight(20),
          const SizedBox(height: 20),

        ],
      ),
    ),
  );
}
}