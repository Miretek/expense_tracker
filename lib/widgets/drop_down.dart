import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final String text;
  final List<String>? itemsList;
  const DropDown(this.text, this.itemsList, {super.key});
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  DropdownMenuItem<String> _buildDropDownMenuItem(String valueItem) {
    return DropdownMenuItem<String>(
      value: valueItem,
      child: Text(valueItem),
    );
  }

  void onChangeHandler(String? value) async {
    setState(() {
      _isSelected = true;
      _selectedDrop = value.toString();
    });
  }

  bool _isSelected = false;
  String _selectedDrop = "";
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        menuMaxHeight: MediaQuery.of(context).size.height * 0.6,
        value: _isSelected ? _selectedDrop : null,
        underline: const SizedBox(),
        hint: !_isSelected
            ? Text(
                widget.text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Poppins",
                ),
              )
            : null,
        dropdownColor: Colors.grey[150],
        icon: const Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 24,
              ),
            ],
          ),
        ),
        iconSize: 18,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: "Poppins",
        ),
        onChanged: (value) => onChangeHandler(value),
        items: widget.itemsList?.map(_buildDropDownMenuItem).toList());
  }
}
