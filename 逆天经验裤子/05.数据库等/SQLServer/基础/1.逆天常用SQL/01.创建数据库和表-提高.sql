use master

--����Ŀ¼�����ָ����·�������ھͻᱨ��
exec sp_configure 'show advanced options',1 --��ʾ�߼�ѡ��
reconfigure with override--��������
	exec sp_configure 'xp_cmdshell',1 --1��������0������ֹ
	reconfigure with override
		exec xp_cmdshell 'mkdir F:\Work\SQL mkdir E:\SQL'
	exec sp_configure 'xp_cmdshell',0
	reconfigure with override
exec sp_configure 'show advanced options',0
reconfigure with override

--���ھ�ɾ��
if exists(select * from sysdatabases where Name=N'LawyerBlog')
begin
drop database LawyerBlog
end

--�������ݿ�
create database LawyerBlog
on primary					--���ݿ��ļ������ļ���
(
	name='LawyerBlog_Data', --�߼���
	size=10mb,				--��ʼ��С
	filegrowth=10%,			--�ļ�����
	maxsize=1024mb,			--���ֵ
	filename=N'E:\SQL\LawyerBlog_Data.mdf'--���·���������ļ���׺����
),
(
	name='LawyerBlog_Data1',
	size=10mb,
	filegrowth=10%,
	maxsize=1024mb,
	filename=N'F:\Work\SQL\LawyerBlog_Data.mdf'
),
filegroup ArticleData --Article�ļ��飨��������ͬ���ļ���������Էֵ�ѹ����
(
	name='LawyerBlog_Data_Article',
	size=10mb,
	filegrowth=10%,
	maxsize=1024mb,
	filename=N'E:\SQL\LawyerBlog_Data_Article.ndf'
),
(
	name='LawyerBlog_Data_Article1',
	size=10mb,
	filegrowth=10%,
	maxsize=1024mb,
	filename=N'F:\Work\SQL\LawyerBlog_Data_Article.ndf'
)
log on --�ռ�
(
	name='LawyerBlog_Log1',
	size=5mb,
	filegrowth=5%,
	filename=N'E:\SQL\LawyerBlog_log2.ldf'
),
(
	name='LawyerBlog_Log2',
	size=5mb,
	filegrowth=5%,
	filename=N'F:\Work\SQL\LawyerBlog_log1.ldf'
)
go

use LawyerBlog
--���ھ�ɾ��
if exists(select * from sysobjects where name=N'SeoTKD')
begin
drop table SeoTKD
end

--����SeoTKD��
create table SeoTKD
(
	Gid varchar(36) primary key,
	SeoTitle nvarchar(100) default('����') not null,	--��ѳ���: 10 ~ 60 �ַ�
	SeoKeyWords nvarchar(149) not null,
	SeoDescription nvarchar(249) not null,			--��ѳ���: 50 ~ 160 �ַ�
	SeoDataStatus tinyint default(0)				--0~255 size:1�ֽ�
)


--���ھ�ɾ��
if exists(select * from sysobjects where name=N'Test')
begin
drop table Test
end
--��ָ���ļ����д����ļ�
create table Test
(
	Tid int primary key identity,
	Title01 nvarchar(100) default('����01'),	
	Title02 nvarchar(100) default('����02'),	
	Title23 nvarchar(100) default('����03'),
	DataStatus tinyint default(0)				--0~255 size:1�ֽ�
) on ArticleData

exec sp_helpfilegroup --�鿴�ļ���