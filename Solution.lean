import ClassFieldTheory.AlgebraicNumberTheory.Idele.ClassGroup.NormComparison
import ClassFieldTheory.GlobalClassFieldTheory.GlobalClassFields.MathlibGlobalReciprocity

set_option autoImplicit false

/-!
The Challenge fixes the determinant norm itself. The proof below uses the
pinned CFT theorem for the ordinary idèle-class norm and the proved equality
between its range and the range of the relative determinant norm.
-/

noncomputable section

namespace ClassFieldTheory.GlobalClassFieldComparison

/-- The idèle class group is commutative.  Naming this witness stabilizes
the normal-subgroup argument in the theorem statement. -/
theorem ideleClassGroupIsMulCommutative
    (K : Type) [Field K] [NumberField K] :
    IsMulCommutative (IdeleClassGroup K) :=
  ⟨⟨fun a b => mul_comm a b⟩⟩

attribute [local instance 2000] ideleClassGroupIsMulCommutative

/-- Finite abelian global reciprocity in determinant norm-quotient form. -/
theorem finiteAbelianGlobalReciprocity_relativeNormQuotient
    (K L : Type)
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsAbelianGalois K L] :
    Nonempty
      ((IdeleClassGroup K ⧸ (RelativeIdeleGroup.classNorm K L).range) ≃ₜ*
        (L ≃ₐ[K] L)) := by
  rw [← ordinaryIdeleClassNorm_range_eq_relative (K := K) (L := L)]
  exact finiteAbelianGlobalReciprocity K L

end ClassFieldTheory.GlobalClassFieldComparison
