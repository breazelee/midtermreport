% !Mode:: "TeX:UTF-8"
%%%%% 'midterm_report.cls' BEGIN


% buaamtr = buaa middle term report
%%%%%%%%%% class clarification %%%%%%%%%%
% 模板声明

\NeedsTeXFormat{LaTeX2e}[2007/10/19]
\ProvidesClass{midtermreport}
              [2016/08/14 v0.1 
The LaTeX template for midterm report of BUAA]
\typeout{Document Class `midtermreport' v0.1 by LIYANG (2016/08)}

%%%%%%%%%% class options %%%%%%%%%%
% 模板选项

\newif\ifmtr@color\mtr@colorfalse
\DeclareOption{color}{\mtr@colortrue}

% 其余选项传递给ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

% 引用ctexbook及基本设置
\LoadClass[cs4size,a4paper,fancyhdr]{ctexbook}[2015/05/16]

%%%%%%%%%% global package %%%%%%%%%%
% 全局通用宏包

\RequirePackage{ifthen}

%%%%%%%%%% font %%%%%%%%%%
% 数学相关和字体设置

\RequirePackage{amsmath,amssymb,amsfonts,mathrsfs,bm}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{txfonts}

% 主要字体为Times New Roman和宋体
% 模板某些标题需要华文行楷和32号字

\setmainfont{Times New Roman}

% 不需要设置CJKmainfont，ctex 宏包已经很好的处理了
% 不仅设置了粗体为黑体，斜体为楷体，还兼容了winfonts和adobefonts
% 直接设置反而会在只有adobefonts的情况下报错
% \setCJKmainfont{宋体}
\setCJKfamilyfont{hwxingkai}{STXingkai}
\newcommand{\hwxingkai}{\CJKfamily{hwxingkai}}
\newcommand{\xiaochuhao}{\fontsize{32pt}{\baselineskip}\selectfont}

%%%%%%%%%% color %%%%%%%%%%
% 颜色设置

% 只用于电子版
\RequirePackage{color}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

%%%%%%%%%% page margin %%%%%%%%%%
% 页面边距

\RequirePackage{geometry}
\newgeometry{
    top=34mm, 
    bottom=34mm, 
    left=31.7mm, 
    right=31.7mm,
    headsep=5mm,
    headheight=10mm, 
    footskip=10mm,
}
\savegeometry{middlereportgeometry}
\loadgeometry{middlereportgeometry}

%%%%%%%%%% space %%%%%%%%%%
% 其他间距

\renewcommand{\baselinestretch}{1.5}
\setlength{\parindent}{2em}
\setlength{\floatsep}{3pt plus 3pt minus 2pt}      % 图形之间或图形与正文之间的距离
\setlength{\abovecaptionskip}{10pt plus 1pt minus 1pt} % 图形中的图与标题之间的距离
\setlength{\belowcaptionskip}{3pt plus 1pt minus 2pt} % 表格中的表与标题之间的距离

%%%%%%%%%% header & footer %%%%%%%%%%
% 页眉页脚

\RequirePackage{fancyhdr}
% 正文之前的页眉页脚，全部去掉
\fancypagestyle{frontmatter}{
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\headrulewidth}{0pt}
    \fancyhf{}
    \fancyfoot[C]{\thepage}
}

% 正文的页眉页脚
\fancypagestyle{mainmatter}{
    \renewcommand{\headrulewidth}{0.5bp} % 页眉线宽度
    \fancyhf{}
    \fancyhead[C]{\kaishu\zihao{-5}硕士学位论文中期检查报告}
    \fancyfoot[C]{
        \raisebox{2ex}{\kaishu\zihao{-5}\mtr@university \mtr@school }\hfill
        \raisebox{2ex}{\kaishu\zihao{-5}.\quad\thepage\quad.}}

}

% chapter page 也是mainmatter类型
\fancypagestyle{plain}{
    \pagestyle{fancy}
}

%%%%%%%%%% title %%%%%%%%%%
% 标题

% 汉化
\renewcommand{\contentsname}{\hspace*{\fill}目\qquad 录\hspace*{\fill}}
\renewcommand\listfigurename{插\ 图\ 目\ 录}
\renewcommand\listtablename{表\ 格\ 目\ 录}
\renewcommand\bibname{\hspace*{\fill}主\ 要\ 参\ 考\ 文\ 献\hspace*{\fill}}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

% 格式
\ctexset{
    chapter = {
        format = \zihao{-3}\heiti,
        nameformat = \zihao{-3}\heiti,
        titleformat = \zihao{-3}\heiti,
        name = {,},
        aftername = {\quad},
        number = \arabic{chapter},
        beforeskip= {-.5\baselineskip},
        afterskip= {.5\baselineskip}
    },
    section = {
        format =  \zihao{4}\heiti ,
        aftername = \quad ,
        beforeskip = .5\baselineskip ,
        afterskip = .5\baselineskip 
    },
    subsection = {
        format={\zihao{-4}\heiti},
        aftername={\quad},
        beforeskip = .25ex plus 1ex minus .2ex ,
        afterskip = .3ex plus .2ex 
    }
}

\newcommand\relaxclearpage{
    \let\tmpdp\cleardoublepage%
    \let\tmpp\clearpage%
    \let\cleardoublepage\relax%
    \let\clearpage\relax%
}

\newcommand\resetclearpage{
    \let\cleardoublepage\tmpdp%
    \let\clearpage\tmpp%
}

%%%%%%%%%% contents %%%%%%%%%%
% 目录

\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\heiti\zihao{5}}{\thecontentslabel\ }{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}

\titlecontents{section}[2em]{\vspace{0.1\baselineskip}\songti\zihao{5}}{\thecontentslabel\ }{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}

\titlecontents{subsection}[4em]{\vspace{0.1\baselineskip}\songti\zihao{5}}{\thecontentslabel\ }{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}


% 取消图片、表格目录中的章节空格
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}

%表目录图目录的格式设置
%表目录与图目录数字前增加“表”与“图”字，并且使目录行间距与section行间距一致

\titlecontents{figure}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{图~\thecontentslabel\quad}}{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

\titlecontents{table}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{表~\thecontentslabel\quad}}{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

%%%%%%%%%% cross reference %%%%%%%%%%
% 交叉引用

\RequirePackage[xetex,unicode]{hyperref}
\ifmtr@color
    \hypersetup{colorlinks}
\else
    \hypersetup{hidelinks}
\fi
\hypersetup{
    bookmarksnumbered,
    bookmarksopen,
    pdftitle={midterm report},
    pdfauthor={liyang},
    pdfsubject={北京航空航天大学计算机学院中期检查报告},
    pdfcreator={LaTeXed~By~liyang}
}

%%%%%%%%%% reference %%%%%%%%%%
% 参考文献

\bibliographystyle{midtermreport} % 参考文献格式
\RequirePackage[sort&compress]{natbib}
\bibpunct{[}{]}{,}{n}{}{}
\setlength{\bibsep}{0pt}
\RequirePackage{hypernat}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

%%%%%%%%%% table %%%%%%%%%%
% 表格

% 长表格
\RequirePackage{longtable}

% 表格中的行合并
\RequirePackage{multirow}

% 重定义table/tabular/tabularx环境，使表格内为5号字
% TODO(huxuan): 支持 longtable
\let\oldtable\table
\let\endoldtable\endtable
\renewenvironment{table}[1][h!]
{\renewcommand{\arraystretch}{1.5}
\oldtable[#1]\zihao{5}}
{\renewcommand{\arraystretch}{1}
\endoldtable}

\let\oldtabular\tabular
\let\endoldtabular\endtabular
\renewenvironment{tabular}[1][h!]
{\renewcommand{\arraystretch}{1.5}
\oldtabular[#1]\zihao{5}}
{\renewcommand{\arraystretch}{1}
\endoldtabular}

\RequirePackage{tabularx}
\let\oldtabularx\tabularx
\let\endoldtabularx\endtabularx
\renewenvironment{tabularx}[2]
{\renewcommand{\arraystretch}{1.5}
\zihao{5}\oldtabularx{#1}{#2}}
{\renewcommand{\arraystretch}{1}
\endoldtabularx}


\RequirePackage{array}

%%%%%%%%%% picture %%%%%%%%%%
% 图片

\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.eps,.ps,.jpg,.bmp}
\graphicspath{{figure/}}
\RequirePackage{pifont} % “秘级”后的五角星
\RequirePackage{subfigure}

%%%%%%%%%% list %%%%%%%%%%
% 列表

\RequirePackage{enumitem}
\setlist{noitemsep}
\setlist[1,2]{labelindent=\parindent}
\setlist[enumerate,1]{label=\arabic*、}
\setlist[enumerate,2]{label=（\arabic*）}
\setlist{
    topsep=0pt,
    itemsep=0pt,
    partopsep=0pt,
    parsep=\parskip,
}

%%%%%%%%%% code %%%%%%%%%%
% 代码

% Listing 的设置请参考 http://en.wikibooks.org/wiki/LaTeX/Packages/Listings
\RequirePackage{listings}
\lstset{
    backgroundcolor=\color{white},
    basicstyle=\zihao{5}\ttfamily,
    columns=flexible,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    frame=single,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    stepnumber=1,
    rulecolor=\color{black},
    tabsize=2,
    texcl=true,
    title=\lstname,
    escapeinside={\%*}{*)},
    extendedchars=false,
    mathescape=true,
    xleftmargin=3em,
    xrightmargin=3em,
}
\ifmtr@color
    \lstset{
        numberstyle=\color{gray},
        keywordstyle=\color{blue},
        commentstyle=\color{dkgreen},
        stringstyle=\color{mauve},
    }
\else
    \lstset{
        numberstyle=\color{black},
        keywordstyle=\color{black},
        commentstyle=\color{black},
        stringstyle=\color{black},
    }
\fi

% 重命名Listings标题头
\renewcommand{\lstlistingname}{代码}

%%%%%%%%%% theorem %%%%%%%%%%
% 定理

\theoremsymbol{\ensuremath{\square}}
\newtheorem*{proof}{证明}
\theoremstyle{plain}
\theoremsymbol{}
\theoremseparator{：}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{remark}{注释}[chapter]
\newtheorem{problem}{问题}[chapter]
\newtheorem{conjecture}{猜想}[chapter]

%%%%%%%%%% file directory %%%%%%%%%%
% 文件目录

\RequirePackage{dirtree}
\ifmtr@color
    \renewcommand*\DTstylecomment{\ttfamily\color{dkgreen}}
    \renewcommand*\DTstyle{\ttfamily\color{red}}
\fi

%%%%%%%%%% caption %%%%%%%%%%
% 图表标题

\RequirePackage{caption}
\DeclareCaptionFormat{mtrfigure}{\bf\songti\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{mtrtable}{\bf\songti\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{mtrlstlisting}{\bf\songti\zihao{5}{#1\textrm{#2}#3}}

\RequirePackage{remreset}
\@removefromreset{table}{chapter}
\@removefromreset{figure}{chapter}
%使图表的标号与章节无关
\captionsetup[figure]{format=mtrfigure,labelsep=quad}
\captionsetup[table]{format=mtrtable,labelsep=quad}
\captionsetup[lstlisting]{format=mtrlstlisting,labelsep=quad}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}

% Fix subfigure reference bug
\let\p@subfigure=\thefigure

% 图片表格标题命令，主要用于混排
\newcommand\figcaption{\def\@captype{figure}\caption}
\newcommand\tabcaption{\def\@captype{table}\caption}

% 下划线
\RequirePackage{ulem}

% 设置行距
\RequirePackage{setspace}

% 正文前的页码设置位大写罗马数字
\renewcommand{\frontmatter}{
    % \cleardoublepage
    \newpage
    \@mainmatterfalse
    \pagenumbering{roman}
}

%%%%%%%%%% index %%%%%%%%%%
% 首页

% 中文首页
\newcommand{\titlech}{
    \begin{titlepage}
        \begin{center}
            \centerline{~}
            \vskip 50bp
            \centerline{\zihao{-2}\kaishu\mtr@university\mtr@school }
            \vskip 50bp
            \centerline{\zihao{1}\heiti {硕士学位论文中期检查报告} }
            \vskip 100bp
            {
                \zihao{-3}\kaishu
                \begin{tabular}[b]{ll}
                    论文题目： & \mtr@thesistitle \\[.3ex]
                    专~~~~~~~~业： & \mtr@major       \\[.3ex]
                    研究方向： & \mtr@direction   \\[.3ex]
                    研~~究~~生： & \mtr@thesisauthor\\[.3ex]
                    学~~~~~~~~号： & \mtr@studentid\\[.3ex]
                    指导教师： & \mtr@teacher~~\mtr@teacherdegree\\
                \end{tabular}
            }
            \vskip 100bp
            \centerline{\heiti\zihao{3}\mtr@university \mtr@school}
            \centerline{\heiti\zihao{3}\mtr@commityear ~~年~~\mtr@commitmonth ~~月~~\mtr@commitday ~~日}
        \end{center}
    \end{titlepage}
}

\renewcommand{\maketitle}{%
    \titlech
    \frontmatter
    \songti
    \zihao{-4}
}

%%%%%%%%%% common user info %%%%%%%%%%
% 用户信息

% 学校名称
\def\mtr@university{北京航空航天大学}
\def\mtr@universityeng{Beihang University}
\newcommand{\university}[2]{%
    \def\mtr@university{#1}
    \def\mtr@universityeng{#2}
}
% 学院
\def\mtr@school{计算机学院}
\def\mtr@schooleng{School of Computer Science and Engineering}
\newcommand{\school}[2]{%
    \def\mtr@school{#1}
    \def\mtr@schooleng{#2}
}

% 专业
\def\mtr@major{计算机技术}
\def\mtr@majoreng{Computer Technology}
\newcommand{\major}[2]{%
    \def\mtr@major{#1}
    \def\mtr@majoreng{#2}
}

% 研究方向direction
\def\mtr@direction{虚拟现实技术}
\def\mtr@directioneng{Virtual Reality Technology}
\newcommand{\direction}[2]{%
    \def\mtr@direction{#1}
    \def\mtr@directioneng{#2}
}

% 提交时间
\def\mtr@commityear{2016}
\def\mtr@commitmonth{08}
\def\mtr@commitday{08}
\newcommand{\committime}[3]{%
    \def\mtr@commityear{#1}
    \def\mtr@commitmonth{#2}
    \def\mtr@commitday{#3}
}

% 学号
\def\mtr@studentid{ZY1406204}
\newcommand{\studentid}[1]{
    \def\mtr@studentid{#1}
}
% 论文题目
\def\mtr@thesistitle{}
\def\mtr@thesissubtitle{}
\def\mtr@thesistitleeng{}
\def\mtr@thesissubtitleeng{}
\newcommand{\thesistitle}[4]{
    \def\mtr@thesistitle{#1}
    \def\mtr@thesissubtitle{#2}
    \def\mtr@thesistitleeng{#3}
    \def\mtr@thesissubtitleeng{#4}
}

% 作者
\def\mtr@thesisauthor{}
\def\mtr@thesisauthoreng{}
\newcommand{\thesisauthor}[2]{%
    \def\mtr@thesisauthor{#1}
    \def\mtr@thesisauthoreng{#2}
}

% 指导老师
\def\mtr@teacher{}
\def\mtr@teachereng{}
\newcommand{\teacher}[2]{%
    \def\mtr@teacher{#1}
    \def\mtr@teachereng{#2}
}

% 导师职称
\def\mtr@teacherdegree{}
\def\mtr@teacherdegreeeng{}
\newcommand{\teacherdegree}[2]{%
    \def\mtr@teacherdegree{#1}
    \def\mtr@teacherdegreeeng{#2}
}

\newcommand{\printtitle}{
       
    \centerline{~} 
    \centerline{~} 
    \centerline{\songti\zihao{2}\mtr@thesistitle }
    \vskip 30pt
}
