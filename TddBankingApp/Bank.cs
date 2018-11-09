namespace TddBankingApp
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public class Bank
    {
        private readonly IList<IExchangeRate> exchangeRates;
        private readonly string internalCode;

        public Bank(string internalCode)
        {
            this.exchangeRates = new List<IExchangeRate>();
            this.internalCode = internalCode;
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

        public IExchangeRate GetExchangeRateOn(string currencyFrom, string currencyTo, DateTime during)
        {
            return this.exchangeRates
                       .Where(n => n.CurrencyFrom == currencyFrom && n.CurrencyTo == currencyTo && 
                            n.Effective <= during).Max();
        }

        public Currency ConvertToLocal(Currency originalCurrency)
        {
            if (originalCurrency == null) { return null; }
            if (originalCurrency.Code == this.internalCode) { return originalCurrency; }

            var exchangeRate = this.GetExchangeRate(originalCurrency.Code, this.internalCode);
            if (exchangeRate == null)
            {
                throw new InvalidOperationException(
                    "Missing exchange rate for '" + originalCurrency.Code + "' to '" + this.internalCode + "'");
            }

            var newValue = originalCurrency.Amount * exchangeRate.ConversionRate;
            return new Currency(newValue, this.internalCode);
        }
    }
}
