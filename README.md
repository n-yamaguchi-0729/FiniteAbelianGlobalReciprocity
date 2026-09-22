# Global class field theory in Lean 4.34.0

This repository is a thin submission interface for the topological form of
global class field theory proved in
[ClassFieldTheory](https://github.com/n-yamaguchi-0729/ClassFieldTheory/tree/01b4614ee76fa6f50e7f3ea3e1cff93b85693345).

The compared declaration is
`ClassFieldTheory.topologicalGlobalReciprocity`. For every number field `K`,
it states

```text
C_K / C_K⁰ ≃ₜ* G_Kᵃᵇ,
```

where `C_K` is Mathlib's idèle class group, `C_K⁰` is its identity component,
and `G_Kᵃᵇ` is Mathlib's topological abelianization of the absolute Galois
group. The Challenge uses only Mathlib imports and gives the quotient a
concrete definition. `Solution.lean` imports the proved declaration from the
pinned CFT commit.

## Scope and the rest of the CFT development

This entry records the standard compact maximal-abelian topological theorem.
The `Nonempty` equivalence asserts existence of a topological group
isomorphism, but does not itself select a globally normalized Artin map or
state its values on finite-prime Frobenius elements. It covers number fields,
not global function fields.

The substantive CFT library separately proves:

- existence of a continuous surjective maximal-abelian Artin map with kernel
  `C_K⁰` in
  [`MaximalAbelianGlobalArtin.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/Theorems/GlobalClassFieldTheory/MaximalAbelianGlobalArtin.lean);
- finite abelian global reciprocity through a ray class group, including
  surjectivity and arithmetic Frobenius normalization, in
  [`FiniteAbelianGlobalReciprocity.lean`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/blob/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/Theorems/GlobalClassFieldTheory/FiniteAbelianGlobalReciprocity.lean);
- finite-place comparison and norm-kernel results in the other public modules
  under
  [`Theorems/GlobalClassFieldTheory`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/tree/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/Theorems/GlobalClassFieldTheory);
- ray-class existence results under
  [`Theorems/ConductorsAndRayClassFields`](https://github.com/n-yamaguchi-0729/ClassFieldTheory/tree/01b4614ee76fa6f50e7f3ea3e1cff93b85693345/Lean4/ClassFieldTheory/Theorems/ConductorsAndRayClassFields).

Those results explain the scope of the underlying library; this Comparator
configuration selects only the displayed topological theorem.

## Files and verification

- `Challenge.lean`: the short Mathlib-only statement surface; its one `sorry`
  is the deliberate Comparator placeholder.
- `Solution.lean`: imports the proof from the exact pinned CFT commit.
- `comparator.json`: selects exactly one theorem.
- `formalization.yaml`: provenance, scope, source, and automation metadata.

The project uses Lean 4.34.0 and commits an exact dependency manifest. The CI
builds `Challenge` and `Solution` together with their transitive import
closures; it does not rerun the whole CFT library. Locally, run
`lake exe cache get`, `lake build Challenge`, and
`lake --no-ansi --wfail build Solution`. The Challenge build has one expected
warning for its deliberate statement placeholder. Palomar independently runs
Comparator, Lean kernel checking, and NanoDa replay for a submitted immutable
commit.

Licensed under Apache-2.0. The human author and responsible maintainer is
Naganori Yamaguchi (山口永悟).
