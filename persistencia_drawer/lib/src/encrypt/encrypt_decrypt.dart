import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptAndDecrypt {

  //AES
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));


  static encryptAES(text) {
    final encrypted = encrypter.encrypt(text, iv:iv);

  //   print(encrypted.bytes);
    print(encrypted.base16);
  //   print(encrypted.base64);

    return encrypted;
  }

  static decryptAES(text) {
    return encrypter.decrypt(text, iv:iv);
  }


  static final keyFernet = encrypt.Key.fromUtf8("TechWithVPTechWithVPTechWithVPTechWith");
  static final fernet = encrypt.Fernet(key);
  static final encrypterFernet = encrypt.Encrypter(fernet);

  static encryptFernet(text) {
    final encrypted = encrypterFernet.encrypt(text);

    return encrypted;
  }

  static decryptFernet(text) {
    return encrypterFernet.decrypt(text);
  }

}