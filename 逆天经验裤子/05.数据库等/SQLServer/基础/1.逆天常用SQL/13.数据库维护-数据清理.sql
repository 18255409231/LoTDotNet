--������װ
declare @cloumnName varchar(100)='TName'
update ShopMenuType set @cloumnName=replace(@cloumnName,char(10),'') --- ��ȥ���з� 
update ShopMenuType set @cloumnName=replace(@cloumnName,char(13),'') --- ��ȥ�س��� 
update ShopMenuType set @cloumnName=replace(@cloumnName,' ','') --- ��ȥ�ո�� 

--����
declare @tableName varchar(100)='ShopMenuType'
exec('select * from '+ @tableName)
--����ת��
select '''','''''',''' '''
go

--���շ�װ
declare @tableName varchar(100),@cloumnName varchar(100),@sqlStr nvarchar(1000)
select @tableName='ShopMenuType',@cloumnName='TName'--ÿ���滻����ı����������Ϳ�����
set @sqlStr='update '+@tableName+' set '+@cloumnName+'=replace('+@cloumnName+',char(10),'''')' --- ��ȥ���з� 
set @sqlStr=@sqlStr+' update '+@tableName+' set '+@cloumnName+'=replace('+@cloumnName+',char(13),'''')' --- ��ȥ�س���
set @sqlStr=@sqlStr+' update '+@tableName+' set '+@cloumnName+'=replace('+@cloumnName+','' '','''')' --- ��ȥ�ո�� 
print @sqlStr
exec(@sqlStr)
