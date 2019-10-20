import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {

  //File _imageFile;
  TabController _tabController;

  /*Future<bool> _pickImage() async {
    setState(() => this._imageFile = null);
    final File imageFile = await showDialog<File>(
      context: context,
      builder: (ctx) => SimpleDialog(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Take picture'),
            onTap: () async {
              final File imageFile =
              await ImagePicker.pickImage(source: ImageSource.camera);
              Navigator.pop(ctx, imageFile);
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Pick from gallery'),
            onTap: () async {
              try {
                final File imageFile =
                await ImagePicker.pickImage(source: ImageSource.gallery);
                Navigator.pop(ctx, imageFile);
              } catch (e) {
                print(e);
                Navigator.pop(ctx, null);
              }
            },
          ),
        ],
      ),
    );
    if (imageFile == null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('Please pick one image first.')),
      );
      return false;
    }
    setState(() => this._imageFile = imageFile);
    print('picked image: ${this._imageFile}');
    return true;
  }*/

  static const _kTabPages = <Widget>[
    Center(child: Icon(Icons.account_circle, size: 64.0, color: Colors.teal)),
    Center(child: Icon(Icons.camera_alt, size: 64.0, color: Colors.cyan)),
    Center(child: Icon(Icons.add_box, size: 64.0, color: Colors.blue)),
  ];
  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.account_circle), text: 'Profile'),
    Tab(icon: Icon(Icons.camera_alt), text: 'Take Picture'),
    Tab(icon: Icon(Icons.add_box), text: 'Medicines'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: TabBarView(
        children: _kTabPages,
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}