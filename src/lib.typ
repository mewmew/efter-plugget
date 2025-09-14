#import "@preview/latex-lookalike:0.1.4"

#import "@preview/nth:1.0.1": nth

// This function gets your whole document as its `body` and formats it as a lab
// report.
#let template(
	logo:           image("../inc/default_logo.png", width: 4.3cm),
	title:          "Lab report",
	sub-title:      none,
	short-title:    none,
	course-name:    none,
	course-code:    none,
	course-part:    none,
	lab-name:       none,
	author:         none,
	lab-partners:   none,
	lab-supervisor: none,
	lab-group:      none,
	lab-date:       none,

	// Report contents.
	body,
) = {
	// Set document metadata.
	set document(title: title)

	// Set page size and margins.
	set page(
		paper: "a4",
		margin: (x: 2.5cm, top: 3.1cm, bottom: 3.55cm),
		header: {
			grid(
				columns: (2fr, 1fr, 2fr),
				align: (left, center, right),
				inset: (bottom: 5pt),
				// left
				course-code,
				// middle
				short-title,
				//right
				author,
				grid.hline(stroke: 0.4pt),
			)
		},
	)

	// Set default font.
	set text(font: "New Computer Modern")

	set text(size: 1.05em)

	set par(justify: true)

	// Use arabic numbering of headings.
	set heading(numbering: "1.1")

	// Style outline as LaTeX "Table of contents".
	show outline: latex-lookalike.style-outline

	// Style headings with "1.1" numbering and increased spacing.
	show heading: latex-lookalike.style-heading

	// Style links and citations.
	let linkblue = rgb(66, 93, 178)
	show link: it => {
		set text(fill: linkblue) if type(it.dest) == str // style external links
		it
	}
	show cite: set text(fill: linkblue)

	// raw figures
	show figure.where(kind: raw): set figure.caption(position: top)

	show figure: outer => {
		let alignment = left
		if outer.kind == table or outer.kind == raw {
			alignment = center
		}
		show figure.caption: it => align(
			alignment,
			[
				#strong[#it.supplement #context it.counter.display(it.numbering)#it.separator]
				#it.body
			]
		)
		outer
	}

	set bibliography(title: "References")

	// === [ Front matter ] =====================================================

	// --- [ Front page ] -------------------------------------------------------

	page(
		numbering: none,
		header: none,
		margin: (x: 1.55cm, top: 3.1cm, bottom: 3.55cm),
	)[
		#grid(
			columns: (5.10cm, 1fr),
			gutter: 3pt,
			grid.vline(x: 1, stroke: 0.4pt + black),
			// left cell (logo)
			logo,
			// right cell (title)
			block(height: 100%, inset: 2.1em)[
				#v(6.1cm)
				#if course-name != none { text(size: 1.2em)[ #course-name \ ] }
				#if course-code != none { text(size: 1.2em)[ (#course-code) ] }

				// title
				#text(size: 2.1em, weight: "bold", title)

				// subtitle
				#if sub-title != none { v(-1.5em) + text(size: 1.5em, weight: "bold", sub-title) }

				// date
				#text(size: 1.2em, {
					let today = datetime.today()
					nth(today.display("[day padding:none]"))
					today.display(" [month repr:long] [year]")
				})

				#v(1fr)

				#let cells = ()
				#if course-name != none {
					cells.push([Course:])
					cells.push([#course-name])
				}
				#if course-part != none {
					cells.push([Course part:])
					cells.push([#course-part])
				}
				#if lab-name != none {
					cells.push([Lab:])
					cells.push([#lab-name])
				}
				#if author != none {
					cells.push([Author:])
					cells.push([#author])
				}
				#if lab-partners != none {
					cells.push([Lab partner(s):])
					cells.push([#lab-partners.join(", ", last: " and ")])
				}
				#if lab-supervisor != none {
					cells.push([Lab supervisor:])
					cells.push([#lab-supervisor])
				}
				#if lab-group != none {
					cells.push([Lab group:])
					cells.push([#lab-group])
				}
				#if lab-date != none {
					cells.push([Lab date:])
					cells.push([#lab-date])
				}
				#block(inset: 0.4em)[
					#grid(
						columns: (auto, 1fr),
						gutter: 10pt,
						..cells,
					)
				]
			],
		)
	]

	pagebreak(weak: true)

	// --- [ Table of contents ] ------------------------------------------------

	set page(numbering: "i")
	counter(page).update(1)

	outline()
	pagebreak(weak: true)


	// --- [ Main matter ] ------------------------------------------------------

	set page(numbering: "1")
	counter(page).update(1)

	body
}
