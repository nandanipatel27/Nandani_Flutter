import 'package:flutter/material.dart';

class Prg78 extends StatefulWidget {
  @override
  _Prg78State createState() => _Prg78State();
}

class _Prg78State extends State<Prg78> {
  final TextEditingController _nameController = TextEditingController();
  final List<String> _names = [];
  String? _selectedName;
  int? _selectedIndex;

  void _addName() {
    final name = _nameController.text.trim();
    if (name.isNotEmpty) {
      setState(() {
        _names.add(name);
        _nameController.clear();
      });
    }
  }

  void _showNameDialog(String name) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Selected Name'),
        content: Text(name),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showContextMenu(int index) {
    _selectedIndex = index;
    _selectedName = _names[index];
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Edit Item'),
            onTap: () {
              Navigator.of(context).pop();
              _editItem();
            },
          ),
          ListTile(
            title: Text('Delete Item'),
            onTap: () {
              Navigator.of(context).pop();
              _confirmDelete();
            },
          ),
          ListTile(
            title: Text('Exit'),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _editItem() {
    if (_selectedIndex != null) {
      _nameController.text = _names[_selectedIndex!];
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Edit Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _names[_selectedIndex!] = _nameController.text.trim();
                  _nameController.clear();
                });
                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
          ],
        ),
      );
    }
  }

  void _confirmDelete() {
    if (_selectedIndex != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _names.removeAt(_selectedIndex!);
                });
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('No'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter Name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addName,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_names[index]),
                    onTap: () => _showNameDialog(_names[index]),
                    onLongPress: () => _showContextMenu(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
