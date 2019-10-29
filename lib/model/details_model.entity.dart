class DetailsModelEntity {
	String status;
	String huaSessionId;
	dynamic errMsg;
	DetailsModelDatas datas;
	int dataStatus;

	DetailsModelEntity({this.status, this.huaSessionId, this.errMsg, this.datas, this.dataStatus});

	DetailsModelEntity.fromJson(Map<String, dynamic> json) {
		status = json['Status'];
		huaSessionId = json['HuaSessionId'];
		errMsg = json['ErrMsg'];
		datas = json['Datas'] != null ? new DetailsModelDatas.fromJson(json['Datas']) : null;
		dataStatus = json['DataStatus'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Status'] = this.status;
		data['HuaSessionId'] = this.huaSessionId;
		data['ErrMsg'] = this.errMsg;
		if (this.datas != null) {
      data['Datas'] = this.datas.toJson();
    }
		data['DataStatus'] = this.dataStatus;
		return data;
	}
}

class DetailsModelDatas {
	String sale;
	List<DetailsModelDatasItemsku> itemSKUs;
	String itemCode;
	int linePrice;
	String nowpromo;
	DetailsModelDatasItemshareinfo itemShareInfo;
	bool showBothPrice;
	String cartUrl;
	DetailsModelDatasWaychooseus wayChooseUs;
	List<String> priceLabels;
	bool hasComments;
	List<DetailsModelDatasBrandfeature> brandFeatures;
	String itemName;
	List<String> itemImages;
	bool collected;
	String stuff;
	bool hasSelectCity;
	DetailsModelDatasComments comments;
	String explain;
	String contactUrl;
	String pageTitle;
	dynamic itemDetailPrices;
	bool hasItemSKU;
	String deliveryArea;
	bool saleOut;
	dynamic promotionLabels;
	String videoUrl;
	DetailsModelDatasItemselectcity itemSelectCity;
	bool onlyBuyButton;
	String attached;
	String introduction;
	List<String> coverImages;
	int price;
	int cartCount;
	String huaYu;

	DetailsModelDatas({this.sale, this.itemSKUs, this.itemCode, this.linePrice, this.nowpromo, this.itemShareInfo, this.showBothPrice, this.cartUrl, this.wayChooseUs, this.priceLabels, this.hasComments, this.brandFeatures, this.itemName, this.itemImages, this.collected, this.stuff, this.hasSelectCity, this.comments, this.explain, this.contactUrl, this.pageTitle, this.itemDetailPrices, this.hasItemSKU, this.deliveryArea, this.saleOut, this.promotionLabels, this.videoUrl, this.itemSelectCity, this.onlyBuyButton, this.attached, this.introduction, this.coverImages, this.price, this.cartCount, this.huaYu});

	DetailsModelDatas.fromJson(Map<String, dynamic> json) {
		sale = json['Sale'];
		if (json['ItemSKUs'] != null) {
			itemSKUs = new List<DetailsModelDatasItemsku>();(json['ItemSKUs'] as List).forEach((v) { itemSKUs.add(new DetailsModelDatasItemsku.fromJson(v)); });
		}
		itemCode = json['ItemCode'];
		linePrice = json['LinePrice'];
		nowpromo = json['Nowpromo'];
		itemShareInfo = json['ItemShareInfo'] != null ? new DetailsModelDatasItemshareinfo.fromJson(json['ItemShareInfo']) : null;
		showBothPrice = json['ShowBothPrice'];
		cartUrl = json['CartUrl'];
		wayChooseUs = json['WayChooseUs'] != null ? new DetailsModelDatasWaychooseus.fromJson(json['WayChooseUs']) : null;
		priceLabels = json['PriceLabels']?.cast<String>();
		hasComments = json['HasComments'];
		if (json['BrandFeatures'] != null) {
			brandFeatures = new List<DetailsModelDatasBrandfeature>();(json['BrandFeatures'] as List).forEach((v) { brandFeatures.add(new DetailsModelDatasBrandfeature.fromJson(v)); });
		}
		itemName = json['ItemName'];
		itemImages = json['ItemImages']?.cast<String>();
		collected = json['Collected'];
		stuff = json['Stuff'];
		hasSelectCity = json['HasSelectCity'];
		comments = json['Comments'] != null ? new DetailsModelDatasComments.fromJson(json['Comments']) : null;
		explain = json['Explain'];
		contactUrl = json['ContactUrl'];
		pageTitle = json['PageTitle'];
		itemDetailPrices = json['ItemDetailPrices'];
		hasItemSKU = json['HasItemSKU'];
		deliveryArea = json['DeliveryArea'];
		saleOut = json['SaleOut'];
		promotionLabels = json['PromotionLabels'];
		videoUrl = json['VideoUrl'];
		itemSelectCity = json['ItemSelectCity'] != null ? new DetailsModelDatasItemselectcity.fromJson(json['ItemSelectCity']) : null;
		onlyBuyButton = json['OnlyBuyButton'];
		attached = json['Attached'];
		introduction = json['Introduction'];
		coverImages = json['CoverImages']?.cast<String>();
		price = json['Price'];
		cartCount = json['CartCount'];
		huaYu = json['HuaYu'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Sale'] = this.sale;
		if (this.itemSKUs != null) {
      data['ItemSKUs'] =  this.itemSKUs.map((v) => v.toJson()).toList();
    }
		data['ItemCode'] = this.itemCode;
		data['LinePrice'] = this.linePrice;
		data['Nowpromo'] = this.nowpromo;
		if (this.itemShareInfo != null) {
      data['ItemShareInfo'] = this.itemShareInfo.toJson();
    }
		data['ShowBothPrice'] = this.showBothPrice;
		data['CartUrl'] = this.cartUrl;
		if (this.wayChooseUs != null) {
      data['WayChooseUs'] = this.wayChooseUs.toJson();
    }
		data['PriceLabels'] = this.priceLabels;
		data['HasComments'] = this.hasComments;
		if (this.brandFeatures != null) {
      data['BrandFeatures'] =  this.brandFeatures.map((v) => v.toJson()).toList();
    }
		data['ItemName'] = this.itemName;
		data['ItemImages'] = this.itemImages;
		data['Collected'] = this.collected;
		data['Stuff'] = this.stuff;
		data['HasSelectCity'] = this.hasSelectCity;
		if (this.comments != null) {
      data['Comments'] = this.comments.toJson();
    }
		data['Explain'] = this.explain;
		data['ContactUrl'] = this.contactUrl;
		data['PageTitle'] = this.pageTitle;
		data['ItemDetailPrices'] = this.itemDetailPrices;
		data['HasItemSKU'] = this.hasItemSKU;
		data['DeliveryArea'] = this.deliveryArea;
		data['SaleOut'] = this.saleOut;
		data['PromotionLabels'] = this.promotionLabels;
		data['VideoUrl'] = this.videoUrl;
		if (this.itemSelectCity != null) {
      data['ItemSelectCity'] = this.itemSelectCity.toJson();
    }
		data['OnlyBuyButton'] = this.onlyBuyButton;
		data['Attached'] = this.attached;
		data['Introduction'] = this.introduction;
		data['CoverImages'] = this.coverImages;
		data['Price'] = this.price;
		data['CartCount'] = this.cartCount;
		data['HuaYu'] = this.huaYu;
		return data;
	}
}

class DetailsModelDatasItemsku {
	int optionPrice;
	String optionImage;
	String optionItemCode;
	bool selected;
	bool saleOut;
	String optionName;

	DetailsModelDatasItemsku({this.optionPrice, this.optionImage, this.optionItemCode, this.selected, this.saleOut, this.optionName});

	DetailsModelDatasItemsku.fromJson(Map<String, dynamic> json) {
		optionPrice = json['OptionPrice'];
		optionImage = json['OptionImage'];
		optionItemCode = json['OptionItemCode'];
		selected = json['Selected'];
		saleOut = json['SaleOut'];
		optionName = json['OptionName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['OptionPrice'] = this.optionPrice;
		data['OptionImage'] = this.optionImage;
		data['OptionItemCode'] = this.optionItemCode;
		data['Selected'] = this.selected;
		data['SaleOut'] = this.saleOut;
		data['OptionName'] = this.optionName;
		return data;
	}
}

class DetailsModelDatasItemshareinfo {
	String shareUrl;
	String shareTitle;
	String shareDesc;
	String sharePic;

	DetailsModelDatasItemshareinfo({this.shareUrl, this.shareTitle, this.shareDesc, this.sharePic});

	DetailsModelDatasItemshareinfo.fromJson(Map<String, dynamic> json) {
		shareUrl = json['ShareUrl'];
		shareTitle = json['ShareTitle'];
		shareDesc = json['ShareDesc'];
		sharePic = json['SharePic'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['ShareUrl'] = this.shareUrl;
		data['ShareTitle'] = this.shareTitle;
		data['ShareDesc'] = this.shareDesc;
		data['SharePic'] = this.sharePic;
		return data;
	}
}

class DetailsModelDatasWaychooseus {
	String subject;
	List<DetailsModelDatasWaychooseusTitletextimg> titleTextImgs;

	DetailsModelDatasWaychooseus({this.subject, this.titleTextImgs});

	DetailsModelDatasWaychooseus.fromJson(Map<String, dynamic> json) {
		subject = json['Subject'];
		if (json['TitleTextImgs'] != null) {
			titleTextImgs = new List<DetailsModelDatasWaychooseusTitletextimg>();(json['TitleTextImgs'] as List).forEach((v) { titleTextImgs.add(new DetailsModelDatasWaychooseusTitletextimg.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Subject'] = this.subject;
		if (this.titleTextImgs != null) {
      data['TitleTextImgs'] =  this.titleTextImgs.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class DetailsModelDatasWaychooseusTitletextimg {
	String title;
	String image;
	String detail;

	DetailsModelDatasWaychooseusTitletextimg({this.title, this.image, this.detail});

	DetailsModelDatasWaychooseusTitletextimg.fromJson(Map<String, dynamic> json) {
		title = json['Title'];
		image = json['Image'];
		detail = json['Detail'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Title'] = this.title;
		data['Image'] = this.image;
		data['Detail'] = this.detail;
		return data;
	}
}

class DetailsModelDatasBrandfeature {
	String title;
	String image;
	String detail;

	DetailsModelDatasBrandfeature({this.title, this.image, this.detail});

	DetailsModelDatasBrandfeature.fromJson(Map<String, dynamic> json) {
		title = json['Title'];
		image = json['Image'];
		detail = json['Detail'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Title'] = this.title;
		data['Image'] = this.image;
		data['Detail'] = this.detail;
		return data;
	}
}

class DetailsModelDatasComments {
	String commentCount;
	String commentLink;
	List<DetailsModelDatasCommantsItemcommants> itemComments;

	DetailsModelDatasComments({this.commentCount, this.commentLink, this.itemComments});

	DetailsModelDatasComments.fromJson(Map<String, dynamic> json) {
		commentCount = json['CommentCount'];
		commentLink = json['CommentLink'];
		if (json['ItemComments'] != null) {
			itemComments = new List<DetailsModelDatasCommantsItemcommants>();(json['ItemComments'] as List).forEach((v) { itemComments.add(new DetailsModelDatasCommantsItemcommants.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['CommentCount'] = this.commentCount;
		data['CommentLink'] = this.commentLink;
		if (this.itemComments != null) {
      data['ItemComments'] =  this.itemComments.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class DetailsModelDatasCommantsItemcommants {
	String commentContent;
	List<String> commentImgs;
	String userHeadImg;
	String nickName;
	int commentGrade;
	String commentAddress;

	DetailsModelDatasCommantsItemcommants({this.commentContent, this.commentImgs, this.userHeadImg, this.nickName, this.commentGrade, this.commentAddress});

	DetailsModelDatasCommantsItemcommants.fromJson(Map<String, dynamic> json) {
		commentContent = json['CommentContent'];
		commentImgs = json['CommentImgs']?.cast<String>();
		userHeadImg = json['UserHeadImg'];
		nickName = json['NickName'];
		commentGrade = json['CommentGrade'];
		commentAddress = json['CommentAddress'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['CommentContent'] = this.commentContent;
		data['CommentImgs'] = this.commentImgs;
		data['UserHeadImg'] = this.userHeadImg;
		data['NickName'] = this.nickName;
		data['CommentGrade'] = this.commentGrade;
		data['CommentAddress'] = this.commentAddress;
		return data;
	}
}

class DetailsModelDatasItemselectcity {
	dynamic selectCity;
	dynamic buttonLink;
	String notSelectPrompt;
	bool canBuy;
	dynamic prompt;
	dynamic buttonTxt;

	DetailsModelDatasItemselectcity({this.selectCity, this.buttonLink, this.notSelectPrompt, this.canBuy, this.prompt, this.buttonTxt});

	DetailsModelDatasItemselectcity.fromJson(Map<String, dynamic> json) {
		selectCity = json['SelectCity'];
		buttonLink = json['ButtonLink'];
		notSelectPrompt = json['NotSelectPrompt'];
		canBuy = json['CanBuy'];
		prompt = json['Prompt'];
		buttonTxt = json['ButtonTxt'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['SelectCity'] = this.selectCity;
		data['ButtonLink'] = this.buttonLink;
		data['NotSelectPrompt'] = this.notSelectPrompt;
		data['CanBuy'] = this.canBuy;
		data['Prompt'] = this.prompt;
		data['ButtonTxt'] = this.buttonTxt;
		return data;
	}
}
