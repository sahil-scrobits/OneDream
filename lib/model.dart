// To parse this JSON data, do
//
//     final baseModel = baseModelFromMap(jsonString);

import 'dart:convert';

class BaseModel {
    BaseModel({
        this.uid,
        this.steinId,
        this.district,
        this.area,
        this.hospitalCategory,
        this.hospitalName,
        this.hospitalAddress,
        this.contact,
        this.lastUpdated,
        this.officerName,
        this.officerDesignation,
        this.charges,
        this.feeRegulatedBeds,
        this.totalBedsAllocatedToCovid,
        this.totalBedsWithoutOxygen,
        this.availableBedsWithoutOxygen,
        this.totalBedsWithOxygen,
        this.availableBedsWithOxygen,
        this.totalIcuBedsWithoutVentilator,
        this.availableIcuBedsWithoutVentilator,
        this.totalIcuBedsWithVentilator,
        this.availableIcuBedsWithVentilator,
        this.pincode,
        this.location,
        this.lat,
        this.long,
        this.hasIcuBeds,
        this.hasVentilators,
        this.isNewHospital,
        this.lastSynced,
    });

    String? uid;
    String? steinId;
    String? district;
    String? area;
    String? hospitalCategory;
    String? hospitalName;
    String? hospitalAddress;
    String? contact;
    String? lastUpdated;
    String? officerName;
    String? officerDesignation;
    String? charges;
    String? feeRegulatedBeds;
    String? totalBedsAllocatedToCovid;
    String? totalBedsWithoutOxygen;
    String? availableBedsWithoutOxygen;
    String? totalBedsWithOxygen;
    String? availableBedsWithOxygen;
    String? totalIcuBedsWithoutVentilator;
    String? availableIcuBedsWithoutVentilator;
    String? totalIcuBedsWithVentilator;
    String? availableIcuBedsWithVentilator;
    dynamic pincode;
    dynamic location;
    dynamic lat;
    dynamic long;
    String? hasIcuBeds;
    String? hasVentilators;
    String? isNewHospital;
    DateTime? lastSynced;

    factory BaseModel.fromJson(String str) => BaseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BaseModel.fromMap(Map<String, dynamic> json) => BaseModel(
        uid: json["UID"],
        steinId: json["STEIN_ID"],
        district: json["DISTRICT"],
        area: json["AREA"],
        hospitalCategory: json["HOSPITAL_CATEGORY"],
        hospitalName: json["HOSPITAL_NAME"],
        hospitalAddress: json["HOSPITAL_ADDRESS"],
        contact: json["CONTACT"],
        lastUpdated: json["LAST_UPDATED"],
        officerName: json["OFFICER_NAME"],
        officerDesignation: json["OFFICER_DESIGNATION"],
        charges: json["CHARGES"],
        feeRegulatedBeds: json["FEE_REGULATED_BEDS"],
        totalBedsAllocatedToCovid: json["TOTAL_BEDS_ALLOCATED_TO_COVID"],
        totalBedsWithoutOxygen: json["TOTAL_BEDS_WITHOUT_OXYGEN"],
        availableBedsWithoutOxygen: json["AVAILABLE_BEDS_WITHOUT_OXYGEN"],
        totalBedsWithOxygen: json["TOTAL_BEDS_WITH_OXYGEN"],
        availableBedsWithOxygen: json["AVAILABLE_BEDS_WITH_OXYGEN"],
        totalIcuBedsWithoutVentilator: json["TOTAL_ICU_BEDS_WITHOUT_VENTILATOR"],
        availableIcuBedsWithoutVentilator: json["AVAILABLE_ICU_BEDS_WITHOUT_VENTILATOR"],
        totalIcuBedsWithVentilator: json["TOTAL_ICU_BEDS_WITH_VENTILATOR"],
        availableIcuBedsWithVentilator: json["AVAILABLE_ICU_BEDS_WITH_VENTILATOR"],
        pincode: json["PINCODE"],
        location: json["LOCATION"],
        lat: json["LAT"],
        long: json["LONG"],
        hasIcuBeds: json["HAS_ICU_BEDS"],
        hasVentilators: json["HAS_VENTILATORS"],
        isNewHospital: json["IS_NEW_HOSPITAL"],
        lastSynced: DateTime.parse(json["LAST_SYNCED"]),
    );

    Map<String, dynamic> toMap() => {
        "UID": uid,
        "STEIN_ID": steinId,
        "DISTRICT": district,
        "AREA": area,
        "HOSPITAL_CATEGORY": hospitalCategory,
        "HOSPITAL_NAME": hospitalName,
        "HOSPITAL_ADDRESS": hospitalAddress,
        "CONTACT": contact,
        "LAST_UPDATED": lastUpdated,
        "OFFICER_NAME": officerName,
        "OFFICER_DESIGNATION": officerDesignation,
        "CHARGES": charges,
        "FEE_REGULATED_BEDS": feeRegulatedBeds,
        "TOTAL_BEDS_ALLOCATED_TO_COVID": totalBedsAllocatedToCovid,
        "TOTAL_BEDS_WITHOUT_OXYGEN": totalBedsWithoutOxygen,
        "AVAILABLE_BEDS_WITHOUT_OXYGEN": availableBedsWithoutOxygen,
        "TOTAL_BEDS_WITH_OXYGEN": totalBedsWithOxygen,
        "AVAILABLE_BEDS_WITH_OXYGEN": availableBedsWithOxygen,
        "TOTAL_ICU_BEDS_WITHOUT_VENTILATOR": totalIcuBedsWithoutVentilator,
        "AVAILABLE_ICU_BEDS_WITHOUT_VENTILATOR": availableIcuBedsWithoutVentilator,
        "TOTAL_ICU_BEDS_WITH_VENTILATOR": totalIcuBedsWithVentilator,
        "AVAILABLE_ICU_BEDS_WITH_VENTILATOR": availableIcuBedsWithVentilator,
        "PINCODE": pincode,
        "LOCATION": location,
        "LAT": lat,
        "LONG": long,
        "HAS_ICU_BEDS": hasIcuBeds,
        "HAS_VENTILATORS": hasVentilators,
        "IS_NEW_HOSPITAL": isNewHospital,
        "LAST_SYNCED": lastSynced?.toIso8601String(),
    };
}
