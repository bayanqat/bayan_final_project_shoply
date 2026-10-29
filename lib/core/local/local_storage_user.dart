import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/entities/user_entity.dart';

class LocalStorageUser {
  static LocalStorageUser? _instance;
  static FlutterSecureStorage? _secureStorage;

  static String? _uid;
  static String? _email;
  static String? _fullName;
  static String? _address;
  static String? _userName;
  static String? _profileImage;

  String get email => _email ?? '';
  String get uid => _uid ?? '';
  String get fullName => _fullName ?? '';
  String get userName => _userName ?? '';
  String get address => _address ?? '';
  String get profileImage => _profileImage ?? '';

  LocalStorageUser._init() {
    _instance = this;
    _secureStorage = FlutterSecureStorage();
  }

  static LocalStorageUser get instance {
    if (_instance == null) {
      LocalStorageUser._init();
    }
    return _instance!;
  }

  Future<void> _setUid({required String uid}) async {
    _secureStorage?.write(key: 'uid', value: uid);
  }

  Future<String?> _getUid() async {
    return await _secureStorage?.read(key: 'uid');
  }

  Future<void> _setEmail({required String email}) async {
    _secureStorage?.write(key: 'email', value: email);
  }

  Future<String?> _getEmail() async {
    return await _secureStorage?.read(key: 'email');
  }

  Future<void> _setFullName({required String fullName}) async {
    _secureStorage?.write(key: 'fullName', value: fullName);
  }

  Future<String?> _getFullName() async {
    return await _secureStorage?.read(key: 'fullName');
  }

  Future<void> _setUserName({required String userName}) async {
    _secureStorage?.write(key: 'userName', value: userName);
  }

  Future<String?> _getUserName() async {
    return await _secureStorage?.read(key: 'userName');
  }

  Future<void> _setAddress({required String address}) async {
    _secureStorage?.write(key: 'address', value: address);
  }

  Future<String?> _getAddress() async {
    return await _secureStorage?.read(key: 'address');
  }

  Future<void> _setProfileImage({required String profileImage}) async {
    _secureStorage?.write(key: 'profileImage', value: profileImage);
  }

  Future<String?> _getProfileImage() async {
    return await _secureStorage?.read(key: 'profileImage');
  }

  Future<void> setUserData({required UserEntity user}) async {
    await _setUid(uid: user.uid ?? '');
    await _setEmail(email: user.email ?? '');
    await _setFullName(fullName: user.fullName ?? '');
    await _setUserName(userName: user.userName ?? '');
    await _setAddress(address: user.address ?? '');
    await _setProfileImage(profileImage: user.profileImage ?? '');
  }

  Future<UserEntity> getUserData() async {
    final uid = await _getUid();
    final email = await _getEmail();
    final fullName = await _getFullName();
    final userName = await _getUserName();
    final address = await _getAddress();
    final profileImage = await _getProfileImage();
    return UserEntity(
      profileImage: profileImage,
      uid: uid,
      email: email,
      address: address,
      fullName: fullName,
      userName: userName,
    );
  }

  void setUserinfo({required UserEntity user}) {
    _uid = user.uid;
    _email = user.email;
    _fullName = user.fullName;
    _userName = user.userName;
    _address = user.address;
    _profileImage = user.profileImage;
  }

  Future<void> clearUserData() async {
    _email = null;
    _uid = null;
    _address = null;
    _fullName = null;
    _userName = null;
    _profileImage = null;
    await _secureStorage?.deleteAll();
  }
}
