use master

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
)
log on --�ռ�
(
	name='LawyerBlog_Log1',
	size=5mb,
	filegrowth=5%,
	filename=N'E:\SQL\LawyerBlog_log2.ldf'
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
)

exec sp_helpfilegroup --�鿴�ļ���