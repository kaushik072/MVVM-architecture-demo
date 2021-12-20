import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/helper/helper.dart';
import 'package:test_project/models/models.dart';
import 'package:test_project/ui/components/components.dart';
import 'package:test_project/view_model/view_model.dart';
import 'home.dart';

class HomePageUI extends StatefulWidget {
  const HomePageUI({Key? key, this.myAppUser}) : super(key: key);
  final MyAppUser? myAppUser;

  @override
  _HomePageUIState createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  HomeViewModel? homeViewModel;

  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).getProblems();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    homeViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 27,
                ),
                child: Column(
                  children: [
                    Header(
                      title: "Home Page",
                      context: context,
                    ),
                    SizedBox(
                      height: 31,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<LocalDataStorage>(
                    builder: (context, localDataStorage, child) {
                      return Text(
                        "Hi ${localDataStorage.myAppUser?.userName ?? ""} Good ${homeViewModel!.getGreetMessage()},\n your mobile no is ${authViewModel.myAppUser?.mobileNumber ?? ""}",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 110,
                    height: 50,
                    child: CommonButton(
                      onPress: () async {
                        final bool isLogout = await authViewModel.logOut();
                        if (isLogout) {
                          final localDataStorage =
                              Provider.of<LocalDataStorage>(context,
                                  listen: false);
                          localDataStorage
                              .deleteUser(localDataStorage.myAppUser);
                        }
                      },
                      prefixPath: "assets/images/svg/exit.svg",
                      title: 'Logout',
                      textStyle:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                                color: MyColor.textPrimaryLightColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                      color: MyColor.commonColorSet2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              DrugDetailItem(
                associatedDrugModel: AssociatedDrugModel(
                    dose: "Dose", name: "Name", strength: "Strength"),
                isTitle: true,
              ),
              homeViewModel!.problems != null
                  ? Expanded(
                      child: ListView.builder(
                      itemCount: homeViewModel!.associatedDrugs!.length,
                      itemBuilder: (context, problemIndex) {
                        return DrugDetailItem(
                          associatedDrugModel:
                              homeViewModel!.associatedDrugs![problemIndex],
                        );
                      },
                    ))
                  : CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
