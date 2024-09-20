abstract class TrKey {
  /// 数量
  static const amount = 'amount';
  static const delete = 'delete';
  static const dataUploading = 'dataUploading';
  static const dataUploadedSuccessfully = 'dataUploadedSuccessfully';
  static const submit = 'submit';
  static const swipeLeftToDelete = 'swipeLeftToDelete';
  static const replace = 'replace';
  static const mine = 'mine';
  static const version = 'version';
  static const home = 'home';
  static const trade = 'trade';

  /// 卡
  static const debitCard = 'debitCard';
  static const transaction = 'transaction';
  static const more = 'more';
  static const scan = 'scan';

  /// 充币
  static const deposit = 'deposit';

  /// 充值
  static const deposit1 = 'deposit1';

  /// 卡片申请条件：
  static const mustDosForCardApplication = 'mustDosForCardApplication';

  static const applyDebitCardCondition = 'applyDebitCardCondition';

  /// 注：开卡费用将在卡片申请完成后扣除

  static const applyCardRemind = 'applyCardRemind';

  /// 提币
  static const withdraw = 'withdraw';

  /// 转账
  static const transfer = 'transfer';
  static const payment = 'payment';

  /// 付款
  static const titlePayment = 'titlePayment';

  /// 收款
  static const titleReceivePayment = 'titleReceivePayment';
  static const titleBuyCoin = 'titleBuyCoin';
  static const titleSellCoin = 'titleSellCoin';

  /// 额度导入
  static const quotaImport = 'quotaImport';
  static const totalAsset = 'totalAsset';
  static const assetDetail = 'assetDetail';
  static const bulletin = 'bulletin';
  static const settingTransactionPasswordTitle =
      'settingTransactionPasswordTitle';
  static const modifyTransactionPasswordTitle =
      'modifyTransactionPasswordTitle';
  static const modifyTransactionPasswordUnderReviewTip =
      'modifyTransactionPasswordUnderReviewTip';
  static const transactionPassword = 'transactionPassword';
  static const resetPassword = 'resetPassword';
  static const settingTransactionPassword = 'settingTransactionPassword';
  static const settingOldTransactionPassword = 'settingOldTransactionPassword';
  static const settingNewTransactionPassword = 'settingNewTransactionPassword';
  static const hintTransactionPassword = 'inputTransactionPassword';
  static const inputTransactionPasswordError = 'inputTransactionPasswordError';
  static const inputTransactionPasswordTooEasyError =
      'inputTransactionPasswordTooEasyError';
  static const confirmTransactionPassword = 'confirmTransactionPassword';
  static const hintConfirmTransactionPassword =
      'hintConfirmTransactionPassword';
  static const hintNewConfirmTransactionPassword =
      'hintNewConfirmTransactionPassword';
  static const confirmPasswordFailed = 'confirmPasswordFailed';
  static const changeTransactionPasswordSuccess =
      'changeTransactionPasswordSuccess';
  static const isForgetTransactionPassword = 'isForgetTransactionPassword';
  static const forgetTransactionPassword = 'forgetTransactionPassword';
  static const noSetTransactionPassword = 'noSetTransactionPassword';
  static const dialogExpiredTransactionPassword =
      'dialogExpiredTransactionPassword';
  static const dialogExpiredLoginPassword = 'dialogExpiredLoginPassword';
  static const inputLoginPassword = 'inputLoginPassword';
  static const inputPasswordFailed = 'inputPasswordFailed';
  static const confirm = 'confirm';
  static const register = 'registerGKpocketTitle';
  static const createAnAccount = 'createAnAccount';
  static const phone = 'phone';
  static const loginTitle = 'loginTitle';
  static const loginSubTitle = 'loginSubTitle';

  /// 手机号
  static const phoneNumber = 'phoneNumber';
  static const phoneNumber1 = 'phoneNumber1';

  /// 请输入手机号
  static const phoneNumberHint = 'phoneNumberHint';
  static const phoneSMSCode = 'phoneSMSCode';
  static const mail = 'mail';
  static const eMail = 'eMail';
  static const mailHint = 'mailHint';
  static const mailSMSCode = 'mailSMSCode';
  static const hintSMSCodeInput = 'hintSMSCodeInput';
  static const iHaveReadAndAgree = 'iReadAndAgree';
  static const searchEmptyData = 'searchEmptyData';
  static const and = 'and';
  static const termsOfUse = 'termsOfUse';
  static const privacyPolicy = 'privacyPolicy';
  static const next = 'next';
  static const registered = 'registered';
  static const toLogIn = 'toLogIn';
  static const login = 'login';
  static const pleaseEnterValidEmail = 'pleaseEnterValidEmail';
  static const sendVerificationCode = 'sendVerificationCode';
  static const secondsLaterResend = 'secondsLaterResend';
  static const finish = 'finish';
  static const finishRegister = 'finishRegister';
  static const loginPwdSet = 'loginPwdSet';
  static const settingLoginPassword = 'settingLoginPassword';
  static const settingNewLoginPassword = 'settingNewLoginPassword';
  static const confirmPassword = 'confirmPassword';
  static const registerPwdSet = 'registerPwdSet';
  static const registerPwdConfirm = 'registerPwdConfirm';
  static const setNickname = 'setNickname';
  static const titleSetNickname = 'titleSetNickname';
  static const titleModifyNickname = 'titleModifyNickname';
  static const changeNicknameSuccess = 'changeNicknameSuccess';
  static const forgetPassword = 'forgetPassword';
  static const notAccount = 'notAccount';
  static const password = 'password';

  /// 密码输入错误
  static const passwordHint = 'passwordHint';
  static const paste = 'paste';
  static const changePhone = 'changePhone';
  static const phoneVerify = 'phoneVerify';
  static const oldPhoneVerify = 'oldPhoneVerify';
  static const changeMail = 'changeMail';
  static const mailVerify = 'mailVerify';
  static const orderFinish = 'orderFinish';
  static const orderReject = 'orderReject';
  static const orderReview = 'orderReview';
  static const orderWaiting = 'orderWaiting';
  static const orderFail = 'orderFail';
  static const orderUnreleased = 'orderUnreleased';
  static const orderCancel = 'orderCancel';
  static const topTipModifyLoginPassword = 'topTipModifyLoginPassword';
  static const topTipResetLoginPassword = 'topTipResetLoginPassword';
  static const topTipModifyPhone = 'topTipModifyPhone';
  static const topTipModifyTransactionPassword =
      'topTipModifyTransactionPassword';
  static const topTipExpiredTransactionPassword =
      'topTipExpiredTransactionPassword';
  static const topTipExpiredLoginPassword = 'topTipExpiredLoginPassword';
  static const bottomTipExpiredPassword = 'bottomTipExpiredTransactionPassword';
  static const titleOriginLoginPassword = 'titleOriginLoginPassword';
  static const titleOLdLoginPassword = 'titleOLdLoginPassword';
  static const titleNewLoginPassword = 'titleNewLoginPassword';
  static const placeholderAgainNewLoginPassword =
      'placeholderAgainNewLoginPassword';
  static const titleAgainLoginPassword = 'titleAgainLoginPassword';
  static const titlePhoneLoginVerify = 'titlePhoneLoginVerify';
  static const titleMailLoginVerify = 'titleMailLoginVerify';
  static const titleGoogleLoginVerify = 'titleGoogleLoginVerify';
  static const titleTransactionLoginVerify = 'titleTransactionLoginVerify';
  static const titleNewPhoneNumber = 'titleNewPhoneNumber';
  static const titlePhoneVerify = 'titlePhoneVerify';
  static const titleNewMail = 'titleNewMail';
  static const placeholderEnterTransactionPassword =
      'placeholderEnterTransactionPassword';
  static const placeholderAgainTransactionPassword =
      'placeholderAgainTransactionPassword';
  static const placeholderNickname = 'placeholderNickname';
  static const placeholderOriginLoginPassword =
      'placeholderOriginLoginPassword';
  static const placeholderOldLoginPassword = 'placeholderOldLoginPassword';
  static const placeholderNewLoginPassword = 'placeholderNewLoginPassword';
  static const placeholderAgainLoginPassword = 'placeholderAgainLoginPassword';
  static const placeholderInputAgainPassword = 'placeholderInputAgainPassword';
  static const placeholderPhoneVerify = 'placeholderPhoneVerify';
  static const hintRegisterPassword = 'hintRegisterPassword';
  static const hintDiffPassword = 'hintDiffPassword';
  static const hintNicknameInvalid = 'hintNicknameInvalid';
  static const hintAddressExist = 'hintAddressExist';
  static const hintAddress2Exist = 'hintAddress2Exist';
  static const retry = 'retry';
  static const selectCurrency = 'selectCurrency';
  static const networkFailure = 'networkFailure';
  static const mockNetworkFailure = 'mockNetworkFailure';
  static const networkTimeoutFailure = 'networkTimeoutFailure';
  static const networkTimeoutFailureContent = 'networkTimeoutFailureContent';
  static const networkFailureAndRetry = 'networkFailureAndRetry';
  static const networkTimeoutAndRetry = 'networkTimeoutAndRetry';

  /// 网络超时，请稍后再试
  static const networkTimeoutAndRetry1 = 'networkTimeoutAndRetry1';
  static const copyToPasted = 'copyToPasted';
  static const selectProtocol = 'selectProtocol';
  static const depositReminder1 = 'depositReminder1';
  static const depositReminder2 = 'depositReminder2';
  static const depositReminder3 = 'depositReminder3';
  static const canNotUseCardTips = 'canNotUseCardTips';
  static const prompt = 'prompt';
  static const cancel = 'cancel';
  static const ok = 'ok';
  static const iKnow = 'iKnow';
  static const toSet = 'toSet';
  static const toGo = 'toGo';
  static const toOpen = 'toOpen';
  static const securityCenter = 'securityCenter';
  static const loginPwd = 'loginPwd';
  static const txPwd = 'txPwd';
  static const googleVerification = 'googleVerification';
  static const activity = 'activity';
  static const device = 'device';
  static const protectScreenShot = 'protectScreenShot';
  static const protectScreenShotDesc = 'protectScreenShotDesc';
  static const protectScreenShotDisableConfirm =
      'protectScreenShotDisableConfirm';
  static const protectScreenShotNotify = 'protectScreenShotNotify';
  static const preventFishingCode = 'preventFishingCode';
  static const preventFishingCodeOld = 'preventFishingCodeOld';
  static const preventFishingCodeNew = 'preventFishingCodeNew';
  static const preventFishingCodeDesc = 'preventFishingCodeDesc';
  static const preventFishingCodeWarning = 'preventFishingCodeWarning';
  static const preventFishingCodeInfo1 = 'preventFishingCodeInfo1';
  static const preventFishingCodeInputInfo = 'preventFishingCodeInputInfo';
  static const preventFishingCodeInputHint = 'preventFishingCodeInputHint';
  static const hintFishingCodeIncorrect = 'hintFishingCodeIncorrect';
  static const banAccount = 'banAccount';
  static const open = 'open';
  static const close = 'close';
  static const notSet = 'notSet';
  static const edit = 'edit';

  //mine
  // static const mineTransferWhitelist = 'mineTransferWhitelist';
  static const mineAboutUs = 'mineAboutUs';
  static const mineContactCustomerService = 'mineContactCustomerService';
  static const mineLogout = 'Logout';
  static const mineKYCIdentityVerification = 'mineKYCIdentityVerification';
  static const mineLowIntensity = 'mineLowIntensity';
  static const mineMediumIntensity = 'mineMediumIntensity';
  static const mineHighIntensity = 'mineHighIntensity';
  static const mineUncertified = 'mineNotcertified';
  static const mineUnderReview = 'mineUnderReview';
  static const mineVerified = 'mineVerified';

  static const kycIdentityVerification = 'kycIdentityVerification';
  static const kycFirstLevelDecs = 'kycFirstLevelDecs';
  static const kycLastLevelDecs = 'kycLastLevelDecs';
  static const kycOtherDecs = 'kycOtherDecs';
  static const kycFirstLevelTitle = 'kycFirstLevelTitle';
  static const kycFirstLevelSuccess = 'kycFirstLevelSuccess';
  static const kycSecondLevelTitle = 'kycSecondLevelTitle';
  static const kycThirdLevelTitle = 'kycThirdLevelTitle';
  static const kycFourthLevelTitle = 'kycFourLevelTitle';
  static const kycFirstLevelUncertifiedDesc = 'kycFirstLevelUncertifiedDesc';
  static const kycSecondLevelUncertifiedDesc = 'kycSecondLevelUncertifiedDesc';
  static const kycThirdLevelUncertifiedDesc = 'kycThirdLevelUncertifiedDesc';
  static const kycFourthLevelUncertifiedDesc = 'kycFourthLevelUncertifiedDesc';
  static const kycLevel1AuthenticationPrivilege =
      'kycLevel1AuthenticationPrivilege';
  static const kycLevel2AuthenticationPrivilege =
      'kycLevel2AuthenticationPrivilege';
  static const kycLevel3AuthenticationPrivilege =
      'kycLevel3AuthenticationPrivilege';
  static const kycLevel4AuthenticationPrivilege =
      'kycLevel4AuthenticationPrivilege';
  static const kycLastLevelAuthenticationPrivilegeDecs =
      'kycLastLevelAuthenticationPrivilegeDecs';
  static const kycOtherLevelAuthenticationPrivilegeDecs =
      'kycOtherLevelAuthenticationPrivilegeDecs';
  static const kycName = 'kycName';
  static const kycNameHint = 'kycNameHint';
  static const kycNameRemind = 'kycNameRemind';
  static const kycId = 'kycId';
  static const kycIdHint = 'kycIdHint';
  static const kycIdRemind = 'kycIdRemind';
  static const kycMustSees = 'kycMustSees';
  static const kycLevel1Sees1 = 'kycLevel1Sees1';
  static const kycLevel1Sees2 = 'kycLevel1Sees2';
  static const kycLevel1Sees3 = 'kycLevel1Sees3';
  static const kycLevel1Sees4 = 'kycLevel1Sees4';
  static const kycPrivilegesAtThisLevel = 'kycPrivilegesAtThisLevel';
  static const kycPrivilegedItems1 = 'kycPrivilegedItems1';
  static const kycPrivilegedItems2 = 'kycPrivilegedItems2';
  static const kycPrivilegedItems2_1 = 'kycPrivilegedItems2_1';
  static const kycPrivilegedItems3 = 'kycPrivilegedItems3';
  static const kycPrivilegedItems3_1 = 'kycPrivilegedItems3_1';
  static const kycLevel2Sees1 = 'kycLevel2Sees1';
  static const kycLevel2Sees2 = 'kycLevel2Sees2';
  static const kycLevel2Sees3 = 'kycLevel2Sees3';
  static const kycLevel2Sees4 = 'kycLevel2Sees4';
  static const kycLevel3Sees1 = 'kycLevel3Sees1';
  static const kycLevel3Sees2 = 'kycLevel3Sees2';
  static const kycLevel3Sees3 = 'kycLevel3Sees3';
  static const kycLevel3Sees4 = 'kycLevel3Sees4';
  static const kycLevel3Sees5 = 'kycLevel3Sees5';
  static const kycLevel4Sees1 = 'kycLevel4Sees1';
  static const kycLevel4Sees2 = 'kycLevel4Sees2';
  static const kycLevel4Sees3 = 'kycLevel4Sees3';
  static const kycLevel4Sees4 = 'kycLevel4Sees4';
  static const kycLevel4Sees5 = 'kycLevel4Sees5';
  static const kycReviewDecs = 'kycReviewDecs';

  static const multimediaRemind = 'multimediaRemind';
  static const camera = 'camera';
  static const album = 'album';
  static const photo = 'photo';
  static const video = 'video';

  static const loginActivity = 'loginActivity';
  static const securityActivity = 'securityActivity';
  static const keepActivityRecord = 'keepActivityRecord';

  /// 成功
  static const success = 'success';
  static const fail = 'fail';
  static const failReason = 'failReason';
  static const date = 'date';
  static const platform = 'platform';
  static const deviceModel = 'deviceModel';
  static const location = 'location';
  static const ipAddress = 'ipAddress';
  static const mineTerms = 'mineTerms';
  static const mineService = 'mineService';
  static const minePrivate = 'minePrivate';
  static const mineFAQ = 'mineFAQ';
  static const deviceWarning = 'deviceWarning';
  static const currentDevice = 'currentDevice';
  static const lastLogin = 'lastLogin';
  static const loginLocation = 'loginLocation';
  static const sureToDeleteDevice = 'sureToDeleteDevice';
  static const sureToDeleteCurrentDevice = 'sureToDeleteCurrentDevice';
  static const banAccountWarning = 'banAccountWarning';
  static const banAccountContent = 'banAccountContent';
  static const banAccountDesc = 'banAccountDesc';
  static const banThisAccount = 'banThisAccount';
  static const sureToBanAccount = 'sureToBanAccount';
  static const all = 'all';
  static const inProgress = 'inProgress';
  static const completed = 'completed';
  static const cancelled = 'Cancelled';
  static const bound = 'bound';
  static const orderTime = 'orderTime';
  static const orderPrice = 'orderPrice';
  static const orderUnitPrice = 'orderUnitPrice';
  static const orderRateFee = 'orderRateFee';
  static const orderGasFee = 'orderGasFee';
  static const orderSerialNumber = 'orderSerialNumber';
  static const transferAmount = 'transferAmount';
  static const beneficiary = 'beneficiary';
  static const remark = 'remark';
  static const payer = 'payer';
  static const transferToAccount = 'transferToAccount';
  static const transferFrom = 'transferFrom';
  static const receivePaymentAmount = 'receivePaymentAmount';
  static const paymentAmount = 'paymentAmount';
  static const withdrawalSelectAddressNote = 'withdrawalSelectAddressNote';
  static const withdrawalAmount = 'withdrawalAmount';
  static const minimumWithdrawalAmount = 'minimumWithdrawalAmount';
  static const appToRestartTips = 'appToRestartTips';
  static const withdrawalAmountInputHint = 'withdrawalAmountInputHint';
  static const transferAmountInputHint = 'transferAmountInputHint';
  static const depositAmount = 'depositAmount';
  static const blockchainTransactionID = 'blockchainTransactionID';
  static const blockchainAddress = 'blockchainAddress';
  static const blockchainHash = 'blockchainHash';
  static const arrivalAmount = 'arrivalAmount';
  static const withdrawalAddress = 'withdrawalAddress';
  static const paymentSuccess = 'paymentSuccess';
  static const receivePaymentSuccess = 'receivePaymentSuccess';
  static const transferReview = 'transferReview';
  static const transferSuccess = 'transferSuccess';
  static const transferGo = 'transferGo';
  static const transferFailed = 'transferFailed';
  static const depositSuccess = 'depositSuccess';
  static const withdrawReject = 'withdrawReject';
  static const withdrawSuccess = 'withdrawSuccess';
  static const withdrawWait = 'withdrawWait';
  static const withdrawCancel = 'withdrawCancel';
  static const withdrawReview = 'withdrawReview';
  static const buyCoinSuccess = 'buyCoinSuccess';
  static const buyCoinWait = 'buyCoinWait';
  static const buyCoinFailed = 'buyCoinFailed';

  static const paymentReview = 'paymentReview';
  static const quotaImportSuccess = 'quotaImportSuccess';
  static const orderEmptyData = 'orderEmptyData';
  static const subtitleReceivePaymentSuccess = 'subtitleReceivePaymentSuccess';
  static const subtitlePaymentSuccess = 'subtitlePaymentSuccess';
  static const subtitleTransferReview = 'subtitleTransferReview';
  static const subtitleTransferOutSuccess = 'subtitleTransferOutSuccess';
  static const subtitleTransferInSuccess = 'subtitleTransferInSuccess';
  static const subtitleDepositSuccess = 'subtitleDepositSuccess';
  static const subtitleWithdrawReject = 'subtitleWithdrawReject';
  static const subtitleWithdrawSuccess = 'subtitleWithdrawSuccess';
  static const subtitleWithdrawWait = 'subtitleWithdrawWait';
  static const subtitleWithdrawCancel = 'subtitleWithdrawCancel';
  static const subtitleWithdrawReview = 'subtitleWithdrawReview';
  static const subtitleQuotaImportSuccess = 'subtitleQuotaImportSuccess';
  static const subtitleBuyCoinFailed = 'subtitleBuyCoinFailed';
  static const subtitleBuyCoinWait = 'subtitleBuyCoinWait';
  static const subtitleBuyCoinSuccess = 'subtitleBuyCoinSuccess';
  static const googleVerifyVeryImportantNote = 'googleVerifyVeryImportantNote';
  static const googleVerifyCopyPrivateKey = 'googleVerifyCopyPrivateKey';
  static const hintPasswordInput = 'hintPasswordInput';

  /// 输入的手机号码不正确
  static const hintPhoneIncorrect = 'hintPhoneIncorrect';

  /// 持卡人信息，可不同于DCBox账号
  static const cardholderPhoneRemind = 'cardholderPhoneRemind';
  static const hintPleaseInputValidPhoneNumber =
      'hintPleaseInputValidPhoneNumber';
  static const hintVerifyCodeIncorrect = 'hintVerifyCodeIncorrect';
  static const hintMailIncorrect = 'hintMailIncorrect';
  static const sureToLogout = 'sureToLogout';
  static const withdrawalReminder = 'withdrawalReminder';
  static const withdrawalCurrency = 'withdrawalCurrency';
  static const selectWithdrawalCurrency = 'selectWithdrawalCurrency';
  static const searchWithdrawalCurrency = 'searchWithdrawalCurrency';
  static const noData = 'noData';
  static const withdrawableAmount = 'withdrawableAmount';
  static const handlingFee = 'handlingFee';
  static const tapToSelect = 'tapToSelect';
  static const internalTransferTip = 'internalTransferTip';
  static const transferCurrency = 'transferCurrency';
  static const selectTransferCurrency = 'selectTransferCurrency';
  static const transferAmountNum = 'transferAmountNum';
  static const accountsReceivable = 'accountsReceivable';
  static const inputGkAccounts = 'inputGkAccounts';
  static const transferWhitelist = 'transferWhitelist';
  static const noAddAddress = 'noAddAddress';
  static const addAddress = 'addAddress';
  static const scanAddressStatusNotEnabled = 'scanAddressStatusNotEnabled';
  static const scanAddressStatusNotGk = 'scanAddressStatusNotGk';
  static const scanAddressStatusNotExist = 'scanAddressStatusNotExist';
  static const selectAddress = 'selectAddress';
  static const addWhitelistNeedSwitchOn = 'addWhitelistNeedSwitchOn';
  static const addWhitelist = 'addWhitelist';
  static const addWhitelist2 = 'addWhitelist2';
  static const addWhitelistReview = 'addWhitelistReview';
  static const addressNotValid = 'addressNotValid';
  static const customerService = 'customerService';
  static const confirmToDeleteWhitelist = 'confirmToDeleteWhitelist';
  static const addressNickname = 'addressNickname';
  static const hintAddressNickname = 'hintAddressNickname';
  static const selectCurrency2 = 'selectCurrency2';
  static const hintSelectCurrency = 'hintSelectCurrency';
  static const selectProtocol2 = 'selectProtocol2';
  static const hintSelectProtocol = 'hintSelectProtocol';
  static const assetAddress = 'assetAddress';
  static const hintAssetAddress = 'hintAssetAddress';
  static const assetAddressSource = 'assetAddressSource';
  static const selectAssetAddressSourceOther = 'selectAssetAddressSourceOther';
  static const hintAssetAddressSource = 'hintAssetAddressSource';
  static const hintTradeSelectPayType = 'hintTradeSelectPayType';
  static const tradePayTypeBottomSheetTitle = 'tradePayTypeBottomSheetTitle';
  static const hintSearchAssetAddressSource = 'hintSearchAssetAddressSource';
  static const hintOtherAssetAddressSource = 'hintOtherAssetAddressSource';
  static const otherAssetAddressSource = 'otherAssetAddressSource';
  static const exchangeIsLack = 'exchangeIsLack';
  static const exchangeIsLackDialogContent = 'exchangeIsLackDialogContent';
  static const addWhitelistNote = 'addWhitelistNote';
  static const faceId = 'faceId';
  static const fingerprintId = 'fingerprintId';
  static const actionFaceId = 'actionFaceId';
  static const actionFingerprintId = 'actionFingerprintId';
  static const actionBiometric = 'actionBiometric';
  static const biometricDescription = 'biometricDescription';
  static const deviceBiometricNotOpen = 'deviceBiometricNotOpen';
  static const navTitleOrder = 'navTitleOrder';
  static const navTitleSafeVerify = 'navTitleSafeVerify';
  static const navTitleModifyLoginPassword = 'navTitleModifyLoginPassword';
  static const navTitleForgetPassword = 'navTitleForgetPassword';
  static const navTitleMigrateRegister = 'navTitleMigrateRegister';

  /// 设置手机
  static const navTitleSettingPhone = 'navTitleSettingPhone';
  static const navTitleSettingMail = 'navTitleSettingMail';
  static const navTitleGoogleVerify = 'navTitleGoogleVerify';
  static const navTitleOrderDetail = 'navTitleOrderDetail';
  static const navTitleSliderCaptcha = 'navTitleSliderCaptcha';
  static const toastModifyLoginPasswordSuccess =
      'toastModifyLoginPasswordSuccess';
  static const toastFirstSettingPhoneNumberSuccess =
      'toastFirstPhoneNumberSuccess';
  static const toastFirstSettingMailSuccess = 'toastFirstSettingMailSuccess';
  static const toastNewAndOriginPasswordCanNotTheSame =
      'toastNewAndOriginPasswordCanNotTheSame';
  static const toastAccountProhibitedTransfer =
      'toastAccountProhibitedTransfer';
  static const toastInvalidQRCodePhoto = 'toastInvalidQRCodePhoto';
  static const toastPleaseTryAgainInOneMinute =
      'toastPleaseTryAgainInOneMinute';
  static const dialogPhoneAndMailVerificationMustOne =
      'dialogPhoneAndMailVerificationMustOne';
  static const dialogWantToUnbindGoogleVerification =
      'dialogWantToUnbindGoogleVerification';
  static const dialogDidAddPrivateKeyToGoogleAuthenticator =
      'dialogDidAddPrivateKeyToGoogleAuthenticator';
  static const dialogWantToDeleteOrderRecord = 'dialogWantToDeleteOrderRecord';
  static const dialogDCBoxLoginResetPassword = 'dialogDCBoxLoginResetPassword';
  static const dialogDCBoxLoginResetPasswordHightlight =
      'dialogDCBoxLoginResetPasswordHightlight';
  static const dialogSettingOTPVerifyBeforeAction =
      'dialogSettingOTPVerifyBeforeAction';
  static const dialogSettingKycBeforeAction = 'dialogSettingKycBeforeAction';
  static const dialogAddWhitelistNeedSwitchOn =
      'dialogAddWhitelistNeedSwitchOn';
  static const upgradeVersion = 'upgradeVersion';
  static const upgrade = 'upgrade';
  static const alreadyLatestVersion = 'alreadyLatestVersion';
  static const gkPocketPayment = 'gkPocketPayment';
  static const payingTo = 'PayingTo';
  static const balance = 'Balance';
  static const balanceNotEnough = 'BalanceNotEnough';
  static const qrCodeScanner = 'QRCodeScanner';
  static const toBeContinue = 'toBeContinue';
  static const sendFailed = 'sendFailed';
  static const verifyFailed = 'verifyFailed';
  static const updateSuccess = 'updateSuccess';
  static const updateFailed = 'updateFailed';
  static const unknownFailure = 'unknownFailure';

  /// 压缩失败
  static const compressionFailed = 'compressionFailed';
  static const notMember = 'notMember';
  static const transferToSelfTip = 'transferToSelfTip';
  static const addSuccess = 'addSuccess';
  static const addFailed = 'addFailed';
  static const unknown = 'unknown';
  static const expenses = 'expenses';
  static const income = 'income';
  static const tradeBuy = 'tradeBuy';
  static const tradeSell = 'tradeSell';
  static const notCorrectAddress = 'notCorrectAddress';
  static const addressFormatError = 'addressFormatError';
  static const errorDecodeDataFormat = 'errorDecodeDataFormat';

  /// 系统错误，请稍后再试。
  static const errorServiceError = 'errorServiceError';

  /// 系统重启，请稍后再试。
  static const errorServiceReset = 'errorServiceReset';

  static const willReceiveSms = 'willReceiveSms';
  static const replySmsDescPrefix = 'replySmsDescPrefix';
  static const replySmsDescSuffix = 'replySmsDescSuffix';
  static const smsResend = 'smsResend';
  static const toColon = 'toColon';

  /// 我已完成回复
  static const didSendFinish = 'didSendFinish';
  static const replySmsNotifyEnd = 'replySmsNotifyEnd';
  static const biometric = 'biometric';
  static const userRechargeBannedForever = 'userRechargeBannedForever';
  static const userRechargeBannedTemporarily = 'userRechargeBannedTemporarily';
  static const temporarilyBannedDueToPasswordChange =
      'temporarilyBannedDueToPasswordChange';
  static const userTransferBannedForever = 'userTransferBannedForever';
  static const userTransferBannedTemporarily = 'userTransferBannedTemporarily';
  static const userWithdrawBannedForever = 'userWithdrawBannedForever';
  static const userWithdrawBannedTemporarily = 'userWithdrawBannedTemporarily';
  static const userWithdrawBanned = 'userWithdrawBanned';
  static const verificationCodeLogin = 'verificationCodeLogin';
  static const lockedPageVerificationFailed = 'lockedPageVerificationFailed';
  static const lockPageBiometricsNotSet = 'lockPageBiometricsNotSet';
  static const multipleVerificationFailures = 'multipleVerificationFailures';
  static const systemNotEnrolled = 'systemNotEnrolled';
  static const replySmsSMSVerification = 'replySmsSMSVerification';
  static const replySMSVerificationDesc = 'replySMSVerificationDesc';
  static const unBindPhoneFailed = 'unBindPhoneFailed';
  static const bindSuccess = 'bindSuccess';
  static const migrateSuccessReLogin = 'migrateSuccessReLogin';
  static const invalidQRCode = 'invalidQRCode';
  static const verificationCodeError = 'verificationCodeError';
  static const refreshHeaderTitleIdle = 'refreshHeaderTitleIdle';
  static const refreshHeaderTitleReleaseToRefresh =
      'refreshHeaderTitleReleaseToRefresh';
  static const refreshHeaderTitleRefreshing = 'refreshHeaderTitleRefreshing';
  static const refreshHeaderTitleComplete = 'refreshHeaderTitleComplete';
  static const addressAlreadyAdd = 'addressAlreadyAdd';
  static const openSetting = 'openSetting';
  static const depositAddressRefreshRemain = 'depositAddressRefreshRemain';
  static const dragRightToCompletionCaptcha = 'dragRightToCompletionCaptcha';
  static const captchaSuccess = 'captchaSuccess';
  static const captchaFailure = 'captchaFailure';
  static const mustLargerThan = 'mustLargerThan';

  static const remindLoginText = 'remindLoginText';
  static const remindLoginDescription = 'remindLoginDescription';

  static const quantityOfOrderIn24h = 'quantityOfOrderIn24h';
  static const turnoverIn24h = 'turnoverIn24h';
  static const notLoggedIn = 'notLoggedIn';

  static const reviewPasswordContent = 'reviewPasswordContent';

  static const selectCountry = 'selectCountry';
  static const search = 'search';

  /// '请输入@verificationType 收到的6位验证码'
  static const verificationInputTitle = 'verificationInputTitle';
  static const googleVerificationAppInput = 'googleVerificationAppInput';

  /// '谷歌验证器'
  static const googleVerificationApp = 'googleVerificationApp';

  /// 信用卡 开始
  static const creditCardDeposit = 'creditCardDeposit';
  static const creditCardDepositHistory = 'creditCardDepositHistory';
  static const creditCardPleaseKeyIn = 'creditCardPleaseKeyIn';
  static const creditCardBalance = 'creditCardBalance';
  static const creditCardDepositAmount = 'creditCardDepositAmount';
  static const creditCardDepositAmountLimit = 'creditCardDepositAmountLimit';
  static const creditCardAvailableBalance = 'creditCardAvailableBalance';
  static const creditCardReceivableAmount = 'creditCardReceivableAmount';
  static const creditCardFee = 'creditCardFee';
  static const creditCardDepositTime = 'creditCardDepositTime';
  static const creditCardDepositStatus = 'creditCardDepositStatus';
  static const creditCardPleaseConfirmDeposit =
      'creditCardPleaseConfirmDeposit';
  static const creditCardDepositTips = 'creditCardDepositTips';
  static const creditCardDepositAuditing = 'creditCardDepositAuditing';
  static const creditCardDepositPending = 'creditCardDepositPending';
  static const creditCardDepositFinished = 'creditCardDepositFinished';
  static const creditCardDepositFailed = 'creditCardDepositFailed';
  static const creditCardMinDepositAmount = 'creditCardMinDepositAmount';

  /// '开卡费用

  static const applyCardFee = 'applyCardFee';

  /// 点击继续，完成申请

  static const clickToContinueApplying = 'clickToContinueApplying';

  /// 点击继续，重新认证

  static const clickToContinueReverify = 'clickToContinueReverify';

  /// 点击继续，重新上传

  static const clickToContinueUploadAgain = 'clickToContinueUploadAgain';

  /// 点击继续

  static const clickToContinue = 'clickToContinue';

  /// 资料审核中

  static const infoUnderReview = 'infoUnderReview';

  /// 将于24小时内完成

  static const willBeCompletedWithin24Hours = 'willBeCompletedWithin24Hours';

  /// 卡片激活中，请稍后

  static const cardIsBeingActivatedPleaseWait =
      'cardIsBeingActivatedPleaseWait';

  /// KYC认证失败

  static const kycVerificationFailed = 'kycVerificationFailed';

  /// 补充上传照片资料

  static const supplementaryUploadPhotoInformation =
      'supplementaryUploadPhotoInformation';

  /// 照片资料不清晰

  static const photoDataIsNotClear = 'photoDataIsNotClear';

  /// 激活扣费失败

  static const activationFeeDeductionFailed = 'activationFeeDeductionFailed';

  /// 请充币后，点击继续

  static const pleaseRechargeAndClickContinue =
      'pleaseRechargeAndClickContinue';

  /// 激活中

  static const activating = 'activating';

  /// '申请开卡

  static const applyCard = 'applyCard';

  /// DCBox万事达预付费卡

  static const masterCardFeeTitle = 'masterCardFeeTitle';

  /// - 卡片月费：

  static const cardMonthlyFee = 'cardMonthlyFee';

  /// 卡片CVV码：

  static const cardCvvCode = 'cardCvvCode';

  /// 卡片ACS码：

  static const cardAcsCode = 'cardAcsCode';

  /// 查看卡片密码

  static const showCardPassword = 'showCardPassword';

  /// 用途：卡片绑定，线上消费

  static const cardDialogContent = 'cardDialogContent';

  /// 注：不要将任何一个密码告知他人

  static const cardDialogRemind = 'cardDialogRemind';

  /// 卡片挂失后\n将无法充值，以及查看卡信息

  static const cardReportLostInfo = 'cardReportLostInfo';

  /// 卡片已挂失\n是否需要解除卡片挂失

  static const cancelCardReportedLostInfo = 'cancelCardReportedLostInfo';

  /// DCBox@cardName预付费卡

  static const debitCardBackInfo = 'debitCardBackInfo';

  /// 万事达

  static const cardNameMaster = 'cardNameMaster';

  /// 银联

  static const cardNameUnionPay = 'cardNameUnionPay';

  /// 查看资费

  static const tapShowFee = 'tapShowFee';

  /// 点击查看正面

  static const tapTurnToFront = 'tapTurnToFront';

  /// 点击查看背面

  static const tapTurnToBack = 'tapTurnToBack';

  /// 有效期至

  static const validityPeriod = 'validityPeriod';

  /// 继续

  static const continue1 = 'continue1';

  /// 男
  static const male = 'male';

  /// 女
  static const female = 'female';

  /// 图片信息不合格，请重新上传
  static const cardHolderImageUnqualified = 'cardHolderImageUnqualified';

  /// 提交成功
  static const messageSubmitted = 'messageSubmitted';

  /// 人脸自拍照片
  static const faceSelfiePhoto = 'faceSelfiePhoto';

  /// 要求面部清晰
  static const requireFacialClarity = 'requireFacialClarity';

  /// 护照信息页拍照
  static const takePhotoOfPassportInformationPage =
      'takePhotoOfPassportInformationPage';

  /// 示例
  static const example = 'example';

  /// 护照信息
  static const passportInformation = 'passportInformation';

  /// 上传护照信息页
  static const uploadPassportInformationPage = 'uploadPassportInformationPage';

  /// 拍照标题
  static const takePhotoVerityTitle = 'takePhotoVerityTitle';

  /// 完善持卡人信息
  static const completeCardholderInformation = 'completeCardholderInformation';

  /// 使用卡片
  static const useCards = 'useCards';

  /// 使用买卖币交易
  static const useTrade = 'useTrade';

  /// 挂失成功
  static const lossReportedSuccessfully = 'lossReportedSuccessfully';

  /// 解除挂失成功
  static const unreportedLossSuccessfully = 'unreportedLossSuccessfully';

  /// 卡片状态异常，请联系客服
  static const debitCardErrorDescription = 'debitCardErrorDescription';

  /// 卡片充值
  static const cardRecharge = 'cardRecharge';

  /// 提币权限被禁用，无法充值
  static const unableToRecharge = 'unableToRecharge';

  /// 金额
  static const amount_1 = 'amount_1';

  /// 账单
  static const bill = 'bill';

  /// 卡片余额
  static const cardBalance = 'cardBalance';

  /// cvv安全码
  static const cvvSecurityCode = 'cvvSecurityCode';

  /// 解除挂失
  static const releaseLossReport = 'releaseLossReport';

  /// 卡片挂失
  static const reportLostCard = 'reportLostCard';

  /// 资费/权益
  static const tariffPrivilege = 'tariffPrivilege';

  /// 开卡费用将在开卡成功后扣除\n届时若余额不足，卡片将无法激活
  static const submitCardOpeningApplicationDescription =
      'submitCardOpeningApplicationDescription';

  /// 总计扣费：
  static const cardOpeningFee = 'cardOpeningFee';

  /// 扣费成功
  static const deductionSuccessful = 'deductionSuccessful';

  /// 当前余额：
  static const currentBalance = 'currentBalance';

  /// 权益与须知：
  static const benefitsAndNotices = 'benefitsAndNotices';

  /// 卡片充值费率
  static const cardRechargeRate = 'cardRechargeRate';

  /// 日消费限额
  static const dailyConsumptionLimit = 'dailyConsumptionLimit';

  /// 日充值限额
  static const dailyRechargeLimit = 'dailyRechargeLimit';

  /// 月充值限额
  static const monthlyRechargeLimit = 'monthlyRechargeLimit';

  /// 卡片余额上限
  static const cardBalanceLimit = 'cardBalanceLimit';

  /// 使用方法
  static const instructions = 'instructions';

  /// 消费场景
  static const consumptionScene = 'consumptionScene';

  static const bindInfos = 'bindInfos';

  /// 先充值@currency到卡片，充值费率@rate%
  static const debitDepositInfo = 'debitDepositInfo';

  /// 请输入您的手机号码
  static const pleaseEnterYourPhoneNumber = 'pleaseEnterYourPhoneNumber';

  /// 绑定持卡人信息

  static const bindCardHolderInfo = 'bindCardHolderInfo';

  /// 请确认提交信息无误\n提交的护照照片需与KYC相同\n否则会影响卡片审核
  static const submitCardholderInfoRemind = 'submitCardholderInfoRemind';

  /// 卡片已卡片挂失，请先解除挂失
  static const lostRemind = 'lostRemind';

  /// 账户余额不足
  static const insufficientAccountBalance = 'insufficientAccountBalance';

  ///请将面部移入框内
  static const pleaseMoveFaceIntoScope = 'pleaseMoveFaceIntoScope';

  ///请将护照置于框内
  static const pleaseMovePassportIntoScope = 'pleaseMovePassportIntoScope';

  ///打开相机失败
  static const openCameraFail = 'openCameraFail';

  static const tradePayTitle = 'tradePayTitle';
  static const tradeReceiveTitle = 'tradeReceiveTitle';
  static const tradePayTypeTitle = 'tradePayTypeTitle';
  static const tradeMinimumTransaction = 'tradeMinimumTransaction';
  static const tradeOrderDetailTitle = 'tradeOrderDetailTitle';
  static const tradeProcessingFeeTitle = 'tradeProcessingFeeTitle';
  static const tradeNetworkFeeTitle = 'tradeNetworkFeeTitle';
  static const tradeLowest = 'tradeLowest';
  static const tradeOrderDetail = 'tradeOrderDetail';

  static const aboutServiceText = 'aboutServiceText';
  static const aboutPrivateText = 'aboutPrivateText';

  static const faq1Title = 'faq1Title';
  static const faq1SubTitle1 = 'faq1SubTitle1';
  static const faq1SubTitle2 = 'faq1SubTitle2';
  static const faq1SubTitle3 = 'faq1SubTitle3';
  static const faq1SubTitle4 = 'faq1SubTitle4';
  static const faq1SubTitle5 = 'faq1SubTitle5';
  static const faq1Content1 = 'faq1Content1';
  static const faq1Content2 = 'faq1Content2';
  static const faq1Content3 = 'faq1Content3';
  static const faq1Content4 = 'faq1Content4';
  static const faq1Content5 = 'faq1Content5';

  static const faq2Title = 'faq2Title';
  static const faq2SubTitle1 = 'faq2SubTitle1';
  static const faq2SubTitle2 = 'faq2SubTitle2';
  static const faq2SubTitle3 = 'faq2SubTitle3';
  static const faq2SubTitle4 = 'faq2SubTitle4';
  static const faq2SubTitle5 = 'faq2SubTitle5';
  static const faq2SubTitle6 = 'faq2SubTitle6';
  static const faq2SubTitle7 = 'faq2SubTitle7';
  static const faq2SubTitle8 = 'faq2SubTitle8';
  static const faq2Content1 = 'faq2Content1';
  static const faq2Content2 = 'faq2Content2';
  static const faq2Content3 = 'faq2Content3';
  static const faq2Content4 = 'faq2Content4';
  static const faq2Content5 = 'faq2Content5';
  static const faq2Content6 = 'faq2Content6';
  static const faq2Content7 = 'faq2Content7';
  static const faq2Content8 = 'faq2Content8';

  static const faq3Title = 'faq3Title';
  static const faq3SubTitle1 = 'faq3SubTitle1';
  static const faq3SubTitle2 = 'faq3SubTitle2';
  static const faq3SubTitle3 = 'faq3SubTitle3';
  static const faq3SubTitle4 = 'faq3SubTitle4';
  static const faq3Content1 = 'faq3Content1';
  static const faq3Content2 = 'faq3Content2';
  static const faq3Content3 = 'faq3Content3';
  static const faq3Content4 = 'faq3Content4';

  static const faq4Title = 'faq4Title';
  static const faq4SubTitle1 = 'faq4SubTitle1';
  static const faq4SubTitle2 = 'faq4SubTitle2';
  static const faq4SubTitle3 = 'faq4SubTitle3';
  static const faq4SubTitle4 = 'faq4SubTitle4';
  static const faq4Content1 = 'faq4Content1';
  static const faq4Content2 = 'faq4Content2';
  static const faq4Content3 = 'faq4Content3';
  static const faq4Content4 = 'faq4Content4';
  static const minimumTransferAmountNum = 'minimumTransferAmountNum';
  static const tradePayTypeLimit = 'tradePayTypeLimit';
  static const tradeCreateOrderSuccess = 'tradeCreateOrderSuccess';
}
