namespace TddBankingTests
{
    using System;

    using Microsoft.VisualStudio.TestTools.UnitTesting;

    [TestClass]
    public class CurrencyLookupTests
    {
        [TestMethod]
        public void TestLookupValidCurrency()
        {
            var currencies = new MockUpCurrencyListing();
            var usdCurrencyA = currencies.GetCurrency("USD", DateTime.Now);
            var usdCurrencyB = currencies.GetCurrency(840, DateTime.Now);
            Assert.AreEqual(usdCurrencyA, usdCurrencyB);
            Assert.AreEqual(usdCurrencyB.IsStandard, true);
        }

        [TestMethod]
        public void TestLookupInvalidCurrency()
        {
            var currencies = new MockUpCurrencyListing();
            Assert.AreEqual(currencies.GetCurrency("ZZZ", DateTime.Now), null);
            Assert.AreEqual(currencies.GetCurrency(000, DateTime.Now), null);
        }

        [TestMethod]
        public void TestLookupValidOldCurrencyAtValidTime()
        {
            var currencies = new MockUpCurrencyListing();
            var oldCurrency = currencies.GetCurrency("ADP", DateTime.Parse("2003-06-01 12:00:00"));
            Assert.AreEqual(oldCurrency.AlphabeticCode, "ADP");
            Assert.AreEqual(oldCurrency.IsStandard, false);
        }

        [TestMethod]
        public void TestLookupValidOldCurrencyAtInvalidTime()
        {
            var currencies = new MockUpCurrencyListing();
            Assert.AreEqual(currencies.GetCurrency("ADP", DateTime.Parse("2003-08-01 12:00:00")), null);
        }

        [TestMethod]
        public void TestLookupValidCurrencyWithNullNumericCode()
        {
            var currencies = new MockUpCurrencyListing();
            var currency = currencies.GetCurrency("TVD", DateTime.Now);
            Assert.AreEqual(currency.AlphabeticCode, "TVD");
            Assert.AreEqual(currency.NumericCode, null);
            Assert.AreEqual(currency.IsStandard, false);
        }

        [TestMethod]
        public void TestLookupInvalidISO4217CurrencyWithValidEntry()
        {
            var currencies = new MockUpCurrencyListing();
            var currency   = currencies.GetCurrency("XBT", DateTime.Now);
            Assert.AreEqual(currency.AlphabeticCode, "XBT");
            Assert.AreEqual(currency.IsStandard, false);
        }

        [TestMethod]
        public void TestLookupValidISO4217CurrencyWithNegligibleMinorUnits()
        {
            var currencies = new MockUpCurrencyListing();
            var currency   = currencies.GetCurrency(704, DateTime.Now);
            Assert.AreEqual(currency.AlphabeticCode, "VND");
            Assert.AreEqual(currency.MinorUnitNegligible, true);
            Assert.AreEqual(currency.IsStandard, true);
        }
    }
}
