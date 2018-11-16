namespace TddBankingApp
{
    using System.Collections.Generic;
    using System.Linq;

    public interface ICurrencyListing
    {
        void AddCurrency(ICurrency newRate);

        ICurrency GetCurrency(string currencyFromAlphabeticCode);

        ICurrency GetCurrency(int? currencyFromNumericCode);
    }
}