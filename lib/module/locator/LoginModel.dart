class UserModel {
  String? idkey;
  String? iduser;
  String? avatar;
  String? name;
  String? identityCard;
  dynamic dateOfIssue;
  dynamic dateOfExpiry;
  String? dateOfBirth;
  String? sex;
  String? sexText;
  String? email;
  String? phone;
  String? address;
  String? wallet;
  String? epoint;
  String? totalBusiness;
  String? totalProduct;
  String? totalOrder;
  String? referralLink;
  String? referralQr;
  String? kyc;
  dynamic kycDate;
  String? kycText;
  String? kycImg;
  MenuWebview? menuWebview;

  UserModel(
      {this.idkey,
      this.iduser,
      this.avatar,
      this.name,
      this.identityCard,
      this.dateOfIssue,
      this.dateOfExpiry,
      this.dateOfBirth,
      this.sex,
      this.sexText,
      this.email,
      this.phone,
      this.address,
      this.wallet,
      this.epoint,
      this.totalBusiness,
      this.totalProduct,
      this.totalOrder,
      this.referralLink,
      this.referralQr,
      this.kyc,
      this.kycDate,
      this.kycText,
      this.kycImg,
      this.menuWebview});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["idkey"] is String) {
      idkey = json["idkey"];
    }
    if (json["iduser"] is String) {
      iduser = json["iduser"];
    }
    if (json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if (json["ten"] is String) {
      name = json["ten"];
    }
    if (json["cccd"] is String) {
      identityCard = json["cccd"];
    }
    dateOfIssue = json["ngaycap"];
    dateOfExpiry = json["ngaykt"];
    if (json["ngaysinh"] is String) {
      dateOfBirth = json["ngaysinh"];
    }
    if (json["gioitinh"] is String) {
      sex = json["gioitinh"];
    }
    if (json["gioitinh_text"] is String) {
      sexText = json["gioitinh_text"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["dt"] is String) {
      phone = json["dt"];
    }
    if (json["dc"] is String) {
      address = json["dc"];
    }
    if (json["vitien"] is String) {
      wallet = json["vitien"];
    }
    if (json["epoint"] is String) {
      epoint = json["epoint"];
    }
    if (json["tong_doanhnghiep"] is String) {
      totalBusiness = json["tong_doanhnghiep"];
    }
    if (json["tong_sanpham"] is String) {
      totalProduct = json["tong_sanpham"];
    }
    if (json["tong_donhang"] is String) {
      totalOrder = json["tong_donhang"];
    }
    if (json["referral_link"] is String) {
      referralLink = json["referral_link"];
    }
    if (json["referral_qr"] is String) {
      referralQr = json["referral_qr"];
    }
    if (json["kyc"] is String) {
      kyc = json["kyc"];
    }
    kycDate = json["kyc_ngay"];
    if (json["kyc_text"] is String) {
      kycText = json["kyc_text"];
    }
    if (json["kyc_img"] is String) {
      kycImg = json["kyc_img"];
    }
    if (json["menu_webview"] is Map) {
      menuWebview = json["menu_webview"] == null
          ? null
          : MenuWebview.fromJson(json["menu_webview"]);
    }
  }

  static List<UserModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => UserModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["idkey"] = idkey;
    data["iduser"] = iduser;
    data["avatar"] = avatar;
    data["ten"] = name;
    data["cccd"] = identityCard;
    data["ngaycap"] = dateOfIssue;
    data["ngaykt"] = dateOfExpiry;
    data["ngaysinh"] = dateOfBirth;
    data["gioitinh"] = sex;
    data["gioitinh_text"] = sexText;
    data["email"] = email;
    data["dt"] = phone;
    data["dc"] = address;
    data["vitien"] = wallet;
    data["epoint"] = epoint;
    data["tong_doanhnghiep"] = totalBusiness;
    data["tong_sanpham"] = totalProduct;
    data["tong_donhang"] = totalOrder;
    data["referral_link"] = referralLink;
    data["referral_qr"] = referralQr;
    data["kyc"] = kyc;
    data["kyc_ngay"] = kycDate;
    data["kyc_text"] = kycText;
    data["kyc_img"] = kycImg;
    if (menuWebview != null) {
      data["menu_webview"] = menuWebview?.toJson();
    }
    return data;
  }

  UserModel copyWith({
    String? idkey,
    String? iduser,
    String? avatar,
    String? name,
    String? identityCard,
    dynamic dateOfIssue,
    dynamic dateOfExpiry,
    String? dateOfBirth,
    String? sex,
    String? sexText,
    String? email,
    String? phone,
    String? address,
    String? wallet,
    String? epoint,
    String? totalBusiness,
    String? totalProduct,
    String? totalOrder,
    String? referralLink,
    String? referralQr,
    String? kyc,
    dynamic kycDate,
    String? kycText,
    String? kycImg,
    MenuWebview? menuWebview,
  }) =>
      UserModel(
        idkey: idkey ?? this.idkey,
        iduser: iduser ?? this.iduser,
        avatar: avatar ?? this.avatar,
        name: name ?? this.name,
        identityCard: identityCard ?? this.identityCard,
        dateOfIssue: dateOfIssue ?? this.dateOfIssue,
        dateOfExpiry: dateOfExpiry ?? this.dateOfExpiry,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        sex: sex ?? this.sex,
        sexText: sexText ?? this.sexText,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        wallet: wallet ?? wallet,
        epoint: epoint ?? this.epoint,
        totalBusiness: totalBusiness ?? this.totalBusiness,
        totalProduct: totalProduct ?? this.totalProduct,
        totalOrder: totalOrder ?? this.totalOrder,
        referralLink: referralLink ?? this.referralLink,
        referralQr: referralQr ?? this.referralQr,
        kyc: kyc ?? this.kyc,
        kycDate: kycDate ?? this.kycDate,
        kycText: kycText ?? this.kycText,
        kycImg: kycImg ?? this.kycImg,
        menuWebview: menuWebview ?? this.menuWebview,
      );
}

class MenuWebview {
  ItemMenuWebview? zero;
  ItemMenuWebview? two;
  ItemMenuWebview? three;
  ItemMenuWebview? four;
  ItemMenuWebview? five;
  ItemMenuWebview? six;

  MenuWebview(
      {this.zero, this.two, this.three, this.four, this.five, this.six});

  MenuWebview.fromJson(Map<String, dynamic> json) {
    if (json["0"] is Map) {
      zero = json["0"] == null ? null : ItemMenuWebview.fromJson(json["0"]);
    }
    if (json["2"] is Map) {
      two = json["2"] == null ? null : ItemMenuWebview.fromJson(json["2"]);
    }
    if (json["3"] is Map) {
      three = json["3"] == null ? null : ItemMenuWebview.fromJson(json["3"]);
    }
    if (json["4"] is Map) {
      four = json["4"] == null ? null : ItemMenuWebview.fromJson(json["4"]);
    }
    if (json["5"] is Map) {
      five = json["5"] == null ? null : ItemMenuWebview.fromJson(json["5"]);
    }
    if (json["6"] is Map) {
      six = json["6"] == null ? null : ItemMenuWebview.fromJson(json["6"]);
    }
  }

  static List<MenuWebview> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => MenuWebview.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (zero != null) {
      data["0"] = zero?.toJson();
    }
    if (two != null) {
      data["2"] = two?.toJson();
    }
    if (three != null) {
      data["3"] = three?.toJson();
    }
    if (four != null) {
      data["4"] = four?.toJson();
    }
    if (five != null) {
      data["5"] = five?.toJson();
    }
    if (six != null) {
      data["6"] = six?.toJson();
    }
    return data;
  }

  MenuWebview copyWith({
    ItemMenuWebview? zero,
    ItemMenuWebview? two,
    ItemMenuWebview? three,
    ItemMenuWebview? four,
    ItemMenuWebview? five,
    ItemMenuWebview? six,
  }) =>
      MenuWebview(
        zero: zero ?? this.zero,
        two: two ?? this.two,
        three: three ?? this.three,
        four: four ?? this.four,
        five: five ?? this.five,
        six: six ?? this.six,
      );
}

class ItemMenuWebview {
  String? name;
  String? image;
  String? link;

  ItemMenuWebview({this.name, this.image, this.link});

  ItemMenuWebview.fromJson(Map<String, dynamic> json) {
    if (json["ten"] is String) {
      name = json["ten"];
    }
    if (json["hinh"] is String) {
      image = json["hinh"];
    }
    if (json["link"] is String) {
      link = json["link"];
    }
  }

  static List<ItemMenuWebview> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ItemMenuWebview.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["ten"] = name;
    data["hinh"] = image;
    data["link"] = link;
    return data;
  }

  ItemMenuWebview copyWith({
    String? name,
    String? image,
    String? link,
  }) =>
      ItemMenuWebview(
        name: name ?? this.name,
        image: image ?? this.image,
        link: link ?? this.link,
      );
}
