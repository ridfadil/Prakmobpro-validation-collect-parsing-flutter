import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class UtilsCommon{
  static Widget submit({required Function() onTap, String? title,bool isReject = false}) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onTap,
            child: Text('$title'),
            style: ElevatedButton.styleFrom(
                primary: !isReject ? Colors.green : Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(14)
            ),
          ),
        ),
      ],
    );
  }

  static Widget textField({
    String hint ='',
    Function(String val)? onChange,
    Function()? onTap,
    TextEditingController? controller,
    bool isDropdown=false,
    bool isDate=false,
    TextInputType textInputType = TextInputType.text
  }){
    return TextField(
      readOnly: isDropdown||isDate,
      onChanged: onChange,
      onTap: onTap,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: hint,
          fillColor: Colors.white70,
        suffixIcon: isDropdown? const Icon(Icons.arrow_drop_down_circle_outlined) :isDate? const Icon(Icons.date_range) : null
      ),
    );
  }

  static dynamic datePicker(
      BuildContext context, {
        required Function onChanged,
        required Function onConfirm,
        DateTime? minTime,
        DateTime? maxTime,
      }) {
    return DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: minTime ?? DateTime(2018, 1, 1),
      maxTime: maxTime ?? DateTime(2025, 1, 1),
      theme: const DatePickerTheme(
        headerColor: Colors.blue,
        backgroundColor: Colors.white,
        itemStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        doneStyle: TextStyle(color: Colors.white, fontSize: 12),
        cancelStyle: TextStyle(color: Colors.white, fontSize: 12),
      ),
      onChanged: (date) {
        onChanged(date);
      },
      onConfirm: (date) {
        onConfirm(date);
      },
      currentTime: DateTime.now(),
      locale: LocaleType.id,
    );
  }

  static Widget radioButton({val,String? title,Kelas? kelas,Function(Kelas? value)? onChanged}){
    return Row(
      children: [
        Radio<Kelas>(
          value: val,
          groupValue: kelas,
          onChanged: onChanged,
        ),
        Text('$title')
      ],
    );
  }

  static Widget checkboxButton({bool? val,String? title,Function(bool? val)? onChanged}){
    return Row(
      children: [
        Checkbox(
            value: val,
            activeColor: Colors.green,
            onChanged:onChanged),
        Text('$title')
      ],
    );
  }

  static String convertDateIndonesia(String? date,){
    DateFormat dateFormat = DateFormat.yMMMMd('id');
    DateTime dateString = DateTime.parse(date!);
    return dateFormat.format(dateString).toString();
  }

  static Widget spaceEnter(){
    return const SizedBox(height: 10);
  }
  static Widget spaceSpacer(){
    return const SizedBox(width: 20);
  }
}

enum Kelas { A,B,C,D,E,F }