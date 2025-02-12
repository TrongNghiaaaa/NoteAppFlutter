enum ApiType {
  home(0),
  signIn(1),
  qrScan(1),
  signUp(2),
  forgotPassword(3),
  checkScannedCode(4),
  transactionHistories(5),
  usageHistory(6),
  changePassword(10),
  newsCategories(11),

  newsDetail(12),

  //Customer
  customerList(13),
  customerDetailList(14),
  notificationList(7),
  updateNotification(8),
  updateProfile(9),
  //PRODUCTS
  productsList(15),

  // ACCOUNT BALANCE
  depositHistories(5),
  paymentHistories(6),
  accountSettingItem(16),
  signUpScan(17),
  contribute(18),
  inspectUsedProducts(19),
  locationList(19),
  facilityList(20),
  pharmacyList(21);

  // ekyc(20);

  const ApiType(this.type);

  final int type;
}
