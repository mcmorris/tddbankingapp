﻿namespace TddBankingApp
{
    public class Currency : ICurrency
    {
        public decimal Amount { get; }
        public string Code { get; }

        public Currency(decimal amount, string code)
        {
            this.Amount = amount;
            this.Code = code;
        }

        public override bool Equals(object other)
        {
            var otherMoney = (Currency)other;
            return this.Code == otherMoney?.Code && this.Amount == otherMoney?.Amount;
        }
    }
}