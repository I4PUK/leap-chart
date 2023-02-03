// To parse this JSON data, do
//
//     final companyModel = companyModelFromMap(jsonString);

import 'dart:convert';

import 'package:chart_test/domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel({
    required super.symbol,
    required super.assetType,
    required super.name,
    required super.description,
    required super.cik,
    required super.exchange,
    required super.currency,
    required super.country,
    required super.sector,
    required super.industry,
    required super.address,
    required super.fiscalYearEnd,
    required super.marketCapitalization,
    required super.ebitda,
    required super.peRatio,
    required super.pegRatio,
    required super.bookValue,
    required super.dividendPerShare,
    required super.dividendYield,
    required super.eps,
    required super.revenuePerShareTtm,
    required super.profitMargin,
    required super.operatingMarginTtm,
    required super.returnOnAssetsTtm,
    required super.returnOnEquityTtm,
    required super.revenueTtm,
    required super.grossProfitTtm,
    required super.dilutedEpsttm,
    required super.quarterlyEarningsGrowthYoy,
    required super.quarterlyRevenueGrowthYoy,
    required super.analystTargetPrice,
    required super.trailingPe,
    required super.forwardPe,
    required super.priceToSalesRatioTtm,
    required super.priceToBookRatio,
    required super.evToRevenue,
    required super.evToEbitda,
    required super.beta,
    required super.the52WeekHigh,
    required super.the52WeekLow,
    required super.the50DayMovingAverage,
    required super.the200DayMovingAverage,
    required super.sharesOutstanding,
  });

  factory CompanyModel.fromJson(String str) =>
      CompanyModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromMap(Map<String, dynamic> json) => CompanyModel(
        symbol: json["Symbol"] ?? '',
        assetType: json["AssetType"] ?? '',
        name: json["Name"] ?? '',
        description: json["Description"] ?? '',
        cik: json["CIK"] ?? '',
        exchange: json["Exchange"] ?? '',
        currency: json["Currency"] ?? '',
        country: json["Country"] ?? '',
        sector: json["Sector"] ?? '',
        industry: json["Industry"] ?? '',
        address: json["Address"] ?? '',
        fiscalYearEnd: json["FiscalYearEnd"] ?? '',
        marketCapitalization:
            double.tryParse(json["MarketCapitalization"] ?? '') ?? 0.0,
        ebitda: json["EBITDA"] ?? '',
        peRatio: json["PERatio"] ?? '',
        pegRatio: json["PEGRatio"] ?? '',
        bookValue: json["BookValue"] ?? '',
        dividendPerShare: json["DividendPerShare"] ?? '',
        dividendYield: json["DividendYield"] ?? '',
        eps: json["EPS"] ?? '',
        revenuePerShareTtm: json["RevenuePerShareTTM"] ?? '',
        profitMargin: json["ProfitMargin"] ?? '',
        operatingMarginTtm: json["OperatingMarginTTM"] ?? '',
        returnOnAssetsTtm: json["ReturnOnAssetsTTM"] ?? '',
        returnOnEquityTtm: json["ReturnOnEquityTTM"] ?? '',
        revenueTtm: json["RevenueTTM"] ?? '',
        grossProfitTtm: json["GrossProfitTTM"] ?? '',
        dilutedEpsttm: json["DilutedEPSTTM"] ?? '',
        quarterlyEarningsGrowthYoy: json["QuarterlyEarningsGrowthYOY"] ?? '',
        quarterlyRevenueGrowthYoy: json["QuarterlyRevenueGrowthYOY"] ?? '',
        analystTargetPrice: json["AnalystTargetPrice"] ?? '',
        trailingPe: json["TrailingPE"] ?? '',
        forwardPe: json["ForwardPE"] ?? '',
        priceToSalesRatioTtm: json["PriceToSalesRatioTTM"] ?? '',
        priceToBookRatio: json["PriceToBookRatio"] ?? '',
        evToRevenue: json["EVToRevenue"] ?? '',
        evToEbitda: json["EVToEBITDA"] ?? '',
        beta: json["Beta"] ?? '',
        the52WeekHigh: json["52WeekHigh"] ?? '',
        the52WeekLow: json["52WeekLow"] ?? '',
        the50DayMovingAverage: json["50DayMovingAverage"] ?? '',
        the200DayMovingAverage: json["200DayMovingAverage"] ?? '',
        sharesOutstanding: json["SharesOutstanding"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "Symbol": symbol,
        "AssetType": assetType,
        "Name": name,
        "Description": description,
        "CIK": cik,
        "Exchange": exchange,
        "Currency": currency,
        "Country": country,
        "Sector": sector,
        "Industry": industry,
        "Address": address,
        "FiscalYearEnd": fiscalYearEnd,
        "MarketCapitalization": marketCapitalization,
        "EBITDA": ebitda,
        "PERatio": peRatio,
        "PEGRatio": pegRatio,
        "BookValue": bookValue,
        "DividendPerShare": dividendPerShare,
        "DividendYield": dividendYield,
        "EPS": eps,
        "RevenuePerShareTTM": revenuePerShareTtm,
        "ProfitMargin": profitMargin,
        "OperatingMarginTTM": operatingMarginTtm,
        "ReturnOnAssetsTTM": returnOnAssetsTtm,
        "ReturnOnEquityTTM": returnOnEquityTtm,
        "RevenueTTM": revenueTtm,
        "GrossProfitTTM": grossProfitTtm,
        "DilutedEPSTTM": dilutedEpsttm,
        "QuarterlyEarningsGrowthYOY": quarterlyEarningsGrowthYoy,
        "QuarterlyRevenueGrowthYOY": quarterlyRevenueGrowthYoy,
        "AnalystTargetPrice": analystTargetPrice,
        "TrailingPE": trailingPe,
        "ForwardPE": forwardPe,
        "PriceToSalesRatioTTM": priceToSalesRatioTtm,
        "PriceToBookRatio": priceToBookRatio,
        "EVToRevenue": evToRevenue,
        "EVToEBITDA": evToEbitda,
        "Beta": beta,
        "52WeekHigh": the52WeekHigh,
        "52WeekLow": the52WeekLow,
        "50DayMovingAverage": the50DayMovingAverage,
        "200DayMovingAverage": the200DayMovingAverage,
        "SharesOutstanding": sharesOutstanding
      };
}
