--�޸�-����ָ����ʶ�е�����
set identity_insert ShopModelBak on
	insert into ShopModelBak(SId,SName,SOrder,SDataStatus) values(5,N'lll',1,1)
set identity_insert ShopModelBak off
--
--ע�⣺�������д ShopModelBak values(5,N'lll',1,1) ����� �����ؼ��ʣ�����ʹ�������б�
----����ʹ�������б��� IDENTITY_INSERT Ϊ ON ʱ������Ϊ��'ShopModelBak'�еı�ʶ��ָ����ʽֵ��