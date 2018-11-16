namespace TddBankingApp
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public class CurrencyListing : ICurrencyListing
    {
        protected IList<ICurrency> Currencies;

        public CurrencyListing()
        {
            this.Currencies = new List<ICurrency>();
        }

        public void AddCurrency(ICurrency newRate)
        {
            if (this.Currencies.Contains(newRate)) { return; }
            this.Currencies.Add(newRate);
        }

        public ICurrency GetCurrency(string currencyFromAlphabeticCode, DateTime dateSearched)
        {
            return this.Currencies
                            .Where(n => n.AlphabeticCode == currencyFromAlphabeticCode && (n.WithdrawalDate == null || n.WithdrawalDate.Value.Ticks >= dateSearched.Ticks))
                            .OrderByDescending(n => n.NumericCode)
                            .FirstOrDefault();
        }

        public ICurrency GetCurrency(int? currencyFromNumericCode, DateTime dateSearched)
        {
            return this.Currencies
                       .Where(n => n.NumericCode == currencyFromNumericCode && (n.WithdrawalDate == null || n.WithdrawalDate.Value.Ticks >= dateSearched.Ticks))
                       .OrderByDescending(n => n.NumericCode)
                       .FirstOrDefault();
        }
    }
}