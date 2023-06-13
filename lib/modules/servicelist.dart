import 'package:flutter/material.dart';

class SList {
  String head;

  SList({required this.head});
}

List<SList> memberships = [
  SList(head: 'Toto Afya Card'),
  SList(head: 'Student'),
  SList(head: 'Public Institutions'),
  SList(head: 'Non Public Institutions'),
  SList(head: 'Retiree'),
  SList(head: 'Umoja Afya'),
  SList(head: 'Machinga Afya'),
  SList(head: 'Madereva Afya'),
];

List<SList> Bpacks = [
  SList(head: 'Eye and optical services'),
  SList(head: 'Medicines and medical supplies'),
  SList(head: 'Spectacles'),
  SList(head: 'Surgical services'),
];

// Inpatient care services including ICU and HDU
// Retirees health benefits
// Physiotherapy and rehabilitation services
// Medical or orthopaedic appliances
// Dental and oral health services

List<SList> Apacks = [
  SList(
      head:
          '''There are services that have conditions for special approval that require a beneficiary to present a special permit before he or she can enjoy the NHIF benefit cover.'''),
  SList(head: 'The services that require a special permit include; '),
  SList(head: 'Cancer chemotherapy for cancer patients'),
  SList(head: 'Medical and orthopaedic appliances'),
  SList(head: 'Complex Implants'),
  SList(head: 'Dentures '),
  SList(head: 'Radiotherapy service'),
  SList(
      head:
          'Immuno-suppressant medicines for patients, who have organ transplants'),
  SList(head: 'Reading glasses'),
];








// Special radiological imaging such as CT scan and MRI
// Polypropylene-mesh
// Haemodialysis and erythropoietin for patients with renal failure
// EMG needle
// Advanced cardiac services
// Some selected medicines
// Orthodontic services