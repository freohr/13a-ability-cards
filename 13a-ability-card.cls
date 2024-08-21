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
\RequirePackage[skip=5pt, indent=0pt]{parskip}
\RequirePackage{multido}
\RequirePackage{xstring}
\newcommand{\Repeat}{\multido{}}

\RequirePackage{fontspec}
\setmainfont{Inter Medium}

% \setlength{\parindent}{0 pt}
% \setlength{\parskip}{5pt}

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
  \ifnumgreater{\intcalcMod{\value{cardCount}}{6}}{2}{
    \vspace{0.5cm}
  }{}
  \parbox[t][9.5cm]{9cm}{
    #1
  }%
  \quad%
}

\def\emdash{—}

\newcommand{\abilityName}[2]{ 
  \titlefont\textsc{\textbf{#1}}\hfill#2 \\ \par
  \def\internalName{#1}
}

% Level/Tier - Class - Type
\newcommand{\abilityDesc}[3]{
  \def\internalType{#3}%
  \sourcefont\IfInteger {#1}{\nth{#1} level}{#1} #2 #3
}

\newcommand{\abilityType}[3] {
  \bodyfont#1 ◆ #2 ◆ #3 \\  \par
}

\newcommandx{\usage}[2][2] {
\bodyfont\textbf{#1}\notblank{#2}{ #2+ after battle}{}%
}

\newcommand{\fields}[1]{
  \begin{hangparas}{10pt}{1}
    \begin{itemize}
    #1
    \end{itemize}
  \end{hangparas}
}

\newcommand{\field}[2]{
\item\bodyfont\textbf{#1:} #2
}

\newcommand{\atHigherLevels}[1]{
  \textsc{At higher levels} \\
  \begin{hangparas}{25pt}{1}
    #1 
  \end{hangparas}
}

\newcommand{\highLevel}[2]{
  \bodyfont\textit{\nth{#1} level \internalType} #2
}

\newcommand{\feats}[1]{
  \vfill\null
  \begin{hangparas}{10pt}{1}
    \begin{itemize}
    #1
    \end{itemize}
  \end{hangparas}
}

\newcommand{\feat}[2]{
\item\bodyfont\textbf{\textit{#1 Feat:}} #2
}
