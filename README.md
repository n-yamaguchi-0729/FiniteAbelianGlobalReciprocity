# Global class field theory in Lean 4.34.0

This repository presents the finite norm-quotient form of global class field
theory proved in
[ClassFieldTheory](https://github.com/n-yamaguchi-0729/ClassFieldTheory/tree/01b4614ee76fa6f50e7f3ea3e1cff93b85693345).

The compared declaration is
`ClassFieldTheory.GlobalClassFieldComparison.finiteAbelianGlobalReciprocity_relativeNormQuotient`.
For a finite abelian extension `L / K` of number fields, it states

```text
C_K / N_{L/K}(C_L) ≃ₜ* Gal(L/K).
```

Here `≃ₜ*` is an isomorphism of topological multiplicative groups. The
Mathlib-only Challenge constructs the relative idèle-class norm as the
determinant norm on `𝔸_K ⊗[K] L`, descended through principal idèles. The
corresponding ordinary idèle-class norm is defined in
[`IdeleNorm.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/AlgebraicNumberTheory/Idele/Extension/IdeleNorm.lean),
and its range is identified with the relative determinant norm's range in
[`NormComparison.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/AlgebraicNumberTheory/Idele/ClassGroup/NormComparison.lean).
The Solution uses this comparison and the ordinary-norm theorem in
[`MathlibGlobalReciprocity.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/GlobalClassFieldTheory/GlobalClassFields/MathlibGlobalReciprocity.lean).

## Additional proved results

The same CFT development also proves:

- a surjective finite Artin map, an unramified modulus, and arithmetic
  Frobenius normalization in
  [`FiniteAbelianGlobalReciprocity.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/Theorems/GlobalClassFieldTheory/FiniteAbelianGlobalReciprocity.lean);
- the norm-kernel theorem in
  [`FinitePlaceRayArtinNormKernel.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/Theorems/GlobalClassFieldTheory/FinitePlaceRayArtinNormKernel.lean);
- local values and decomposition-group compatibility in
  [`FinitePlaceRayArtinLocalValue.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/Theorems/GlobalClassFieldTheory/FinitePlaceRayArtinLocalValue.lean)
  and
  [`FinitePlaceRayArtinDecomposition.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/Theorems/GlobalClassFieldTheory/FinitePlaceRayArtinDecomposition.lean).

The theorem placeholder in `Challenge.lean` is deliberate; `Solution.lean`
contains the completed proof, and the norm has no definition hole.

## Authorship

Astra GPT-6 Codex assisted with Lean development, statement review, and
preparation of this submission interface. Naganori Yamaguchi (山口永悟) is the
human author and responsible maintainer.

Licensed under Apache-2.0.
