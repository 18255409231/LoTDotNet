--����
--DML������
--	Insert��delete��update����֧��select��
--	after������(for)��instead of����������֧��before��������
--DDL������
--	Create table��create database��alter��drop

--inserted����deleted��
--	inserted�����������
--		insert��update���������õ�
--	deleted�����������
--		delete��update���������õ�

--After��������
--	�����ִ�����֮�󴥷�
--	����䴥������������Ӱ���������������Ӱ��Ϊ�����У�ֻ����һ�Ρ�
--	ֻ�ܽ����ڳ�����ϣ����ܽ�������ͼ����ʱ���ϡ�
--	���Եݹ鴥������߿ɴ�32����
----��ʽ
----create trigger tr_name
----on ���� after [insert|update|delete] 
----as 
----		xxx
----go

--׼������
select * into BackupShopMenuBak from ShopMenuBak where 1=2

--�Ѳ���������Զ����ݵ���һ����
if exists(select * from sysobjects where name='tr_ShopMenuBak')
	drop trigger tr_ShopMenuBak
go
create trigger tr_ShopMenuBak
on ShopMenuBak after insert
as
	insert into BackupShopMenuBak select * from inserted
go

select * from BackupShopMenuBak
insert into ShopMenuBak values(N'test',0,N'test',0,0,99,N'2016-04-08')
select * from BackupShopMenuBak

--��ɾ�����������Զ����ݵ���һ����
if exists(select * from sysobjects where name='tr_ShopMenuBak_delete')
	drop trigger tr_ShopMenuBak
go
create trigger tr_ShopMenuBak_delete
on ShopMenuBak after delete
as
	insert into BackupShopMenuBak select * from deleted
go

select * from BackupShopMenuBak
delete ShopMenuBak where MDataStatus=99
select * from BackupShopMenuBak

--instead of��������
--	�����滻ԭ���Ĳ���
--	����ݹ鴥��
--	������Լ�������֮ǰ����
--	���Խ�����ʱ�����ͼ��
----��ʽ
----create trigger tr_name
----on ���� instead of
----as 
----		xxx
----go

--����
--����������SQL�����Ϊ��ͬһ��������
	--�����ڴ������������Ӳ���
	--���������ڴ�������ִ�к�ʱ����
