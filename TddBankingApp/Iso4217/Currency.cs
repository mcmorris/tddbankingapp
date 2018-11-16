namespace TddBankingApp
{
    using System;

    public class Currency : ICurrency, IComparable<ICurrency>
    {
        public string AlphabeticCode { get; }

        public int? NumericCode { get; }

        public int Exponent { get; }

        public string Country { get; }

        public string Name { get; }

        public bool IsStandard { get; }

        public DateTime? WithdrawalDate { get; }

        public bool MinorUnitNegligible => this.Exponent == 0;

        public Currency(string alphabeticCode, int? numericCode, int exponent, string country, string name, bool isStandard, DateTime? withdrawalDate)
        {
            this.AlphabeticCode = alphabeticCode;
            this.NumericCode    = numericCode;
            this.Exponent      = exponent;
            this.Country        = country;
            this.Name           = name;
            this.IsStandard     = isStandard;
            this.WithdrawalDate = withdrawalDate;
        }

        public int CompareTo(ICurrency other)
        {
            var codeCompare = this.AlphabeticCode.CompareTo(other.AlphabeticCode);
            return codeCompare == 0
                       ? this.Exponent.CompareTo(other.Exponent)
                       : codeCompare;
        }
    }
}
