import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/data/models/organized_model.dart';
import 'package:wallet_ui_kit/data/repository/organization_repo.dart';

class OrganizationProvider extends ChangeNotifier {
  final OrganizationRepo organizationRepo;
  OrganizationProvider({@required this.organizationRepo});

  List<OrganizerModel> getOrganizationList() {
    return organizationRepo.getOrganizerList();
  }
}