import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/widgets/custom_appbar.dart';
import '../utils/widgets/custom_button.dart';
import '../utils/widgets/textformfield.dart';

class AddNewTextField extends StatefulWidget {
  const AddNewTextField({super.key});

  @override
  State<AddNewTextField> createState() => _AddNewTextFieldState();
}

class _AddNewTextFieldState extends State<AddNewTextField> {
  List<Widget> textFields = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarHeight: 80,
        actionIcons: Icons.person,
        leadingIcon: Icons.menu,
        onPressedLeadIcon: () {},
        onPressedActionIcon: () {},
        title: "",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(children: [
              showTextFields(),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                color: AppColors.appColor,
                text: 'Add Custom Fields',
                onPressed: addTextField,
                textColor: textStyle04,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void addTextField() {
    if (textFields.length < 5) {
      setState(() {
        textFields.add(buildTextFieldRow());
      });
    }
  }

  showTextFields() {
    return SingleChildScrollView(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: textFields.length,
          itemBuilder: (context, index) {
            return textFields[index];
          }),
    );
  }

  Widget buildTextFieldRow() {
    double height = MediaQuery.of(context).size.height;
    TextEditingController controller = TextEditingController();

    return Column(
      children: [
        Container(
      
          height: height * 0.08,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1.2,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: MyTextFormField(
              controller: controller,
              hinttext: 'Enter Value', icon: null, myObscureText: false,
              onChanged: (value) {},
              suffixicon: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => removeTextField(textFields.length - 1),
              ),

              // controller: _orderNumberController,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  removeTextField(int index) {
    if (index >= 0 && index < textFields.length) {
      setState(() {
        textFields.removeAt(index);
      });
    }
  }
}
