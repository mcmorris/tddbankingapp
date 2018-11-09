namespace TddBankingApp
{
    using System;

    public interface IExchangeRate
    {
        decimal ConversionRate { get; }

        string CurrencyFrom { get; }

        string CurrencyTo { get; }

        DateTime Effective { get; }
    }
}
