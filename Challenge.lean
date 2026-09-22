import Mathlib.NumberTheory.NumberField.AdeleRing
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.Topology.Algebra.Group.Subgroup
import Mathlib.Topology.Algebra.Group.Units
import Mathlib.FieldTheory.AbsoluteGaloisGroup

set_option autoImplicit false

open scoped NumberField

/-!
# Topological global reciprocity for number fields

For a number field `K`, the idèle class group modulo its identity component
is isomorphic, as a topological multiplicative group, to the abelianization
of the absolute Galois group of `K`.

This compact statement records the maximal-abelian topological conclusion.
It does not itself name or normalize the global Artin map at finite primes;
the substantive ClassFieldTheory library contains those finite-level results
separately, as described in the README.
-/

namespace ClassFieldTheory

universe u

/-- The identity component is normal because the idèle class group is abelian. -/
instance instNormalIdeleClassConnectedComponent
    (K : Type u) [Field K] [NumberField K] :
    (Subgroup.connectedComponentOfOne
      (NumberField.IdeleClassGroup (𝓞 K) K)).Normal := by
  constructor
  intro n hn g
  have h : g * n * g⁻¹ = n := by
    rw [mul_comm g n, mul_assoc, mul_inv_cancel, mul_one]
  rw [h]
  exact hn

/-- The idèle class group modulo its identity component. -/
abbrev IdeleClassConnectedQuotient
    (K : Type u) [Field K] [NumberField K] :=
  NumberField.IdeleClassGroup (𝓞 K) K ⧸
    Subgroup.connectedComponentOfOne
      (NumberField.IdeleClassGroup (𝓞 K) K)

/-- Topological global reciprocity for number fields. -/
theorem topologicalGlobalReciprocity
    (K : Type u) [Field K] [NumberField K] :
    Nonempty (IdeleClassConnectedQuotient K ≃ₜ*
      Field.absoluteGaloisGroupAbelianization K) := by
  sorry

end ClassFieldTheory
