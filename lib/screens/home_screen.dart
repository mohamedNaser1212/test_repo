import 'package:flutter/material.dart';
import 'package:second/cubit/products_cubit.dart';
import 'package:second/models/products_model.dart';
import 'package:second/screens/post_adress.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsCubit cubit = ProductsCubit.get(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostAdress(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => itemBuilder(
                    context, cubit.homeModel!.data!.products[index]),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: cubit.homeModel!.data!.products.length)
          ],
        ),
      ),
    );
  }

  Widget itemBuilder(BuildContext context, ProductModel data) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Center(child: Text(data.name!)),
    );
  }
}
