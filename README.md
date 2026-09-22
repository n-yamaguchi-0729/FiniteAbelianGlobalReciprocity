# Global class field theory in Lean 4.34.0

This repository is a thin submission interface for the finite norm-quotient
form of global class field theory proved in
[ClassFieldTheory](https://github.com/n-yamaguchi-0729/ClassFieldTheory/tree/01b4614ee76fa6f50e7f3ea3e1cff93b85693345).

The compared declaration is
`ClassFieldTheory.GlobalClassFieldComparison.finiteAbelianGlobalReciprocity_relativeNormQuotient`.
For a finite abelian extension `L / K` of number fields, it states

```text
C_K / N_{L/K}(C_L) ≃ₜ* Gal(L/K).
```

The equivalence is an isomorphism of topological multiplicative groups. The
Challenge uses only Mathlib imports and gives the idèle and idèle-class
definitions needed by the statement. It also defines the relative idèle
group from the relative adèle algebra, its determinant norm, and
`RelativeIdeleGroup.classNorm`, obtained by descending that norm through
principal idèles. Thus the norm in the theorem is an actual construction in
`Challenge.lean`, not a definition supplied later by `Solution.lean`.
The relative group is the canonical tensor-product presentation of `C_L`.

The substantive CFT library's ordinary idèle-class norm is defined in
[`IdeleNorm.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/AlgebraicNumberTheory/Idele/Extension/IdeleNorm.lean),
and its range is identified with the relative determinant norm's range in
[`NormComparison.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/AlgebraicNumberTheory/Idele/ClassGroup/NormComparison.lean).

## Scope and the rest of the CFT development

The substantive CFT library separately proves:

- a surjective finite Artin map, an unramified modulus, and arithmetic
  Frobenius normalization in
  [`FiniteAbelianGlobalReciprocity.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/Theorems/GlobalClassFieldTheory/FiniteAbelianGlobalReciprocity.lean);
- the norm-kernel theorem in
  [`FinitePlaceRayArtinNormKernel.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/Theorems/GlobalClassFieldTheory/FinitePlaceRayArtinNormKernel.lean);
- local values and decomposition-group compatibility in
  [`FinitePlaceRayArtinLocalValue.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/Theorems/GlobalClassFieldTheory/FinitePlaceRayArtinLocalValue.lean)
  and
  [`FinitePlaceRayArtinDecomposition.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/Theorems/GlobalClassFieldTheory/FinitePlaceRayArtinDecomposition.lean).

`Solution.lean` derives the compared relative-norm quotient theorem from the
ordinary-norm theorem in
[`MathlibGlobalReciprocity.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/GlobalClassFieldTheory/GlobalClassFields/MathlibGlobalReciprocity.lean)
and the range comparison above.

## Files and verification

- `Challenge.lean`: the Mathlib-only statement surface, including the actual
  determinant norm; its one theorem `sorry` is the deliberate Comparator
  placeholder.
- `Definitions.lean`: the identical definition block used by `Solution`; it is
  kept outside the Challenge import closure required by Palomar.
- `Solution.lean`: proves the selected theorem from the exact pinned CFT
  commit's global reciprocity and norm-comparison results.
- `comparator.json`: selects exactly one theorem and no definition holes.
- `formalization.yaml`: provenance, scope, source, and automation metadata.

The project uses Lean 4.34.0 and commits an exact dependency manifest. CI
builds all three Lean modules and runs the pinned full preflight: provenance,
Comparator, Lean-kernel replay, and NanoDa replay.

## Authorship and AI assistance

Astra GPT-6 Codex assisted with Lean development, statement review, and
preparation of this submission interface. Naganori Yamaguchi (山口永悟) is the
human author and responsible maintainer.

Licensed under Apache-2.0.
