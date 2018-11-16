namespace TddBankingTests
{
    using Microsoft.VisualStudio.TestTools.UnitTesting;

    using TddBankingApp;

    [TestClass]
    public class ISO4217MoneyOperationTests
    {
        [TestMethod]
        public void TestSplitOddAmount()
        {
            var bank        = new Bank(new CurrencyListing(), "USD");

            //Assert.AreEqual(money.NumericCode, 840);
            //Assert.AreEqual(money.MinorUnit, 2);
        }
    }
}
