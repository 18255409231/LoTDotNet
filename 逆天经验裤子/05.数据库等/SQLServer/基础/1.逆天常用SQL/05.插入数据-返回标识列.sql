--��������
--@@identity
insert into ShopModelBak values(N'lll',1,99)
select @@identity

--output
insert into ShopModelBak
output inserted.SId
values(N'222',1,99)


--���ض��ֵ
insert into ShopModelBak
output inserted.SId,inserted.SName,inserted.SOrder,inserted.SDataStatus
values(N'333',1,99)