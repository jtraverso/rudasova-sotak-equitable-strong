/-
Copyright (c) 2026 Juan Pablo Traverso Gianini. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Juan Pablo Traverso Gianini
-/
module

public import Mathlib
public import Balanced.Bridge

/-!
# Solution

`Balanced.palette`, `Balanced.IsStrong`, `Balanced.IsEquitable` and
`Balanced.exists_equitable_strong` are in `Balanced.Bridge` of the pinned dependency
`plantholt_overfull` (jtraverso/plantholt-overfull-criterion, PALOMAR-2026-11-04-000016). The proof
passes to a total partial edge colouring (`Balanced.ofColoring`) and follows Rudašová and Soták
(`Balanced.exists_equitable` in `Balanced.RSc`): take a strong colouring minimising
`Σ_θ vcnt(θ)²` (`vcnt θ` = twice the number of edges coloured `θ`). If `vcnt a ≥ vcnt b + 4`, some
component of the graph of ends `H_{a,b}` (`Balanced.RSb`; maximum degree `2`, and `1` at an end
without a partner colour set) has more ends with `a` than with `b`; interchanging `a` and `b` on its
`(a, b)`-paths keeps the colouring strong and lowers the sum (`Balanced.RSa`).
-/
