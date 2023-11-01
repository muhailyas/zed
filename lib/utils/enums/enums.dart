enum AuthProvider { google, login, signUp }

enum Friend { following, followers }

enum SearchType { gloabal, chatSearch }

enum AuthResults {
  initial,
  loginSuccess,
  signUpSuccess,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  userNotFound,
  wrongPassword,
  error,
  verified,
  googleSignInVerified,
  googleSignInVerifiedNewUser,
  passwordReset
}
