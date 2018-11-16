namespace TddBankingApp
{
    using System;

    public interface ICurrencyListing
    {
        void AddCurrency(ICurrency newRate);

        ICurrency GetCurrency(string currencyFromAlphabeticCode, DateTime dateSearched);

        ICurrency GetCurrency(int? currencyFromNumericCode, DateTime dateSearched);
    }
}