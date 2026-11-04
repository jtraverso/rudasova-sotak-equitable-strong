# Equitable strong edge colourings in Lean 4

Author and maintainer: **Juan Pablo Traverso Gianini**. Licence: Apache-2.0 (see `LICENSE`).

A Lean 4 / Mathlib formalization of Theorem 3.1 of J. Rudašová and R. Soták, *Vertex-distinguishing
proper edge colourings of some regular graphs*, Discrete Math. 308 (2008) 795–802
([doi:10.1016/j.disc.2007.07.019](https://doi.org/10.1016/j.disc.2007.07.019)).

| Lean | Statement |
|---|---|
| `Balanced.exists_equitable_strong` | **Rudašová–Soták, Theorem 3.1.** If `G` has a strong (vertex-distinguishing) proper edge colouring with `m` colours and `m ≤ k`, then `G` has an equitable strong proper edge colouring with `k` colours. |

An edge colouring with `k` colours is a colouring `C : G.lineGraph.Coloring (Fin k)`; the palette of
a vertex is the set of colours of its edges; `C` is strong if distinct vertices have distinct
palettes, and equitable if its colour classes differ in size by at most one. With `m = s(G)`
(the vertex-distinguishing index) this is the article's statement for every `k ≥ s(G)`.

## The proof

The development is in the directory `Balanced/` of the pinned dependency
[jtraverso/plantholt-overfull-criterion](https://github.com/jtraverso/plantholt-overfull-criterion)
@ `28ff33d` (PALOMAR-2026-11-04-000016), where it was written; this repository only states and
compares the theorem.

- `Balanced.Bridge`: line-graph colourings as total partial edge colourings, and the theorem.
- `Balanced.RSa`–`RSc`: among the strong colourings take one minimising `Σ_θ vcnt(θ)²`
  (`vcnt θ` = twice the number of edges coloured `θ`; the article minimises
  `Σ_{x,y} ||E_x| − |E_y||`); the graph of ends `H_{a,b}` has maximum degree `2`, and `1` at an end
  without a partner colour set; interchanging `a` and `b` on the `(a, b)`-paths of a suitable
  component keeps the colouring strong and lowers the sum.

## Checking

```bash
lake build
```

`comparator.json` lists the compared theorem; the axioms are `propext`, `Classical.choice` and
`Quot.sound`. Lean `v4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`.
