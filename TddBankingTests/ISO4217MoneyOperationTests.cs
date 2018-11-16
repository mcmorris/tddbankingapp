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
            var stockExchange = new StockExchange();
            var bank          = new Bank(stockExchange, new MockUpCurrencyListing(), "USD");

            //Assert.AreEqual(money.NumericCode, 840);
            //Assert.AreEqual(money.MinorUnit, 2);
        }
    }
}
