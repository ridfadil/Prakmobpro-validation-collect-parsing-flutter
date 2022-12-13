import 'package:flutter/material.dart';
import 'package:form_validation/utils_common.dart';
import 'package:image_picker/image_picker.dart';

class UtilsValidation{
  static bool validasiFormData(
      BuildContext context,
      TextEditingController namaController,
      TextEditingController nimController,
      TextEditingController jenisKelaminController,
      TextEditingController tanggalLahirController,
      XFile? image){
    if(namaController.text.isEmpty) {
      showValidation('Nama Harus diisi!',context);
      return false;
    }
    else if(nimController.text.isEmpty) {
      showValidation('NIM Harus diisi!',context);
      return false;
    }
    else if(jenisKelaminController.text.isEmpty) {
      showValidation('Jenis Kelamin Harus diisi!',context);
      return false;
    }
    else if(tanggalLahirController.text.isEmpty) {
      showValidation('Tanggal Lahir Harus diisi!',context);
      return false;
    }
    else if(image==null) {
      showValidation('Foto Harus ada!',context);
      return false;
    }
    else{return true;}
  }

  static void showValidation(String err,BuildContext context){
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  Container(
                      width : double.infinity,
                      padding: const EdgeInsets.all(10),
                      color: Colors.red,
                      child: Text(err,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),)),
                  UtilsCommon.spaceEnter(),
                  UtilsCommon.spaceEnter(),
                  UtilsCommon.spaceEnter(),
                  UtilsCommon.submit(
                      title: 'OKE',
                      onTap: (){
                        Navigator.pop(context);
                      })
                ],
              ),
            ),
          );
        }
    );
  }
}