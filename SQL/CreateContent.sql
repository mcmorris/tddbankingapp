
USE [TddBankingDB];

SET ANSI_NULLS ON
GO
 
SET QUOTED_IDENTIFIER ON
GO
 
/****** Object:  Primary Database Creation ******/
CREATE TABLE AuditAll (
    Id					int				NOT NULL	IDENTITY(100,1),
    [OccurredAt]		datetime		NOT NULL,
	UserName			nvarchar(255)	NOT NULL,
    TableName			nvarchar(255)	NOT NULL,
	AuditEntry			xml				NULL,

    CONSTRAINT PK_AuditAll PRIMARY KEY CLUSTERED(Id ASC)
)

USE [TddBankingDB]
CREATE TABLE ISO4217Currencies (
	AlphabeticCode		nvarchar(3)		NOT NULL		PRIMARY KEY CLUSTERED(AlphabeticCode ASC),
	NumericCode			int,
	Country				nvarchar(512),
	[Name]				nvarchar(255)	NOT NULL,
	MinorUnit			int				NOT NULL,
	ISO4217Standard		bit				NOT NULL		DEFAULT 0,
	WithdrawalDate		datetime,
)

GO

INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ADP', 20, 0, 'Andorran Peseta', 'Andorra', 0, '2003-07-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('AED', 784, 2, 'United Arab Emirates Dirham', 'United Arab Emirates', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('AFA', 4, 0, 'Afghan Afghani', 'Afghanistan', 0, '2003-01-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('AFN', 971, 2, 'Afghan Afghani', 'Afghanistan', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ALK', 4, 0, 'Afghan Old Lek', 'Albania', 0, '1989-12-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ALL', 8, 2, 'Albanian Lek', 'Albania', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('AMD', 51, 2, 'Armenian Dram', 'Armenia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ANG', 532, 2, 'Netherlands Antillean Guilder', 'Curaçao, Sint Maarten', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('AOA', 973, 2, 'Angolan Kwanza', 'Angola', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('AOK', null, 0, 'Angolan Kwanza', 'Angola', 0, '1991-03-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('AON', 24, 0, 'Angolan New Kwanza', 'Angola', 0, '2000-02-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('AOR', 982, 0, 'Angolan Kwanza Reajustado', 'Angola', 0, '2000-02-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ARA', 32, 0, 'Austral', 'Argentina', 0, '1992-01-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ARP', 32, 0, 'Peso Argentino', 'Argentina', 0, '1985-07-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ARS', 32, 2, 'Peso Argentine', 'Argentina', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ATS', null, 0, 'Austrian Shilling', 'Austria', 0, '2002-03-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ARY', null, 0, 'Peso', 'Argentina', 0, '1989-01-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('AUD', 36, 2, 'Australian Dollar', 'Australia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('AWG', 533, 2, 'Aruban Florin', 'Aruba', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('AYM', null, 0, 'Azerbaija Manat', 'Azerbaijan', 0, '2005-10-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('AZM', null, 0, 'Azerbaijanian Manat', 'Azerbaijan', 0, '2005-12-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('AZN', 944, 2, 'Azerbaijani Manat', 'Azerbaijan', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BAD', 70, 0, 'Dinar', 'Bosnia and Herzegovina', 0, '1998-07-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BAM', 977, 2, 'Bosnia and Herzegovina Convertible Mark', 'Bosnia and Herzegovina', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BBD', 52, 2, 'Barbados Dollar', 'Barbados', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BDT', 50, 2, 'Bangladeshi Taka', 'Bangladesh', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BEC', 993, 0, 'Belgian Convertible Franc', 'Belgium', 0, '1990-03-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BEF', 56, 0, 'Belgian Franc', 'Belgium', 0, '2002-03-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BEL', 992, 0, 'Financial Franc', 'Belgium', 0, '1990-03-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BGJ', null, 0, 'Lev A/52', 'Bulgaria', 0, '1990-01-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BGK', null, 0, 'Lev A/62', 'Bulgaria', 0, '1990-01-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BGL', 100, 0, 'Lev', 'Bulgaria', 0, '2003-11-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BGN', 975, 2, 'Bulgarian Lev', 'Bulgaria', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BHD', 48, 3, 'Bahraini Dinar', 'Bahrain', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BIF', 108, 0, 'Burundian Franc', 'Burundi', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BMD', 60, 2, 'Bermudian Dollar', 'Bermuda', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BND', 96, 2, 'Brunei Dollar', 'Brunei', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BOB', 68, 2, 'Boliviano', 'Bolivia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BOP', null, 0, 'Peso Boliviano Franc', 'Bolivia', 0, '1987-02-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BOV', 984, 2, 'Bolivian Mvdol (funds code)', 'Bolivia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BRB', null, null, 'Cruziero', 'Brazil', 0, '1986-03-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BRC', 76, null, 'Cruzado', 'Brazil', 0, '1989-02-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BRE', 76, null, 'Cruziero', 'Brazil', 0, '1993-03-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BRN', 76, null, 'New Cruziero', 'Brazil', 0, '1990-03-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BRL', 986, 2, 'Brazilian Real', 'Brazil', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BRR', 987, null, 'Cruziero Real', 'Brazil', 0, '1994-07-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BSD', 44, 2, 'Bahamian Dollar', 'Bahamas', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BTN', 64, 2, 'Bhutanese Ngultrum', 'Bhutan', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BTU', null, 8, 'Bitcoin Unlimited', null, 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BUK', null, 0, null, 'Burma', 0, '1990-02-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BWP', 72, 2, 'Botswana Pula', 'Botswana', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BYB', 112, 0, 'Belarusian Ruble', 'Belarus', 0, '2001-01-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BYR', 974, 0, 'Belarusian Ruble', 'Belarus', 0, '2017-01-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('BZD', 84, 2, 'Belize Dollar', 'Belize', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CAD', 124, 2, 'Canadian Dollar', 'Canada', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CDF', 976, 2, 'Congolese Franc', 'Democratic Republic of the Congo', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CHE', 947, 2, 'WIR Euro (complementary currency)', 'Switzerland', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CHF', 756, 2, 'Swiss Franc', 'Switzerland and Liechtenstein', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CHW', 948, 2, 'WIR Franc (complementary currency)', 'Switzerland', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CLF', 990, 0, 'Unidad de Fomento (funds code)', 'Chile', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CLP', 152, 0, 'Chilean Peso', 'Chile', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CNH', null, 2, 'Chinese Yuan (when traded offshore)', 'Hong Kong', 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CNT', null, 2, 'Chinese Yuan (when traded offshore)', 'Taiwan', 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CNX', null, 0, 'Peoples Bank Dollar', 'China', 0, '1989-12-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CNY', 156, 2, 'Renminbi (Chinese) Yuan', 'China', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('COP', 170, 2, 'Colombian Peso', 'Colombia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('COU', 970, 2, 'Unidad de Valor Real (UVR) (funds code)', 'Colombia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CRC', 188, 2, 'Costa Rican Colon', 'Costa Rica', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CSJ', null, 0, 'Krone A/53', 'Czechoslovakia', 0, '1989-01-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CSK', 200, 0, 'Koruna', 'Czechoslovakia', 0, '1939-03-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CUC', 931, 2, 'Cuban Convertible Peso', 'Cuba', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CUP', 192, 2, 'Cuban Peso', 'Cuba', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CVE', 132, 0, 'Cape Verde Escudo', 'Cabo Verde', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CYP', 196, 0, 'Cyprus Pound', 'Cyprus', 0, '2008-01-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('CZK', 203, 2, 'Czech Koruna', 'Czechia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('DASH', null, 8, 'Dash', null, 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('DDM', 278, 0, 'Mark der DDM', 'German Democratic Republic', 0, '1990-09-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('DEM', 276, 0, 'Mark der DDM', 'Deutsche Mark', 0, '2002-03-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('DJF', 262, 0, 'Djiboutian Franc', 'Djibouti', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('DKK', 208, 2, 'Danish Krone', 'Denmark, Faroe Islands, Greenland', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('DOP', 214, 2, 'Dominican Peso', 'Dominican Republic', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('DZD', 12, 2, 'Algerian Dinar', 'Algeria', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ECS', 218, 0, 'Sucre', 'Equador', 0, '2000-09-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ECV', 983, 0, 'Unidad de Valor Constante', 'Equador', 0, '2000-09-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('EEK', 233, 0, 'Krone', 'Estonia', 0, '2011-01-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('EGP', 818, 2, 'Egyptian Pound', 'Egypt', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ERN', 232, 2, 'Eritrean Nakfa', 'Eritrea', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ESP', 724, 0, 'Spanish Peseta', 'Andorra', 0, '2002-03-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ETB', 230, 2, 'Ethiopian Birr', 'Ethiopia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ETH', null, 18, 'Ether', null, 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('EUR', 978, 2, 'Euro', 'European Union', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('FIM', 246, 0, 'Ãland Islands Markka', 'Ãland Islands', 0, '2002-03-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('FJD', 242, 2, 'Fiji Dollar', 'Fiji', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('FKP', 238, 2, 'Falkland Islands Pound', 'Falkland Islands', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('FRF', 250, 0, 'French Frank', 'Andorra', 0, '2002-03-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GBP', 826, 2, 'Pound Sterling', 'United Kingdom', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GBX', null, 2, 'Penny sterling', 'United Kingdom', 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GEK', 268, 0, 'Georgian Coupon', 'Georgia', 0, '1995-10-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GEL', 981, 2, 'Georgian Lari', 'Georgia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GGP', null, 0, 'Guernsey pound', 'Guernsey', 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GHC', 288, 0, 'Ghanaian Cedi', 'Ghana', 0, '2008-01-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GHP', 939, 0, 'Ghanaian Cedi', 'Ghana', 0, '2007-06-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GHS', 936, 2, 'Ghanaian Cedi', 'Ghana', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GIP', 292, 2, 'Gibraltar Pound', 'Gibraltar', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GMD', 270, 2, 'Gambian Dalasi', 'Gambia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GNE', null, 0, 'Guinean Syli', 'Guinea', 0, '1989-12-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GNF', 324, 0, 'Guinean Franc', 'Guinea', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GNS', null, 0, 'Guinean Syli', 'Guinea', 0, '1986-02-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GRD', 300, 0, 'Drachma', 'Greece', 0, '2002-03-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GTQ', 320, 2, 'Guatemalan Quetzal', 'Guatemala', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GQE', 226, 0, 'Ekwele', 'Equatorial Guinea', 0, '1986-06-01 12:00:00');     
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GWE', null, 0, 'Escudo', 'Guinea-Bissau', 0, '1978-01-01 12:00:00');   
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GWP', 624, 0, 'Guinea-Bissau Peso', 'Guinea-Bissau', 0, '1997-05-01 12:00:00');   
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('GYD', 328, 2, 'Guyanese Dollar', 'Guyana', 1, null);     
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('HKD', 344, 2, 'Hong Kong Dollar', 'Hong Kong', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('HNL', 340, 2, 'Honduran Lempira', 'Honduras', 1, null);   
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('HRD', 191, 2, 'Croatian Dinar', 'Croatia', 0, '1995-01-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('HRK', 191, 2, 'Croatian Kuna', 'Croatia', 0, '2015-06-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('HTG', 332, 2, 'Haitian Gourde', 'Haiti', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('HUF', 348, 2, 'Hungarian Forint', 'Hungary', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('IDR', 360, 2, 'Indonesian Rupiah', 'Indonesia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ILS', 376, 2, 'Israeli New Shekel', 'Israel and the Palestinian Authority', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('IMP', null, 2, 'Isle of Man pound (also Manx pound)', 'Isle of Man', 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('INR', 356, 2, 'Indian Rupee', 'India and Bhutan', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('IQD', 368, 3, 'Iraqi Dinar', 'Iraq', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('IRR', 364, 0, 'Iranian Rial', 'Iran', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ISK', 352, 0, 'Icelandic Króna', 'Iceland', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ITL', 380, 0, 'Italian Lira', 'Italy and Vatican City State', 0, '2002-03-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('JEP', null, 0, 'Jersey pound', 'Jersey', 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('JMD', 388, 2, 'Jamaican Dollar', 'Jamaica', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('JOD', 400, 3, 'Jordanian Dinar', 'Jordan', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('JPY', 392, 0, 'Japanese Yen', 'Japan', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('KES', 404, 2, 'Kenyan Shilling', 'Kenya', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('KGS', 417, 2, 'Kyrgyzstani Som', 'Kyrgyzstan', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('KHR', 116, 2, 'Cambodian Riel', 'Cambodia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('KES', 404, 2, 'Kenyan Shilling', 'Kenya', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('KID', null, 2, 'Kiribati dollar', 'Kiribati', 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('KPW', 408, 0, 'North Korean Won', 'North Korea', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('KRW', 410, 0, 'South Korean Won', 'South Korea', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('KWD', 414, 3, 'Kuwaiti Dinar', 'Kuwait', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('KYD', 136, 2, 'Cayman Islands Dollar', 'Cayman Islands', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('KZT', 398, 2, 'Kazakhstani Tenge', 'Kazakhstan', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('LAK', 418, 0, 'Lao Kip', 'Laos', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('LBP', 422, 0, 'Lebanese Pound', 'Lebanon', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('LKR', 144, 2, 'Sri Lankan Rupee', 'Sri Lanka', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('LRD', 430, 2, 'Liberian Dollar', 'Liberia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('LSL', 426, 2, 'Lesotho Loti', 'Lesotho', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('LYD', 434, 3, 'Libyan Dinar', 'Libya', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('MAD', 504, 2, 'Moroccan Dirham', 'Morocco', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('MDL', 498, 2, 'Moldovan Leu', 'Moldova', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('MGA', 969, 2, 'Malagasy Ariary', 'Madagascar', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('MKD', 807, 0, 'Macedonian Denar', 'Macedonia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('MMK', 104, 0, 'Myanmar Kyat', 'Myanmar', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('MNT', 496, 2, 'Mongolian Tögrög', 'Mongolia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('MOP', 446, 2, 'Macanese Pataca', 'Macau', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('MRO', 478, 2, 'Mauritanian Ouguiya', 'Mauritania', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('MUR', 480, 2, 'Mauritian Rupee', 'Mauritius', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('MVR', 462, 2, 'Maldivian Rufiyaa', 'Maldives', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('MWK', 454, 2, 'Malawian Kwacha', 'Malawi', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('MXN', 484, 2, 'Mexican Peso', 'Mexico', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('MXV', 979, 2, 'Mexican Unidad de Inversion (UDI) (funds code)', 'Mexico', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('MYR', 458, 2, 'Malaysian Ringgit', 'Malaysia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('MZN', 943, 2, 'Mozambican Metical', 'Mozambique', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('NAD', 516, 2, 'Namibian dollar', 'Namibia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('NGN', 566, 2, 'Nigerian Naira', 'Nigeria', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('NIO', 558, 2, 'Nicaraguan Córdoba', 'Nicaragua', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('NIS', null, 2, 'Israeli New Shekel', 'Israel', 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('NOK', 578, 2, 'Norwegian Krone', 'Norway, Svalbard and Jan Mayen, and Bouvet Island', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('NPR', 524, 2, 'Nepalese Rupee', 'Nepal', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('NTD', null, 2, 'New Taiwan dollar', 'Taiwan', 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('NZD', 554, 2, 'New Zealand Dollar', 'New Zealand, Cook Islands, Niue, Pitcairn Islands, Tokelau', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('OMR', 512, 3, 'Omani Rial', 'Oman', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('PAB', 590, 2, 'Panamanian Balboa', 'Panama', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('PEN', 604, 2, 'Peruvian Sol', 'Peru', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('PGK', 598, 2, 'Papua New Guinean Kina', 'Papua New Guinea', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('PHP', 608, 2, 'Philippine Peso', 'Philippines', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('PKR', 586, 2, 'Pakistani Rupee', 'Pakistan', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('PLN', 985, 2, 'Polish Złoty', 'Poland', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('PRB', null, 2, 'Transnistrian ruble', 'Transnistria', 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('PYG', 600, 0, 'Paraguayan Guaraní', 'Paraguay', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('QAR', 634, 2, 'Qatari Riyal', 'Qatar', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('RMB', null, 2, 'Renminbi (Chinese) yuan', 'Mainland China (from its official name RenMinBi)', 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('RON', 946, 2, 'Romanian Leu', 'Romania', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('RSD', 941, 2, 'Serbian Dinar', 'Serbia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('RUB', 643, 2, 'Russian Ruble', 'Russia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('RUR', 810, 0, 'Russian Ruble', 'Armenia', 0, '1994-08-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('RWF', 646, 0, 'Rwandan Franc', 'Rwanda', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('SAR', 682, 2, 'Saudi Riyal', 'Saudi Arabia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('SBD', 90, 2, 'Solomon Islands Dollar', 'Solomon Islands', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('SCR', 690, 2, 'Seychelles Rupee', 'Seychelles', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('SDG', 938, 2, 'Sudanese Pound', 'Sudan', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('SEK', 752, 2, 'Swedish Krona/Kronor', 'Sweden', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('SGD', 702, 2, 'Singapore Dollar', 'Singapore', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('SHP', 654, 2, 'Saint Helena Pound', 'Saint Helena, Ascension Island, Tristan da Cunha', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('SLL', 694, 0, 'Sierra Leonean Leone', 'Sierra Leone', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('SLS', null, 2, 'Somaliland shilling', 'Somaliland', 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('SOS', 706, 2, 'Somali Shilling', 'Somalia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('SRD', 968, 2, 'Surinamese Dollar', 'Suriname', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('SSP', 728, 2, 'South Sudanese Pound', 'South Sudan', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('STN', 678, 0, 'São Tomé and Príncipe Dobra', 'São Tomé and Príncipe', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('SVC', 222, 2, 'Salvadoran Colón', 'El Salvador', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('SYP', 760, 2, 'Syrian Pound', 'Syria', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('SZL', 748, 2, 'Swazi Lilangeni', 'Eswatini', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('THB', 764, 2, 'Thai Baht', 'Thailand', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('TJS', 972, 2, 'Tajikistani Somoni', 'Tajikistan', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('TMT', 934, 2, 'Turkmenistan Manat', 'Turkmenistan', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('TND', 788, 3, 'Tunisian Dinar', 'Tunisia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('TOP', 776, 2, 'Tongan Paʻanga', 'Tonga', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('TRY', 949, 2, 'Turkish Lira', 'Turkey', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('TTD', 780, 2, 'Trinidad and Tobago Dollar', 'Trinidad and Tobago', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('TVD', null, 2, 'Tuvalu dollar', 'Tuvalu', 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('TWD', 901, 2, 'New Taiwan Dollar', 'Taiwan', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('TZS', 834, 2, 'Tanzanian Shilling', 'Tanzania', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('UAH', 980, 2, 'Ukrainian Hryvnia', 'Ukraine', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('UGX', 800, 2, 'Ugandan Shilling', 'Uganda', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('USD', 840, 2, 'United States Dollar', 'United States of America, American Samoa, Barbados, Bermuda, British Indian Ocean Territory, British Virgin Islands, Caribbean Netherlands, Ecuador, El Salvador, Guam, Haiti, Marshall Islands, Federated States of Micronesia, Northern Mariana Islands, Palau, Panama, Puerto Rico, Timor-Leste, Turks and Caicos Islands, U.S. Virgin Islands, and United States Minor Outlying Islands', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('USN', 997, 2, 'United States Dollar (next day) (funds code)', 'United States of America', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('USS', 998, 2, 'United States Dollar (same day) (funds code)', 'United States of America', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('UYI', 940, 0, 'Uruguay Peso en Unidades Indexadas (URUIURUI) (funds code)', 'Uruguay', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('UYU', 858, 2, 'Uruguayan Peso', 'Uruguay', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('UYW', 927, 4, 'Unidad Previsional', 'Uruguay', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('UZS', 860, 2, 'Uzbekistan Som', 'Uzbekistan', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('VES', 937, 2, 'Venezuelan Bolívar Soberano', 'Venezuela', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('VND', 704, 0, 'Vietnamese Dồng', 'Vietnam', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('VTC', null, 8, 'VertCoin', null, 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('VUV', 548, 0, 'Vanuatu Vatu', 'Vanuatu', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('WST', 882, 2, 'Samoan Tala', 'Samoa', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XAF', 950, 0, 'CFA Franc BEAC', 'Cameroon, Central African Republic, Republic of the Congo, Chad, Equatorial Guinea, and Gabon', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XAG', 961, 0, 'Silver (one troy ounce)', null, 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XAU', 959, 0, 'Gold (one troy ounce)', null, 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XBA', 955, 0, 'European Composite Unit (EURCO) (bond market unit)', null, 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XBB', 956, 0, 'European Monetary Unit (E.M.U.-6) (bond market unit)', null, 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XBC', 957, 0, 'European Unit of Account 9 (E.U.A.-9) (bond market unit)', null, 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XBD', 958, 0, 'European Unit of Account 17 (E.U.A.-17) (bond market unit)', null, 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XBT', null, 8, 'Bitcoin', null, 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XDR', 960, 0, 'Special drawing rights International Monetary Fund', 'International Monetary Fund', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XFA', null, 2, 'Africahead Ipparts (AFA collision)', null, 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XEU', 954, 0, 'European Currency Unit', 'European Monetary Co-operation Fund', 0, '1999-01-01 12:00:00');
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XLM', null, 8, 'Stellar Lumen', null, 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XMR', null, 12, 'Monero', null, 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XPD', 964, 0, 'Palladium (one troy ounce)', null, 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XPT', 962, 0, 'Platinum (one troy ounce)', null, 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XRP', null, 6, 'Ripple', null, 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XSU', 994, 0, 'SUCRE Unified System for Regional Compensation (SUCRE)', 'Unified System for Regional Compensation (SUCRE)', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XTS', 963, 0, 'Code reserved for testing purposes', null, 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XUA', 965, 0, 'ADB Unit of Account African Development Bank', 'African Development Bank', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XXX', 999, 0, 'No currency', null, 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XCD', 951, 2, 'East Caribbean Dollar', 'Anguilla, Antigua and Barbuda, Dominica, Grenada, Montserrat, Saint Kitts and Nevis, Saint Lucia, Saint Vincent and the Grenadines', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XOF', 952, 0, 'CFA Franc BCEAO', 'Benin, Burkina Faso, Côte d''Ivoire, Guinea-Bissau, Mali, Niger, Senegal, Togo', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('XPF', 953, 0, 'CFP Franc (Franc Pacifique)', 'French territories of the Pacific Ocean: French Polynesia, New Caledonia, Wallis, and Futuna', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('YER', 886, 2, 'Yemeni Rial', 'Yemen', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ZAR', 710, 2, 'South African Rand', 'South Africa', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ZEC', null, 8, 'Zcash', null, 0, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ZMW', 967, 2, 'Zambian Kwacha', 'Zambia', 1, null);
INSERT INTO ISO4217Currencies(AlphabeticCode, NumericCode, MinorUnit, [Name], Country, ISO4217Standard, WithdrawalDate) VALUES ('ZWB', null, 2, 'Zimbabwean bonds', 'Zimbabwe', 0, null);
GO
