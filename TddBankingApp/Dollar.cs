﻿namespace TddBankingApp
{
    public class Dollar : Money
    {
        public Dollar(decimal amount) :
            base(amount)
        {
            this.amount = amount;
        }
    }
}
