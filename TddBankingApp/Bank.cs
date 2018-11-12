namespace TddBankingApp
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    
    public class Bank : IBank
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

        public IExchangeRate GetInternalExchangeRate(string currencyFrom)
        {
            return this.GetExchangeRate(currencyFrom, this.internalCode);
        }

        public IExchangeRate GetExchangeRateOn(string currencyFrom, string currencyTo, DateTime during)
        {
            return this.exchangeRates
                       .Where(n => n.CurrencyFrom == currencyFrom && n.CurrencyTo == currencyTo && 
                            n.Effective <= during).Max();
        }

        public ICurrency ConvertToLocal(ICurrency originalCurrency)
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

        public ICurrency InternalCurrency(decimal amount)
        {
            return new Currency(amount, this.internalCode);
        }
    }
}