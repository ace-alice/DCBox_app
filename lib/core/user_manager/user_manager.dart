abstract class UserManager {
  Future init();

  setToken(String? token);

  setTokenExpired();

  checkToken();

  initData();

  Future getUserBalance();

  Future getKycStatus();
}
