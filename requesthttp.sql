DECLARE @Object1 AS INT;
DECLARE @ResponseText AS VARCHAR(8000);
DECLARE @ResponseText1 AS NVARCHAR(2000);
DECLARE @ISIPESAN AS NVARCHAR(2000);
DECLARE @contentType AS VARCHAR(80) = 'application/x-www-form-urlencoded'
DECLARE @URLGS AS VARCHAR(800)= 'https://script.google.com/macros/s/XXXX/exec'
DECLARE @Body1 AS NVARCHAR(2000) = 
	'{
		"aksi": "TP",
		"keyword": "WELCOME"
	}'  
DECLARE @Body2 AS VARCHAR(8000) ='aksi=TP&keyword=WELCOME' 
--EXEC sp_OACreate 'MSXML2.ServerXMLHttp', @Object1 OUT;
EXEC sp_OACreate 'WinHttp.WinHttpRequest.5.1', @Object1 OUT;
EXEC sp_OAMethod @Object1, 'open', NULL, 'post',@URLGS, 'false'
EXEC sp_OAMethod @Object1, 'setRequestHeader', null, 'Content-Type', @contentType
EXEC sp_OAMethod @Object1, 'send', null, @Body2
 
EXEC sp_OAMethod @Object1, 'responseText', @ResponseText1 OUTPUT
SELECT @ResponseText1
Select StringValue from parseJSON(@ResponseText1) WHERE NAME='TEMPLATE PESAN';
EXEC sp_OADestroy @Object1