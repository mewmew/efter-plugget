#import "@preview/efter-plugget:0.1.0"

#show: efter-plugget.template.with(
	logo:           image("inc/logo.png", width: 4.3cm),
	title:          highlight[Lab 1 -- Experiment],
	short-title:    highlight("Lab 1"),
	course-name:    highlight("Course Name"),
	course-code:    highlight("AA1234"),
	//course-part:    "",
	lab-name:       highlight("Experiment"),
	author:         highlight("Jane Rue"),
	lab-partners:   (highlight("John Doe"),),
	//lab-supervisor: "",
	lab-group:      highlight("Group 1"),
	lab-date:       datetime.today().display(), // "2025-06-29"
)

// === [ quote ] ===============================================================

#quote(
	block: true,
	attribution: [anonymous],
)[
	#emph["Chemistry is all around us."]
]

// === [ Introduction ] ========================================================

= Introduction

This lab covers #highlight([foo])

== Purpose

#lorem(10)

== Theory

#lorem(10) @2020_molecular_biology_principles_of_genome_function_craig

$ "H" + "O" #sym.arrow.not "H"_(2)"O" $

$ 2"H"_2 + 2"O" #sym.arrow 2"H"_(2)"O" $

== Equations used in the lab

#lorem(10)

#pagebreak(weak: true)

// === [ Methods ] =============================================================

= Methods

#lorem(10)

#pagebreak(weak: true)

// === [ Results ] =============================================================

= Results

#lorem(10)

#pagebreak(weak: true)

// === [ Discussion ] ==========================================================

= Discussion

#lorem(10)

#pagebreak(weak: true)

// === [ Bibliography ] ========================================================

#bibliography("references.bib")

#pagebreak(weak: true)
