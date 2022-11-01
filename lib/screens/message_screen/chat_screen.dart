import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';
import 'package:timmarkus/controller%20/message_controller.dart';
import 'package:timmarkus/widgets/my_text_field.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  MessageController messageController = MessageController();
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();
  FocusNode textFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }



  scrollToBottom() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150.h,
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {Get.back();},
                        child: Container(
                          height: 27.sp,
                          width: 26.sp,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icon/back_icon.png"),
                            )
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 50.h,),
                          Container(
                            height: 50.sp,
                            width: 50.sp,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.primaryColor)
                            ),
                            child: Container(
                              height: 50.sp,
                              width: 50.sp,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/image/people.png"),
                                )
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h,),
                          Text("Hamza Munir", style: Styles.myTextStyle(color: AppColors.primaryColor),),
                        ],
                      ),
                      Container(
                        height: 27.sp,
                        width: 26.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: AppColors.blackColor, thickness: 1.sp,),
            SizedBox(height: 25.h,),
            Center(child: Text("Today", style: Styles.myTextStyle(fontSize: 14.sp, color: AppColors.blackColor.withOpacity(0.7)),),),
            SizedBox(height: 25.h,),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  controller: scrollController,
                  itemCount: messageController.messages.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return renderingNotifications(messageController.messages[index], index);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 20.h,);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w,),
              child: MyTextField(
                height: 55.h,
                focusNode: textFocusNode,
                fillColor: Colors.white,
                controller: textController,
                hintText: 'Enter text here...',
                suffixIcon: 'assets/icon/send_icon.png',
                onEditingComplete: () {
                  if(textController.text.toString().trim().length!=0) {
                    textFocusNode.unfocus();
                    messageController.messages.add(textController.text);
                    textController.clear();
                    scrollController.jumpTo(scrollController.position.maxScrollExtent);
                  }
                },
                onSuffixIconTap: () {
                  if(textController.text.toString().trim().length!=0) {
                    textFocusNode.unfocus();
                    messageController.messages.add(textController.text);
                    textController.clear();
                    scrollController.jumpTo(scrollController.position.maxScrollExtent);
                  }
                },
              ),
            ),
            SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }

  renderingNotifications(String message, index) {
    return Align(
      alignment: index%2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        child: Container(
          width: 200.w,
          child: Text(message, style: Styles.myTextStyle(fontSize: 16.sp, ),)
        ),
      ),
    );
  }
}
