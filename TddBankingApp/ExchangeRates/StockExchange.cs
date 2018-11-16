namespace TddBankingApp
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    
    public class StockExchange : IStockExchange
    {
        private readonly IList<IExchangeRate> exchangeRates;

        public StockExchange()
        {
            this.exchangeRates = new List<IExchangeRate>();
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

        public static IExchangeRate ExchangeRate(DateTime date, string currencyFrom, string currencyTo, decimal rate)
        {
            return new ExchangeRate(date, currencyFrom, currencyTo, rate);
        }

    }
}