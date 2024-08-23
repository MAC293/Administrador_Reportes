--Server name: X293CA\X293CA

SELECT * FROM Member;

SELECT * FROM Spreadsheet;

SELECT CONVERT(VARCHAR(20), GETDATE(), 103);

SET DATEFORMAT dmy;

SELECT Testing as Testing
FROM Spreadsheet
WHERE Testing = Testing;

DELETE FROM Spreadsheet
WHERE Code != 20;

DELETE FROM Spreadsheet
WHERE Code = 2;

DELETE FROM Spreadsheet
WHERE Code = 3;

DELETE FROM Spreadsheet
WHERE Code = 4;

ALTER TABLE [dbo].[Spreadheet]
DROP CONSTRAINT FK_Description_Spreadheet

TRUNCATE TABLE Spreadsheet;

UPDATE Spreadsheet
SET Generated = '2018-05-17'
WHERE Code = 2; 

DELETE FROM Spreadsheet;