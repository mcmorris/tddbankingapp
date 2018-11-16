﻿namespace TddBankingApp
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    
    public class StockMarket
    {
        private readonly IList<IExchangeRate> exchangeRates;

        public StockMarket()
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

    }
}