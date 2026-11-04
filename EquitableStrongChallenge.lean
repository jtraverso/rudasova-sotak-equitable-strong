/-
Copyright (c) 2026 Juan Pablo Traverso Gianini. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Juan Pablo Traverso Gianini
-/
module

public import Mathlib

/-!
# Equitable strong edge colourings (Rudašová–Soták 2008, Theorem 3.1)

An edge colouring of `G` with `k` colours is a colouring `C : G.lineGraph.Coloring (Fin k)`. The
*palette* of a vertex `v` is the set of colours of the edges at `v`; `C` is *strong* (vertex
distinguishing) if distinct vertices have distinct palettes, and *equitable* if its colour classes
differ in size by at most one.

`Balanced.exists_equitable_strong`: **J. Rudašová and R. Soták, *Vertex-distinguishing proper
edge colourings of some regular graphs*, Discrete Math. 308 (2008) 795–802, Theorem 3.1.** If `G`
has a strong edge colouring with `m` colours and `m ≤ k`, then `G` has an equitable strong edge
colouring with `k` colours.
-/

@[expose] public section

namespace Balanced

open SimpleGraph Finset

variable {V : Type*} [Fintype V] [DecidableEq V] {G : SimpleGraph V} {k : ℕ}

/-- The set of colours of the edges at `v`. -/
def palette (C : G.lineGraph.Coloring (Fin k)) (v : V) : Set (Fin k) :=
  {θ | ∃ e : G.edgeSet, v ∈ (e : Sym2 V) ∧ C e = θ}

/-- Distinct vertices see distinct sets of colours. -/
def IsStrong (C : G.lineGraph.Coloring (Fin k)) : Prop := Function.Injective (palette C)

/-- The colour classes differ in size by at most one. -/
def IsEquitable (C : G.lineGraph.Coloring (Fin k)) : Prop :=
  ∀ x y : Fin k, (C.colorClass x).ncard ≤ (C.colorClass y).ncard + 1

/-- **Rudašová–Soták 2008, Theorem 3.1.** -/
theorem exists_equitable_strong {m : ℕ} (hmk : m ≤ k) (C : G.lineGraph.Coloring (Fin m))
    (hC : IsStrong C) :
    ∃ C' : G.lineGraph.Coloring (Fin k), IsStrong C' ∧ IsEquitable C' := by
  sorry

end Balanced
