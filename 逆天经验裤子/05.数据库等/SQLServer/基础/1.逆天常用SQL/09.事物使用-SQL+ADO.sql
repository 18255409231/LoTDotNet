--����������ؼ���䣺
--��������--�������� begin transaction
--û�д���--�ύ���� commit transaction
--���ִ���--����ع� rollback transaction
--�����ʹ�÷���:������Ҫִ�е�ҵ���߼�����ŵ�����Ŀ����ͻع�����������Ŀ������ύ֮��Ϳ�����
--ע�⣺����һ���������ͱ������ύ���߻ع�

--������ ������������ ��ע�⣺set @error+=@@error ��ÿ����涼Ҫ�ӡ���
--����һ
declare @error int=0
begin transaction
	insert into ShopModelBak values(N'test',1,1)
set @error+=@@error
	insert into ShopModelBak values(N'test',1,1)
set @error+=@@error
	insert into ShopModelBak values(N'test',1,1)
set @error+=@@error
	insert into ShopModelBak values(N'test',1,999999999)
set @error+=@@error
	insert into ShopModelBak values(N'test',1,1)
set @error+=@@error
if(@error=0)
	commit transaction
else
	rollback transaction

--������
begin try
	begin transaction
		insert into ShopModelBak values(N'test',1,1)
		insert into ShopModelBak values(N'test',1,1)
		insert into ShopModelBak values(N'test',1,1)
		insert into ShopModelBak values(N'test',1,1)
		insert into ShopModelBak values(N'test',1,999999999)
		insert into ShopModelBak values(N'test',1,1)
		insert into ShopModelBak values(N'test',1,1)
	commit transaction
end try
begin catch
	rollback transaction
	select @@error,error_message() --�����п���
end catch


--ADO.Net����ʹ��
--using (SqlConnection conn = new SqlConnection(connStr))
--{
--    string sql = @"insert into ShopModelBak values(N'test',1,1) 
--                   insert into ShopModelBak values(N'test',1,1) 
--                   insert into ShopModelBak values(N'test',1,1) 
--                   insert into ShopModelBak values(N'test',1,1) 
--                   insert into ShopModelBak values(N'test',1,999999999) 
--                   insert into ShopModelBak values(N'test',1,1) 
--                   insert into ShopModelBak values(N'test',1,1) ";
--    using (SqlCommand cmd = new SqlCommand(sql, conn))
--    {
--        conn.Open();
--        cmd.Transaction = conn.BeginTransaction();
--        try
--        {
--            int i = cmd.ExecuteNonQuery();
--            Console.WriteLine(i);
--        }
--        catch (Exception ex)
--        {
--            cmd.Transaction.Rollback();
--            Console.WriteLine(ex);
--        }
--    }
--}