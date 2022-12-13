import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_validation/detail_data.dart';
import 'package:form_validation/utils_common.dart';
import 'package:form_validation/utils_validation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';

void main(){
  ///Tambahkan ini untuk library intl
  initializeDateFormatting();
  runApp(
    const MaterialApp(
      home: FormValidation(),
      debugShowCheckedModeBanner: false,
    ),);
}

class FormValidation extends StatefulWidget {
  const FormValidation({Key? key}) : super(key: key);

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  late XFile? image;
  final ImagePicker _picker = ImagePicker();
  ///Controller
  TextEditingController namaController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController jenisKelaminController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();

  Kelas? _kelas = Kelas.A;
  bool java=false;
  bool golang=false;
  bool ruby=false;
  bool php=false;

  @override
  void initState() {
    ///initialisasi XFile
    image = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title : const Text('Form Validation and Collect Data')
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                children: [
                  UtilsCommon.textField(hint: 'Masukan Nama',controller: namaController),
                  UtilsCommon.spaceEnter(),
                  UtilsCommon.textField(hint: 'Masukan NIM',textInputType: TextInputType.number,controller: nimController),
                  UtilsCommon.spaceEnter(),
                  UtilsCommon.textField(hint: 'Jenis Kelamin',
                      isDropdown: true,
                      controller: jenisKelaminController,
                      onTap: (){
                        return showDialog(
                            context: context,
                            builder: (_) {
                              return Dialog(
                                child: Container(
                                  margin: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children:  [
                                      InkWell(
                                        onTap:(){
                                          setState(() {
                                            jenisKelaminController.text = 'Laki-laki';
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Container(
                                          width : double.infinity,
                                          padding: const EdgeInsets.all(10),
                                          color: Colors.grey,
                                            child: const Text('Laki - laki',style: TextStyle(color: Colors.white),)),
                                      ),
                                      UtilsCommon.spaceEnter(),
                                      InkWell(
                                        onTap:(){
                                          setState(() {
                                            jenisKelaminController.text = 'Perempuan';
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Container(
                                            width : double.infinity,
                                            padding: const EdgeInsets.all(10),
                                            color: Colors.grey,
                                            child: const Text('Perempuan',style: TextStyle(color: Colors.white),)),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        );
                      }),
                  UtilsCommon.spaceEnter(),
                  UtilsCommon.textField(hint: 'Tanggal Lahir',isDate: true, onTap: (){
                    UtilsCommon.datePicker(
                      context,
                      onChanged: (date) {},
                      minTime: DateTime(1950, 1, 1),
                      maxTime: DateTime(2025, 1, 1),
                      onConfirm: (date) {
                        setState(() {
                          ///Konversi tanggal ke Indonesia / ID
                         tanggalLahirController.text = UtilsCommon.convertDateIndonesia(date.toString());
                        }
                        );
                      },
                    );
                  },controller: tanggalLahirController),

                  UtilsCommon.spaceEnter(),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Pilih Kelas',style: TextStyle(fontSize: 16),)),
                  UtilsCommon.spaceEnter(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        UtilsCommon.radioButton(val:Kelas.A,title: 'Kelas A',kelas: _kelas,onChanged: (Kelas? value){setState(() {_kelas = value;});}),
                        UtilsCommon.radioButton(val:Kelas.B,title: 'Kelas B',kelas: _kelas,onChanged: (Kelas? value){setState(() {_kelas = value;});}),
                        UtilsCommon.radioButton(val:Kelas.C,title: 'Kelas C',kelas: _kelas,onChanged: (Kelas? value){setState(() {_kelas = value;});}),
                        UtilsCommon.radioButton(val:Kelas.D,title: 'Kelas D',kelas: _kelas,onChanged: (Kelas? value){setState(() {_kelas = value;});}),
                        UtilsCommon.radioButton(val:Kelas.E,title: 'Kelas E',kelas: _kelas,onChanged: (Kelas? value){setState(() {_kelas = value;});}),
                        UtilsCommon.radioButton(val:Kelas.F,title: 'Kelas F',kelas: _kelas,onChanged: (Kelas? value){setState(() {_kelas = value;});}),
                      ],
                    ),
                  ),
                  UtilsCommon.spaceEnter(),

                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Pilih Kemampuan (Opsional)',style: TextStyle(fontSize: 16),)),
                  UtilsCommon.spaceEnter(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        UtilsCommon.checkboxButton(val:java,title: 'Java',onChanged: (newValue){
                          setState(() {
                            java = newValue!;
                          });
                        }),
                        UtilsCommon.checkboxButton(val:php,title: 'PHP',onChanged: (newValue){
                          setState(() {
                            php = newValue!;
                          });
                        }),
                        UtilsCommon.checkboxButton(val:golang,title: 'Golang',onChanged: (newValue){
                          setState(() {
                            golang = newValue!;
                          });
                        }),
                        UtilsCommon.checkboxButton(val:ruby,title: 'Ruby on Rails',onChanged: (newValue){
                          setState(() {
                            ruby = newValue!;
                          });
                        }),
                      ],
                    ),
                  ),
                  UtilsCommon.spaceEnter(),

                  image==null? Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: UtilsCommon.submit(onTap: () async {
                          image = await _picker.pickImage(source: ImageSource.gallery);
                          setState(() {});
                        },title: 'Pick Foto dari Gallery'),
                      ),
                      UtilsCommon.spaceSpacer(),
                      Expanded(
                        flex: 1,
                        child: UtilsCommon.submit(onTap: () async {
                          image = await _picker.pickImage(source: ImageSource.camera);
                          setState(() {});
                        },title: 'Pick Foto dari Kamera'),
                      ),
                    ],
                  ) : Container(),
                  UtilsCommon.spaceEnter(),
                  if(image!=null)...[
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 220,
                          child: Image.file(
                            File(image!.path),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.blue,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              color: Colors.red, onPressed: () {setState(() {image=null;});},
                            )
                        ),
                      ],
                    )
                  ],

                  UtilsCommon.submit(onTap: () async {
                    bool validation = UtilsValidation.validasiFormData(
                        context,
                        namaController,
                        nimController,
                        jenisKelaminController,
                        tanggalLahirController,
                        image
                    );
                    if(validation){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailData(
                          namaController:namaController.text,
                          nimController:nimController.text,
                          jenisKelaminController:jenisKelaminController.text,
                          tanggalLahirController:tanggalLahirController.text,
                          image:image,
                          isGolang: golang,
                          kelas: Kelas.values[_kelas!.index].toString(),
                          isJava: java,
                          isPhp: php,
                          isRuby: ruby,
                        )),
                      );
                    }
                  },title: 'Submit Data'),
                ],
              ),
            ),
          )
      ),
    );
  }
}
