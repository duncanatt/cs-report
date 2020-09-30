\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csreport}[Computer Science Report Template]

% Define manuscript type.
\LoadClass[11pt,a4paper]{report}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Package requirements with basic inlined configuration.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% Configure page size and orientation.
\RequirePackage[a4paper,
  top=1.4in,
  bottom=1.4in,
  left=1.2in,
  right=1in,
  footskip=0.4in,
  footnotesep=2\baselineskip
]{geometry}

% Provides support for typography formatting.
\RequirePackage[activate={true,nocompatibility},
  final,
  tracking=true,
  kerning=true,
  spacing=true,
  factor=1000,
  stretch=20,
  shrink=20
]{microtype}

% Replaces default Computer Modern for Latin Modern as the font used to typeset 
% manuscript, since it requires teletype text to be emboldened.
\RequirePackage{lmodern}

% Provides Helvetica font used for chapter and section titles. Font is scaled to
% proportionably to match Latin Modern font.
\RequirePackage[scaled=0.855]{helvet}

% Provides color support.
\RequirePackage{xcolor}

% Provides support for including graphics.
\RequirePackage{graphicx}

% Provides support for formatting and stylising chapter titles and section 
% headings.
\RequirePackage{titlesec}

% Provides support for formatting and stylising headers and footers.
\RequirePackage{fancyhdr}

% Provides automated and sensible handling of trailing spaces which eats or 
% inserts spaces depending on the command context stream that follows.
\RequirePackage{xspace}

% Provides support for configuring and stylising captions appearance.
\usepackage[skip=0.4\baselineskip,
  labelfont=bf,
  textfont=it,
  singlelinecheck=off,
  justification=raggedright,
  font=small,
  labelsep=period
]{caption}


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% General presentation-related definitions and configuration.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% Named colors based on UM template.
\definecolor{tblgray}{gray}{0.8}
\definecolor{offgray}{gray}{0.7}
\definecolor{lstgray}{gray}{0.6}
\definecolor{darkgreen}{HTML}{78BE20}
\definecolor{darkblue}{HTML}{69B3E7}
\definecolor{darkred}{HTML}{BC1F3E}
\definecolor{umred}{HTML}{A12440}

% Reset textsc spacing applied by microtype.
\SetTracking{encoding={*}, shape={sc}}{0}

% Default spread between text lines.
\linespread{1.2}


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Front page restyling.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

\makeatletter

% Define additional title page attributes that are not provided by default and
% that are specific to UM manuscripts.
\def\subtitle#1{\gdef\@subtitle{#1}}

\def\email#1{\gdef\@email{#1}}
\def\department#1{\gdef\@department{#1}}
\department{Set department name using \texttt{\textbackslash{department}\{Department\}}}
\def\faculty#1{\gdef\@faculty{#1}}
\faculty{Set faculty name using \texttt{\textbackslash{faculty}\{Faculty\}}}
\def\supervisors#1{\gdef\@supervisors{#1}}
\supervisors{Set supervisors names using \texttt{\textbackslash{supervisors}\{Supervisors\}}}

% Customize title page. The content of the title page can be controlled by 
% populating the manuscript attributes defined above. All attributes are 
% required, save for the subtitle.
\renewcommand{\maketitle}{ 
  \begin{center}
    \includegraphics[scale=0.43]{./logo/um-logo}
    % \vspace{6em}
  \end{center}

  \begin{center}
    \setlength{\baselineskip}{2.4em}
    \textcolor{umred}{\Huge\sffamily\bfseries\@title}
  \end{center}
  
  \vspace{3em}
  \parbox[t]{0.6\textwidth}{
    \normalsize
    \begin{flushright}
      \setlength{\baselineskip}{1.6em}
      \@ifundefined{@subtitle}{}{{\sffamily\Large\@subtitle}\\[2em]}
      {\itshape by}\\
      [1em]
      {\bfseries\@author}\\[1em]
      \@ifundefined{@email}{}{{\ttfamily\@email\\}}
      {\@department\\\@faculty}
    \end{flushright}
    }
\hspace*{0.01\textwidth} % Whitespace between the vertical line and title page text
\textcolor{umred}{\rule[-22em]{\plinewidth}{22em}}
\hspace*{0.01\textwidth} % Whitespace between the vertical line and title page text
\parbox[t]{0.4\textwidth}{
  \large
  \setlength{\baselineskip}{1.2em}  
  \@ifundefined{@subtitle}{~\\[8.5em]}{~\\[12em]} 
  {\itshape supervised by}\\
  [1em]
  \textsc{\@supervisors}\\
}

  \vspace{8em}
  \begin{center}\normalsize\itshape\@date\end{center}

  \pagenumbering{gobble}
  \thispagestyle{empty}
  \clearpage  
}
\makeatother


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
%  Define command \declaration.
%  Creates the declaration page for the dissertation.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
\makeatletter
\newcommand{\removenl}[1]{\def\\{\relax\ifhmode\unskip\fi\space\ignorespaces}#1}
\newcommand{\declaration}{%
  \clearpage
  \thispagestyle{plain}
  %
  \begin{center}
    {\Large\bfseries Faculty of ICT}
    \vspace{1cm}

    {\large\bfseries Declaration}
    \vspace{1.5cm}
  \end{center}

  \noindent I, the undersigned, declare that the dissertation entitled:
  \newline

  \textsf{\removenl{\@title}}\newline

  
  \noindent submitted is my work, except where acknowledged and referenced.
  \newline

  \vspace{3cm}
  {
    % \setstretch{2}
    \noindent\textsf{\@author} \vspace{0.5cm}\\
    \noindent\textsf{\@date}
  %   %Signature: & & \makebox[5cm]{\hrulefill}
  }
}
\makeatother


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Chapter, section and TOC title restyling.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% Set style and format for numbered chapter titles.
\titleformat{name=\chapter}[display]{\bfseries\sffamily\huge\centering}{\chaptertitlename~\thechapter}{-0.8em}{\rule{0.6\textwidth}{\plinewidth}\\}

% Set style and format for unnumbered chapter titles such as the TOC and list of
% figures, etc.
\titleformat{name=\chapter,numberless}[display]{\bfseries\sffamily\huge\centering}{}{-1.4em}{}

% Set style and format for numbered section and subsection titles.
\titleformat{\section}{\bfseries\sffamily\Large}{\thesection}{0.4em}{}
\titleformat{\subsection}{\bfseries\sffamily\large}{\thesubsection}{0.4em}{}

% Set style and format for paragraph
\titleformat{\paragraph}[runin]{\normalfont\itshape}{}{0.4em}{}[.]

% Set spacing between chapter title and start of text.
\titlespacing{\chapter}{0em}{0em}{12em}

% Set spacing between paragraphs of text.
\titlespacing{\paragraph}{0em}{0.4\baselineskip}{1em} 


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Page header and footer restyling.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% Clear fancy header to start configuring the header and footer appearance from 
% scratch.
\fancyhf{}

% Set header to fancy. The configuration that follows affects only pages whose 
% headers and footers are not typeset in plain mode (e.g. TOC, list of figures,
% chapter starting pages, etc).
\pagestyle{fancy}

% Redefine \chaptermark so as to account for the chapter number in which the 
% left header mark is to be typeset, and based on this, include or omit the
% chapter name in places where this is not wanted (e.g. TOC, list of figures, 
% etc).
\renewcommand{\chaptermark}[1]{%
    \markboth{\textbf{\chaptername~\thechapter.}~#1}{}%
  }

% \renewcommand{\sectionmark}[1]{\markright{\thesection #1}{}}
 
% Set top header left and right content. The left content consists of the 
% formatted chapter name, number and title, the right, of the page number.
\fancyhead[L]{\small\nouppercase{\leftmark}}
\fancyhead[R]{\small\thepage}


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Pretty frame.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% Define the width for the pretty line. This is used to control the width of the
% pretty frame line as well as the front page separator line.
\newlength{\plinewidth}
\setlength{\plinewidth}{0.75pt}

% Gets current font size.
\makeatletter
\newcommand*\fsize{\dimexpr\f@size pt\relax}
\makeatother

% Defines box size for pretty frame as a fraction of current font size.
\newlength{\pframeboxsize}
\setlength{\pframeboxsize}{0.7\fsize}

% Provides a pretty frame for floating content such as figures, tables and 
% algorithms.
\newcommand{\pframe}[1]{
  % \rule{\textwidth}{\arrayrulewidth}\dimexpr7pt+0.0pt\relax
  % \rule{\textwidth}{\plinewidth}\vspace{\pframeboxsize}%
  \rule{\textwidth}{\plinewidth}\par\vspace{-\pframeboxsize}%
  #1
  \par\rule[\baselineskip]{\textwidth}{\plinewidth}%
  \hspace{-\pframeboxsize}%
  \rule[\baselineskip]{\pframeboxsize}{\pframeboxsize}
  \vspace{-2\baselineskip}
}

% Provides means to reset the extra spacing that is inserted by the \pframe 
% command in case this is not needed.
\newcommand*{\resetpframespacing}{\vspace{-\pframeboxsize}}