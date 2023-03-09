import 'dart:convert';
/// lang : "ar"
/// order : {"ship_name":"بارجينيا","pay_name":"مدي","id":275,"orderid":275,"payment_date":"2021-06-15","ship_date":null,"pay_status":1,"type":1}
/// pay_address : {"id":58,"type":0,"customer_id":96,"company":"home","bank_name":"ahli","account_number":"878787878787","full_name_third":"test test est","street":"street","city_id":1,"state":"state","postal_code":"214578","country_id":75,"default":0,"_token":null,"created_at":"2021-04-17 11:30:13","updated_at":"2022-02-28 16:29:34","deleted_at":null,"country":"السعودية","city":null}
/// ship_address : {"id":144,"type":1,"customer_id":96,"company":"home","bank_name":null,"account_number":null,"full_name_third":null,"street":"street","city_id":78,"state":"state","postal_code":"214578","country_id":75,"default":1,"_token":null,"created_at":"2022-02-27 09:23:27","updated_at":"2022-05-19 21:49:24","deleted_at":null,"country":"السعودية","city":"جدة"}
/// order_detail : {"seller_firstname":"marina","seller_lastname":"marinamarina","discount_amount":"0","width":1,"weight":1,"height":1,"amount_before_discount":"1.05","shipping_amount":0,"final_amount":"1.05","final_amount_after_discount":"1.05","id":404,"order_id":275,"product_id":386,"product_count":1,"price_before":"1","price_after":"1.05","amount":"1.05","points":0,"_token":"","created_at":"2021-06-15 17:48:49","updated_at":"2021-06-15 17:48:49","deleted_at":null,"cat_name":"هواتف","product_name":"ايفون 12","product_inputs":[[{"id":2,"dname":"وحدة الذاكرة","classfield":"Ram","required":null,"type":"Selectbox","help":null,"options":[{"id":1,"field_id":2,"value_ar":"1GB","value_en":"1GB","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 18:21:31","updated_at":"2021-02-19 18:21:31","deleted_at":null},{"id":2,"field_id":2,"value_ar":"2GB","value_en":"2GB","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 18:21:59","updated_at":"2021-02-19 18:21:59","deleted_at":null},{"id":48,"field_id":2,"value_ar":"3GB","value_en":"3GB","_token":null,"created_at":"2021-07-17 14:56:53","updated_at":"2021-07-17 14:56:53","deleted_at":null},{"id":62,"field_id":2,"value_ar":"4GB","value_en":"4GB","_token":null,"created_at":"2021-12-21 12:32:30","updated_at":"2021-12-21 12:32:30","deleted_at":null},{"id":63,"field_id":2,"value_ar":"5GB","value_en":"5GB","_token":null,"created_at":"2021-12-21 12:32:45","updated_at":"2021-12-21 12:32:45","deleted_at":null},{"id":64,"field_id":2,"value_ar":"6GB","value_en":"6GB","_token":null,"created_at":"2021-12-21 12:33:10","updated_at":"2021-12-21 12:33:10","deleted_at":null},{"id":65,"field_id":2,"value_ar":"8GB","value_en":"8GB","_token":null,"created_at":"2021-12-21 12:35:28","updated_at":"2021-12-21 12:35:28","deleted_at":null},{"id":66,"field_id":2,"value_ar":"12GB","value_en":"12GB","_token":null,"created_at":"2021-12-21 12:35:54","updated_at":"2021-12-21 12:35:54","deleted_at":null},{"id":67,"field_id":2,"value_ar":"16GB","value_en":"16GB","_token":null,"created_at":"2021-12-21 12:36:17","updated_at":"2021-12-21 12:36:17","deleted_at":null},{"id":68,"field_id":2,"value_ar":"32GB","value_en":"32GB","_token":null,"created_at":"2021-12-21 12:36:57","updated_at":"2021-12-21 12:36:57","deleted_at":null},{"id":69,"field_id":2,"value_ar":"64GB","value_en":"64GB","_token":null,"created_at":"2021-12-21 12:37:14","updated_at":"2021-12-21 12:37:14","deleted_at":null},{"id":70,"field_id":2,"value_ar":"128GB","value_en":"128GB","_token":null,"created_at":"2021-12-21 12:37:30","updated_at":"2021-12-21 12:37:30","deleted_at":null},{"id":71,"field_id":2,"value_ar":"512GB","value_en":"512GB","_token":null,"created_at":"2021-12-21 12:37:43","updated_at":"2021-12-21 12:37:43","deleted_at":null}]},{"id":4,"dname":"الالوان","classfield":"colors","required":1,"type":"Text","help":null,"options":[{"id":4,"field_id":4,"value_ar":"اسود","value_en":"black","_token":null,"created_at":"2020-09-30 15:25:06","updated_at":"2020-09-30 15:25:06","deleted_at":null},{"id":25,"field_id":4,"value_ar":"الاخضر الغامق","value_en":"Midnight Green","_token":"jCJ2RslDXsEDHgue1pPuvcEMT322QnCz1QP2e98L","created_at":"2021-04-17 12:00:40","updated_at":"2021-04-17 12:00:40","deleted_at":null},{"id":31,"field_id":4,"value_ar":"فضي","value_en":"Silver","_token":null,"created_at":"2021-03-02 23:20:22","updated_at":"2021-03-02 23:20:22","deleted_at":null},{"id":32,"field_id":4,"value_ar":"ذهبي","value_en":"Gold","_token":null,"created_at":"2021-03-02 23:38:11","updated_at":"2021-03-02 23:38:11","deleted_at":null},{"id":34,"field_id":4,"value_ar":"بنفسجي","value_en":"purple","_token":null,"created_at":"2021-04-17 15:08:10","updated_at":"2021-04-17 15:08:10","deleted_at":null},{"id":35,"field_id":4,"value_ar":"أصفر","value_en":"yellow","_token":null,"created_at":"2021-04-17 15:08:45","updated_at":"2021-04-17 15:08:45","deleted_at":null},{"id":36,"field_id":4,"value_ar":"ابيض","value_en":"white","_token":null,"created_at":"2021-04-17 15:08:57","updated_at":"2021-04-17 15:08:57","deleted_at":null},{"id":37,"field_id":4,"value_ar":"الأزرق السلمي","value_en":"pacific Blue","_token":null,"created_at":"2021-04-17 15:16:28","updated_at":"2021-04-17 15:16:28","deleted_at":null},{"id":38,"field_id":4,"value_ar":"اسود","value_en":"Phantom Black","_token":null,"created_at":"2021-04-18 10:51:10","updated_at":"2021-04-18 10:51:10","deleted_at":null},{"id":39,"field_id":4,"value_ar":"رمادي","value_en":"Phantom Gray","_token":null,"created_at":"2021-04-18 10:51:40","updated_at":"2021-04-18 10:51:40","deleted_at":null},{"id":40,"field_id":4,"value_ar":"الرمادي الكوني","value_en":"Cosmic Gray","_token":null,"created_at":"2021-04-18 10:52:38","updated_at":"2021-04-18 10:52:38","deleted_at":null},{"id":49,"field_id":4,"value_ar":"أزرق","value_en":"blue","_token":null,"created_at":"2021-07-26 08:41:53","updated_at":"2021-07-26 08:41:53","deleted_at":null},{"id":51,"field_id":4,"value_ar":"اخضر","value_en":"Green","_token":null,"created_at":"2021-08-11 08:15:04","updated_at":"2021-08-11 08:15:04","deleted_at":null},{"id":52,"field_id":4,"value_ar":"dream Glow","value_en":"dream Glow","_token":null,"created_at":"2021-08-28 03:52:03","updated_at":"2021-08-28 03:52:03","deleted_at":null},{"id":53,"field_id":4,"value_ar":"الاحمر","value_en":"Red","_token":null,"created_at":"2021-09-26 02:34:33","updated_at":"2021-09-26 02:34:33","deleted_at":null},{"id":54,"field_id":4,"value_ar":"Titanium Sapphire","value_en":"Titanium Sapphire","_token":null,"created_at":"2021-09-26 03:15:37","updated_at":"2021-09-26 03:15:37","deleted_at":null},{"id":55,"field_id":4,"value_ar":"OCEAN WAVE","value_en":"OCEAN WAVE","_token":null,"created_at":"2021-09-27 00:44:07","updated_at":"2021-09-27 00:44:07","deleted_at":null},{"id":56,"field_id":4,"value_ar":"Morandi Green","value_en":"Morandi Green","_token":null,"created_at":"2021-09-27 01:00:34","updated_at":"2021-09-27 01:00:34","deleted_at":null},{"id":57,"field_id":4,"value_ar":"رمادي","value_en":"Graphite Grey","_token":null,"created_at":"2021-09-28 04:19:41","updated_at":"2021-09-28 04:19:41","deleted_at":null},{"id":58,"field_id":4,"value_ar":"Power black","value_en":"Power black","_token":null,"created_at":"2021-09-28 04:39:30","updated_at":"2021-09-28 04:39:30","deleted_at":null},{"id":59,"field_id":4,"value_ar":"رمادي","value_en":"Grey","_token":null,"created_at":"2021-10-10 18:23:41","updated_at":"2021-10-10 18:23:41","deleted_at":null}]},{"id":5,"dname":"حالة البطاريه","classfield":"Battery information","required":1,"type":"Text","help":"percentage of battery","options":[{"id":5,"field_id":5,"value_ar":"سكرين 1","value_en":"screen 1","_token":null,"created_at":"2020-09-30 17:19:46","updated_at":"2020-09-30 17:19:46","deleted_at":null},{"id":6,"field_id":5,"value_ar":"سكرين 2","value_en":"screen 2","_token":null,"created_at":"2020-09-30 17:19:57","updated_at":"2020-09-30 17:19:57","deleted_at":null}]},{"id":6,"dname":"كاميرا","classfield":"camers","required":null,"type":"Selectbox","help":null,"options":[{"id":7,"field_id":6,"value_ar":"1.2 MP","value_en":"1.2MP","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 16:55:37","updated_at":"2021-02-19 16:55:37","deleted_at":null},{"id":8,"field_id":6,"value_ar":"5MP","value_en":"5MP","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 16:56:34","updated_at":"2021-02-19 16:56:34","deleted_at":null},{"id":9,"field_id":6,"value_ar":"7MP","value_en":"7MP","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 16:57:02","updated_at":"2021-02-19 16:57:02","deleted_at":null},{"id":19,"field_id":6,"value_ar":"8MP","value_en":"8MP","_token":null,"created_at":"2021-02-19 17:06:46","updated_at":"2021-02-19 17:06:46","deleted_at":null},{"id":20,"field_id":6,"value_ar":"10MP","value_en":"10MP","_token":null,"created_at":"2021-02-19 17:06:58","updated_at":"2021-02-19 17:06:58","deleted_at":null},{"id":21,"field_id":6,"value_ar":"12MP","value_en":"12MP","_token":null,"created_at":"2021-02-19 17:07:03","updated_at":"2021-02-19 17:07:03","deleted_at":null},{"id":22,"field_id":6,"value_ar":"16MP","value_en":"16MP","_token":null,"created_at":"2021-02-19 17:07:14","updated_at":"2021-02-19 17:07:14","deleted_at":null},{"id":23,"field_id":6,"value_ar":"24MP","value_en":"24MP","_token":null,"created_at":"2021-02-19 17:07:30","updated_at":"2021-02-19 17:07:30","deleted_at":null},{"id":41,"field_id":6,"value_ar":"40MP","value_en":"40MP","_token":"DjcdRKeCutQ33IjMKnTBstSWzDxlGqrTeZwAbapg","created_at":"2021-04-18 11:16:14","updated_at":"2021-04-18 11:16:14","deleted_at":null},{"id":42,"field_id":6,"value_ar":"64MP","value_en":"64MP","_token":null,"created_at":"2021-04-18 11:18:23","updated_at":"2021-04-18 11:18:23","deleted_at":null},{"id":46,"field_id":6,"value_ar":"48MP","value_en":"48MP","_token":null,"created_at":"2021-07-14 12:29:23","updated_at":"2021-07-14 12:29:23","deleted_at":null},{"id":47,"field_id":6,"value_ar":"13MP","value_en":"13MP","_token":null,"created_at":"2021-07-14 13:12:25","updated_at":"2021-07-14 13:12:25","deleted_at":null}]},{"id":7,"dname":"المساحة","classfield":"Memory","required":1,"type":"Selectbox","help":null,"options":[{"id":10,"field_id":7,"value_ar":"32G","value_en":"32G","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 16:59:11","updated_at":"2021-02-19 16:59:11","deleted_at":null},{"id":11,"field_id":7,"value_ar":"64G","value_en":"64G","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 16:59:25","updated_at":"2021-02-19 16:59:25","deleted_at":null},{"id":12,"field_id":7,"value_ar":"128G","value_en":"128G","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 17:01:51","updated_at":"2021-02-19 17:01:51","deleted_at":null},{"id":15,"field_id":7,"value_ar":"256G","value_en":"256G","_token":null,"created_at":"2021-02-19 16:57:50","updated_at":"2021-02-19 16:57:50","deleted_at":null},{"id":16,"field_id":7,"value_ar":"512G","value_en":"512G","_token":null,"created_at":"2021-02-19 16:58:25","updated_at":"2021-02-19 16:58:25","deleted_at":null},{"id":50,"field_id":7,"value_ar":"16GB","value_en":"16GB","_token":null,"created_at":"2021-07-26 09:05:06","updated_at":"2021-07-26 09:05:06","deleted_at":null}]},{"id":11,"dname":"المتبقي من فترة الضمان","classfield":"Warranty period (months)","required":null,"type":"Text","help":"كم شهر متبقي في الضمان","options":[]},{"id":12,"dname":"الوكيل","classfield":"Warranted by","required":null,"type":"Text","help":"الوكيل في المملكه العربيه السعوديه","options":[]}]]}
/// fee : {"id":1,"name":"شركة بارجينيا","phone":"0565753161","mobile_no":null,"email":"noreply@bargainia.com.sa","address":"جدة","logo":"tmpphpd9rc5j.png","fb":"https://www.facebook.com/Bargainia.com.sa/","tweeter":"https://twitter.com/bargainia","insta":"https://www.instagram.com/bargainia.com.sa/","google":null,"youtube":null,"longtute":"149.5710983929677","latitute":"33.43399308961885","lang":3,"_token":"9zXmqf29sU2bRMVTiWw8xnZHvDMY1EmNI7eVSWR6","created_at":"2020-09-22 17:39:20","updated_at":"2022-04-14 14:12:12","deleted_at":null,"meta_tag":"شركة بارجينيا","name_en":"Bargainia Company","address_en":null,"meta_tag_en":"Bargainia","contact_email":"admin@bargainia.com.sa","link_map":null,"status_email":0,"logo_en":"tmpphpajxblm.png","logo_fav":"exampptmpphpa3f1tmp.png","otp":0,"expire_day":0,"fee":"0","return_back":2,"introduce_message_ar":"بارجينيا الأن في جدة","introduce_message_en":"Bargainia is now in Jeddah only","email_send_seller":10,"ship_price_out":50,"ship_price_gada":0,"ship_price_gada_offer":0,"ship_price_out_offer":30,"cupon_active":1,"local_product":1,"mail_warning_ar":"منتجكم قضى 7 أيام ولم يباع بإمكانك تعديل سعره الى سعر منافس للغير                                              ","mail_warning_en":"<blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><pre class=\"tw-data-text tw-text-large XcVN5d tw-ta\" data-placeholder=\"الترجمة\" id=\"tw-target-text\" dir=\"ltr\" style=\"unicode-bidi: isolate; font-size: 28px; line-height: 36px; background-color: rgb(248, 249, 250); border: none; padding: 2px 0px 2px 0.14em; position: relative; margin-top: -2px; margin-bottom: -2px; resize: none; font-family: inherit; overflow: hidden; text-align: left; width: 270px; white-space: pre-wrap; overflow-wrap: break-word; color: rgb(32, 33, 36);\"><pre class=\"tw-data-text tw-text-large XcVN5d tw-ta\" data-placeholder=\"الترجمة\" id=\"tw-target-text\" dir=\"ltr\" style=\"text-align: left; unicode-bidi: isolate; font-size: 28px; line-height: 36px; border: none; padding: 2px 0px 2px 0.14em; position: relative; margin-top: -2px; margin-bottom: -2px; resize: none; font-family: inherit; overflow: hidden; width: 270px; white-space: pre-wrap; overflow-wrap: break-word; color: rgb(32, 33, 36);\"><span style=\"font-family: Arial, Helvetica, sans-serif; text-align: right; white-space: normal; background-color: rgb(255, 255, 255);\">Your product has spent 7 days and has not been sold. you can adjust the price on a competitive price.</span><br></pre></pre></blockquote>","mail_product_ar":"تم اضافة منتجكم بنجاح","mail_product_en":"Your product has been added successfully","seller_email_ar":"تم بيع المنتج الخاص بك عن طريق موقعنا بارجينيا","seller_email_en":"Your product sold successfully by our website Bargainia","sms_active":0,"barginia_fee":"5","text1":"الثقة","text2":"الدفع الأمن","text3":"الشحن","text4":"لا للخردة والمكسور","text5":"<h3 class=\"content_header\">الثقة</h3><p class=\"content_blurb\"></p><p>في Bargainia , تشتري وتبيع مباشرة مع مستخدمين آخرين.الاستغناء عن الوسيط يعني أنك تنضم إلى سوق مجتمعية بأفضل الأسعار وأعلى قيمة. </p><p></p>","text6":"<h3 class=\"content_header\">لا للخردة والمكسور</h3><p class=\"content_blurb\"></p><p>للحفاظ على أمان سوقنا , لا نسمح بالعناصر المكسورة. كل منتج لديه متطلبات قائمة وعملية موافقة لضمان تسوق موثوق. </p><p></p>","text1_en":"Confidence","text2_en":"Safe payment","text3_en":"Shipping","text4_en":"No junk, no broken","text5_en":"<h3 class=\"content_header\">Confidence</h3><p class=\"content_blurb\"></p><p>In Bargainia, you buy and sell directly with other users. Cutting out the middleman means you join a community marketplace at the best prices and highest value.</p><p></p>","text6_en":"<h3 class=\"content_header\">No junk, no broken</h3><p class=\"content_blurb\"></p><p>To keep our market safe, we do not allow broken items. Every product has requirements in place and approval process to ensure reliable shopping.</p><p></p>","stext1":"<h3 class=\"content_header\"> ما هي قيمة النموذج الخاص بي؟ </h3><div class=\"content_blurb\"><p> في Bargainia , يستحق الموديل 11 الخاص بك أكثر من عرض المقايضة لأنك تبيع مباشرة إلى مستخدم آخر. الاستغناء عن الوسيط يعني حصولك على أفضل سعر وأكبر قيمة. <!-- p--></p><p> هناك عدة عوامل تؤثر على سعر الطراز المستخدم , بما في ذلك التخزين والناقل والحالة. سيكون الطراز الذي يحتوي على 32 جيجا بايت من التخزين أرخص من الطراز الذي يحتوي على 128 جيجا بايت. سيكلف النموذج الجديد أكثر من النموذج المستخدم أو المجدد ؛ تتطلب حالة النعناع سعرًا أعلى من حالة جيدة وعادلة. عادةً ما تفرض النماذج غير المؤمَّنة وتلك الأكثر توافقًا أسعارًا أعلى من تلك التي يتم تأمينها لشركات اتصالات معينة. <!-- p--></p></div>","stext2":"<h3 class=\"content_header\"> احصل على مزيد من المعلومات حول جهازك بسرعة </h3><div class=\"content_blurb\"><p> تأكد من الاستفادة من <a href=\"/esn\" title=\"Apple IMEI check\"> فحص Apple IMEI </a> قبل إدراج الطراز الخاص بك للتأكد من أن معلومات جهازك بأكبر قدر ممكن من الدقة. <!-- p--></p></div>","stext3":"<h3 class=\"content_header\"> لماذا تبيع مع Bargainia ؟ </h3><p class=\"content_blurb\"><p> Bargainia هو سوق يعمل بالطاقة البشرية: <!-- p--></p><ul><li> البيع والشراء مباشرة لمستخدمي Bargainia الآخرين </li><li> لا يوجد شخص وسيط ​​بمعنى انك تحصل على أفضل الأسعار وأكثرها قيمة <!-- li--></li><li> مجتمع وليس مجرد سوق <!-- li--></li></ul></p>","stext4":"<h3 class=\"content_header\"> بيع نموذجك سهل ومجاني </h3><div class=\"content_blurb\"><p> تعد Bargainia الطريقة الأكثر أمانًا لبيع طراز Apple الخاص بك عبر الإنترنت والحصول على أموال بسرعة. في Bargainia , يمكنك الشراء والبيع مباشرة مع مستخدمين آخرين والاستغناء عن الوسيط يعني أنك تحصل على أفضل الأسعار عند البيع. <!-- p--></p><p> البيع على Bargainia دائمًا مجاني ويتم الدفع لك بمجرد بيع موديلك دون انتظار أموالك! يمنحك نظامنا المستند إلى PayPal أنت والمشتري حماية قوية وراحة البال أثناء البيع. <!-- p--></p></div>","stext5":"<h3 class=\"content_header\"> أموال أكثر من التجارة </h3><div class=\"content_blurb\"><p> يعني البيع على Bargainia أنك تحصل على أموال مقابل ما يستحقه نموذجك بالفعل , وهذا أكثر مما تقدمه أي من مواقع التجارة. بالإضافة إلى ذلك , عندما تقوم بالإدراج في Bargainia , يتم الدفع لك فورًا بمجرد بيع موديلك القديم بدلاً من الانتظار لمدة أسبوع أو أكثر للحصول على شيك. <!-- p--></p></div>","stext6":"<h3 class=\"content_header\"> كيف أبيع جهازي</h3><p class=\"content_blurb\"><p> ابدأ بإدراج جهازك المعروض للبيع في Bargainia . سيُطلب منك إدخال بعض التفاصيل حول الجهاز وحالته , وتحميل بعض الصور واختيار السعر. يتم توفير بيانات تسعير الطراز المباع مؤخرًا حتى تتمكن من اختيار السعر بسرعة بناءً على اللون وحجم التخزين والمواصفات واتجاهات السوق. <!-- p--></p><p> بعد إرسال قائمتك , سيجري فريقنا فحصًا سريعًا للتأكد من أنك قدمت كل ما هو ضروري. بمجرد الموافقة عليها , تتم إضافة قائمتك إلى السوق حيث يمكن للمستخدمين الذين يبحثون عن نموذج ميسور التكلفة العثور عليها. <!-- p--></p></p>","stext7":"<h3 class=\"content_header\"> ادفع رسوم أقل واحصل على افضل قيمة </h3><p class=\"content_blurb\"><p> لا تفرض Bargainia رسومًا على البائع. يدفع المشترون رسومًا رمزية متضمنة في سعر البيع. انخفاض الرسوم يعني أن الجميع يوفرون المال مقارنة بالأسواق الأخرى. <!-- p--></p><p> لا تفرض Bargainia رسومًا على البائع. يدفع المشترون رسومًا رمزية متضمنة في سعر البيع. انخفاض الرسوم يعني أن الجميع يوفرون المال مقارنة بالأسواق الأخرى. <!-- p--></p></p>","stext8":null,"stext1_en":"<h3 class=\"content_header\">How much is my Model worth?</h3>\t\t\t<div class=\"content_blurb\">\t\t\t\t<p>On Bargainia your Model 11 is worth more than a trade-in offer because you sell directly to another user. Cutting out the middleman means you get the best price and the most value.</p><p>Several factors affect the price of a used Model, including storage, carrier, and condition. A Model with 32 GB of storage will be cheaper than one with 128 GB. A new Model will cost more than a used or refurbished Model; mint condition demands higher price than good and fair condition. Unlocked Model, and those more broadly compatible, usually command higher prices than those that are locked to specific carriers.</p>\t\t\t</div>","stext2_en":"<h3 class=\"content_header\">Get more information about your device quickly</h3>\t\t\t<div class=\"content_blurb\">\t\t\t\t<p>Make sure you to take advantage of our <a href=\"/esn\" title=\"Apple IMEI check\">Apple IMEI check</a> before listing your Model in order to make sure your device's information is as accurate as possible.</p>\t\t\t</div>","stext3_en":"<h3 class=\"content_header\">Why sell with Bargainia ?</h3>\t\t\t<div class=\"content_blurb\">\t\t\t\t<p>Bargainia is a human-powered marketplace:</p>\t\t\t\t\t<ul>\t\t\t\t\t<li>Buy and sell directly to other Bargainia users</li>\t\t\t\t\t<li>No middle person means the best prices and most value</li>\t\t\t\t\t<li>A community, not just a marketplace</li>\t\t\t\t\t</ul>\t\t\t</div>","stext4_en":"<h3 class=\"content_header\">Selling your Model is easy and free</h3>\t\t\t<div class=\"content_blurb\">\t\t\t\t<p>Bargainia is the safest way to sell your Apple Model online and get paid fast. On Bargainia , you buy and sell directly with other users and cutting out the middleman means you get the best prices when selling.</p><p>Selling on Bargainia is always free and you get paid as soon as your Model sells without waiting for your money! Our PayPal-based system also gives you and the buyer strong protections and peace of mind during a sale.</p>\t\t\t</div>","stext5_en":"<h3 class=\"content_header\">More money than trade-in</h3>\t\t\t<div class=\"content_blurb\">\t\t\t\t<p>Selling on Bargainia means you get paid what your Model is actually worth, and that's more than any of the trade-in sites are offering. Plus, when you list on Bargainia you get paid instantly as soon as your old Model sells rather than waiting a week or more for a check.</p>\t\t\t</div>","stext6_en":"<h3 class=\"content_header\">How to sell my Model</h3>\t\t\t<div class=\"content_blurb\">\t\t\t\t<p>Start by listing your Model for sale on Bargainia . You’ll be asked to enter a few details about the device and its condition, upload a few pictures, and choose a price. Recently sold Model pricing data is provided so you can quickly choose a price based on the color, storage size, specs, and market trends.</p><p>After you submit your listing, our team will do a quick check to make sure you have provided everything necessary. Once approved, your listing is added to the marketplace where users looking for an affordable Model can find it.</p>\t\t\t</div>","stext7_en":"<h3 class=\"content_header\">Pay less fees, pocket more cash</h3>\t\t\t<div class=\"content_blurb\">\t\t\t\t<p>Bargainia doesn't charge seller fees. Buyers pay a small fee that is included in the sale price. Fewer fees means everyone saves money over other markets.</p>\t\t\t\t<p>Bargainia doesn't charge seller fees. Buyers pay a small fee that is included in the sale price. Fewer fees means everyone saves money over other markets.</p>\t\t\t</div>","stext8_en":null,"apear_period_product":1,"like4card_fee":"5"}
/// order_history : [{"payment_date":"2021-06-15","type":1}]
/// status_return : false

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));
String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());
class OrderDetailsModel {
  OrderDetailsModel({
      String? lang, 
      Order? order, 
      PayAddress? payAddress, 
      ShipAddress? shipAddress, 
      OrderDetail? orderDetail, 
      Fee? fee, 
      List<OrderHistory>? orderHistory, 
      bool? statusReturn,}){
    _lang = lang;
    _order = order;
    _payAddress = payAddress;
    _shipAddress = shipAddress;
    _orderDetail = orderDetail;
    _fee = fee;
    _orderHistory = orderHistory;
    _statusReturn = statusReturn;
}

  OrderDetailsModel.fromJson(dynamic json) {
    _lang = json['lang'];
    _order = json['order'] != null ? Order.fromJson(json['order']) : null;
    _payAddress = json['pay_address'] != null ? PayAddress.fromJson(json['payAddress']) : null;
    _shipAddress = json['ship_address'] != null ? ShipAddress.fromJson(json['shipAddress']) : null;
    _orderDetail = json['order_detail'] != null ? OrderDetail.fromJson(json['orderDetail']) : null;
    _fee = json['fee'] != null ? Fee.fromJson(json['fee']) : null;
    if (json['order_history'] != null) {
      _orderHistory = [];
      json['order_history'].forEach((v) {
        _orderHistory?.add(OrderHistory.fromJson(v));
      });
    }
    _statusReturn = json['status_return'];
  }
  String? _lang;
  Order? _order;
  PayAddress? _payAddress;
  ShipAddress? _shipAddress;
  OrderDetail? _orderDetail;
  Fee? _fee;
  List<OrderHistory>? _orderHistory;
  bool? _statusReturn;

  String? get lang => _lang;
  Order? get order => _order;
  PayAddress? get payAddress => _payAddress;
  ShipAddress? get shipAddress => _shipAddress;
  OrderDetail? get orderDetail => _orderDetail;
  Fee? get fee => _fee;
  List<OrderHistory>? get orderHistory => _orderHistory;
  bool? get statusReturn => _statusReturn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lang'] = _lang;
    if (_order != null) {
      map['order'] = _order?.toJson();
    }
    if (_payAddress != null) {
      map['pay_address'] = _payAddress?.toJson();
    }
    if (_shipAddress != null) {
      map['ship_address'] = _shipAddress?.toJson();
    }
    if (_orderDetail != null) {
      map['order_detail'] = _orderDetail?.toJson();
    }
    if (_fee != null) {
      map['fee'] = _fee?.toJson();
    }
    if (_orderHistory != null) {
      map['order_history'] = _orderHistory?.map((v) => v.toJson()).toList();
    }
    map['status_return'] = _statusReturn;
    return map;
  }

}

/// payment_date : "2021-06-15"
/// type : 1

OrderHistory orderHistoryFromJson(String str) => OrderHistory.fromJson(json.decode(str));
String orderHistoryToJson(OrderHistory data) => json.encode(data.toJson());
class OrderHistory {
  OrderHistory({
      String? paymentDate, 
      int? type,}){
    _paymentDate = paymentDate;
    _type = type;
}

  OrderHistory.fromJson(dynamic json) {
    _paymentDate = json['payment_date'];
    _type = json['type'];
  }
  String? _paymentDate;
  int? _type;

  String? get paymentDate => _paymentDate;
  int? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['payment_date'] = _paymentDate;
    map['type'] = _type;
    return map;
  }

}

/// id : 1
/// name : "شركة بارجينيا"
/// phone : "0565753161"
/// mobile_no : null
/// email : "noreply@bargainia.com.sa"
/// address : "جدة"
/// logo : "tmpphpd9rc5j.png"
/// fb : "https://www.facebook.com/Bargainia.com.sa/"
/// tweeter : "https://twitter.com/bargainia"
/// insta : "https://www.instagram.com/bargainia.com.sa/"
/// google : null
/// youtube : null
/// longtute : "149.5710983929677"
/// latitute : "33.43399308961885"
/// lang : 3
/// _token : "9zXmqf29sU2bRMVTiWw8xnZHvDMY1EmNI7eVSWR6"
/// created_at : "2020-09-22 17:39:20"
/// updated_at : "2022-04-14 14:12:12"
/// deleted_at : null
/// meta_tag : "شركة بارجينيا"
/// name_en : "Bargainia Company"
/// address_en : null
/// meta_tag_en : "Bargainia"
/// contact_email : "admin@bargainia.com.sa"
/// link_map : null
/// status_email : 0
/// logo_en : "tmpphpajxblm.png"
/// logo_fav : "exampptmpphpa3f1tmp.png"
/// otp : 0
/// expire_day : 0
/// fee : "0"
/// return_back : 2
/// introduce_message_ar : "بارجينيا الأن في جدة"
/// introduce_message_en : "Bargainia is now in Jeddah only"
/// email_send_seller : 10
/// ship_price_out : 50
/// ship_price_gada : 0
/// ship_price_gada_offer : 0
/// ship_price_out_offer : 30
/// cupon_active : 1
/// local_product : 1
/// mail_warning_ar : "منتجكم قضى 7 أيام ولم يباع بإمكانك تعديل سعره الى سعر منافس للغير                                              "
/// mail_warning_en : "<blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><pre class=\"tw-data-text tw-text-large XcVN5d tw-ta\" data-placeholder=\"الترجمة\" id=\"tw-target-text\" dir=\"ltr\" style=\"unicode-bidi: isolate; font-size: 28px; line-height: 36px; background-color: rgb(248, 249, 250); border: none; padding: 2px 0px 2px 0.14em; position: relative; margin-top: -2px; margin-bottom: -2px; resize: none; font-family: inherit; overflow: hidden; text-align: left; width: 270px; white-space: pre-wrap; overflow-wrap: break-word; color: rgb(32, 33, 36);\"><pre class=\"tw-data-text tw-text-large XcVN5d tw-ta\" data-placeholder=\"الترجمة\" id=\"tw-target-text\" dir=\"ltr\" style=\"text-align: left; unicode-bidi: isolate; font-size: 28px; line-height: 36px; border: none; padding: 2px 0px 2px 0.14em; position: relative; margin-top: -2px; margin-bottom: -2px; resize: none; font-family: inherit; overflow: hidden; width: 270px; white-space: pre-wrap; overflow-wrap: break-word; color: rgb(32, 33, 36);\"><span style=\"font-family: Arial, Helvetica, sans-serif; text-align: right; white-space: normal; background-color: rgb(255, 255, 255);\">Your product has spent 7 days and has not been sold. you can adjust the price on a competitive price.</span><br></pre></pre></blockquote>"
/// mail_product_ar : "تم اضافة منتجكم بنجاح"
/// mail_product_en : "Your product has been added successfully"
/// seller_email_ar : "تم بيع المنتج الخاص بك عن طريق موقعنا بارجينيا"
/// seller_email_en : "Your product sold successfully by our website Bargainia"
/// sms_active : 0
/// barginia_fee : "5"
/// text1 : "الثقة"
/// text2 : "الدفع الأمن"
/// text3 : "الشحن"
/// text4 : "لا للخردة والمكسور"
/// text5 : "<h3 class=\"content_header\">الثقة</h3><p class=\"content_blurb\"></p><p>في Bargainia , تشتري وتبيع مباشرة مع مستخدمين آخرين.الاستغناء عن الوسيط يعني أنك تنضم إلى سوق مجتمعية بأفضل الأسعار وأعلى قيمة. </p><p></p>"
/// text6 : "<h3 class=\"content_header\">لا للخردة والمكسور</h3><p class=\"content_blurb\"></p><p>للحفاظ على أمان سوقنا , لا نسمح بالعناصر المكسورة. كل منتج لديه متطلبات قائمة وعملية موافقة لضمان تسوق موثوق. </p><p></p>"
/// text1_en : "Confidence"
/// text2_en : "Safe payment"
/// text3_en : "Shipping"
/// text4_en : "No junk, no broken"
/// text5_en : "<h3 class=\"content_header\">Confidence</h3><p class=\"content_blurb\"></p><p>In Bargainia, you buy and sell directly with other users. Cutting out the middleman means you join a community marketplace at the best prices and highest value.</p><p></p>"
/// text6_en : "<h3 class=\"content_header\">No junk, no broken</h3><p class=\"content_blurb\"></p><p>To keep our market safe, we do not allow broken items. Every product has requirements in place and approval process to ensure reliable shopping.</p><p></p>"
/// stext1 : "<h3 class=\"content_header\"> ما هي قيمة النموذج الخاص بي؟ </h3><div class=\"content_blurb\"><p> في Bargainia , يستحق الموديل 11 الخاص بك أكثر من عرض المقايضة لأنك تبيع مباشرة إلى مستخدم آخر. الاستغناء عن الوسيط يعني حصولك على أفضل سعر وأكبر قيمة. <!-- p--></p><p> هناك عدة عوامل تؤثر على سعر الطراز المستخدم , بما في ذلك التخزين والناقل والحالة. سيكون الطراز الذي يحتوي على 32 جيجا بايت من التخزين أرخص من الطراز الذي يحتوي على 128 جيجا بايت. سيكلف النموذج الجديد أكثر من النموذج المستخدم أو المجدد ؛ تتطلب حالة النعناع سعرًا أعلى من حالة جيدة وعادلة. عادةً ما تفرض النماذج غير المؤمَّنة وتلك الأكثر توافقًا أسعارًا أعلى من تلك التي يتم تأمينها لشركات اتصالات معينة. <!-- p--></p></div>"
/// stext2 : "<h3 class=\"content_header\"> احصل على مزيد من المعلومات حول جهازك بسرعة </h3><div class=\"content_blurb\"><p> تأكد من الاستفادة من <a href=\"/esn\" title=\"Apple IMEI check\"> فحص Apple IMEI </a> قبل إدراج الطراز الخاص بك للتأكد من أن معلومات جهازك بأكبر قدر ممكن من الدقة. <!-- p--></p></div>"
/// stext3 : "<h3 class=\"content_header\"> لماذا تبيع مع Bargainia ؟ </h3><p class=\"content_blurb\"><p> Bargainia هو سوق يعمل بالطاقة البشرية: <!-- p--></p><ul><li> البيع والشراء مباشرة لمستخدمي Bargainia الآخرين </li><li> لا يوجد شخص وسيط ​​بمعنى انك تحصل على أفضل الأسعار وأكثرها قيمة <!-- li--></li><li> مجتمع وليس مجرد سوق <!-- li--></li></ul></p>"
/// stext4 : "<h3 class=\"content_header\"> بيع نموذجك سهل ومجاني </h3><div class=\"content_blurb\"><p> تعد Bargainia الطريقة الأكثر أمانًا لبيع طراز Apple الخاص بك عبر الإنترنت والحصول على أموال بسرعة. في Bargainia , يمكنك الشراء والبيع مباشرة مع مستخدمين آخرين والاستغناء عن الوسيط يعني أنك تحصل على أفضل الأسعار عند البيع. <!-- p--></p><p> البيع على Bargainia دائمًا مجاني ويتم الدفع لك بمجرد بيع موديلك دون انتظار أموالك! يمنحك نظامنا المستند إلى PayPal أنت والمشتري حماية قوية وراحة البال أثناء البيع. <!-- p--></p></div>"
/// stext5 : "<h3 class=\"content_header\"> أموال أكثر من التجارة </h3><div class=\"content_blurb\"><p> يعني البيع على Bargainia أنك تحصل على أموال مقابل ما يستحقه نموذجك بالفعل , وهذا أكثر مما تقدمه أي من مواقع التجارة. بالإضافة إلى ذلك , عندما تقوم بالإدراج في Bargainia , يتم الدفع لك فورًا بمجرد بيع موديلك القديم بدلاً من الانتظار لمدة أسبوع أو أكثر للحصول على شيك. <!-- p--></p></div>"
/// stext6 : "<h3 class=\"content_header\"> كيف أبيع جهازي</h3><p class=\"content_blurb\"><p> ابدأ بإدراج جهازك المعروض للبيع في Bargainia . سيُطلب منك إدخال بعض التفاصيل حول الجهاز وحالته , وتحميل بعض الصور واختيار السعر. يتم توفير بيانات تسعير الطراز المباع مؤخرًا حتى تتمكن من اختيار السعر بسرعة بناءً على اللون وحجم التخزين والمواصفات واتجاهات السوق. <!-- p--></p><p> بعد إرسال قائمتك , سيجري فريقنا فحصًا سريعًا للتأكد من أنك قدمت كل ما هو ضروري. بمجرد الموافقة عليها , تتم إضافة قائمتك إلى السوق حيث يمكن للمستخدمين الذين يبحثون عن نموذج ميسور التكلفة العثور عليها. <!-- p--></p></p>"
/// stext7 : "<h3 class=\"content_header\"> ادفع رسوم أقل واحصل على افضل قيمة </h3><p class=\"content_blurb\"><p> لا تفرض Bargainia رسومًا على البائع. يدفع المشترون رسومًا رمزية متضمنة في سعر البيع. انخفاض الرسوم يعني أن الجميع يوفرون المال مقارنة بالأسواق الأخرى. <!-- p--></p><p> لا تفرض Bargainia رسومًا على البائع. يدفع المشترون رسومًا رمزية متضمنة في سعر البيع. انخفاض الرسوم يعني أن الجميع يوفرون المال مقارنة بالأسواق الأخرى. <!-- p--></p></p>"
/// stext8 : null
/// stext1_en : "<h3 class=\"content_header\">How much is my Model worth?</h3>\t\t\t<div class=\"content_blurb\">\t\t\t\t<p>On Bargainia your Model 11 is worth more than a trade-in offer because you sell directly to another user. Cutting out the middleman means you get the best price and the most value.</p><p>Several factors affect the price of a used Model, including storage, carrier, and condition. A Model with 32 GB of storage will be cheaper than one with 128 GB. A new Model will cost more than a used or refurbished Model; mint condition demands higher price than good and fair condition. Unlocked Model, and those more broadly compatible, usually command higher prices than those that are locked to specific carriers.</p>\t\t\t</div>"
/// stext2_en : "<h3 class=\"content_header\">Get more information about your device quickly</h3>\t\t\t<div class=\"content_blurb\">\t\t\t\t<p>Make sure you to take advantage of our <a href=\"/esn\" title=\"Apple IMEI check\">Apple IMEI check</a> before listing your Model in order to make sure your device's information is as accurate as possible.</p>\t\t\t</div>"
/// stext3_en : "<h3 class=\"content_header\">Why sell with Bargainia ?</h3>\t\t\t<div class=\"content_blurb\">\t\t\t\t<p>Bargainia is a human-powered marketplace:</p>\t\t\t\t\t<ul>\t\t\t\t\t<li>Buy and sell directly to other Bargainia users</li>\t\t\t\t\t<li>No middle person means the best prices and most value</li>\t\t\t\t\t<li>A community, not just a marketplace</li>\t\t\t\t\t</ul>\t\t\t</div>"
/// stext4_en : "<h3 class=\"content_header\">Selling your Model is easy and free</h3>\t\t\t<div class=\"content_blurb\">\t\t\t\t<p>Bargainia is the safest way to sell your Apple Model online and get paid fast. On Bargainia , you buy and sell directly with other users and cutting out the middleman means you get the best prices when selling.</p><p>Selling on Bargainia is always free and you get paid as soon as your Model sells without waiting for your money! Our PayPal-based system also gives you and the buyer strong protections and peace of mind during a sale.</p>\t\t\t</div>"
/// stext5_en : "<h3 class=\"content_header\">More money than trade-in</h3>\t\t\t<div class=\"content_blurb\">\t\t\t\t<p>Selling on Bargainia means you get paid what your Model is actually worth, and that's more than any of the trade-in sites are offering. Plus, when you list on Bargainia you get paid instantly as soon as your old Model sells rather than waiting a week or more for a check.</p>\t\t\t</div>"
/// stext6_en : "<h3 class=\"content_header\">How to sell my Model</h3>\t\t\t<div class=\"content_blurb\">\t\t\t\t<p>Start by listing your Model for sale on Bargainia . You’ll be asked to enter a few details about the device and its condition, upload a few pictures, and choose a price. Recently sold Model pricing data is provided so you can quickly choose a price based on the color, storage size, specs, and market trends.</p><p>After you submit your listing, our team will do a quick check to make sure you have provided everything necessary. Once approved, your listing is added to the marketplace where users looking for an affordable Model can find it.</p>\t\t\t</div>"
/// stext7_en : "<h3 class=\"content_header\">Pay less fees, pocket more cash</h3>\t\t\t<div class=\"content_blurb\">\t\t\t\t<p>Bargainia doesn't charge seller fees. Buyers pay a small fee that is included in the sale price. Fewer fees means everyone saves money over other markets.</p>\t\t\t\t<p>Bargainia doesn't charge seller fees. Buyers pay a small fee that is included in the sale price. Fewer fees means everyone saves money over other markets.</p>\t\t\t</div>"
/// stext8_en : null
/// apear_period_product : 1
/// like4card_fee : "5"

Fee feeFromJson(String str) => Fee.fromJson(json.decode(str));
String feeToJson(Fee data) => json.encode(data.toJson());
class Fee {
  Fee({
      int? id, 
      String? name, 
      String? phone, 
      dynamic mobileNo, 
      String? email, 
      String? address, 
      String? logo, 
      String? fb, 
      String? tweeter, 
      String? insta, 
      dynamic google, 
      dynamic youtube, 
      String? longtute, 
      String? latitute, 
      int? lang, 
      String? token, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      String? metaTag, 
      String? nameEn, 
      dynamic addressEn, 
      String? metaTagEn, 
      String? contactEmail, 
      dynamic linkMap, 
      int? statusEmail, 
      String? logoEn, 
      String? logoFav, 
      int? otp, 
      int? expireDay, 
      String? fee, 
      int? returnBack, 
      String? introduceMessageAr, 
      String? introduceMessageEn, 
      int? emailSendSeller, 
      int? shipPriceOut, 
      int? shipPriceGada, 
      int? shipPriceGadaOffer, 
      int? shipPriceOutOffer, 
      int? cuponActive, 
      int? localProduct, 
      String? mailWarningAr, 
      String? mailWarningEn, 
      String? mailProductAr, 
      String? mailProductEn, 
      String? sellerEmailAr, 
      String? sellerEmailEn, 
      int? smsActive, 
      String? barginiaFee, 
      String? text1, 
      String? text2, 
      String? text3, 
      String? text4, 
      String? text5, 
      String? text6, 
      String? text1En, 
      String? text2En, 
      String? text3En, 
      String? text4En, 
      String? text5En, 
      String? text6En, 
      String? stext1, 
      String? stext2, 
      String? stext3, 
      String? stext4, 
      String? stext5, 
      String? stext6, 
      String? stext7, 
      dynamic stext8, 
      String? stext1En, 
      String? stext2En, 
      String? stext3En, 
      String? stext4En, 
      String? stext5En, 
      String? stext6En, 
      String? stext7En, 
      dynamic stext8En, 
      int? apearPeriodProduct, 
      String? like4cardFee,}){
    _id = id;
    _name = name;
    _phone = phone;
    _mobileNo = mobileNo;
    _email = email;
    _address = address;
    _logo = logo;
    _fb = fb;
    _tweeter = tweeter;
    _insta = insta;
    _google = google;
    _youtube = youtube;
    _longtute = longtute;
    _latitute = latitute;
    _lang = lang;
    _token = token;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _metaTag = metaTag;
    _nameEn = nameEn;
    _addressEn = addressEn;
    _metaTagEn = metaTagEn;
    _contactEmail = contactEmail;
    _linkMap = linkMap;
    _statusEmail = statusEmail;
    _logoEn = logoEn;
    _logoFav = logoFav;
    _otp = otp;
    _expireDay = expireDay;
    _fee = fee;
    _returnBack = returnBack;
    _introduceMessageAr = introduceMessageAr;
    _introduceMessageEn = introduceMessageEn;
    _emailSendSeller = emailSendSeller;
    _shipPriceOut = shipPriceOut;
    _shipPriceGada = shipPriceGada;
    _shipPriceGadaOffer = shipPriceGadaOffer;
    _shipPriceOutOffer = shipPriceOutOffer;
    _cuponActive = cuponActive;
    _localProduct = localProduct;
    _mailWarningAr = mailWarningAr;
    _mailWarningEn = mailWarningEn;
    _mailProductAr = mailProductAr;
    _mailProductEn = mailProductEn;
    _sellerEmailAr = sellerEmailAr;
    _sellerEmailEn = sellerEmailEn;
    _smsActive = smsActive;
    _barginiaFee = barginiaFee;
    _text1 = text1;
    _text2 = text2;
    _text3 = text3;
    _text4 = text4;
    _text5 = text5;
    _text6 = text6;
    _text1En = text1En;
    _text2En = text2En;
    _text3En = text3En;
    _text4En = text4En;
    _text5En = text5En;
    _text6En = text6En;
    _stext1 = stext1;
    _stext2 = stext2;
    _stext3 = stext3;
    _stext4 = stext4;
    _stext5 = stext5;
    _stext6 = stext6;
    _stext7 = stext7;
    _stext8 = stext8;
    _stext1En = stext1En;
    _stext2En = stext2En;
    _stext3En = stext3En;
    _stext4En = stext4En;
    _stext5En = stext5En;
    _stext6En = stext6En;
    _stext7En = stext7En;
    _stext8En = stext8En;
    _apearPeriodProduct = apearPeriodProduct;
    _like4cardFee = like4cardFee;
}

  Fee.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _mobileNo = json['mobile_no'];
    _email = json['email'];
    _address = json['address'];
    _logo = json['logo'];
    _fb = json['fb'];
    _tweeter = json['tweeter'];
    _insta = json['insta'];
    _google = json['google'];
    _youtube = json['youtube'];
    _longtute = json['longtute'];
    _latitute = json['latitute'];
    _lang = json['lang'];
    _token = json['_token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _metaTag = json['meta_tag'];
    _nameEn = json['name_en'];
    _addressEn = json['address_en'];
    _metaTagEn = json['meta_tag_en'];
    _contactEmail = json['contact_email'];
    _linkMap = json['link_map'];
    _statusEmail = json['status_email'];
    _logoEn = json['logo_en'];
    _logoFav = json['logo_fav'];
    _otp = json['otp'];
    _expireDay = json['expire_day'];
    _fee = json['fee'];
    _returnBack = json['return_back'];
    _introduceMessageAr = json['introduce_message_ar'];
    _introduceMessageEn = json['introduce_message_en'];
    _emailSendSeller = json['email_send_seller'];
    _shipPriceOut = json['ship_price_out'];
    _shipPriceGada = json['ship_price_gada'];
    _shipPriceGadaOffer = json['ship_price_gada_offer'];
    _shipPriceOutOffer = json['ship_price_out_offer'];
    _cuponActive = json['cupon_active'];
    _localProduct = json['local_product'];
    _mailWarningAr = json['mail_warning_ar'];
    _mailWarningEn = json['mail_warning_en'];
    _mailProductAr = json['mail_product_ar'];
    _mailProductEn = json['mail_product_en'];
    _sellerEmailAr = json['seller_email_ar'];
    _sellerEmailEn = json['seller_email_en'];
    _smsActive = json['sms_active'];
    _barginiaFee = json['barginia_fee'];
    _text1 = json['text1'];
    _text2 = json['text2'];
    _text3 = json['text3'];
    _text4 = json['text4'];
    _text5 = json['text5'];
    _text6 = json['text6'];
    _text1En = json['text1_en'];
    _text2En = json['text2_en'];
    _text3En = json['text3_en'];
    _text4En = json['text4_en'];
    _text5En = json['text5_en'];
    _text6En = json['text6_en'];
    _stext1 = json['stext1'];
    _stext2 = json['stext2'];
    _stext3 = json['stext3'];
    _stext4 = json['stext4'];
    _stext5 = json['stext5'];
    _stext6 = json['stext6'];
    _stext7 = json['stext7'];
    _stext8 = json['stext8'];
    _stext1En = json['stext1_en'];
    _stext2En = json['stext2_en'];
    _stext3En = json['stext3_en'];
    _stext4En = json['stext4_en'];
    _stext5En = json['stext5_en'];
    _stext6En = json['stext6_en'];
    _stext7En = json['stext7_en'];
    _stext8En = json['stext8_en'];
    _apearPeriodProduct = json['apear_period_product'];
    _like4cardFee = json['like4card_fee'];
  }
  int? _id;
  String? _name;
  String? _phone;
  dynamic _mobileNo;
  String? _email;
  String? _address;
  String? _logo;
  String? _fb;
  String? _tweeter;
  String? _insta;
  dynamic _google;
  dynamic _youtube;
  String? _longtute;
  String? _latitute;
  int? _lang;
  String? _token;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  String? _metaTag;
  String? _nameEn;
  dynamic _addressEn;
  String? _metaTagEn;
  String? _contactEmail;
  dynamic _linkMap;
  int? _statusEmail;
  String? _logoEn;
  String? _logoFav;
  int? _otp;
  int? _expireDay;
  String? _fee;
  int? _returnBack;
  String? _introduceMessageAr;
  String? _introduceMessageEn;
  int? _emailSendSeller;
  int? _shipPriceOut;
  int? _shipPriceGada;
  int? _shipPriceGadaOffer;
  int? _shipPriceOutOffer;
  int? _cuponActive;
  int? _localProduct;
  String? _mailWarningAr;
  String? _mailWarningEn;
  String? _mailProductAr;
  String? _mailProductEn;
  String? _sellerEmailAr;
  String? _sellerEmailEn;
  int? _smsActive;
  String? _barginiaFee;
  String? _text1;
  String? _text2;
  String? _text3;
  String? _text4;
  String? _text5;
  String? _text6;
  String? _text1En;
  String? _text2En;
  String? _text3En;
  String? _text4En;
  String? _text5En;
  String? _text6En;
  String? _stext1;
  String? _stext2;
  String? _stext3;
  String? _stext4;
  String? _stext5;
  String? _stext6;
  String? _stext7;
  dynamic _stext8;
  String? _stext1En;
  String? _stext2En;
  String? _stext3En;
  String? _stext4En;
  String? _stext5En;
  String? _stext6En;
  String? _stext7En;
  dynamic _stext8En;
  int? _apearPeriodProduct;
  String? _like4cardFee;

  int? get id => _id;
  String? get name => _name;
  String? get phone => _phone;
  dynamic get mobileNo => _mobileNo;
  String? get email => _email;
  String? get address => _address;
  String? get logo => _logo;
  String? get fb => _fb;
  String? get tweeter => _tweeter;
  String? get insta => _insta;
  dynamic get google => _google;
  dynamic get youtube => _youtube;
  String? get longtute => _longtute;
  String? get latitute => _latitute;
  int? get lang => _lang;
  String? get token => _token;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String? get metaTag => _metaTag;
  String? get nameEn => _nameEn;
  dynamic get addressEn => _addressEn;
  String? get metaTagEn => _metaTagEn;
  String? get contactEmail => _contactEmail;
  dynamic get linkMap => _linkMap;
  int? get statusEmail => _statusEmail;
  String? get logoEn => _logoEn;
  String? get logoFav => _logoFav;
  int? get otp => _otp;
  int? get expireDay => _expireDay;
  String? get fee => _fee;
  int? get returnBack => _returnBack;
  String? get introduceMessageAr => _introduceMessageAr;
  String? get introduceMessageEn => _introduceMessageEn;
  int? get emailSendSeller => _emailSendSeller;
  int? get shipPriceOut => _shipPriceOut;
  int? get shipPriceGada => _shipPriceGada;
  int? get shipPriceGadaOffer => _shipPriceGadaOffer;
  int? get shipPriceOutOffer => _shipPriceOutOffer;
  int? get cuponActive => _cuponActive;
  int? get localProduct => _localProduct;
  String? get mailWarningAr => _mailWarningAr;
  String? get mailWarningEn => _mailWarningEn;
  String? get mailProductAr => _mailProductAr;
  String? get mailProductEn => _mailProductEn;
  String? get sellerEmailAr => _sellerEmailAr;
  String? get sellerEmailEn => _sellerEmailEn;
  int? get smsActive => _smsActive;
  String? get barginiaFee => _barginiaFee;
  String? get text1 => _text1;
  String? get text2 => _text2;
  String? get text3 => _text3;
  String? get text4 => _text4;
  String? get text5 => _text5;
  String? get text6 => _text6;
  String? get text1En => _text1En;
  String? get text2En => _text2En;
  String? get text3En => _text3En;
  String? get text4En => _text4En;
  String? get text5En => _text5En;
  String? get text6En => _text6En;
  String? get stext1 => _stext1;
  String? get stext2 => _stext2;
  String? get stext3 => _stext3;
  String? get stext4 => _stext4;
  String? get stext5 => _stext5;
  String? get stext6 => _stext6;
  String? get stext7 => _stext7;
  dynamic get stext8 => _stext8;
  String? get stext1En => _stext1En;
  String? get stext2En => _stext2En;
  String? get stext3En => _stext3En;
  String? get stext4En => _stext4En;
  String? get stext5En => _stext5En;
  String? get stext6En => _stext6En;
  String? get stext7En => _stext7En;
  dynamic get stext8En => _stext8En;
  int? get apearPeriodProduct => _apearPeriodProduct;
  String? get like4cardFee => _like4cardFee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['mobile_no'] = _mobileNo;
    map['email'] = _email;
    map['address'] = _address;
    map['logo'] = _logo;
    map['fb'] = _fb;
    map['tweeter'] = _tweeter;
    map['insta'] = _insta;
    map['google'] = _google;
    map['youtube'] = _youtube;
    map['longtute'] = _longtute;
    map['latitute'] = _latitute;
    map['lang'] = _lang;
    map['_token'] = _token;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    map['meta_tag'] = _metaTag;
    map['name_en'] = _nameEn;
    map['address_en'] = _addressEn;
    map['meta_tag_en'] = _metaTagEn;
    map['contact_email'] = _contactEmail;
    map['link_map'] = _linkMap;
    map['status_email'] = _statusEmail;
    map['logo_en'] = _logoEn;
    map['logo_fav'] = _logoFav;
    map['otp'] = _otp;
    map['expire_day'] = _expireDay;
    map['fee'] = _fee;
    map['return_back'] = _returnBack;
    map['introduce_message_ar'] = _introduceMessageAr;
    map['introduce_message_en'] = _introduceMessageEn;
    map['email_send_seller'] = _emailSendSeller;
    map['ship_price_out'] = _shipPriceOut;
    map['ship_price_gada'] = _shipPriceGada;
    map['ship_price_gada_offer'] = _shipPriceGadaOffer;
    map['ship_price_out_offer'] = _shipPriceOutOffer;
    map['cupon_active'] = _cuponActive;
    map['local_product'] = _localProduct;
    map['mail_warning_ar'] = _mailWarningAr;
    map['mail_warning_en'] = _mailWarningEn;
    map['mail_product_ar'] = _mailProductAr;
    map['mail_product_en'] = _mailProductEn;
    map['seller_email_ar'] = _sellerEmailAr;
    map['seller_email_en'] = _sellerEmailEn;
    map['sms_active'] = _smsActive;
    map['barginia_fee'] = _barginiaFee;
    map['text1'] = _text1;
    map['text2'] = _text2;
    map['text3'] = _text3;
    map['text4'] = _text4;
    map['text5'] = _text5;
    map['text6'] = _text6;
    map['text1_en'] = _text1En;
    map['text2_en'] = _text2En;
    map['text3_en'] = _text3En;
    map['text4_en'] = _text4En;
    map['text5_en'] = _text5En;
    map['text6_en'] = _text6En;
    map['stext1'] = _stext1;
    map['stext2'] = _stext2;
    map['stext3'] = _stext3;
    map['stext4'] = _stext4;
    map['stext5'] = _stext5;
    map['stext6'] = _stext6;
    map['stext7'] = _stext7;
    map['stext8'] = _stext8;
    map['stext1_en'] = _stext1En;
    map['stext2_en'] = _stext2En;
    map['stext3_en'] = _stext3En;
    map['stext4_en'] = _stext4En;
    map['stext5_en'] = _stext5En;
    map['stext6_en'] = _stext6En;
    map['stext7_en'] = _stext7En;
    map['stext8_en'] = _stext8En;
    map['apear_period_product'] = _apearPeriodProduct;
    map['like4card_fee'] = _like4cardFee;
    return map;
  }

}

/// seller_firstname : "marina"
/// seller_lastname : "marinamarina"
/// discount_amount : "0"
/// width : 1
/// weight : 1
/// height : 1
/// amount_before_discount : "1.05"
/// shipping_amount : 0
/// final_amount : "1.05"
/// final_amount_after_discount : "1.05"
/// id : 404
/// order_id : 275
/// product_id : 386
/// product_count : 1
/// price_before : "1"
/// price_after : "1.05"
/// amount : "1.05"
/// points : 0
/// _token : ""
/// created_at : "2021-06-15 17:48:49"
/// updated_at : "2021-06-15 17:48:49"
/// deleted_at : null
/// cat_name : "هواتف"
/// product_name : "ايفون 12"
/// product_inputs : [[{"id":2,"dname":"وحدة الذاكرة","classfield":"Ram","required":null,"type":"Selectbox","help":null,"options":[{"id":1,"field_id":2,"value_ar":"1GB","value_en":"1GB","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 18:21:31","updated_at":"2021-02-19 18:21:31","deleted_at":null},{"id":2,"field_id":2,"value_ar":"2GB","value_en":"2GB","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 18:21:59","updated_at":"2021-02-19 18:21:59","deleted_at":null},{"id":48,"field_id":2,"value_ar":"3GB","value_en":"3GB","_token":null,"created_at":"2021-07-17 14:56:53","updated_at":"2021-07-17 14:56:53","deleted_at":null},{"id":62,"field_id":2,"value_ar":"4GB","value_en":"4GB","_token":null,"created_at":"2021-12-21 12:32:30","updated_at":"2021-12-21 12:32:30","deleted_at":null},{"id":63,"field_id":2,"value_ar":"5GB","value_en":"5GB","_token":null,"created_at":"2021-12-21 12:32:45","updated_at":"2021-12-21 12:32:45","deleted_at":null},{"id":64,"field_id":2,"value_ar":"6GB","value_en":"6GB","_token":null,"created_at":"2021-12-21 12:33:10","updated_at":"2021-12-21 12:33:10","deleted_at":null},{"id":65,"field_id":2,"value_ar":"8GB","value_en":"8GB","_token":null,"created_at":"2021-12-21 12:35:28","updated_at":"2021-12-21 12:35:28","deleted_at":null},{"id":66,"field_id":2,"value_ar":"12GB","value_en":"12GB","_token":null,"created_at":"2021-12-21 12:35:54","updated_at":"2021-12-21 12:35:54","deleted_at":null},{"id":67,"field_id":2,"value_ar":"16GB","value_en":"16GB","_token":null,"created_at":"2021-12-21 12:36:17","updated_at":"2021-12-21 12:36:17","deleted_at":null},{"id":68,"field_id":2,"value_ar":"32GB","value_en":"32GB","_token":null,"created_at":"2021-12-21 12:36:57","updated_at":"2021-12-21 12:36:57","deleted_at":null},{"id":69,"field_id":2,"value_ar":"64GB","value_en":"64GB","_token":null,"created_at":"2021-12-21 12:37:14","updated_at":"2021-12-21 12:37:14","deleted_at":null},{"id":70,"field_id":2,"value_ar":"128GB","value_en":"128GB","_token":null,"created_at":"2021-12-21 12:37:30","updated_at":"2021-12-21 12:37:30","deleted_at":null},{"id":71,"field_id":2,"value_ar":"512GB","value_en":"512GB","_token":null,"created_at":"2021-12-21 12:37:43","updated_at":"2021-12-21 12:37:43","deleted_at":null}]},{"id":4,"dname":"الالوان","classfield":"colors","required":1,"type":"Text","help":null,"options":[{"id":4,"field_id":4,"value_ar":"اسود","value_en":"black","_token":null,"created_at":"2020-09-30 15:25:06","updated_at":"2020-09-30 15:25:06","deleted_at":null},{"id":25,"field_id":4,"value_ar":"الاخضر الغامق","value_en":"Midnight Green","_token":"jCJ2RslDXsEDHgue1pPuvcEMT322QnCz1QP2e98L","created_at":"2021-04-17 12:00:40","updated_at":"2021-04-17 12:00:40","deleted_at":null},{"id":31,"field_id":4,"value_ar":"فضي","value_en":"Silver","_token":null,"created_at":"2021-03-02 23:20:22","updated_at":"2021-03-02 23:20:22","deleted_at":null},{"id":32,"field_id":4,"value_ar":"ذهبي","value_en":"Gold","_token":null,"created_at":"2021-03-02 23:38:11","updated_at":"2021-03-02 23:38:11","deleted_at":null},{"id":34,"field_id":4,"value_ar":"بنفسجي","value_en":"purple","_token":null,"created_at":"2021-04-17 15:08:10","updated_at":"2021-04-17 15:08:10","deleted_at":null},{"id":35,"field_id":4,"value_ar":"أصفر","value_en":"yellow","_token":null,"created_at":"2021-04-17 15:08:45","updated_at":"2021-04-17 15:08:45","deleted_at":null},{"id":36,"field_id":4,"value_ar":"ابيض","value_en":"white","_token":null,"created_at":"2021-04-17 15:08:57","updated_at":"2021-04-17 15:08:57","deleted_at":null},{"id":37,"field_id":4,"value_ar":"الأزرق السلمي","value_en":"pacific Blue","_token":null,"created_at":"2021-04-17 15:16:28","updated_at":"2021-04-17 15:16:28","deleted_at":null},{"id":38,"field_id":4,"value_ar":"اسود","value_en":"Phantom Black","_token":null,"created_at":"2021-04-18 10:51:10","updated_at":"2021-04-18 10:51:10","deleted_at":null},{"id":39,"field_id":4,"value_ar":"رمادي","value_en":"Phantom Gray","_token":null,"created_at":"2021-04-18 10:51:40","updated_at":"2021-04-18 10:51:40","deleted_at":null},{"id":40,"field_id":4,"value_ar":"الرمادي الكوني","value_en":"Cosmic Gray","_token":null,"created_at":"2021-04-18 10:52:38","updated_at":"2021-04-18 10:52:38","deleted_at":null},{"id":49,"field_id":4,"value_ar":"أزرق","value_en":"blue","_token":null,"created_at":"2021-07-26 08:41:53","updated_at":"2021-07-26 08:41:53","deleted_at":null},{"id":51,"field_id":4,"value_ar":"اخضر","value_en":"Green","_token":null,"created_at":"2021-08-11 08:15:04","updated_at":"2021-08-11 08:15:04","deleted_at":null},{"id":52,"field_id":4,"value_ar":"dream Glow","value_en":"dream Glow","_token":null,"created_at":"2021-08-28 03:52:03","updated_at":"2021-08-28 03:52:03","deleted_at":null},{"id":53,"field_id":4,"value_ar":"الاحمر","value_en":"Red","_token":null,"created_at":"2021-09-26 02:34:33","updated_at":"2021-09-26 02:34:33","deleted_at":null},{"id":54,"field_id":4,"value_ar":"Titanium Sapphire","value_en":"Titanium Sapphire","_token":null,"created_at":"2021-09-26 03:15:37","updated_at":"2021-09-26 03:15:37","deleted_at":null},{"id":55,"field_id":4,"value_ar":"OCEAN WAVE","value_en":"OCEAN WAVE","_token":null,"created_at":"2021-09-27 00:44:07","updated_at":"2021-09-27 00:44:07","deleted_at":null},{"id":56,"field_id":4,"value_ar":"Morandi Green","value_en":"Morandi Green","_token":null,"created_at":"2021-09-27 01:00:34","updated_at":"2021-09-27 01:00:34","deleted_at":null},{"id":57,"field_id":4,"value_ar":"رمادي","value_en":"Graphite Grey","_token":null,"created_at":"2021-09-28 04:19:41","updated_at":"2021-09-28 04:19:41","deleted_at":null},{"id":58,"field_id":4,"value_ar":"Power black","value_en":"Power black","_token":null,"created_at":"2021-09-28 04:39:30","updated_at":"2021-09-28 04:39:30","deleted_at":null},{"id":59,"field_id":4,"value_ar":"رمادي","value_en":"Grey","_token":null,"created_at":"2021-10-10 18:23:41","updated_at":"2021-10-10 18:23:41","deleted_at":null}]},{"id":5,"dname":"حالة البطاريه","classfield":"Battery information","required":1,"type":"Text","help":"percentage of battery","options":[{"id":5,"field_id":5,"value_ar":"سكرين 1","value_en":"screen 1","_token":null,"created_at":"2020-09-30 17:19:46","updated_at":"2020-09-30 17:19:46","deleted_at":null},{"id":6,"field_id":5,"value_ar":"سكرين 2","value_en":"screen 2","_token":null,"created_at":"2020-09-30 17:19:57","updated_at":"2020-09-30 17:19:57","deleted_at":null}]},{"id":6,"dname":"كاميرا","classfield":"camers","required":null,"type":"Selectbox","help":null,"options":[{"id":7,"field_id":6,"value_ar":"1.2 MP","value_en":"1.2MP","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 16:55:37","updated_at":"2021-02-19 16:55:37","deleted_at":null},{"id":8,"field_id":6,"value_ar":"5MP","value_en":"5MP","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 16:56:34","updated_at":"2021-02-19 16:56:34","deleted_at":null},{"id":9,"field_id":6,"value_ar":"7MP","value_en":"7MP","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 16:57:02","updated_at":"2021-02-19 16:57:02","deleted_at":null},{"id":19,"field_id":6,"value_ar":"8MP","value_en":"8MP","_token":null,"created_at":"2021-02-19 17:06:46","updated_at":"2021-02-19 17:06:46","deleted_at":null},{"id":20,"field_id":6,"value_ar":"10MP","value_en":"10MP","_token":null,"created_at":"2021-02-19 17:06:58","updated_at":"2021-02-19 17:06:58","deleted_at":null},{"id":21,"field_id":6,"value_ar":"12MP","value_en":"12MP","_token":null,"created_at":"2021-02-19 17:07:03","updated_at":"2021-02-19 17:07:03","deleted_at":null},{"id":22,"field_id":6,"value_ar":"16MP","value_en":"16MP","_token":null,"created_at":"2021-02-19 17:07:14","updated_at":"2021-02-19 17:07:14","deleted_at":null},{"id":23,"field_id":6,"value_ar":"24MP","value_en":"24MP","_token":null,"created_at":"2021-02-19 17:07:30","updated_at":"2021-02-19 17:07:30","deleted_at":null},{"id":41,"field_id":6,"value_ar":"40MP","value_en":"40MP","_token":"DjcdRKeCutQ33IjMKnTBstSWzDxlGqrTeZwAbapg","created_at":"2021-04-18 11:16:14","updated_at":"2021-04-18 11:16:14","deleted_at":null},{"id":42,"field_id":6,"value_ar":"64MP","value_en":"64MP","_token":null,"created_at":"2021-04-18 11:18:23","updated_at":"2021-04-18 11:18:23","deleted_at":null},{"id":46,"field_id":6,"value_ar":"48MP","value_en":"48MP","_token":null,"created_at":"2021-07-14 12:29:23","updated_at":"2021-07-14 12:29:23","deleted_at":null},{"id":47,"field_id":6,"value_ar":"13MP","value_en":"13MP","_token":null,"created_at":"2021-07-14 13:12:25","updated_at":"2021-07-14 13:12:25","deleted_at":null}]},{"id":7,"dname":"المساحة","classfield":"Memory","required":1,"type":"Selectbox","help":null,"options":[{"id":10,"field_id":7,"value_ar":"32G","value_en":"32G","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 16:59:11","updated_at":"2021-02-19 16:59:11","deleted_at":null},{"id":11,"field_id":7,"value_ar":"64G","value_en":"64G","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 16:59:25","updated_at":"2021-02-19 16:59:25","deleted_at":null},{"id":12,"field_id":7,"value_ar":"128G","value_en":"128G","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 17:01:51","updated_at":"2021-02-19 17:01:51","deleted_at":null},{"id":15,"field_id":7,"value_ar":"256G","value_en":"256G","_token":null,"created_at":"2021-02-19 16:57:50","updated_at":"2021-02-19 16:57:50","deleted_at":null},{"id":16,"field_id":7,"value_ar":"512G","value_en":"512G","_token":null,"created_at":"2021-02-19 16:58:25","updated_at":"2021-02-19 16:58:25","deleted_at":null},{"id":50,"field_id":7,"value_ar":"16GB","value_en":"16GB","_token":null,"created_at":"2021-07-26 09:05:06","updated_at":"2021-07-26 09:05:06","deleted_at":null}]},{"id":11,"dname":"المتبقي من فترة الضمان","classfield":"Warranty period (months)","required":null,"type":"Text","help":"كم شهر متبقي في الضمان","options":[]},{"id":12,"dname":"الوكيل","classfield":"Warranted by","required":null,"type":"Text","help":"الوكيل في المملكه العربيه السعوديه","options":[]}]]

OrderDetail orderDetailFromJson(String str) => OrderDetail.fromJson(json.decode(str));
String orderDetailToJson(OrderDetail data) => json.encode(data.toJson());
class OrderDetail {
  OrderDetail({
      String? sellerFirstname, 
      String? sellerLastname, 
      String? discountAmount, 
      int? width, 
      int? weight, 
      int? height, 
      String? amountBeforeDiscount, 
      int? shippingAmount, 
      String? finalAmount, 
      String? finalAmountAfterDiscount, 
      int? id, 
      int? orderId, 
      int? productId, 
      int? productCount, 
      String? priceBefore, 
      String? priceAfter, 
      String? amount, 
      int? points, 
      String? token, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      String? catName, 
      String? productName, 
     // List<List<ProductInputs>>? productInputs,
  }){
    _sellerFirstname = sellerFirstname;
    _sellerLastname = sellerLastname;
    _discountAmount = discountAmount;
    _width = width;
    _weight = weight;
    _height = height;
    _amountBeforeDiscount = amountBeforeDiscount;
    _shippingAmount = shippingAmount;
    _finalAmount = finalAmount;
    _finalAmountAfterDiscount = finalAmountAfterDiscount;
    _id = id;
    _orderId = orderId;
    _productId = productId;
    _productCount = productCount;
    _priceBefore = priceBefore;
    _priceAfter = priceAfter;
    _amount = amount;
    _points = points;
    _token = token;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _catName = catName;
    _productName = productName;
   // _productInputs = productInputs;
}

  OrderDetail.fromJson(dynamic json) {
    _sellerFirstname = json['seller_firstname'];
    _sellerLastname = json['seller_lastname'];
    _discountAmount = json['discount_amount'];
    _width = json['width'];
    _weight = json['weight'];
    _height = json['height'];
    _amountBeforeDiscount = json['amount_before_discount'];
    _shippingAmount = json['shipping_amount'];
    _finalAmount = json['final_amount'];
    _finalAmountAfterDiscount = json['final_amount_after_discount'];
    _id = json['id'];
    _orderId = json['order_id'];
    _productId = json['product_id'];
    _productCount = json['product_count'];
    _priceBefore = json['price_before'];
    _priceAfter = json['price_after'];
    _amount = json['amount'];
    _points = json['points'];
    _token = json['_token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _catName = json['cat_name'];
    _productName = json['product_name'];
    // if (json['product_inputs'] != null) {
    //   _productInputs = [];
    //   json['product_inputs'].forEach((v) {
    //     _productInputs?.add(ProductInputs.fromJson(v));
    //   });
    // }
  }
  String? _sellerFirstname;
  String? _sellerLastname;
  String? _discountAmount;
  int? _width;
  int? _weight;
  int? _height;
  String? _amountBeforeDiscount;
  int? _shippingAmount;
  String? _finalAmount;
  String? _finalAmountAfterDiscount;
  int? _id;
  int? _orderId;
  int? _productId;
  int? _productCount;
  String? _priceBefore;
  String? _priceAfter;
  String? _amount;
  int? _points;
  String? _token;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  String? _catName;
  String? _productName;
  //List<List<ProductInputs>>? _productInputs;

  String? get sellerFirstname => _sellerFirstname;
  String? get sellerLastname => _sellerLastname;
  String? get discountAmount => _discountAmount;
  int? get width => _width;
  int? get weight => _weight;
  int? get height => _height;
  String? get amountBeforeDiscount => _amountBeforeDiscount;
  int? get shippingAmount => _shippingAmount;
  String? get finalAmount => _finalAmount;
  String? get finalAmountAfterDiscount => _finalAmountAfterDiscount;
  int? get id => _id;
  int? get orderId => _orderId;
  int? get productId => _productId;
  int? get productCount => _productCount;
  String? get priceBefore => _priceBefore;
  String? get priceAfter => _priceAfter;
  String? get amount => _amount;
  int? get points => _points;
  String? get token => _token;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String? get catName => _catName;
  String? get productName => _productName;
  //List<List<ProductInputs>>? get productInputs => _productInputs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['seller_firstname'] = _sellerFirstname;
    map['seller_lastname'] = _sellerLastname;
    map['discount_amount'] = _discountAmount;
    map['width'] = _width;
    map['weight'] = _weight;
    map['height'] = _height;
    map['amount_before_discount'] = _amountBeforeDiscount;
    map['shipping_amount'] = _shippingAmount;
    map['final_amount'] = _finalAmount;
    map['final_amount_after_discount'] = _finalAmountAfterDiscount;
    map['id'] = _id;
    map['order_id'] = _orderId;
    map['product_id'] = _productId;
    map['product_count'] = _productCount;
    map['price_before'] = _priceBefore;
    map['price_after'] = _priceAfter;
    map['amount'] = _amount;
    map['points'] = _points;
    map['_token'] = _token;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    map['cat_name'] = _catName;
    map['product_name'] = _productName;
    // if (_productInputs != null) {
    //   map['product_inputs'] = _productInputs?.map((v) => v.toJson()).toList();
    // }
    return map;
  }

}

/// id : 2
/// dname : "وحدة الذاكرة"
/// classfield : "Ram"
/// required : null
/// type : "Selectbox"
/// help : null
/// options : [{"id":1,"field_id":2,"value_ar":"1GB","value_en":"1GB","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 18:21:31","updated_at":"2021-02-19 18:21:31","deleted_at":null},{"id":2,"field_id":2,"value_ar":"2GB","value_en":"2GB","_token":"erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0","created_at":"2021-02-19 18:21:59","updated_at":"2021-02-19 18:21:59","deleted_at":null},{"id":48,"field_id":2,"value_ar":"3GB","value_en":"3GB","_token":null,"created_at":"2021-07-17 14:56:53","updated_at":"2021-07-17 14:56:53","deleted_at":null},{"id":62,"field_id":2,"value_ar":"4GB","value_en":"4GB","_token":null,"created_at":"2021-12-21 12:32:30","updated_at":"2021-12-21 12:32:30","deleted_at":null},{"id":63,"field_id":2,"value_ar":"5GB","value_en":"5GB","_token":null,"created_at":"2021-12-21 12:32:45","updated_at":"2021-12-21 12:32:45","deleted_at":null},{"id":64,"field_id":2,"value_ar":"6GB","value_en":"6GB","_token":null,"created_at":"2021-12-21 12:33:10","updated_at":"2021-12-21 12:33:10","deleted_at":null},{"id":65,"field_id":2,"value_ar":"8GB","value_en":"8GB","_token":null,"created_at":"2021-12-21 12:35:28","updated_at":"2021-12-21 12:35:28","deleted_at":null},{"id":66,"field_id":2,"value_ar":"12GB","value_en":"12GB","_token":null,"created_at":"2021-12-21 12:35:54","updated_at":"2021-12-21 12:35:54","deleted_at":null},{"id":67,"field_id":2,"value_ar":"16GB","value_en":"16GB","_token":null,"created_at":"2021-12-21 12:36:17","updated_at":"2021-12-21 12:36:17","deleted_at":null},{"id":68,"field_id":2,"value_ar":"32GB","value_en":"32GB","_token":null,"created_at":"2021-12-21 12:36:57","updated_at":"2021-12-21 12:36:57","deleted_at":null},{"id":69,"field_id":2,"value_ar":"64GB","value_en":"64GB","_token":null,"created_at":"2021-12-21 12:37:14","updated_at":"2021-12-21 12:37:14","deleted_at":null},{"id":70,"field_id":2,"value_ar":"128GB","value_en":"128GB","_token":null,"created_at":"2021-12-21 12:37:30","updated_at":"2021-12-21 12:37:30","deleted_at":null},{"id":71,"field_id":2,"value_ar":"512GB","value_en":"512GB","_token":null,"created_at":"2021-12-21 12:37:43","updated_at":"2021-12-21 12:37:43","deleted_at":null}]

// ProductInputs productInputsFromJson(String str) => ProductInputs.fromJson(json.decode(str));
// String productInputsToJson(ProductInputs data) => json.encode(data.toJson());
// class ProductInputs {
//   ProductInputs({
//       int? id,
//       String? dname,
//       String? classfield,
//       dynamic required,
//       String? type,
//       dynamic help,
//       List<OptionsInput>? options,}){
//     _id = id;
//     _dname = dname;
//     _classfield = classfield;
//     _required = required;
//     _type = type;
//     _help = help;
//     _options = options;
// }
//
//   ProductInputs.fromJson(dynamic json) {
//     _id = json['id'];
//     _dname = json['dname'];
//     _classfield = json['classfield'];
//     _required = json['required'];
//     _type = json['type'];
//     _help = json['help'];
//     if (json['options'] != null) {
//       _options = [];
//       json['options'].forEach((v) {
//         _options?.add(OptionsInput.fromJson(v));
//       });
//     }
//   }
//   int? _id;
//   String? _dname;
//   String? _classfield;
//   dynamic _required;
//   String? _type;
//   dynamic _help;
//   List<OptionsInput>? _options;
//
//   int? get id => _id;
//   String? get dname => _dname;
//   String? get classfield => _classfield;
//   dynamic get required => _required;
//   String? get type => _type;
//   dynamic get help => _help;
//   List<OptionsInput>? get options => _options;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['dname'] = _dname;
//     map['classfield'] = _classfield;
//     map['required'] = _required;
//     map['type'] = _type;
//     map['help'] = _help;
//     if (_options != null) {
//       map['options'] = _options?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }

/// id : 1
/// field_id : 2
/// value_ar : "1GB"
/// value_en : "1GB"
/// _token : "erLjaQvspJSLL57H091BSjSC98WCdQAWa4sOFNW0"
/// created_at : "2021-02-19 18:21:31"
/// updated_at : "2021-02-19 18:21:31"
/// deleted_at : null

OptionsInput optionsFromJson(String str) => OptionsInput.fromJson(json.decode(str));
String optionsToJson(OptionsInput data) => json.encode(data.toJson());
class OptionsInput {
  OptionsInput({
      int? id, 
      int? fieldId, 
      String? valueAr, 
      String? valueEn, 
      String? token, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt,}){
    _id = id;
    _fieldId = fieldId;
    _valueAr = valueAr;
    _valueEn = valueEn;
    _token = token;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
}

  OptionsInput.fromJson(dynamic json) {
    _id = json['id'];
    _fieldId = json['field_id'];
    _valueAr = json['value_ar'];
    _valueEn = json['value_en'];
    _token = json['_token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  int? _id;
  int? _fieldId;
  String? _valueAr;
  String? _valueEn;
  String? _token;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;

  int? get id => _id;
  int? get fieldId => _fieldId;
  String? get valueAr => _valueAr;
  String? get valueEn => _valueEn;
  String? get token => _token;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['field_id'] = _fieldId;
    map['value_ar'] = _valueAr;
    map['value_en'] = _valueEn;
    map['_token'] = _token;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}

/// id : 144
/// type : 1
/// customer_id : 96
/// company : "home"
/// bank_name : null
/// account_number : null
/// full_name_third : null
/// street : "street"
/// city_id : 78
/// state : "state"
/// postal_code : "214578"
/// country_id : 75
/// default : 1
/// _token : null
/// created_at : "2022-02-27 09:23:27"
/// updated_at : "2022-05-19 21:49:24"
/// deleted_at : null
/// country : "السعودية"
/// city : "جدة"

ShipAddress shipAddressFromJson(String str) => ShipAddress.fromJson(json.decode(str));
String shipAddressToJson(ShipAddress data) => json.encode(data.toJson());
class ShipAddress {
  ShipAddress({
      int? id, 
      int? type, 
      int? customerId, 
      String? company, 
      dynamic bankName, 
      dynamic accountNumber, 
      dynamic fullNameThird, 
      String? street, 
      int? cityId, 
      String? state, 
      String? postalCode, 
      int? countryId, 
      int? def,
      dynamic token, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      String? country, 
      String? city,}){
    _id = id;
    _type = type;
    _customerId = customerId;
    _company = company;
    _bankName = bankName;
    _accountNumber = accountNumber;
    _fullNameThird = fullNameThird;
    _street = street;
    _cityId = cityId;
    _state = state;
    _postalCode = postalCode;
    _countryId = countryId;
    _default = def;
    _token = token;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _country = country;
    _city = city;
}

  ShipAddress.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _customerId = json['customer_id'];
    _company = json['company'];
    _bankName = json['bank_name'];
    _accountNumber = json['account_number'];
    _fullNameThird = json['full_name_third'];
    _street = json['street'];
    _cityId = json['city_id'];
    _state = json['state'];
    _postalCode = json['postal_code'];
    _countryId = json['country_id'];
    _default = json['default'];
    _token = json['_token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _country = json['country'];
    _city = json['city'];
  }
  int? _id;
  int? _type;
  int? _customerId;
  String? _company;
  dynamic _bankName;
  dynamic _accountNumber;
  dynamic _fullNameThird;
  String? _street;
  int? _cityId;
  String? _state;
  String? _postalCode;
  int? _countryId;
  int? _default;
  dynamic _token;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  String? _country;
  String? _city;

  int? get id => _id;
  int? get type => _type;
  int? get customerId => _customerId;
  String? get company => _company;
  dynamic get bankName => _bankName;
  dynamic get accountNumber => _accountNumber;
  dynamic get fullNameThird => _fullNameThird;
  String? get street => _street;
  int? get cityId => _cityId;
  String? get state => _state;
  String? get postalCode => _postalCode;
  int? get countryId => _countryId;
  int? get def => _default;
  dynamic get token => _token;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String? get country => _country;
  String? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['customer_id'] = _customerId;
    map['company'] = _company;
    map['bank_name'] = _bankName;
    map['account_number'] = _accountNumber;
    map['full_name_third'] = _fullNameThird;
    map['street'] = _street;
    map['city_id'] = _cityId;
    map['state'] = _state;
    map['postal_code'] = _postalCode;
    map['country_id'] = _countryId;
    map['default'] = _default;
    map['_token'] = _token;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    map['country'] = _country;
    map['city'] = _city;
    return map;
  }

}

/// id : 58
/// type : 0
/// customer_id : 96
/// company : "home"
/// bank_name : "ahli"
/// account_number : "878787878787"
/// full_name_third : "test test est"
/// street : "street"
/// city_id : 1
/// state : "state"
/// postal_code : "214578"
/// country_id : 75
/// default : 0
/// _token : null
/// created_at : "2021-04-17 11:30:13"
/// updated_at : "2022-02-28 16:29:34"
/// deleted_at : null
/// country : "السعودية"
/// city : null

PayAddress payAddressFromJson(String str) => PayAddress.fromJson(json.decode(str));
String payAddressToJson(PayAddress data) => json.encode(data.toJson());
class PayAddress {
  PayAddress({
      int? id, 
      int? type, 
      int? customerId, 
      String? company, 
      String? bankName, 
      String? accountNumber, 
      String? fullNameThird, 
      String? street, 
      int? cityId, 
      String? state, 
      String? postalCode, 
      int? countryId, 
      int? def,
      dynamic token, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      String? country, 
      dynamic city,}){
    _id = id;
    _type = type;
    _customerId = customerId;
    _company = company;
    _bankName = bankName;
    _accountNumber = accountNumber;
    _fullNameThird = fullNameThird;
    _street = street;
    _cityId = cityId;
    _state = state;
    _postalCode = postalCode;
    _countryId = countryId;
    _default = def;
    _token = token;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _country = country;
    _city = city;
}

  PayAddress.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _customerId = json['customer_id'];
    _company = json['company'];
    _bankName = json['bank_name'];
    _accountNumber = json['account_number'];
    _fullNameThird = json['full_name_third'];
    _street = json['street'];
    _cityId = json['city_id'];
    _state = json['state'];
    _postalCode = json['postal_code'];
    _countryId = json['country_id'];
    _default = json['default'];
    _token = json['_token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _country = json['country'];
    _city = json['city'];
  }
  int? _id;
  int? _type;
  int? _customerId;
  String? _company;
  String? _bankName;
  String? _accountNumber;
  String? _fullNameThird;
  String? _street;
  int? _cityId;
  String? _state;
  String? _postalCode;
  int? _countryId;
  int? _default;
  dynamic _token;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  String? _country;
  dynamic _city;

  int? get id => _id;
  int? get type => _type;
  int? get customerId => _customerId;
  String? get company => _company;
  String? get bankName => _bankName;
  String? get accountNumber => _accountNumber;
  String? get fullNameThird => _fullNameThird;
  String? get street => _street;
  int? get cityId => _cityId;
  String? get state => _state;
  String? get postalCode => _postalCode;
  int? get countryId => _countryId;
  int? get def => _default;
  dynamic get token => _token;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String? get country => _country;
  dynamic get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['customer_id'] = _customerId;
    map['company'] = _company;
    map['bank_name'] = _bankName;
    map['account_number'] = _accountNumber;
    map['full_name_third'] = _fullNameThird;
    map['street'] = _street;
    map['city_id'] = _cityId;
    map['state'] = _state;
    map['postal_code'] = _postalCode;
    map['country_id'] = _countryId;
    map['default'] = _default;
    map['_token'] = _token;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    map['country'] = _country;
    map['city'] = _city;
    return map;
  }

}

/// ship_name : "بارجينيا"
/// pay_name : "مدي"
/// id : 275
/// orderid : 275
/// payment_date : "2021-06-15"
/// ship_date : null
/// pay_status : 1
/// type : 1

Order orderFromJson(String str) => Order.fromJson(json.decode(str));
String orderToJson(Order data) => json.encode(data.toJson());
class Order {
  Order({
      String? shipName, 
      String? payName, 
      int? id, 
      int? orderid, 
      String? paymentDate, 
      dynamic shipDate, 
      int? payStatus, 
      int? type,}){
    _shipName = shipName;
    _payName = payName;
    _id = id;
    _orderid = orderid;
    _paymentDate = paymentDate;
    _shipDate = shipDate;
    _payStatus = payStatus;
    _type = type;
}

  Order.fromJson(dynamic json) {
    _shipName = json['ship_name'];
    _payName = json['pay_name'];
    _id = json['id'];
    _orderid = json['orderid'];
    _paymentDate = json['payment_date'];
    _shipDate = json['ship_date'];
    _payStatus = json['pay_status'];
    _type = json['type'];
  }
  String? _shipName;
  String? _payName;
  int? _id;
  int? _orderid;
  String? _paymentDate;
  dynamic _shipDate;
  int? _payStatus;
  int? _type;

  String? get shipName => _shipName;
  String? get payName => _payName;
  int? get id => _id;
  int? get orderid => _orderid;
  String? get paymentDate => _paymentDate;
  dynamic get shipDate => _shipDate;
  int? get payStatus => _payStatus;
  int? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ship_name'] = _shipName;
    map['pay_name'] = _payName;
    map['id'] = _id;
    map['orderid'] = _orderid;
    map['payment_date'] = _paymentDate;
    map['ship_date'] = _shipDate;
    map['pay_status'] = _payStatus;
    map['type'] = _type;
    return map;
  }

}