class FormDataValidator {
  final String valid;
  final String message;
  FormDataValidator({this.valid = '', required this.message});
}

class SignInDataValidator {
  static FormDataValidator mailMax255 = FormDataValidator(
    message: 'Maximun 255 Characters',
    valid: r'.{0,255}',
  );

  static FormDataValidator mailMin5 = FormDataValidator(
    message: 'Maximun 5 Characters',
    valid: r'.{5,}',
  );

  static FormDataValidator mailAt = FormDataValidator(
    message: 'Add the at sign of the mail',
    valid: '@',
  );

  static FormDataValidator mailSpace = FormDataValidator(
    message: 'Please remove the blanks',
    valid: ' ',
  );

  static FormDataValidator mailDomain = FormDataValidator(
    message: 'You need to add the domain EJ: .com',
    valid: r'.+\.[a-zA-Z]+',
  );

  static FormDataValidator mailValid = FormDataValidator(
    message: 'Email valid',
    valid:
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static FormDataValidator passwordLowercase = FormDataValidator(
    message: 'Minimum 1 lowercase',
    valid: r'[a-z]',
  );

  static FormDataValidator passwordUppercase = FormDataValidator(
    message: 'Minimum 1 uppercase',
    valid: r'[A-Z]',
  );

  static FormDataValidator passwordNumeric = FormDataValidator(
    message: 'Minimum 1 Numeric Number',
    valid: r'[0-9]',
  );

  static FormDataValidator passwordSpecial = FormDataValidator(
    message: 'Minimum 1 Special Character',
    valid: r'[!@#$%^&*(),.?":{}|<>]',
  );

  static FormDataValidator passwordMin8 = FormDataValidator(
    message: 'Minimum 8 Characters',
    valid: r'.{8,}',
  );

  static FormDataValidator passwordMax20 = FormDataValidator(
    message: 'Maximun 20 Characters',
    valid: r'.{0,20}',
  );

  static FormDataValidator userNameMax255 = FormDataValidator(
    message: 'Maximun 255 Characters',
    valid: r'.{0,255}',
  );

  static FormDataValidator userNameMin8 = FormDataValidator(
    message: 'Maximun 3 Characters',
    valid: r'.{3,}',
  );
}
