import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_validation/utils_common.dart';
import 'package:image_picker/image_picker.dart';

class DetailData extends StatefulWidget {
  String? namaController;
  String? nimController;
  String? jenisKelaminController;
  String? tanggalLahirController;
  String? kelas;
  bool? isJava;
  bool? isPhp;
  bool? isGolang;
  bool? isRuby;
  XFile? image;

  DetailData({Key? key,
    this.namaController,
    this.nimController,
    this.jenisKelaminController,
    this.tanggalLahirController,
    this.kelas,
    this.image,
    this.isGolang,
    this.isJava,
    this.isPhp,
    this.isRuby
  }) : super(key: key);

  @override
  State<DetailData> createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Data'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: 220,
                child: Image.file(
                  File(widget.image!.path),
                  fit: BoxFit.cover,
                ),
                color: Colors.blue,
              ),
            ),
            fieldBuild(title: 'Nama : ',value: '${widget.namaController}'),
            fieldBuild(title: 'NIM : ',value: '${widget.nimController}'),
            fieldBuild(title: 'Jenis Kelamin : ',value: '${widget.jenisKelaminController}'),
            fieldBuild(title: 'Tanggal Lahir : ',value: '${widget.tanggalLahirController}'),
            fieldBuild(title: 'Kelas : ',value: '${widget.kelas??'-'}'),
            fieldBuild(title: 'Kemampuan : ', value:
            '${widget.isJava!?'Java, ':''}'
                '${widget.isRuby!?'Ruby on Rails, ':''}'
                '${widget.isPhp!?'PHP, ':''}'
                '${widget.isGolang!?'Golang. ':''}'),
          ],
        ),
      ),
    );
  }

  Widget fieldBuild({String? title,String? value}){
    return  Container(
        width : double.infinity,
        padding: const EdgeInsets.all(10),
        color: Colors.white10,
        child: Row(
          children: [
            Text('$title',style: const TextStyle(color: Colors.black),),
            UtilsCommon.spaceSpacer(),
            Text('$value',style: const TextStyle(color: Colors.black),),
          ],
        ));
  }
}
