--�����ۼ�����
if exists(select * from sysindexes where name='IX_ShopMenuBak_MId')
 drop index ShopMenuBak.IX_ShopMenuBak_MId
create clustered  index  IX_ShopMenuBak_MId
on ShopMenuBak(Mid)
go

--����һ��������Ĭ������
if exists(select * from sysindexes where name='IX_ShopMenuBak_MName')
 drop index ShopMenuBak.IX_ShopMenuBak_MName
create index  IX_ShopMenuBak_MName
on ShopMenuBak(MName)
go

--���䣺����һ�����������ý���
if exists(select * from sysindexes where name='IX_ShopMenuBak_MName')
 drop index ShopMenuBak.IX_ShopMenuBak_MName
create  index  IX_ShopMenuBak_MName
on ShopMenuBak(MName desc)
go

--��֪ʶ�㣺
--�ۼ�����---��ζ������
--�ۼ�����---����ҳ��˳���������ָ������ݵ�˳��,�������������޷��ֶ��������������������ȴ����ۼ��������ٴ��������Ϳ������������Ǿۼ�����
--�Ǿۼ�����-����ҳ��˳����������ָ������ݵ�˳���޹�
--���������ã�
--1.Ϊ����߲�ѯ��Ч�ʵ�
--2.ÿһ������ɾ�����޸�Ҳ���޸Ļ���ˢ������ҳ(������ɾ���ٶȾͱ���ǰ����)
--3.���������������ݣ�������Ҳ��Ҫ�洢�ռ䰡