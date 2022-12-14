import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/Provider/ServiceListProvider.dart';
import 'package:pet_app/Screens/Add_Pets/addPet.dart';
import 'package:pet_app/Screens/HOME/BlogDetailList.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';
import '../../Api/Models/ServiceListModel.dart';
import '../../Api/Services.dart';
import '../../Componants/Images&Icons.dart';
import '../DrawerScreen.dart';
import '../LocationBottomSeet.dart';
import '../Reminder.dart';

String? Search;

class Home extends StatefulWidget {
  Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ScrollController scrollController = ScrollController();

  TextEditingController searchCantrolller = TextEditingController();

  ServiceModel result = ServiceModel();

  var currentindex = 0;
  @override
  initState() {
    super.initState();
    servicelistApi().then((value) {
      setState(() {
        result = value;
        print(result.serviceListdata.toString());
      });
    });
  }

  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      // backgroundColor: WHITE70_CLR,
      appBar: AppBar(
        toolbarHeight: h * 0.095,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () => _scaffoldKey.currentState!.openDrawer(),
            child: Image.asset(
              DRAWER_ICON,
              color: GRAY_CLR,
            )),
        iconTheme: IconThemeData(color: BLACK_CLR),
        backgroundColor: WHITE70_CLR,
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (ctx) => const LocationBottomSeet());
                },
                child: styleText(LOCATION, GRAY_CLR, FontWeight.normal, 12)),
            Padding(
              padding: EdgeInsets.only(left: w * 0.06),
              child: SizedBox(
                width: w * 0.4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: GREEN_CLR,
                      size: 18,
                    ),
                    Consumer<ProviderTutorial>(
                        builder: (BuildContext context, value, Widget? child) {
                      return TutorialText(
                          "Mansover jaipur", BLACK70_CLR, FontWeight.bold, 13);
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<int>(
            offset: const Offset(10, 80),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10,
            icon: Image.asset(USER_IMAGE),
            iconSize: 40,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(USER_IMAGE),
                          const SizedBox(
                            width: 10,
                          ),
                          styleText(PET_NAME, BLACK_CLR, FontWeight.normal, 15),
                        ],
                      ),
                      const Divider(
                        color: FADE_BLUE_CLR,
                      )
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(USER_IMAGE),
                          const SizedBox(
                            width: 10,
                          ),
                          styleText(PET_NAME, BLACK_CLR, FontWeight.normal, 15),
                        ],
                      ),
                      const Divider(
                        color: FADE_BLUE_CLR,
                      )
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                  enabled: true,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: MaterialButton(
                      height: 30,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      color: GREEN_CLR,
                      onPressed: () {
                        Navigate_to(
                            context,
                            AddPetpage(
                              isEdit: false,
                            ));
                        Navigator.of(context).pop;
                      },
                      child: styleText(
                          ADD_PET_NAME, WHITE70_CLR, FontWeight.normal, 13),
                    ),
                  ))
            ],
          ),
        ],
      ),
      drawer: const MyDrawer(),

      floatingActionButton: SizedBox(
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigate_to(context, const Reminder());
          },
          child: SvgPicture.asset(NOTIFICATION_ICON),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,

      body: Container(
        height: h * 1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: HBACKGROUND_CLR),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: w * 0.030, right: w * 0.030),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 48,
                  margin: EdgeInsets.only(top: h * 0.03),
                  decoration: BoxDecoration(
                    color: WHITE70_CLR,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8, color: SHADOW_CLR.withOpacity(0.1)),
                    ],
                  ),
                  child: TextFormField(
                      controller: searchCantrolller,
                      decoration: InputDecoration(
                          errorText: "",
                          errorStyle: const TextStyle(height: 0),
                          hintText: "Search",
                          hintStyle: const TextStyle(
                              color: GRAY_CLR,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                          prefixIcon: Image.asset(
                            "assets/png_icon/magnifying-glass.png",
                            color: GRAY_CLR,
                          ),
                          suffixIcon: Image.asset(FILTTER_ICON),
                          border: InputBorder.none)),
                ),
                SizedBox(
                  height: h * 0.020,
                ),

                styleText(SERVICES, BLACK_CLR, FontWeight.bold, 19),

                SizedBox(
                  height: h * 0.010,
                ),

                SizedBox(
                    height: h * 0.145,
                    child: Consumer<ServiceHealthProvider>(
                        builder: (BuildContext context, value, Widget? child) {
                      return result.serviceListdata == null
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              shrinkWrap: true,
                              controller: scrollController,
                              itemCount: result.serviceListdata!.length,
                              scrollDirection: Axis.horizontal,
                              // physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                print(result.serviceListdata![index].name
                                    .toString());
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        value.OnTap(index);
                                        value.currentindex = index;
                                        print(value.currentindex);
                                        setState(() {});
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 13),
                                        height: 70,
                                        width: 70,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: value.currentindex == index
                                                ? GREEN_CLR
                                                : WHITE_CLR,
                                            boxShadow: const [
                                              BoxShadow(color: SHADOW_CLR)
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              result
                                                  .serviceListdata![index].image
                                                  .toString(),

                                              width: w * 0.14,
                                              height: h * 0.08,
                                              fit: BoxFit.fill,
                                              // "",
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Container();
                                              },
                                              // value.detaildata[index].ImageUrl),
                                            ),
                                          ),
                                        ),
                                        // child: Image.asset(SERVICES_ICON,color: value.data.elementAt(index)==value.Services? WHITE70_CLR:GRAY_CLR,),
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.010,
                                    ),
                                    styleText(
                                        result.serviceListdata![index].name
                                            .toString(),
                                        GRAY_CLR,
                                        FontWeight.bold,
                                        13)
                                  ],
                                );
                              });
                    })),

                Consumer<ServiceHealthProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                  return result.serviceListdata == null
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: result.serviceListdata?[value.currentindex]
                              .subserviceListdata?.length,
                          itemBuilder: (BuildContext context, int index) {
                            SubServiceListModel? subResultdata = result
                                .serviceListdata?[currentindex]
                                .subserviceListdata?[index];
                            print(subResultdata?.name);
                            return SizedBox(
                              height: h * 0.12,
                              width: w * 1,
                              child: GestureDetector(
                                onTap: () {
                                  value.onClickedList(context, index);
                                },
                                // onTap: ()=> Navigate_to(context, PageRoute[index]),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Card(
                                      color: WHITE70_CLR,
                                      elevation: 1,
                                      // shadowColor: GRAY_CLR,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                subResultdata!.image.toString(),

                                                width: w * 0.17,
                                                height: h * 0.1,
                                                fit: BoxFit.fill,
                                                // "",
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Container();
                                                },
                                                // value.detaildata[index].ImageUrl),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: w * 0.035,
                                          ),
                                          styleText(
                                              subResultdata.name.toString(),
                                              // "",
                                              // value.detaildata[index].name,
                                              DARK_CLR,
                                              FontWeight.bold,
                                              17)
                                        ],
                                      )),
                                ),
                              ),
                            );
                          });
                }),
                styleText(EXPLORE, BLACK_CLR, FontWeight.bold, 19),
                SizedBox(
                  height: h * 0.015,
                ),

                ///BlogDetailList
                BlogDetailsList(),
                SizedBox(
                  height: h * 0.015,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
