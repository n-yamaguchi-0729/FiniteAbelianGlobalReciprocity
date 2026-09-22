import Mathlib.NumberTheory.NumberField.AdeleRing
import Mathlib.NumberTheory.NumberField.Completion.FinitePlace
import Mathlib.Topology.Algebra.Group.Units
import Mathlib.FieldTheory.Galois.Abelian

set_option autoImplicit false

/-!
# Finite abelian global reciprocity: norm-quotient form

For a finite abelian extension `L / K` of number fields, the idèle class
group of `K`, modulo norms from the idèle class group of `L`, is isomorphic
as a topological multiplicative group to `Gal(L / K)`.

The idèle and idèle-class definitions below reproduce the statement surface
of the substantive development using only Mathlib. The idèle-class norm is a
Comparator definition target: its completed construction is supplied by
`Solution.lean` from the pinned ClassFieldTheory repository.
-/

open scoped NumberField RestrictedProduct
open NumberField IsDedekindDomain

noncomputable section

variable (K : Type*) [Field K] [NumberField K]

/-- The finite idèle group, with its restricted-product topology. -/
abbrev FiniteIdeleGroupOf
    (R : Type*) [CommRing R] [IsDedekindDomain R]
    (F : Type*) [Field F] [Algebra R F] [IsFractionRing R F] :=
  Πʳ v : HeightOneSpectrum R,
    [(v.adicCompletion F)ˣ, (v.adicCompletionIntegers F).units]

/-- The finite idèle group of a number field. -/
abbrev FiniteIdeleGroup := FiniteIdeleGroupOf (𝓞 K) K

/-- The product of the multiplicative groups at the infinite places. -/
abbrev InfiniteIdeleGroup := (NumberField.InfiniteAdeleRing K)ˣ

/-- The idèle group `I_K`. -/
abbrev IdeleGroup := InfiniteIdeleGroup K × FiniteIdeleGroup K

namespace IdeleGroup

variable {K}

/-- Algebraically, finite idèles are the units of the finite adèle ring. -/
def finiteEquivFiniteAdeleUnitsOf
    (R : Type*) [CommRing R] [IsDedekindDomain R]
    (F : Type*) [Field F] [Algebra R F] [IsFractionRing R F] :
    FiniteIdeleGroupOf R F ≃*
      (IsDedekindDomain.FiniteAdeleRing R F)ˣ :=
  (RestrictedProduct.unitsEquiv
    (ι := HeightOneSpectrum R)
    (S := fun v : HeightOneSpectrum R ↦ ValuationSubring (v.adicCompletion F))
    (B := fun v : HeightOneSpectrum R ↦ v.adicCompletionIntegers F)
    (𝓕 := Filter.cofinite)
    (fun v : HeightOneSpectrum R ↦ v.adicCompletion F)).symm

/-- Algebraically, finite idèles are the units of the finite adèle ring. -/
def finiteEquivFiniteAdeleUnits :
    FiniteIdeleGroup K ≃*
      (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K)ˣ :=
  finiteEquivFiniteAdeleUnitsOf (𝓞 K) K

/-- Algebraically, the idèle group is the unit group of the adèle ring. -/
def equivAdeleRingUnits :
    IdeleGroup K ≃* (NumberField.AdeleRing (𝓞 K) K)ˣ :=
  ((MulEquiv.refl (InfiniteIdeleGroup K)).prodCongr
      (finiteEquivFiniteAdeleUnits (K := K))).trans
    MulEquiv.prodUnits.symm

variable (K)

/-- The diagonal embedding of `Kˣ` into the idèle group. -/
def principalIdele : Kˣ →* IdeleGroup K :=
  (equivAdeleRingUnits (K := K)).symm.toMonoidHom.comp
    (Units.map (algebraMap K (NumberField.AdeleRing (𝓞 K) K)))

/-- The subgroup of principal idèles. -/
def principalSubgroup : Subgroup (IdeleGroup K) :=
  (principalIdele K).range

end IdeleGroup

/-- The idèle class group `C_K = I_K / Kˣ`. -/
abbrev IdeleClassGroup :=
  IdeleGroup K ⧸ IdeleGroup.principalSubgroup K

universe u v

/-- The idèle-class norm `N_{L/K} : C_L → C_K`.

The Solution supplies its value: the determinant norm on relative idèles,
transported to ordinary idèles and descended through principal idèles. -/
noncomputable def ideleClassNorm
    (K : Type u) (L : Type v)
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L] :
    IdeleClassGroup L →* IdeleClassGroup K := by
  sorry

namespace ClassFieldTheory.GlobalClassFieldComparison

private instance ideleClassGroupIsMulCommutative
    (K : Type) [Field K] [NumberField K] :
    IsMulCommutative (IdeleClassGroup K) :=
  ⟨⟨fun a b => mul_comm a b⟩⟩

/-- Finite abelian global reciprocity in idèle-class norm-quotient form. -/
theorem finiteAbelianGlobalReciprocity
    (K L : Type)
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsAbelianGalois K L] :
    Nonempty
      ((IdeleClassGroup K ⧸ (_root_.ideleClassNorm K L).range) ≃ₜ*
        (L ≃ₐ[K] L)) := by
  sorry

end ClassFieldTheory.GlobalClassFieldComparison
