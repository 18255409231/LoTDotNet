--�ֲ���ʱ��:ֻ���ڵ�ǰ�Ự��ʹ�ã�������˵�ǰ�Ự��ʱ��Ͳ���ʹ�á�
create table #temp
(
 SId int not null,
 SName nvarchar(20) not null,
 SOrder smallint not null,
 SDataStatus smallint not null
)
--��ShopModelBak������ݴ洢����ʱ��ռ�
insert into #temp select * from ShopModelBak
--�鿴��ʱ�������
select * from #temp

--ɾ��ShopModelBak�������
truncate table ShopModelBak
select * from ShopModelBak

--����ʱ����������µ��뵽ShopModelBakge
insert into ShopModelBak(SName,SOrder,SDataStatus) select SName,SOrder,SDataStatus from #temp
select * from ShopModelBak


---ȫ����ʱ��:ֻ�ڵ�ǰ�Ựû�йرգ���ô��ʱ���������Ự��Ҳ�ܹ�ʹ��
create table ##temp1
(
 SId int not null,
 SName nvarchar(20) not null,
 SOrder smallint not null,
 SDataStatus smallint not null
)

insert into ##temp1 select * from #temp
select * from ##temp1