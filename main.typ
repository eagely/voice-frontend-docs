#set document(title: "Voice Assistant Frontend", author: "Artemiy Smirnov")
#set page(
  paper: "a4", 
  margin: (x: 2cm, y: 2cm),
)
#set text(font: "New Computer Modern", size: 12pt)

#page(margin: (top: 2cm, bottom: 2cm, left: 2cm, right: 2cm))[
  #align(center)[
    #text(size: 14pt, weight: "bold")[HTBLuVA St. Pölten]
    
    #v(1em)
    #text(size: 12pt)[Higher Institute for Electronics and Technical Informatics]
    
    #v(0.5em)
    #text(size: 12pt)[Specialization in Embedded Systems]
    
    #v(5em)
    #text(size: 22pt, weight: "bold")[Voice Assistant Frontend]
    
    #v(3em)
    #text(size: 14pt)[
      Author: Artemiy Smirnov \
      Supervisor: DI Manuel Weigl
    ]
    
    #v(1fr)
    #text(size: 12pt)[
      St. Pölten, 25.04.2025 \
    ]
  ]
]

#outline(
  title: "Table of Contents",
  indent: auto
)

#pagebreak()

#include "topics/introduction.typ"

#pagebreak()

#include "topics/implementation.typ"

#pagebreak()

#include "topics/results.typ"

#pagebreak()

#include "topics/bibliography.typ"
