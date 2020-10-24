\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csreport}[Computer Science Report Template (c) Duncan Paul Attard]


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Class options.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% Internal class option flags.
\newif\if@draft
\@draftfalse
\newif\if@print
\@printfalse
\newif\if@abref
\@abreffalse

% TODO: Add option for phd, msc, bsc which chooses the "submitted in parital
% TODO: fulfilment ..." and possibly, also the declaration of authenticity.

% Unused class options. 
\DeclareOption{letterpaper}{\OptionNotUsed}
\DeclareOption{a5paper}{\OptionNotUsed}
\DeclareOption{b5paper}{\OptionNotUsed}
\DeclareOption{executivepaper}{\OptionNotUsed}
\DeclareOption{legalpaper}{\OptionNotUsed}

% Used class options.
\DeclareOption{draft}{\@drafttrue}
\DeclareOption{print}{\@printtrue}
\DeclareOption{abref}{\@abreftrue}

% Pass-thru class options. These are handed over to base class. Process options 
% and load base class with hardcoded options.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[a4paper]{report}


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Required packages used by class.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% Configure page orientation and margins.
\RequirePackage[
  top=1.4in,
  bottom=1.4in,
  left=1.2in,
  right=1in,
  footskip=0.4in,
  footnotesep=2\baselineskip
]{geometry}

% Provides micro-typographical formatting support.
\RequirePackage[
  final,  
  activate={true,nocompatibility},
  tracking=true,
  kerning=true,
  spacing=true,
  factor=1000,
  stretch=20,
  shrink=20
]{microtype}

% Replace default Computer Modern font by Latin Modern. This provides access to
% teletype text in boldface.
\RequirePackage{lmodern}

% Provides Helvetica font. Scale font proportionally to match Latin Modern font
% size.
\RequirePackage[scaled=0.855]{helvet}

% Provides extended color support.
\RequirePackage{xcolor}

% Provides graphics support.
\RequirePackage[final]{graphicx}

% Provides caption styling support.
\RequirePackage[skip=0.4\baselineskip,
  labelfont=bf,
  textfont=it,
  singlelinecheck=off,
  justification=raggedright,
  font=small,
  labelsep=period
]{caption}

% Provides support for styling of chapter titles and section headings.
\RequirePackage{titlesec}

% Provides support for styling headers and footers.
\RequirePackage{fancyhdr}

% Provides support for vector-based illustrations.
\RequirePackage{tikz}

% Provides support sub-floats. This might be replaced with 'subcaption' in the
% future.
\RequirePackage{subfig}





% TODO: Might add more packages here.








% Provides miscellaneous enhancements for improving the structure and 
% information of documents containing mathematical formulae.
\RequirePackage{amsmath}

% Provides an extended math symbol collection such as binary relations and the
% blackboard bold characters. Note that 'amssymb' package internally loads 
% 'amsfonts'.
\RequirePackage{amssymb}

% Provides an enhanced version of default 'theorem-like' environments provided 
% by LaTeX, in addition to a 'proof' environment that automatically adds the QED
% symbol at the end. Note that 'amsthm' must be loaded after 'amsmath' (see sec. 
% 1 of 'amsmath' manual).
\RequirePackage{amsthm}

% Provides algorithm pseudocode support. Note that 'algpseudocode' command set 
% provides a pseudocode layout based on top of the 'algorithmicx' package.
\usepackage{algpseudocode}

% Provides support for displaying algorithm floats.
\usepackage[plain]{algorithm}

% Provide macro patching commands. This is currently used to reduce the line 
% spacing in 'algorithmcx' (see 
% https://tex.stackexchange.com/questions/84816/how-to-modify-line-spacing-in-algorithm-algpseudocode). 
\usepackage{xpatch}

% Provides SI unit support.
\RequirePackage[free-standing-units, binary-units]{siunitx}

% Provides hyperlink support for document cross-referencing and web URLs. Note 
% that package option 'hypertexnames' is set to false so that 'hyperref' 
% generates unique links; this solves the 'algorithmicx' problem with line 
% numbers that do not link to correct location in algorithm listings (see 
% https://tex.stackexchange.com/questions/148977/incorrect-reference-to-a-line-in-algorithmic-using-hyperref).
\RequirePackage[
  final,
  hypertexnames=false,
  colorlinks,
  % frenchlinks,
  linktoc=page,
  linkcolor=darkred,
  citecolor=darkgreen,
  urlcolor=darkblue
]{hyperref}

% Provides automatic caption label names with references. Note that 'cleveref'
% must be included after 'amsmath' and 'hyperref' (see sec. 14.1 of 'cleveref'
% manual).
\RequirePackage[nameinlink]{cleveref}

% Provides support for line numbering.
\RequirePackage[displaymath, mathlines]{lineno}

% More packages that would need to be included *after* 'hyperref'. See
% https://texblog.net/hyperref/ for details.


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Standard conveniently-named lengths based on the ones defined in TikZ.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

\newlength{\ultrathin}
\setlength{\ultrathin}{0.1pt}
\newlength{\verythin}
\setlength{\verythin}{0.2pt}
\newlength{\thin} % Default length in TikZ.
\setlength{\thin}{0.4pt}
\newlength{\semithick}
\setlength{\semithick}{0.6pt}
\newlength{\thick}
\setlength{\thick}{0.8pt}
\newlength{\verythick}
\setlength{\verythick}{1.2pt}
\newlength{\ultrathick}
\setlength{\ultrathick}{1.6pt}


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Additional package-specific configuration.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% Configure line number from text, font size and font color.
\setlength\linenumbersep{1em}
\renewcommand\thelinenumber{\protect\raisebox{0.2em}{\arabic{linenumber}}}
\renewcommand\linenumberfont{\color{darkred}\normalfont\tiny\sffamily}


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Cross-referencing configuration ('cleveref' package) and supporting commands.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% Define text range separator.
\newcommand{\crefrangeconjunction}{to}

% Define cross-referencing label link names for document elements.
\crefname{chapter}{chapter}{chapters}
\crefname{section}{section}{sections}
\crefname{appendix}{appendix}{appendices}

% Define cross-referencing label link names for document content. 
\crefname{figure}{figure}{figures}
\crefname{table}{table}{tables}
\crefname{algorithm}{listing}{listings}
\crefname{example}{example}{examples}
\crefname{ln}{line}{lines}
\crefname{definition}{definition}{definitions}


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Algorithms configuration ('algorithm' and 'algorithmcx' packages) and 
% supporting commands.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

%%% Custom lengths for easier configuration of 'algorithmicx' elements.      %%%

% Default indentation width.
\newlength{\algindentlength}
\setlength{\algindentlength}{0.6em}

% Default code, line numbering and comment fonts.
\newcommand*{\algcodefont}{\normalfont\footnotesize}
\newcommand*{\alglinefont}{\normalfont\tiny}
\newcommand*{\algcommfont}{\color{darkgreen}\itshape}

%%% Supporting commands for easier writing of algorithms and pseudocode.     %%%

% Provides a different comment pound that sits above the baseline for a more
% visually appealing and cleaner look.
\newcommand*{\commentpound}{%
  \protect\scalebox{0.8}{\protect\raisebox{0.18em}{\#}}
}

% Provides a horizontal rule command to delineate code segments.
\newcommand*{\Rule}{%
  \Statex \vspace{0.6\baselineskip}\hrule\vspace{0.1\baselineskip}
}

% Provides an indentation command that inserts space on the left of code lines
% in multiples of the default indentation width. Indentation width can be 
% controlled via \algindentlength.
\newcommand*{\Indent}[1]{%
  \hspace*{#1\algindentlength}
}

%%% Redefinitions and reconfigurations of 'algorithmcx' specific elements.   %%%

% Redefine algorithm label name.
\renewcommand{\ALG@name}{Listing.}

% Redefine code font size.
\renewcommand{\ALG@beginalgorithmic}{\algcodefont}

% Redefine line number size, indent length and comment symbol.
\algrenewcommand\algorithmicindent{\algindentlength}
\algrenewcommand\alglinenumber[1]{{\alglinefont#1}}
\algrenewcommand\algorithmiccomment[1]{{\algcommfont\commentpound\!#1}}

% Reconfigure line spacing.
\xpatchcmd{\algorithmic}{\itemsep\z@}{\itemsep=-0.16em plus2pt}{}{}


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% General typesetting configuration and tweaking.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% Named colors based on UM template.
\definecolor{tblgray}{gray}{0.8}
\definecolor{offgray}{gray}{0.7}
\definecolor{lstgray}{gray}{0.6}
\definecolor{darkgreen}{HTML}{78BE20}
\definecolor{darkblue}{HTML}{69B3E7}
\definecolor{darkred}{HTML}{BC1F3E}
\definecolor{umred}{HTML}{A12440}

% TODO: Enter all the UM template colors, and see whether to use these or to 
% TODO: use the standard Tableau ones used by Matplotlib.

% Reset textsc spacing applied by microtype.
\SetTracking{encoding={*}, shape={sc}}{0}

% Relational operators spacing (for operators like =, <, etc.)
\thickmuskip=3mu plus 3mu minus 3mu

% Binary operators spacing (for operators like +, -, etc.)
\medmuskip=2mu plus 2mu minus 2mu

% Spacing for the rest of the operators and numbers.
\thinmuskip=1mu plus 1mu minus 1mu

% Set default spread between lines.
\linespread{1.2}




%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Front page restyling.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

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
\renewcommand{\maketitle}{%
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
\textcolor{umred}{\rule[-22em]{\thick}{22em}}
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


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
%  Define command \declaration.
%  Creates the declaration page for the dissertation.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% \makeatletter
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


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Chapter, section and TOC title restyling.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% Set style and format for numbered chapter titles.
\titleformat{name=\chapter}[display]{\bfseries\sffamily\huge\centering}{\chaptertitlename~\thechapter}{-0.8em}{\rule{0.6\textwidth}{\thin}\\}

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

% % Define the width for the pretty line. This is used to control the width of the
% % pretty frame line as well as the front page separator line.
% \newlength{\plinewidth}
% \setlength{\plinewidth}{3.75pt}

% % Gets current font size.
% \makeatletter
% \newcommand*\fsize{\dimexpr\f@size pt\relax}
% \makeatother

% % Defines box size for pretty frame as a fraction of current font size.
% \newlength{\pframeboxsize}
% \setlength{\pframeboxsize}{0.7\fsize}

% % Provides a pretty frame for floating content such as figures, tables and 
% % algorithms.
% \newcommand{\pframe}[1]{
%   % \rule{\textwidth}{\arrayrulewidth}\dimexpr7pt+0.0pt\relax
%   % \rule{\textwidth}{\plinewidth}\vspace{\pframeboxsize}%
%   \rule{\textwidth}{\plinewidth}\par\vspace{-\pframeboxsize}%
%   #1
%   \par\rule[\baselineskip]{\textwidth}{\plinewidth}%
%   \hspace{-\pframeboxsize}%
%   \rule[\baselineskip]{\pframeboxsize}{\pframeboxsize}
%   \vspace{-2\baselineskip}
% }

% % Provides means to reset the extra spacing that is inserted by the \pframe 
% % command in case this is not needed.
% \newcommand*{\resetpframespacing}{\vspace{-\pframeboxsize}}


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Float restyling.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% Define new float style 'tbruled' that sandwiches the float content in between
% top and bottom rules. Adapted from https://tex.stackexchange.com/questions/501341/add-a-rule-above-and-below-each-figure-including-caption.
% See 'float' package manual for details.
\newcommand\fs@tbruled{%
  \def\@fs@cfont{\normalfont}%
  \let\@fs@capt\floatc@plain%
  \def\@fs@pre{\hrule height \thin\kern2pt}% 
  % \def\@fs@post{\kern2pt\hrule height \thick\kern2pt}%
  \def\@fs@post{}%BUG: We need to cater for the case where there is no caption.
  \def\@fs@mid{\kern2pt\hrule height \thick\kern2pt}%
  % \def\@fs@mid{\kern2pt\hrule height \thick\hspace{\textwidth}\hspace{-\ultrathick}\rule[2\baselineskip]{\ultrathick}{\ultrathick}\kern2pt}%
  \let\@fs@iftopcapt\iffalse% Caption at bottom.
  % \let\@fs@iftopcapt\iftrue% Caption at top.
}

% Apply style to known floats.
\floatstyle{tbruled}
\restylefloat{figure}
\restylefloat{table}
\restylefloat{algorithm}


%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Handle conditional reconfiguration based on class options.
%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% Document with 'draft' mode on.
\if@draft
  
  % Enable line numbers.
  \linenumbers
\fi

% Document with 'print' mode on.
\if@print

  % Set line number color to default.
  \renewcommand\linenumberfont{\normalcolor\normalfont\tiny\sffamily}

  % Hide hyperlinks.
  \hypersetup{
    hidelinks
  }
\fi

% Document with 'abbref' mode on.
\if@abref

  % Define 'cleveref' hypenated range separator.
  \renewcommand{\crefrangeconjunction}{--}

  % Abbreviate 'cleveref' cross-referencing label link names for document 
  % elements. See https://www.cite.auckland.ac.nz/5_3.html for abbreviations.
  \crefname{chapter}{ch.}{chs.}
  \crefname{section}{sec.}{secs.}
  \crefname{appendix}{app.}{apps.}

  % Abbreviate 'cleveref' cross-referencing label link names for document 
  % content. See https://www.cite.auckland.ac.nz/5_3.html for abbreviations.
  \crefname{figure}{fig.}{figs.}
  \crefname{table}{tbl.}{tbls.}
  \crefname{algorithm}{lst.}{lsts.}
  \crefname{example}{ex.}{exs.}
  \crefname{ln}{ln.}{lns.}
  \crefname{definition}{def.}{defs.}

  % Abbreviate 'caption' labels.
  \captionsetup{
    figurename=Fig.,
    tablename=Tbl.
  }

  % Abbreviate 'algorithmcx' caption label.
  \renewcommand{\ALG@name}{Lst.}
\fi