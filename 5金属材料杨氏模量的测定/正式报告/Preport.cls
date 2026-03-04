\ProvidesClass{Preport}
\LoadClass{ctexart}
\RequirePackage{graphicx, xcolor, tikz}
\RequirePackage{geometry, titlesec, fancyhdr}
\RequirePackage{listings, cncolours}
\RequirePackage{indentfirst, enumitem, zhnumber}
\RequirePackage{fontspec, stackengine}
\RequirePackage{silence}
\WarningFilter{latexfont}{Some font shapes}
\WarningFilter{latexfont}{Font shape}

% 设置版式
\linespread{1.2}
\geometry{top=1in,bottom=1in,left=1.91cm,right=1.91cm}

% 设置标题和字体格式
\setCJKmainfont[ItalicFont={KaiTi},BoldFont={SimHei}]{SimSun}
\setmonofont{DejaVu Sans Mono}
\setCJKfamilyfont{KaiTi}[AutoFakeBold=2.5]{KaiTi}

% 伪粗宋体
\newCJKfontfamily\fakeboldsong{SimSun}[AutoFakeBold = 2.5]
\newcommand{\fbsong}[1]{{\fakeboldsong\bfseries #1}}
% 伪粗仿宋体
\newCJKfontfamily\fakeboldfangsong{FangSong}[AutoFakeBold = 2.5]
\newcommand{\fbfangsong}[1]{{\fakeboldfangsong\bfseries #1}}

\setcounter{secnumdepth}{3}
\renewcommand\thesection{\zhnumber{\arabic{section}}、\hspace{-5.53mm}}
\renewcommand\thesubsection{\arabic{subsection}.\hspace{-2.415mm}}
\renewcommand\thesubsubsection{(\arabic{subsubsection})}
\setlist[enumerate,1]{label=(\arabic*)}
\setlist[enumerate,2]{label=\alph*.}
\titleformat*{\section}{\Large\bfseries}
\titleformat*{\subsection}{\large\fakeboldsong\bfseries}
\titleformat*{\subsubsection}{\normalsize}

% 代码格式和颜色定义
\colorlet{keyword}{松花绿}
\colorlet{comment}{漆黑!50}
\colorlet{emph1}{靛蓝}
\colorlet{emph2}{琥珀}
\lstset{
  frame=tb,
  framerule=0.5pt,
  numbers=none,
  breaklines=true,
  breakatwhitespace=true,
  keywordstyle = \bfseries\color{keyword},
  commentstyle = \itshape\color{comment},
  emphstyle    = [1]\itshape\color{emph1},
  emphstyle    = [2]\color{emph2},
  basicstyle   = {\small\ttfamily},
}

% 信息
%\newcommand\major[1]{\def\@major{#1}}
%\newcommand\course[1]{\def\@course{#1}}
\newcommand\exname[1]{\def\@exname{#1}}
%\newcommand\extable[1]{\def\@extable{#1}}
\newcommand\instructor[1]{\def\@instructor{#1}}

\newcommand\class[1]{\def\@class{#1}}
\newcommand\name[1]{\def\@name{#1}}
\newcommand\stuid[1]{\def\@stuid{#1}}


\newcommand\nyear[1]{\def\@nyear{#1}}
\newcommand\nmonth[1]{\def\@nmonth{#1}}
\newcommand\nday[1]{\def\@nday{#1}}
\newcommand\nweekday[1]{\def\@nweekday{#1}}

\newcommand\redate[1]{\def\@redate{#1}}
\newcommand\resitu[1]{\def\@resitu{#1}}

%\newcommand\college[1]{\def\@college{#1}}
%\newcommand\lab[1]{\def\@lab{#1}}
%\newcommand\grades[1]{\def\@grades{#1}}
%\newcommand\expname[1]{\def\@expname{#1}}
%\newcommand\exptype[1]{\def\@exptype{#1}}
%\newcommand\partner[1]{\def\@partner{#1}}
\graphicspath{{figures/}}

\pagestyle{plain} 
%\lhead{实验名称：\@expname}
%\chead{姓名：\@name}
%\rhead{学号：\@stuid}

% 下划线定义
\newcommand{\underlinetext}[2][3cm]{%
  \stackunder[0.8ex]{\makebox[#1][c]{#2}}{\rule{#1}{1pt}}%
}

% 封面
\newcommand{\makecover}{

    \phantom{\fontsize{42pt}{50.4pt}\selectfont wcnm的LaTeX}

    \begin{center}
    {\fontsize{36pt}{6pt}\selectfont \fbsong{物理实验预习报告}}\\
    \vspace{15.18mm}
    \vspace{17.712mm}

    \Large
    \centering
    \renewcommand\arraystretch{2}
    \begin{tabular}{l@{}l}
      \fbsong{实验名称：} & \underlinetext[69.125mm]{\@exname} \\
      \fbsong{指导教师：} & \underlinetext[69.125mm]{\@instructor} 
    \end{tabular}

    \vspace{19.08mm}
    \large
    \centering
    \renewcommand\arraystretch{2}
    \begin{tabular}{l@{}l}
      \fbsong{班级：} & \underlinetext[79.695mm]{\@class}  \\
      \fbsong{姓名：} & \underlinetext[79.695mm]{\@name}   \\
      \fbsong{学号：} & \underlinetext[79.695mm]{\@stuid}  
    \end{tabular}

    \vspace{8.694mm}

    \begin{center}
      \large{\fbsong{实验日期：}\underlinetext[9.66mm]{\@nyear}\fbsong{年}\underlinetext[9.66mm]{\@nmonth}\fbsong{月}\underlinetext[9.66mm]{\@nday}\fbsong{日}\hspace{7.245mm}\fbsong{星期}\underlinetext[7.245mm]{\@nweekday}\fbsong{上/下午}}

      \vspace{8.694mm}

    \large{浙江大学物理实验教学中心}
    \end{center}
  \end{center}
  \thispagestyle{plain}
  \newpage
}
\endinput