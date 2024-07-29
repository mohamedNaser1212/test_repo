import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/models/adressess_model.dart';
import 'package:second/widgets/custom_elevated_button.dart';
import 'package:second/widgets/custom_form_field.dart';

import '../cubit/adressess_cubit.dart';

class PostAdress extends StatelessWidget {
  PostAdress({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  AdressessModel? adressessModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdressessCubit(),
      child: BlocConsumer<AdressessCubit, AdressessState>(
        listener: (context, state) {
          if (state is AdressessSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.model.message!),
              ),
            );
          }

          if (state is AdressessFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          } else if (state is AdressessPutFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Post Adress'),
            ),
            body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomFormField(
                          label: 'id',
                          onTap: () {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'id must not be empty';
                            }
                          },
                          onSubmit: (va) {},
                          controller: idController,
                          keyboardType: TextInputType.text),
                      CustomFormField(
                          label: 'title',
                          onTap: () {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'title must not be empty';
                            }
                          },
                          onSubmit: (va) {},
                          controller: nameController,
                          keyboardType: TextInputType.text),
                      CustomFormField(
                          label: 'price',
                          onTap: () {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'price must not be empty';
                            }
                          },
                          onSubmit: (va) {},
                          controller: priceController,
                          keyboardType: TextInputType.number),
                      CustomFormField(
                          label: 'description',
                          onTap: () {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Region must not be empty';
                            }
                          },
                          onSubmit: (va) {},
                          controller: regionController,
                          keyboardType: TextInputType.text),
                      CustomFormField(
                          label: 'category',
                          onTap: () {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Details must not be empty';
                            }
                          },
                          onSubmit: (va) {},
                          controller: detailsController,
                          keyboardType: TextInputType.text),
                      CustomFormField(
                          label: 'Latitude',
                          onTap: () {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Latitude must not be empty';
                            }
                          },
                          onSubmit: (va) {},
                          controller: latitudeController,
                          keyboardType: TextInputType.number),
                      CustomFormField(
                          label: 'Longitude',
                          onTap: () {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Longitude must not be empty';
                            }
                          },
                          onSubmit: (va) {},
                          controller: longitudeController,
                          keyboardType: TextInputType.number),
                      CustomFormField(
                          label: 'Notes',
                          onTap: () {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Notes must not be empty';
                            }
                          },
                          onSubmit: (va) {},
                          controller: notesController,
                          keyboardType: TextInputType.text),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          CustomElevatedButton(
                              label: 'delete Adreess',
                              function: () {
                                AdressessCubit.get(context).putAdreessData(
                                  id: int.parse(idController.text),
                                  title: nameController.text,
                                  price: double.parse(priceController.text),
                                  description: regionController.text,
                                  category: detailsController.text,
                                );
                              }),
                          SizedBox(
                            height: 30,
                          ),
                          CustomElevatedButton(
                              label: 'Add Adreess',
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  AdressessCubit.get(context).postAdressessData(
                                    name: nameController.text,
                                    city: cityController.text,
                                    region: regionController.text,
                                    details: detailsController.text,
                                    latitude:
                                        double.parse(latitudeController.text),
                                    longitude:
                                        double.parse(longitudeController.text),
                                    notes: notesController.text,
                                  );
                                }
                              }),
                        ],
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
