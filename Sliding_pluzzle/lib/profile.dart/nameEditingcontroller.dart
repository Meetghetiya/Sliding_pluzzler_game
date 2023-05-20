import 'package:flutter/material.dart';

class NameEditor extends StatefulWidget {
  final String name;
  final Function(String) onNameChanged;

  NameEditor({required this.name, required this.onNameChanged});

  @override
  _NameEditorState createState() => _NameEditorState();
}

class _NameEditorState extends State<NameEditor> {
  final TextEditingController _nameController = TextEditingController();
  bool _editing = false;
  late String _currentName;

  @override
  void initState() {
    super.initState();
    _currentName = widget.name;
    _nameController.text = _currentName;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _editing = true;
        });
      },
      child: _editing
          ? SizedBox(
              width: 300,
              height: 40,
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (name) {
                  setState(() {
                    _editing = false;
                    _currentName = name;
                    widget.onNameChanged(_currentName);
                  });
                },
              ),
            )
          : Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                _currentName,
                style: TextStyle(fontSize: 20),
              ),
            ),
    );
  }
}
