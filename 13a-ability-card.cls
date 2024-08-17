\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{13a-ability-card}[2024-07-25 Cards for monsters in the 13th Age RPG]

\LoadClass[a4paper]{article}
\RequirePackage[landscape,left=0.6cm,right=0.9cm,top=0.7cm,bottom=0cm]{geometry}

\RequirePackage{calc}
\RequirePackage{hanging}
\RequirePackage{enumitem}
\RequirePackage{xargs}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage[super]{nth}
\RequirePackage{stringstrings}
\RequirePackage{intcalc}
\RequirePackage[skip=20pt , indent=0pt]{parskip}
\RequirePackage{multido}
\newcommand{\Repeat}{\multido{}}

\RequirePackage{fontspec}
\setmainfont{Fira Sans}

\setlength{\parindent}{0 pt}
% \setlength{\parskip}{2pt}

\pagestyle{empty}

\setlist[itemize]{label=,noitemsep,itemindent=-0.5cm,left=0pt}

\hbadness=10000

\newcommand{\titlefont}[1][1]{\large}
\newcommand{\sourcefont}[1][1]{\footnotesize}
\newcommand{\typefont}[1][1]{\normalsize}
\newcommand{\defensefont}[1][1]{\large}
\newcommand{\bodyfont}[1][1]{\small}
\newcommand{\headerfont}[1][1]{\normalsize}

\newcounter{cardCount}

\newcommand{\abilityCard}[1]
{
  \stepcounter{cardCount}
  \ifnumgreater{\intcalcMod{\value{cardCount}}{8}}{3}{
    \vspace{0.5cm}
  }{}
  \parbox[t][9.5cm]{6.5cm}{
    #1
  }%
  \quad%
}

\newcommand{\abilityName}[1]{
  \begin{center}
    \titlefont\textsc{\textbf{#1}}
  \end{center}
  \def\internalName{#1}
}

