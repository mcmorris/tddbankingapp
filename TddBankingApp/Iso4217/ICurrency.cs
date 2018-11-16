namespace TddBankingApp
{
    using System;

    public interface ICurrency
    {
        string AlphabeticCode { get; }

        int? NumericCode { get; }

        int MinorUnit { get; }

        string Country { get; }

        string Name { get; }

        bool ISO4217Standard { get; }

        DateTime? WithdrawalDate { get; }

        bool MinorUnitNegligible { get; }

        int CompareTo(ICurrency other);
    }
}
