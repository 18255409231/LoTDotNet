--һ��ע�⣺select into�±� ֻ�Ǹ�����ԭ��ṹ��������ʶ��, ��������,Լ����û���հ��.

--��һ��������ݲ��뵽��һ�����У�ResultBak���Բ����ڣ�
select * into ShopMenuBak from ShopMenu

--����ͬ�Ƚṹ�ı�
select top 0 * into ShopMenuBak1 from ShopMenu --�Ƽ�
--select * into ShopMenuBak1 from ShopMenu where 1=2

--һ��˼·�����ݱ�����(CityInfoBak�����ȴ����Һ�CityInfo�ṹ����)
insert into CityInfoBak select CAreaCode,CName,CPid,CLevel,COrder,CNameEn,CShortname,CDataStatus from CityInfo