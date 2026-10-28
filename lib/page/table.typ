#let setup-table-rules(self, body) = {
  show table.cell.where(y: 0): set text(..self.theme.table.header.text)
  show table.cell: set align(left)
  show table: set text(..self.theme.table.text)
  set table(
    fill: (none_, y) => if calc.odd(y) { self.theme.table.cell.primary.fill } else {
      if y > 1 { self.theme.table.cell.secondary.fill }
    },
    stroke: none,
  )
  [#body]
}
