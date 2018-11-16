namespace TddBankingApp
{
    using System;

    public interface IStockExchange
    {
        void AddExchangeRate(IExchangeRate newRate);

        IExchangeRate GetExchangeRate(string currencyFrom, string currencyTo);

        IExchangeRate GetExchangeRateOn(string currencyFrom, string currencyTo, DateTime during);

    }
}