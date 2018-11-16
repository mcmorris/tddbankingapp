namespace TddBankingApp
{
    using System;

    public class Currency : ICurrency, IComparable<ICurrency>
    {
        public string AlphabeticCode { get; }

        public int? NumericCode { get; }

        public int MinorUnit { get; }

        public string Country { get; }

        public string Name { get; }

        public bool ISO4217Standard { get; }

        public DateTime? WithdrawalDate { get; }

        public bool MinorUnitNegligible => this.MinorUnit == 0;

        public Currency(string alphabeticCode, int? numericCode, int minorUnit, string country, string name, bool iso4217Standard, DateTime? withdrawalDate)
        {
            this.AlphabeticCode = alphabeticCode;
            this.NumericCode    = numericCode;
            this.MinorUnit      = minorUnit;
            this.Country        = country;
            this.Name           = name;
            this.ISO4217Standard= iso4217Standard;
            this.WithdrawalDate = withdrawalDate;
        }

        public int CompareTo(ICurrency other)
        {
            var codeCompare = this.AlphabeticCode.CompareTo(other.AlphabeticCode);
            return codeCompare == 0
                       ? this.MinorUnit.CompareTo(other.MinorUnit)
                       : codeCompare;
        }
    }
}
