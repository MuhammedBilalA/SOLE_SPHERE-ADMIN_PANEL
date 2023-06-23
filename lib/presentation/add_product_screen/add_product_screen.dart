import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/presentation/add_product_screen/widgets/title_text_formfield.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String? selectedOption;
  List<String> options = [
    'NIKE',
    'ADDIDAS',
    'PUMA',
    'BATA',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kwhite,
            )),
        // elevation: 2,
        centerTitle: true,
        title: Text(
          'ADD PRODUCT',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: const Color(0xFF2C2B2B),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add Image",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: kwhite),
                    ),
                    Icon(
                      Icons.add_a_photo_outlined,
                      color: kwhite,
                      size: 28,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              TitleTexFormField(
                  title: 'Product Name',
                  height: 60,
                  inputType: TextInputType.name),
              TitleTexFormField(
                  title: 'Real Price',
                  height: 60,
                  inputType: TextInputType.number),
              TitleTexFormField(
                  title: 'Offer Price',
                  height: 60,
                  inputType: TextInputType.number),
              TitleTexFormField(
                  title: 'Inventory',
                  height: 60,
                  inputType: TextInputType.number),
              TitleTexFormField(
                  title: 'Discription',
                  height: 150,
                  inputType: TextInputType.name),
              Text(
                'Brand',
                style: TextStyle(
                    color: kwhite, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      hintText: ' Select Brand',
                      hintStyle: TextStyle(color: kwhite),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: kwhite,
                          // width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: kwhite,
                          // width: 2.0,
                        ),
                      ),
                      disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kwhite))),
                  focusColor: kwhite,
                  dropdownColor: const Color(0xFF2C2B2B),
                  style: TextStyle(color: kwhite),
                  value: selectedOption,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: kwhite,
                    // size: 40,
                  ),
                  iconSize: 25,
                  elevation: 16,
                  onChanged: (newValue) {
                    setState(() {
                      selectedOption = newValue;
                    });
                  },
                  items: options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton.icon(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 3, 59, 15))),
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Add Product '))
            ],
          ),
        ),
      ),
    );
  }
}
