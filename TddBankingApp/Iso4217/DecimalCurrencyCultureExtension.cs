﻿using System;
using System.Collections.Generic;
using System.Linq;

namespace TddBankingApp.Iso4217
{
    using System.Globalization;

    // Thanks to https://stackoverflow.com/questions/13364984/format-decimal-as-currency-based-on-currency-code
    public static class DecimalCurrencyCultureExtension
    {
        private static readonly Dictionary<string, CultureInfo> _isoCurrenciesToACultureMap =
            CultureInfo.GetCultures(CultureTypes.SpecificCultures)
                       .Select(c => new { c, new RegionInfo(c.Name).ISOCurrencySymbol })
                       .GroupBy(x => x.ISOCurrencySymbol)
                       .ToDictionary(g => g.Key, g => g.First().c, StringComparer.OrdinalIgnoreCase);

        public static string FormatCurrency(this decimal amount, string currencyCode)
        {
            return _isoCurrenciesToACultureMap.TryGetValue(currencyCode, out var culture) ? string.Format(culture, "{0:C}", amount) : amount.ToString("0.00");
        }
    }
}
