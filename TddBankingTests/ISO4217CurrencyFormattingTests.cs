namespace TddBankingTests
{
    using Microsoft.VisualStudio.TestTools.UnitTesting;

    using TddBankingApp;
    using TddBankingApp.Iso4217;

    [TestClass]
    public class ISO4217CurrencyFormattingTests
    {
        [TestMethod]
        public void TestDecimalCultureFormatting()
        {
            const decimal Amount = 100;
            Assert.AreEqual(Amount.FormatCurrency("AUD"), "$100.00");
            Assert.AreEqual(Amount.FormatCurrency("GBP"), "£100.00");
            Assert.AreEqual(Amount.FormatCurrency("EUR"), "100,00 €");
            Assert.AreEqual(Amount.FormatCurrency("VND"), "100,00 ₫");
            Assert.AreEqual(Amount.FormatCurrency("INR"), "₹ 100.00");
        }

        [TestMethod]
        public void TestCurrencyCultureFormatting()
        {
            var bank = new Bank(new MockUpCurrencyListing(), "USD");
            Assert.AreEqual(bank.Dollar(100M).ToString(), "$100.00");
            Assert.AreEqual(bank.Pound(100M).ToString(), "£100.00");
            Assert.AreEqual(bank.Euro(100M).ToString(), "100,00 €");
            Assert.AreEqual(bank.Dong(100M).ToString(), "100,00 ₫");
            Assert.AreEqual(bank.Rial(100M).ToString(), "100/00ريال");
        }
    }
}
