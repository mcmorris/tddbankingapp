namespace TddBankingApp
{
    using System;

    public interface IBank
    {
        void AddExchangeRate(IExchangeRate newRate);

        IExchangeRate GetExchangeRate(string currencyFrom, string currencyTo);

        IExchangeRate GetExchangeRateOn(string currencyFrom, string currencyTo, DateTime during);

        IExchangeRate GetInternalExchangeRate(string currencyFrom);

        IMoney ConvertToLocal(IMoney originalMoney);

        IMoney InternalMoney(decimal amount);
    }
}
