namespace TddBankingApp
{
    using System;

    public interface ICurrency
    {
        string AlphabeticCode { get; }

        int? NumericCode { get; }

        int Exponent { get; }

        string Country { get; }

        string Name { get; }

        bool IsStandard { get; }

        DateTime? WithdrawalDate { get; }

        bool MinorUnitNegligible { get; }

        int CompareTo(ICurrency other);
    }
}
