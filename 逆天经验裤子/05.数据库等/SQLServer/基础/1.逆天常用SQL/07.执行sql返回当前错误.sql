--ʹ��ȫ�ֱ��� @@error ����ʵ��һ�־͹��ˡ�
insert into ShopModelBak values(N'test',1,999999999)
select @@error

--ʹ�� try catch
begin try
	insert into ShopModelBak values(N'test',1,999999999)
end try
begin catch
		select @@error,error_message()
end catch