import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_database/profile.dart/total.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Board.dart';
import '../database/mydatabase.dart';
import '../loginpage and homescreen/pallete.dart';
import 'data.dart';
import 'nameEditingcontroller.dart';

class Profile extends StatefulWidget {
  Profile();

  // const profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? imageFile;

  int _totalwingame = 0;

  void initState() {
    super.initState();
    _getWin4Value();
  }

  void _getWin4Value() async {
    Game2? game = await MyDatabase().getGame2(0);
    if (game != null) {
      _totalwingame = game.total + 1;
    } else {
      _totalwingame = game!.total;
    }
    await MyDatabase().updateGame2(game);

    setState(() {
      _totalwingame = game.total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              onPressed: () async {
                // var updatedItem = {
                //   'id': 0,
                //   'wingame': 0,
                //   'besttime': 0,
                //   'bestmoves': 0,
                // };
                // await MyDatabase().update(0, updatedItem);
              },
              icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person_add)),
        ],
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 29),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 7),
              height: 190,
              decoration: BoxDecoration(
                  color: Pallete.backgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Column(
                children: [
                  Stack(
                    children: [
                      imageFile == null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(150.0),
                              child: Image.asset(
                                "assets/profile_pi.jpg",
                                height: 100.0,
                                width: 100.0,
                                // color: Colors.black26,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(150.0),
                              child: Image.file(
                                imageFile!,
                                height: 100.0,
                                width: 100.0,
                                fit: BoxFit.fill,
                              )),
                      // CircleAvatar(
                      //   backgroundImage:  imageFile == null ? Image.asset(""):Image.file(imageFile! as File),
                      //   // backgroundImage: NetworkImage(""),
                      //   radius: 50,
                      // ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: InkWell(
                          onTap: () async {
                            Map<Permission, PermissionStatus> statuses = await [
                              Permission.storage,
                              Permission.camera,
                            ].request();
                            if (statuses[Permission.storage]!.isGranted &&
                                statuses[Permission.camera]!.isGranted) {
                              showImagePicker(context);
                            } else {
                              print('no permission provided');
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.edit,
                              color: Colors.purpleAccent,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: NameEditor(
                      name: 'Your name',
                      onNameChanged: (newName) {
                        print('New name: $newName');
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),

            // total(),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Text(
                    "${_totalwingame}",
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                  Text("Total win",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
            ),
            Container(
              width: 100,
              height: 1,
              color: Colors.grey,
              // margin: EdgeInsets.only(bottom: 50),
              margin: EdgeInsets.only(top: 10),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "info",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 400,
                height: 270,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: tests()),
          ],
        ),
      ),
    );
  }

  final picker = ImagePicker();

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  // color: Colors.grey.shade300,
                  padding: const EdgeInsets.all(20),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -35,
                        child: Container(
                          width: 50,
                          height: 6,
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.5),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(children: [
                        ElevatedButton(
                          onPressed: () {
                            _imgFromGallery();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: Colors.grey.shade200,
                            shape: const StadiumBorder(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 6,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Icon(
                                  Icons.image,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  'Browse Gallery',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // SelectPhoto(
                        //   onTap: () => onTap(ImageSource.gallery),
                        //   icon: Icons.image,
                        //   textLabel: 'Browse Gallery',
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                          child: Text(
                            'OR',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _imgFromCamera();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: Colors.grey.shade200,
                            shape: const StadiumBorder(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 6,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: const [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  'Use a Camera',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // SelectPhoto(
                        //   onTap: () => onTap(ImageSource.camera),
                        //   icon: Icons.camera_alt_outlined,
                        //   textLabel: 'Use a Camera',
                        // ),
                      ])
                    ],
                  ),
                ));
          }),
    );
  }

  _imgFromGallery() async {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile = File(croppedFile.path);
      });
    }
  }
}
