import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import 'package:transport_app/app/ui/shared/style.dart';
import 'package:velocity_x/velocity_x.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _infoBar(),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: APPSTYLE.WHITE_COLOR,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: APPSTYLE.WHITE_COLOR,
                        border: Border(
                          bottom: BorderSide(
                              color: APPSTYLE.PRIMARY_COLOR_LIGH, width: 2),
                        ),
                      ),
                      unselectedLabelColor: Colors.grey,
                      labelColor: APPSTYLE.BLACK_COLOR,
                      isScrollable: true,
                      controller: _tabController,
                      unselectedLabelStyle:
                          GoogleFonts.montserrat(fontSize: 12),
                      labelStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold, fontSize: 12),
                      tabs: const [
                        Tab(
                          child: Text("Liste de Client"),
                        ),
                        Tab(
                          child: Text("Historique de paiement"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: const [_TabClient(), _TabHistorique()],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _infoBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        color: APPSTYLE.WHITE_COLOR,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              'Client',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  border: Border.all(
                    color: APPSTYLE.BORDER_COLOR,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          hintText: "Rechercher un client",
                          helperStyle: GoogleFonts.montserrat(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    10.widthBox,
                    Icon(
                      Iconsax.search_normal,
                      color: APPSTYLE.DESABLE_COLOR,
                      size: 16,
                    ),
                  ],
                ),
              ),
              20.widthBox,
            ],
          ),
        ],
      ),
    );
  }
}

class _TabClient extends StatelessWidget {
  const _TabClient();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tabHeader(context: context),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                  20,
                  (index) => allClient(
                        index: index,
                        context: context,
                      )),
            ),
          ),
        )
      ],
    );
  }

  Widget tabHeader({required BuildContext context}) {
    double space = 10;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: tabHeaderDetailModel(
              title: '#Num',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 2,
            child: tabHeaderDetailModel(
              title: 'Nom Complet',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 2,
            child: tabHeaderDetailModel(
              title: 'Contact',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 1,
            child: tabHeaderDetailModel(
              title: 'Adresse',
            ),
          ),
          space.widthBox,
        ],
      ),
    );
  }

  Widget allClient({
    int? index,
    BuildContext? context,
  }) {
    Widget spacer = 15.widthBox;
    return InkWell(
      onTap: () {
        // showDialog(
        //     context: context,
        //     barrierColor: Colors.transparent,
        //     builder: ((context) => const DetailPaiement()));
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 60,
          right: 60,
          bottom: 15,
          top: 15,
        ),
        width: MediaQuery.of(context!).size.width,
        decoration: BoxDecoration(
          color: index! % 2 == 0
              ? APPSTYLE.DESABLE_COLOR.withOpacity(.4)
              : Colors.transparent,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: clientModel(
                title: "00${index + 1}",
              ),
            ),
            spacer,
            Expanded(
              flex: 2,
              child: clientModel(title: "Jonh Doe ${index + 1}"),
            ),
            spacer,
            Expanded(
              flex: 2,
              child: clientModel(title: "+243 826136191"),
            ),
            spacer,
            Expanded(
              flex: 1,
              child: clientModel(title: "Himbi, Alindi n°147"),
            ),
            spacer,
          ],
        ),
      ),
    );
  }

  Widget modelAction({
    Function()? onTap,
    IconData? icon,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: color,
      ),
    );
  }

  Widget tabHeaderDetailModel({String? title}) {
    return Text(
      title!,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }

  Widget clientModel({String? title}) {
    return Text(
      title!,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: GoogleFonts.montserrat(
        fontSize: 12,
        color: APPSTYLE.BLACK_COLOR,
        height: 1.5,
      ),
    );
  }
}

class _TabHistorique extends StatelessWidget {
  const _TabHistorique();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tabHeader(context: context),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                  20,
                  (index) => allClient(
                        index: index,
                        context: context,
                      )),
            ),
          ),
        )
      ],
    );
  }

  Widget tabHeader({required BuildContext context}) {
    double space = 10;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: tabHeaderDetailModel(
              title: '#Num',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 2,
            child: tabHeaderDetailModel(
              title: 'Nom Complet',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 2,
            child: tabHeaderDetailModel(
              title: 'Contact',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 1,
            child: tabHeaderDetailModel(
              title: 'Adresse',
            ),
          ),
          space.widthBox,
        ],
      ),
    );
  }

  Widget allClient({
    int? index,
    BuildContext? context,
  }) {
    Widget spacer = 15.widthBox;
    return InkWell(
      onTap: () {
        // showDialog(
        //     context: context,
        //     barrierColor: Colors.transparent,
        //     builder: ((context) => const DetailPaiement()));
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 60,
          right: 60,
          bottom: 15,
          top: 15,
        ),
        width: MediaQuery.of(context!).size.width,
        decoration: BoxDecoration(
          color: index! % 2 == 0
              ? APPSTYLE.DESABLE_COLOR.withOpacity(.4)
              : Colors.transparent,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: clientModel(
                title: "00${index + 1}",
              ),
            ),
            spacer,
            Expanded(
              flex: 2,
              child: clientModel(title: "Jonh Doe ${index + 1}"),
            ),
            spacer,
            Expanded(
              flex: 2,
              child: clientModel(title: "+243 826136191"),
            ),
            spacer,
            Expanded(
              flex: 1,
              child: clientModel(title: "Himbi, Alindi n°147"),
            ),
            spacer,
          ],
        ),
      ),
    );
  }

  Widget modelAction({
    Function()? onTap,
    IconData? icon,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: color,
      ),
    );
  }

  Widget tabHeaderDetailModel({String? title}) {
    return Text(
      title!,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }

  Widget clientModel({String? title}) {
    return Text(
      title!,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: GoogleFonts.montserrat(
        fontSize: 12,
        color: APPSTYLE.BLACK_COLOR,
        height: 1.5,
      ),
    );
  }
}
