import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/cubit/products_cubit.dart';

class deleteAdressScreen extends StatelessWidget {
  const deleteAdressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          body: Column(
            children: [
              const Text('Delete Address Screen'),
              ElevatedButton(
                onPressed: () {
                  // ProductsCubit.get(context).deleteAddress();
                },
                child: const Text('Delete Address'),
              ),
            ],
          ),
        ));
      },
    );
  }
}
