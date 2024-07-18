import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/customs/classes/state_list.dart';
import 'package:splashcashapp/global/customs/user_session_management.dart';
import 'package:splashcashapp/global/modules/model/state_model.dart';
import 'package:splashcashapp/global/modules/model/user_login_model.dart';
import 'package:splashcashapp/global/web_services/referral_services.dart';

import '../../constants/constants.dart';
import '../../customs/classes/custom_dialog.dart';
import '../../customs/common_code.dart';
import '../../customs/progress_dialogs.dart';

class CreateReferralScreenController extends GetxController  {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController homePoneController = TextEditingController();
  TextEditingController workPhoneController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController houseNumController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool obscureText = true.obs;
  RxBool obscureTextReEnter = true.obs;

  RxBool isCopied = false.obs;

  RxBool validationError = false.obs;
  RxString confirmPassword = ''.obs;

  FocusNode fNameFN=FocusNode(),
      lNFocusNode=FocusNode(),
      hPFocusNode=FocusNode(),
      wPFocusNode=FocusNode(),
      homeNFocusNode=FocusNode(),
      streetAddFocusNode=FocusNode(),
      cityFocusNode=FocusNode(),
      stateFocusNode=FocusNode(),
      zipFocusNode=FocusNode(),
      emailFocusNode=FocusNode();

  UserSession userSession=UserSession();
  Rx<UserLoginModel> userLoginModel=UserLoginModel.empty().obs;

  RxList<StateModel> listOfState=<StateModel>[].obs;

  RxString userEmail=''.obs;

  RxString droDowValue = "Select Interest".obs;
  Rx<StateModel> selectedState=StateModel(state: "Select State", abbreviation: "", capitalCity: "", dateEstablished: "").obs;
  RxBool isSelected=false.obs;
  RxBool isStateSelected=false.obs;


  final List<String> items = [
    'Select Interest',
    'New Pool',
    'Renovation'
  ];

  void removeFocus(){
    if(fNameFN.hasFocus){
      fNameFN.unfocus();
    }else if(lNFocusNode.hasFocus){
      lNFocusNode.unfocus();
    }else if(emailFocusNode.hasFocus){
      emailFocusNode.unfocus();
    }else if(cityFocusNode.hasFocus){
      cityFocusNode.unfocus();
    }else if(zipFocusNode.hasFocus){
      zipFocusNode.unfocus();
    }else if(stateFocusNode.hasFocus){
      stateFocusNode.unfocus();
    }else if(hPFocusNode.hasFocus){
      hPFocusNode.unfocus();
    }else if(wPFocusNode.hasFocus){
      wPFocusNode.unfocus();
    }else if(streetAddFocusNode.hasFocus){
      streetAddFocusNode.unfocus();
    }else if(homeNFocusNode.hasFocus){
      homeNFocusNode.unfocus();
    }
  }

  Future<void> getUserInfo() async{
    userLoginModel.value=await userSession.getUserLoginModel();
    userEmail.value=userLoginModel.value.email;
  }

  @override
  onInit(){
    for(int i=0;i<StateList.listOfState.length;i++){
      listOfState.add(StateModel.fromJson(StateList.listOfState[i]));
    }
    for(int i=0;i<listOfState.length;i++){
      if(i==0){
        selectedState.value=listOfState[i];
        break;
      }
    }
    getUserInfo();
    super.onInit();
  }

  Future<void> submit() async {
    removeFocus();
    if (formKey.currentState!.validate() )  {
      if(selectedState.value.state=='Select State'){
        isStateSelected.value=true;
        return;
      }else{
        isStateSelected.value=false;
      }
      if(droDowValue.value=='Select Interest'){
        isSelected.value=true;
        return;
      }else{
        isSelected.value=false;
      }
        validationError.value = false;
        ProgressDialog pd = ProgressDialog();
        pd.showDialog();
        if(await CommonCode().checkInternetAccess()) {
          String resp = await ReferralServices().createReferral(firstName: firstNameController.text, lastName: lastNameController.text, email: emailController.text, userId: userLoginModel.value.id, memberCode: userLoginModel.value.memberCode, homePhone: homePoneController.text, workPhone: workPhoneController.text, homeNum: houseNumController.text, streetAdd: streetAddressController.text, city: cityController.text, zip: zipController.text, state: selectedState.value.abbreviation, interest: droDowValue.value);
          if (resp=='OK') {
            pd.dismissDialog();
            Get.back();
          }else {
            pd.dismissDialog();
            CustomDialogs().showMessageDialog(title: "Alert",
                description: resp,
                type: DialogType.ERROR);
          }
        } else{
          pd.dismissDialog();
          CustomDialogs().showMessageDialog(title: 'Alert',
              description: kInternetMsg,
              type: DialogType.ERROR);
        }


    }
  }

  Future<void> copyToClipboard(String text) async {
    isCopied.value = true;
    Clipboard.setData(ClipboardData(text: text));
    // showSimpleToast();
    await Future.delayed(const Duration(seconds: 3));
    isCopied.value = false;

  }

  // void showSimpleToast() {
  //   Get.rawSnackbar(
  //
  //     message: "Text copied",
  //     margin: const EdgeInsets.all(20),
  //     borderRadius: 8,
  //     forwardAnimationCurve: Curves.easeOutCubic,
  //     reverseAnimationCurve: Curves.easeInCubic,
  //     duration: Duration(seconds: 1),
  //   );
  // }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    fNameFN.dispose();
    lNFocusNode.dispose();
    emailFocusNode.unfocus();
    super.dispose();
  }

}