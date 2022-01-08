import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:upwork/Models/JobData.dart';
import 'package:upwork/Services/UserDataService.dart';
import 'package:upwork/Models/ProposalsData.dart';
import 'package:upwork/View/components/Shared/CustomLoader.dart';
import 'package:upwork/View/components/Talent/ProposalCard.dart';

class ActiveBody extends StatefulWidget {
  @override
  _ActiveBodyState createState() => _ActiveBodyState();
}

class _ActiveBodyState extends State<ActiveBody> {
  JobDataModel job;
  List<ProposalsDataModel> contractPropals;
  List<ProposalsDataModel> submitPropals;
  List<ProposalsDataModel> offerPropals;
  getData() async {
    contractPropals = await UserDataService().getContractProposalsData();
    setState(() {});
  }

  getData1() async {
    submitPropals = await UserDataService().getSubmittedProposalsData();
    setState(() {});
  }

  getData2() async {
    offerPropals = await UserDataService().getofferProposalsData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
    getData1();
    getData2();
  }

  @override
  Widget build(BuildContext context) {
    return contractPropals != null &&
            submitPropals != null &&
            offerPropals != null
        ? Container(
            decoration: BoxDecoration(
                color: Color(0xFFF1F2F4),
                border: Border.all(
                  color: Theme.of(context).accentColor,
                )),
            child: Accordion(
              maxOpenSections: 1,
              headerTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
              headerBackgroundColor: Colors.white,
              headerPadding: EdgeInsets.all(10.0),
              paddingBetweenClosedSections: 15.0,
              contentBackgroundColor: Colors.white,
              contentVerticalPadding: 5.0,
              contentHorizontalPadding: 5.0,
              children: [
                AccordionSection(
                    isOpen: false,
                    headerText: offerPropals?.length > 0
                        ? "Offers (${offerPropals?.length.toString()})"
                        : "Offers(0)",
                    content: offerPropals?.length > 0
                        ? Column(children: [
                            for (var i = 0; i < offerPropals?.length; i++)
                              ProposalsCard(
                                offerPropals[i],
                              ),
                          ])
                        : Text("")),
                AccordionSection(
                  isOpen: false,
                  headerText: contractPropals?.length > 0
                      ? "Active Proposals (${contractPropals?.length.toString()})"
                      : "Active Proposals(0)",
                  content: contractPropals?.length > 0
                      ? Column(children: [
                          for (var i = 0; i < contractPropals?.length; i++)
                            ProposalsCard(
                              contractPropals[i],
                            ),
                        ])
                      : Text(""),
                ),
                AccordionSection(
                    isOpen: false,
                    headerText: submitPropals?.length > 0
                        ? "Submmitted Proposals (${submitPropals?.length.toString()})"
                        : 'Submmitted Proposals(0)',
                        headerTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                    content: Column(children: [
                      for (var i = 0; i < submitPropals?.length; i++)
                        ProposalsCard(
                          submitPropals[i],
                        ),
                    ])),
              ],
            ))
        : CustomLoader();
  }
}
