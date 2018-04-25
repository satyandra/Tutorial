DECLARE @LoopCounter INT , @MaxEmployeeId INT, 
        @event_type INT,@fromdate VARCHAR(10),@noteVal VARCHAR(250),
		@todate VARCHAR(10),@count INT,@psdDate DATETIME,@ExpressionToFind VARCHAR(20)
SET @count =0
drop table Tempout
Create table Tempout(ID INT IDENTITY(1, 1) primary key ,event_id INT,event_type VARCHAR(250),psd DATETIME,rsd DATETIME,rdd VARCHAR(250));
SELECT @LoopCounter = min(id) , @MaxEmployeeId = max(Id) 
FROM psd_event 
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxEmployeeId)
BEGIN
   SELECT @event_type = event_type,@noteVal=note, @count = LEN(note)
		 FROM psd_event 
   WHERE Id = @LoopCounter
	SET @count =@count	
	SET @noteVal =@noteVal
	SET @count =@count
	SET @psdDate =CONVERT(DATETIME, CONVERT(VARCHAR(10),'2015-12-02',120),103)
PRINT @psdDate
	IF @event_type = 140 or @event_type = 104 or @event_type = 130 or @event_type = 131 or @event_type = 188 or @event_type = 189
	BEGIN
			IF (@event_type = 140 or @event_type = 104)
			BEGIN
				PRINT 'hi'
				INSERT INTO Tempout(event_id,event_type) values (@event_type,'Arrange Delivery')
			END
			IF (@count = 33 and UPPER(SUBSTRING(@noteVal,1,4)) = 'FROM' and UPPER(SUBSTRING(@noteVal,6,2)) = 'TO'
				and UPPER(SUBSTRING(@noteVal,20,3)) = 'RDD')
			BEGIN
				PRINT 'hi'
				
				INSERT INTO Tempout(event_id,event_type,psd,rsd) 
					values (@event_type,'initial',

					CONVERT(DATETIME, CONVERT(VARCHAR(10),SUBSTRING(@noteVal,9,11),112),103),
					CONVERT(DATETIME, CONVERT(VARCHAR(10),SUBSTRING(@noteVal,24,11),112),103))
			END
			IF (@count = 44 and UPPER(SUBSTRING(@noteVal,1,4)) = 'FROM' and UPPER(SUBSTRING(@noteVal,17,2)) = 'TO'
			and UPPER(SUBSTRING(@noteVal,31,3)) = 'RDD')
			BEGIN
				PRINT 'hi'
				
				INSERT INTO Tempout(event_id,event_type,psd,rsd) 
					values (@event_type,'update',
					CONVERT(DATETIME, CONVERT(VARCHAR(10),SUBSTRING(@noteVal,6,10),112),103),
					CONVERT(DATETIME, CONVERT(VARCHAR(10),SUBSTRING(@noteVal,20,11),112),103))
			END
			SET @ExpressionToFind = 'nochange' 
			IF @noteVal LIKE '%' + @ExpressionToFind + '%' 
			BEGIN 
				PRINT 'Yes it is find'  
				INSERT INTO Tempout(event_id,event_type) 
					values (@event_type,'Nochange')
			END
			ELSE  
				PRINT 'It doesn''t find'  
		END
   SELECT @LoopCounter  = min(id) FROM psd_event
   WHERE Id > @LoopCounter
END
select * from Tempout
select * from psd_event

----
select CONVERT(DATETIME, convert(varchar(10),getdate(),101) )
from psd_event 
select CONVERT(DATETIME, CONVERT(VARCHAR(10),'2015-12-02',112),103)

insert into psd_event values(9,188,'data has nochange');
insert into psd_event values(9,188,'From 2018-03-04 To 20-09-2016 rdd=30-12-2017');
insert into psd_event values(9,188,'From 20-01-2018 To 30-01-2018 rdd=30-12-2017');
insert into psd_event values(9,188,'From 20-01-2018 To 30-01-2018 rdd=30-12-2017');

From 20-01-2018 To 30-01-2018 rdd=30-12-2017
SELECT Cast('2013-07-01 00:00:00.000' AS DATE) 
SELECT  CONVERT(VARCHAR(10), '03-07-2018', 112) 'Date Part Only'

From 2018-03-04 To 10-08-2016 rdd=30-12-2017

Declare @PSDDATE
SET @PSDDATE= (CONVERT(VARCHAR(10), CAST('2010-04-14' AS DATETIME), 103) AS [DD/MM/YYYY])
SELECT (CAST('2010-04-14' AS DATETIME)) AS [DD/MM/YYYY]
SELECT CONVERT(DATETIME, CONVERT(VARCHAR(10),SUBSTRING('2010-04-14',1,10),112),103)