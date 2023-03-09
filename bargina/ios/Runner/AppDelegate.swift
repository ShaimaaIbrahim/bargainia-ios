import UIKit
import Flutter
import SafariServices

@UIApplicationMain
@objc class AppDelegate : FlutterAppDelegate , SFSafariViewControllerDelegate, UIAdaptivePresentationControllerDelegate, PKPaymentAuthorizationViewControllerDelegate, OPPThreeDSEventListener, UINavigationControllerDelegate {

    var brand:String = ""

    var checkoutID:String = ""
    //var cardHolder:String = ""
    //var cardNumber:String = ""
    //var expiryMonth:String = ""
    //var expiryYear:String = ""
    //var cvv:String = ""

    /// Apple pay specific args.
    var countryCode:String = ""
    var currencyCode:String = ""
    var appleMerchantId:String = ""
    var label:String = ""
    var amount:Double = 0.0

    var transaction:OPPTransaction?
    var paymentResult: FlutterResult?
    var safariVC:SFSafariViewController?
    var navigationController: UINavigationController!

    /// The URL that redirects the user back to the application after authroization is complete.
    var shopperResultURL:String = ""

    /// The payment mode could either be `TEST` or `LIVE`.
    var paymentMode:String = ""

    /// A suffix added to the bundle ID of the client's app to form a complete `shopperResultURL`.
    let shopperResultURLSuffix = ".payments://result"



    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {



        let controller = window?.rootViewController as! FlutterViewController

        GeneratedPluginRegistrant.register(with: self)

            // create and then add a new UINavigationController
            self.navigationController = UINavigationController(rootViewController: controller)
            self.window.rootViewController = self.navigationController
            self.navigationController.setNavigationBarHidden(true, animated: false)
            self.window.makeKeyAndVisible()

        let batteryChannel = FlutterMethodChannel(name:"com.app.bargina",binaryMessenger:controller.binaryMessenger)

        batteryChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // This method is invoked on the UI thread.


            self?.paymentResult = result

            let args = call.arguments as! Dictionary<String, Any>


            if(call.method == "start_payment_transaction"){


                let args = call.arguments as! Dictionary<String, Any>


                let checkoutID = args["checkoutID"] as! String
                let cardHolder = args["holderName"] as! String
                let cardNumber = args["cardNumber"] as! String
                let expiryMonth = args["expiryMonth"] as! String
                let expiryYear = args["expiryYear"] as! String
                let cvv = args["CVV"] as! String
                let brand = args["brand"] as! String

                //var params : OPPPaymentParams

                var provider:OPPPaymentProvider = OPPPaymentProvider(mode: OPPProviderMode.live)

                do {
                   var params = try OPPCardPaymentParams(checkoutID: checkoutID, paymentBrand: brand, holder: cardHolder, number: cardNumber, expiryMonth: expiryMonth, expiryYear: expiryYear, cvv: cvv)

                    // Set shopper result URL
                    params.shopperResultURL =   Bundle.main.bundleIdentifier!  + ".payments://result"

                    let transaction = OPPTransaction(paymentParams: params)


                    provider.threeDSEventListener = self

                    provider.submitTransaction(transaction) { (transaction, error) in

                        if transaction.type == .asynchronous {
                            // Open transaction.redirectURL in Safari browser to complete the transaction
                            result("async")
                            UIApplication.shared.open(transaction.redirectURL!)
                        } else if transaction.type == .synchronous {
                            // Send request to your server to obtain transaction status
                            result("sync")

                        }
                        else if (transaction.threeDS2Info != nil){


                                              result("success")
                                          }
                        else {
                            // Handle the error
                            //result("error")
                            result(
                                                    FlutterError(
                                                        code: "0.2",
                                                        message: error?.localizedDescription,
                                                        details: ""
                                                    )
                                                )
                        }
                    }

                } catch let error as NSError {
                    // See error.code (OPPErrorCode) and error.localizedDescription to identify the reason of failure
                }
            } else if(call.method == "start_payment_apple"){

                self?.checkoutID = args["checkoutID"] as! String
                let appleMerchantId = args["appleMerchantId"] as! String
                let countryCode = args["countryCode"] as! String
                let currencyCode = args["currencyCode"] as! String
                let amount = args["amount"] as! Double


        let oPPPaymentProvider = OPPPaymentProvider.paymentRequest(withMerchantIdentifier: appleMerchantId, countryCode: countryCode)

        // Set currency.
        oPPPaymentProvider.currencyCode = currencyCode

        // Create total item. Label should represent your company.
        // It will be prepended with the word "Pay" (i.e. "Pay Sportswear $100.00")
       // let amounty = NSDecimalNumber(mantissa: amount, exponent: -2, isNegative: false)
          oPPPaymentProvider.paymentSummaryItems = [PKPaymentSummaryItem(label: "Bargainia", amount: NSDecimalNumber(value: amount))]

          //  let request = PKPaymentRequest()

          if OPPPaymentProvider.canSubmitPaymentRequest(oPPPaymentProvider) {
              if let vc = PKPaymentAuthorizationViewController(paymentRequest: oPPPaymentProvider) as PKPaymentAuthorizationViewController? {
                  vc.delegate = self
                  UIApplication.shared.windows.first?.rootViewController?.present(vc, animated: true, completion: nil)
              } else {
                  NSLog("Apple Pay not supported.");
              }
          }
            }
            else{
                result(FlutterMethodNotImplemented)

            }
        })

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)

    }

    //OPPThreeDSEventListener protocol methods
    public func onThreeDSChallengeRequired(completion: @escaping (UINavigationController) -> Void) {
        completion(self.navigationController!)
     }

        func onThreeDSConfigRequired(completion: @escaping (OPPThreeDSConfig) -> Void) {
            let config = OPPThreeDSConfig()
            completion(config)
        }


    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {

         var provider:OPPPaymentProvider = OPPPaymentProvider(mode: OPPProviderMode.live)

        if let params = try? OPPApplePayPaymentParams(checkoutID: self.checkoutID, tokenData: payment.token.paymentData) as OPPApplePayPaymentParams? {

            params.shopperResultURL = Bundle.main.bundleIdentifier! + self.shopperResultURLSuffix

            provider.threeDSEventListener = self

            provider.submitTransaction(OPPTransaction(paymentParams: params), completionHandler: { (transaction, error) in
                if (error != nil) {
                    // See code attribute (OPPErrorCode) and NSLocalizedDescription to identify the reason of failure.
                    completion(.failure)
                    NSLog("logs \(error?.localizedDescription)")
                    self.paymentResult?(error?.localizedDescription)

                } else {
                    // Send request to your server to obtain transaction status.
                    completion(.success)
                    self.paymentResult?("sync")
                }
             })
        }
    }

    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        self.paymentResult!("canceled")
        controller.dismiss(animated: true, completion: nil)
    }


    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        self.paymentResult!("canceled")
    }

    public func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        self.paymentResult!("canceled")
    }




    @objc func didReceiveAsynchronousPaymentCallback(result: @escaping FlutterResult) {
        NotificationCenter.default.removeObserver(
            self,
            name: Notification.Name(rawValue: "AsyncPaymentCompletedNotificationKey"),
            object: nil
        )

        self.safariVC?.dismiss(animated: true) {
            DispatchQueue.main.async {
                result("success")
            }
        }

    }

}
