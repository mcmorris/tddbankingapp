namespace TddBankingApp
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    
    public class Bank : MoneyFactory, IBank
    {
        private readonly IList<IExchangeRate> exchangeRates;
        private readonly ICurrency internalCurrency;

        public Bank(CurrencyListing currencies, string internalCurrencyCode) 
            : base(currencies)
        {
            this.exchangeRates = new List<IExchangeRate>();
            this.internalCurrency = currencies.GetCurrency(internalCurrencyCode);
        }

        public void AddExchangeRate(IExchangeRate newRate)
        {
            if (this.exchangeRates.Contains(newRate)) { return; }
            this.exchangeRates.Add(newRate);
        }

        public IExchangeRate GetExchangeRate(string currencyFrom, string currencyTo)
        {
            return this.exchangeRates
                            .Where(n => n.CurrencyFrom == currencyFrom && n.CurrencyTo == currencyTo)
                            .OrderByDescending(n => n.Effective)
                            .FirstOrDefault();
        }

        public IExchangeRate GetInternalExchangeRate(string currencyFrom)
        {
            return this.GetExchangeRate(currencyFrom, this.internalCurrency.AlphabeticCode);
        }

        public IExchangeRate GetExchangeRateOn(string currencyFrom, string currencyTo, DateTime during)
        {
            return this.exchangeRates
                       .Where(n => n.CurrencyFrom == currencyFrom && n.CurrencyTo == currencyTo && 
                            n.Effective <= during).Max();
        }

        public IMoney ConvertToLocal(IMoney originalMoney)
        {
            if (originalMoney == null) { return null; }
            if (originalMoney.Currency == this.internalCurrency) { return originalMoney; }

            var exchangeRate = this.GetExchangeRate(originalMoney.Currency.AlphabeticCode, this.internalCurrency.AlphabeticCode);
            if (exchangeRate == null)
            {
                throw new InvalidOperationException(
                    "Missing exchange rate for '" + originalMoney.Currency.AlphabeticCode + "' to '" + this.internalCurrency.AlphabeticCode + "'");
            }

            var newValue = originalMoney.Amount * exchangeRate.ConversionRate;
            return this.InternalMoney(newValue);
        }

        public IMoney InternalMoney(decimal amount)
        {
            return this.BuildMoney(amount, this.internalCurrency);
        }
    }
}