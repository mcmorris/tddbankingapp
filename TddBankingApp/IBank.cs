using System.Collections;

using TddBankingApp;

namespace TddBankingApp
{
    public interface IBank
    {
        void AddExchangeRate(IExchangeRate newRate);

        IExchangeRate GetExchangeRate(string currencyFrom, string currencyTo);

        IExchangeRate GetInternalExchangeRate(string currencyFrom);

        ICurrency ConvertToLocal(ICurrency originalCurrency);

        ICurrency InternalCurrency(decimal amount);
    }
}
