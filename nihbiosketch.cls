%% nihbiosketch.cls
%% Copyright 2015 Paul M. Magwene
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 008/05/04 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Paul M. Magwene
%
% This work consists of the files nihbiosketch.cls


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nihbiosketch}[2021/06/02 NIH Biosketch Class]

%------------------------------------------------------------------------------

\ProcessOptions\relax
\LoadClass[11pt,letterpaper]{article}

%------------------------------------------------------------------------------
% Packages

\RequirePackage{etoolbox}
\RequirePackage[letterpaper]{geometry}
% \RequirePackage{ifxetex, ifluatex}   % requires fontspec, so either XeTeX or LuaTeX
% \RequirePackage{fontspec}
% \setmainfont[Ligatures=TeX]{Arial}

% Do not bother with fancy non-pdftex, should be sufficient to be sans-serif
\usepackage{helvet}
\renewcommand*{\familydefault}{\sfdefault}%the whole document will be sans serif
\usepackage{amsfonts}

\RequirePackage{microtype}

\RequirePackage{tabu}
\RequirePackage{longtable}
\RequirePackage{ifthen}
\RequirePackage[normalem]{ulem}

\RequirePackage{enumitem}
\setlist[enumerate,2]{label=\alph*.,itemsep=0pt,parsep=1pt,partopsep=1pt}


\RequirePackage[largestsep]{titlesec}
% NIH examples use this larger size for some headers
%\newcommand{\headersize}{\fontsize{13.5pt}{13.5pt}\selectfont}
\renewcommand{\thesection}{\Alph{section}.}
\titleformat{\section}[hang]{\normalfont\bfseries}{\thesection}{0.5em}{}
\titleformat{\subsection}[hang]{\normalfont\bfseries}{\thesubsection}{0.5em}{\uline}
\titleformat{\subsubsection}[hang]{\normalfont}{\thesubsubsection}{0.5em}{\uline}

\titlespacing{\section}{0pt}{11pt}{1.5pt}
\titlespacing{\subsection}{0pt}{11pt}{1.5pt}
\titlespacing{\subsubsection}{0pt}{1.25ex}{0.5ex}

\usepackage[usenames,dvipsnames]{color}
\definecolor{darkblue}{rgb}{0,0.08,0.35}
\definecolor{darkgreen}{rgb}{0,0.35,0.08}
\definecolor{webgreen}{rgb}{0.0,0.2,0.0}

\PassOptionsToPackage{
  hidelinks=true,
  backref=false,
  citecolor=darkblue,
  urlcolor=darkblue,
%  colorlinks=true,
%  breaklinks=true
}{hyperref}
\RequirePackage{hyperref}
\urlstyle{same}

%------------------------------------------------------------------------------
% New commands and environments

\newcommand{\@name}{}
\newcommand{\@eracommons}{}
\newcommand{\@position}{}

\newcommand{\name}[1]{\renewcommand{\@name}{#1}}
\newcommand{\eracommons}[1]{\renewcommand{\@eracommons}{#1}}
\newcommand{\position}[1]{\renewcommand{\@position}{#1}}

\newcommand{\pgline}{\vspace{-0.1em}\noindent\makebox[\linewidth]{\rule{\textwidth}{0.5pt}}\newline\vspace{-0.1em}}
% tried other ways
%\newcommand{\pgline}{\vspace{-0.5em}\noindent\rule{\textwidth}{0.5pt}\\[-0.7em]\vspace{-0.5em}}
%\newcommand{\pgline}{\hrulefill\newline}
\newcommand{\pgspace}{\noindent\vspace{0.5em}}
\newcommand{\piinfo}
{
\begin{flushright}
 \small
  % OMB No. 0925-0001 and 0925-0002 (Rev. 09/17 Approved Through  03/31/2020)
 % OMB No. 0925-0001 and 0925-0002 (Rev. 03/2020 Approved Through 02/28/2023)\vspace{0em}
 OMB No. 0925-0001 and 0925-0002 (Rev. 10/2021 Approved Through 09/30/2024)\vspace{0em}\\
\end{flushright}
\pgline
{\centering
\textbf{BIOGRAPHICAL SKETCH}\\
{\footnotesize
Provide the following information for the Senior/key personnel and other significant contributors.\\
Follow this format for each person.  DO NOT EXCEED FIVE PAGES.\\}}
\pgline
NAME: \@name\\
\pgline
eRA COMMONS USER NAME (credential, e.g., agency login): \@eracommons\\
\pgline
POSITION TITLE: \@position\\
\pgline
EDUCATION/TRAINING (\textit{Begin with baccalaureate or other initial professional education, such as nursing, include postdoctoral training and residency training if applicable. Add/delete rows as necessary.})\\}

\newcommand{\grantinfo}[6]
{\begin{tabular}{@{}lll@{}}
{#1} & {#2} & {#3} \\
\end{tabular}
\newline{#4}\newline{#5}\newline{#6}}

\newenvironment{education}
{\bgroup\centering
\tabulinesep=1.5mm
\begin{tabu} to \textwidth {X[3.33,l,m]|X[1,c,m]|X[0.8,c,m]|X[1.8,l,m]}
\hline
\rowfont[c]{}               
INSTITUTION AND LOCATION & 
DEGREE \newline (\textit{if applicable}) & 
Completion Date MM/YYYY & 
FIELD OF STUDY\\
\hline}
{\end{tabu}\egroup}

\newenvironment{datetbl}
{\tabulinesep=0mm
\begin{tabu} to 7.5in{X[1,l]X[6.5,l,p]}}
{\end{tabu}}

\newenvironment{datelngtbl}
{\tabulinesep=0mm\vspace{-2ex} % should not be necessary
\begin{longtabu} to 7.5in{X[1,l]X[6.5,l,p]}}
{\end{longtabu}}

\newenvironment{statement}
{\setlength\parindent{2em}}
{\setlength\parindent{0pt}}

\newenvironment{performance}
{\bgroup\centering
\tabulinesep=0mm
\begin{longtabu} to \textwidth {X[1,c,m]X[5.249,l,m]X[1,c,m]}
\hline
\rowfont[c]{}
YEAR &
COURSE TITLE &
GRADE \\
\hline}
{\end{longtabu}\egroup}


%------------------------------------------------------------------------------
% setup document geometry

% turn off page numbering
\pagenumbering{gobble}

% no paragraph indentation
\setlength\parindent{0pt}

\geometry{left=0.5in,right=0.5in,top=0.5in,bottom=0.5in} % this should be the last call

%------------------------------------------------------------------------------

\AfterEndPreamble{\piinfo}
