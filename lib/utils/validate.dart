import 'package:get/get.dart';

class Validate {
  // Minimum eight characters, at least one letter, one number and one special character:
  final String passwordPattern =
      r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9!@#$%^&*()_+-=]+)$';

  // email validate
  final String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}';

  // name validate: special character, number
  final String namePattern =
      r'[ぁ-ゖ]|[ァ-ヷ]|ー|[ぁ-ゖァ-ヷ]|[ｧ-ﾝﾞﾟ]|[一-龥]|[一-龥ぁ-ゖ]|[ぁ-ゖァ-ヷ一-龥]|[a-zA-Z]|[ａ-ｚＡ-Ｚ]|ー|々|\s';

  // validate email userID
  String? emailIDValidate(String email) {
    final emailString = email.toString().trim();

    RegExp regExp = RegExp(emailPattern);

    if (emailString.isEmpty) {
      return "msg_userId_empty".tr;
    } else if (emailString.length > 255) {
      return "msg_userId_maxLength".tr;
    } else if (!regExp.hasMatch(emailString)) {
      return "msg_userId_format".tr;
    }
    return null;
  }

  // validate confirm password
  String? passwordConfirmValidate(
      {required String password, required String confPass}) {
    final confPassString = confPass.toString();

    if (confPassString.isEmpty) {
      return "msg_confirm_new_password_empty".tr;
    } else if (confPassString.length < 8) {
      return "msg_pass_minLength".tr;
    } else if (password != confPass) {
      return "msg_confirm_new_password_not_match".tr;
    }
    return null;
  }

  // validate password
  String? passwordValidate(String password) {
    final passwordString = password.toString();

    RegExp regExp = RegExp(passwordPattern);

    if (passwordString.isEmpty) {
      return "msg_pass_empty".tr;
    } else if (passwordString.length < 8) {
      return "msg_pass_minLength".tr;
    } else if (!regExp.hasMatch(passwordString)) {
      return "msg_pass_format".tr;
    }
    return null;
  }

  // validate new password
  String? newPasswordValidate(
      {required String password, required String newPass}) {
    final newPassString = newPass.toString();

    RegExp regExp = RegExp(passwordPattern);

    if (newPassString.isEmpty) {
      return "msg_pass_empty".tr;
    } else if (newPassString.length < 8) {
      return "msg_pass_minLength".tr;
    } else if (!regExp.hasMatch(newPassString)) {
      return "msg_pass_format".tr;
    } else if (password == newPass) {
      return "msg_new_password_same_old_password".tr;
    }
    return null;
  }

  String? passwordLoginValidate(String password) {
    final passwordString = password.toString();

    RegExp regExp = RegExp(passwordPattern);

    if (passwordString.isEmpty) {
      return "msg_pass_empty".tr;
    } else if (passwordString.length < 8) {
      return "msg_pass_minLength".tr;
    } else if (!regExp.hasMatch(passwordString)) {
      return "msg_pass_login_format".tr;
    }
    return null;
  }

  // validate first name
  String? firstNameValidate(String firstName) {
    final firstNameString = firstName.toString().trim();
    RegExp regExp = RegExp(namePattern);
    Iterable<Match> matches = regExp.allMatches(firstNameString);

    if (firstNameString.isEmpty) {
      return "msg_firstname_empty".tr;
    } else if (matches.length < firstNameString.length) {
      return "name_not_special_character".tr;
    }
    return null;
  }

  // validate last name
  String? lastNameValidate(String lastName) {
    final lastNameString = lastName.toString().trim();
    RegExp regExp = RegExp(namePattern);
    Iterable<Match> matches = regExp.allMatches(lastNameString);

    if (lastNameString.isEmpty) {
      return "msg_lastname_empty".tr;
    } else if (matches.length < lastNameString.length) {
      return "name_not_special_character".tr;
    }
    return null;
  }

  // validate phone number
  String? phoneValidate(String phone) {
    final phoneString = phone.toString().trim();
    if (phoneString.isEmpty) {
      return "msg_phone_empty".tr;
    } else if (phoneString.length < 10) {
      return "msg_phone_minLength".tr;
    } else if (!isNumeric(phoneString)) {
      return "msg_phone_number_only".tr;
    }
    return null;
  }

  // validate date
  String? dateValidate(String date) {
    final dateString = date.toString();
    if (dateString.isEmpty) {
      return "msg_date_empty".tr;
    }
    return null;
  }

  // validate address
  String? addressValidate(String address) {
    final addressString = address.toString().trim();
    if (addressString.isEmpty) {
      return "msg_address_empty".tr;
    }
    return null;
  }

  // validate prefecture
  String? prefectureValidate(String str) {
    final prefectureString = str.toString().trim();
    if (prefectureString.isEmpty) {
      return "msg_prefecture_empty".tr;
    }
    return null;
  }

  // validate city
  String? cityValidate(String str) {
    final cityString = str.toString().trim();
    if (cityString.isEmpty) {
      return "msg_city_empty".tr;
    }
    return null;
  }

  // validate town
  String? townValidate(String str) {
    final townString = str.toString().trim();
    if (townString.isEmpty) {
      return "msg_town_empty".tr;
    }
    return null;
  }

  // validate year
  String? yearValidate(String str) {
    try {
      final townString = str.toString().trim();
      if (townString.isEmpty) {
        return "msg_year_empty".tr;
      } else {
        int number = int.parse(townString);
        if (number + 100 < DateTime.now().year || number < 1) {
          return "msg_year_error".tr;
        }
      }
    } on FormatException catch (_) {
      return "msg_year_error".tr;
    }
    return null;
  }

  // validate month
  String? monthValidate(String str) {
    try {
      final townString = str.toString().trim();
      if (townString.isEmpty) {
        return "msg_month_empty".tr;
      } else {
        int number = int.parse(townString);
        if (number > 12 || number < 1) {
          return "msg_month_error".tr;
        }
      }
    } on FormatException catch (_) {
      return "msg_month_error".tr;
    }
    return null;
  }

  // validate town
  String? dayValidate(String str) {
    try {
      final townString = str.toString().trim();
      if (townString.isEmpty) {
        return "msg_day_empty".tr;
      } else {
        int number = int.parse(townString);
        if (number > 32 || number < 1) {
          return "msg_day_error".tr;
        }
      }
    } on FormatException catch (_) {
      return "msg_day_error".tr;
    }
    return null;
  }

  // validate email
  String? emailValidate(String email) {
    final emailString = email.toString().trim();

    RegExp regExp = RegExp(emailPattern);

    if (emailString.isEmpty) {
      return "msg_email_empty".tr;
    } else if (!regExp.hasMatch(emailString)) {
      return "msg_email_format".tr;
    }
    return null;
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
