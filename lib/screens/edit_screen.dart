import 'package:account/main.dart';
import 'package:account/models/transections.dart';
import 'package:account/provider/transection_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
class EditScreen extends StatefulWidget {
 
  Transactions statement;
 
  EditScreen({super.key, required this.statement});
 
  @override
  State<EditScreen> createState() => _EditScreenState();
}
 
class _EditScreenState extends State<EditScreen> {
  final formKey = GlobalKey<FormState>();
 
  final titleController = TextEditingController();
 
  final clubController = TextEditingController();

  final countryController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    titleController.text = widget.statement.title;
    clubController.text = widget.statement.club;
    countryController.text = widget.statement.country;
    return Scaffold(
        appBar: AppBar(
          title: const Text('แบบฟอร์มแก้ไขข้อมูล'),
        ),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ชื่อนักฟุตบอล',
                  ),
                  autofocus: false,
                  controller: titleController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ชื่อสโมสร',
                  ),
                  autofocus: false,
                  controller: clubController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ชื่อทีมชาติ',
                  ),
                  autofocus: false,
                  controller: countryController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextButton(
                    child: const Text('แก้ไขข้อมูล'),
                    onPressed: () {
                          if (formKey.currentState!.validate())
                            {
                              // create transaction data object
                              var statement = Transactions(
                                  keyID: widget.statement.keyID,
                                  title: titleController.text,
                                  club: clubController.text,
                                  country: countryController.text,
                                  date: DateTime.now()
                                  );
                           
                              // add transaction data object to provider
                              var provider = Provider.of<TransactionProvider>(context, listen: false);
                             
                              provider.updateTransaction(statement);
 
                              Navigator.push(context, MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context){
                                  return MyHomePage();
                                }
                              ));
                            }
                        })
              ],
            )));
  }
}