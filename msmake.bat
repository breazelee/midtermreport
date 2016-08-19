::======================================
:: Filename: mamske.bat
:: Author:   Joseph
:: Created:  2012 - 07 - 12
:: E-mail:   mrpeng000@gmail.com
::======================================
:: ʹ��˵��
::
::   1�������ĵ�
::   msmake [bachelor|master] [full]
::     �ڵ�ǰĿ¼�±������ģ���ִ��xelatex���������Ӧ��cls/bst�ļ�����ֱ�ӱ���
::      - full Ϊ�״α������ȫ���ʱ��ѡ���ִ��xelatex->bibtex->xelatex->xelatex����
::   2�������ļ�
::   msmake [clean] [more|empty]
::     �ڵ�ǰĿ¼�������������в�������ʱ�ļ�
::     - more �������������в������ļ�������*aux *.bbl �ļ�
::     - empty �������������в������ļ�������*aux *.bbl *.pdf �ļ���������ʹ��
::
::======================================

@echo off
:init
if /i {%1}=={report} goto report
if /i {%1}=={clean} goto clean
if /i {%1}=={help} goto help
if /i {%1}=={} goto report
goto help

::======================================
:: �����ҵ�����
::======================================
:report
echo ���ڱ����ļ�
if not exist midtermreport.cls goto clserr
if not exist midtermreport.bst goto bsterr
if /i {%1}=={report} set mythesis=midtermreport

:: �������ļ������ģ��뽫�����"sample-bachelor"��"sample-master"���ġ�
call xelatex %mythesis%
if {%2}=={full} (goto full)
if errorlevel 1 goto myerr1
echo �ɹ���������
call %mythesis%.pdf
goto end

:full
call bibtex %mythesis%
call xelatex %mythesis%
call xelatex %mythesis%
echo �ɹ���������
call %mythesis%.pdf
goto end

::======================================
:: ����ļ��Լ���������ļ�
::======================================
:clean
echo ɾ��������ʱ�ļ�
del /f /q /s *.log *.glo *.idx *.ilg *.lof *.ind *.out *.thm *.toc *.lot *.loe *.out.bak *.blg *.synctex.gz 
del /f /s *.dvi *.ps
if {%2}=={more} (goto cleanmore)
if {%2}=={empty} (goto cleanempty)
goto end
:cleanmore
del /f /q /s *.aux *.bbl
goto end
:cleanempty
del /f /q /s *aux *.bbl *.pdf
goto end


::======================================
:: ���д�����Ϣ
::======================================
:myerr1
echo ��ѽ����������ʧ������
goto end

:biberr
echo ò��ľ�вο��������ݿ��
goto end

:clserr
echo ��Ȼ��clsģ�嶼ľ�У���������
goto end

:bsterr
echo ��Ȼ��bst�Ĳο�������ʽ��ľ�У���������
goto end

::======================================
:: �����������κξ�������
::======================================
:end