::======================================
:: Filename: mamske.bat
:: Author:   Joseph
:: Created:  2012 - 07 - 12
:: E-mail:   mrpeng000@gmail.com
::======================================
:: 使用说明
::
::   1、生成文档
::   msmake [bachelor|master] [full]
::     在当前目录下编译论文，将执行xelatex命令，若无相应的cls/bst文件，将直接报错
::      - full 为首次编译或完全清空时的选项，将执行xelatex->bibtex->xelatex->xelatex命令
::   2、清理文件
::   msmake [clean] [more|empty]
::     在当前目录下清理编译过程中产生的临时文件
::     - more 将清除编译过程中产生的文件，包括*aux *.bbl 文件
::     - empty 将清除编译过程中产生的文件，包括*aux *.bbl *.pdf 文件，不建议使用
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
:: 编译我的论文
::======================================
:report
echo 正在编译文件
if not exist midtermreport.cls goto clserr
if not exist midtermreport.bst goto bsterr
if /i {%1}=={report} set mythesis=midtermreport

:: 如若主文件名更改，请将上面的"sample-bachelor"或"sample-master"更改。
call xelatex %mythesis%
if {%2}=={full} (goto full)
if errorlevel 1 goto myerr1
echo 成功生成论文
call %mythesis%.pdf
goto end

:full
call bibtex %mythesis%
call xelatex %mythesis%
call xelatex %mythesis%
echo 成功生成论文
call %mythesis%.pdf
goto end

::======================================
:: 清除文件以及清除更多文件
::======================================
:clean
echo 删除编译临时文件
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
:: 运行错误信息
::======================================
:myerr1
echo 唉呀，生成论文失败了呢
goto end

:biberr
echo 貌似木有参考文献数据库吧
goto end

:clserr
echo 居然连cls模板都木有！闹哪样！
goto end

:bsterr
echo 居然连bst的参考文献样式都木有！闹哪样！
goto end

::======================================
:: 结束符，无任何具体意义
::======================================
:end