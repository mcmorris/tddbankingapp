namespace TddBankingApp
{
    using System;

    public interface IBank
    {
        IExchangeRate GetInternalExchangeRate(string currencyFrom);

        IMoney ConvertToLocal(IMoney originalMoney);

        IMoney InternalMoney(decimal amount);
    }
}
