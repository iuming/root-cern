//===- IntrinsicsAArch64.td - Defines AArch64 intrinsics -----------*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines all of the AArch64-specific intrinsics.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Advanced SIMD (NEON)

let TargetPrefix = "aarch64" in {  // All intrinsics start with "llvm.aarch64.".

// Vector Absolute Compare (Floating Point)
def int_aarch64_neon_vacgeq :
  Intrinsic<[llvm_v2i64_ty], [llvm_v2f64_ty, llvm_v2f64_ty], [IntrNoMem]>;
def int_aarch64_neon_vacgtq :
  Intrinsic<[llvm_v2i64_ty], [llvm_v2f64_ty, llvm_v2f64_ty], [IntrNoMem]>;

// Vector maxNum (Floating Point)
def int_aarch64_neon_vmaxnm : Neon_2Arg_Intrinsic;

// Vector minNum (Floating Point)
def int_aarch64_neon_vminnm : Neon_2Arg_Intrinsic;

// Vector Pairwise maxNum (Floating Point)
def int_aarch64_neon_vpmaxnm : Neon_2Arg_Intrinsic;

// Vector Pairwise minNum (Floating Point)
def int_aarch64_neon_vpminnm : Neon_2Arg_Intrinsic;

// Vector Multiply Extended (Floating Point)
def int_aarch64_neon_vmulx : Neon_2Arg_Intrinsic;

class Neon_N2V_Intrinsic
  : Intrinsic<[llvm_anyvector_ty], [LLVMMatchType<0>, llvm_i32_ty],
              [IntrNoMem]>;
class Neon_N3V_Intrinsic
  : Intrinsic<[llvm_anyvector_ty],
              [LLVMMatchType<0>, LLVMMatchType<0>, llvm_i32_ty],
              [IntrNoMem]>;
class Neon_N2V_Narrow_Intrinsic
  : Intrinsic<[llvm_anyvector_ty],
              [LLVMExtendedElementVectorType<0>, llvm_i32_ty],
              [IntrNoMem]>;

// Vector rounding shift right by immediate (Signed)
def int_aarch64_neon_vsrshr : Neon_N2V_Intrinsic;
def int_aarch64_neon_vurshr : Neon_N2V_Intrinsic;
def int_aarch64_neon_vsqshlu : Neon_N2V_Intrinsic;

def int_aarch64_neon_vsri : Neon_N3V_Intrinsic;
def int_aarch64_neon_vsli : Neon_N3V_Intrinsic;

def int_aarch64_neon_vsqshrun : Neon_N2V_Narrow_Intrinsic;
def int_aarch64_neon_vrshrn : Neon_N2V_Narrow_Intrinsic;
def int_aarch64_neon_vsqrshrun : Neon_N2V_Narrow_Intrinsic;
def int_aarch64_neon_vsqshrn : Neon_N2V_Narrow_Intrinsic;
def int_aarch64_neon_vuqshrn : Neon_N2V_Narrow_Intrinsic;
def int_aarch64_neon_vsqrshrn : Neon_N2V_Narrow_Intrinsic;
def int_aarch64_neon_vuqrshrn : Neon_N2V_Narrow_Intrinsic;

// Scalar Add
def int_aarch64_neon_vaddds :
  Intrinsic<[llvm_v1i64_ty], [llvm_v1i64_ty, llvm_v1i64_ty], [IntrNoMem]>;
def int_aarch64_neon_vadddu :
  Intrinsic<[llvm_v1i64_ty], [llvm_v1i64_ty, llvm_v1i64_ty], [IntrNoMem]>;

// Scalar Saturating Add (Signed, Unsigned)
def int_aarch64_neon_vqadds : Neon_2Arg_Intrinsic;
def int_aarch64_neon_vqaddu : Neon_2Arg_Intrinsic;

// Scalar Sub
def int_aarch64_neon_vsubds :
  Intrinsic<[llvm_v1i64_ty], [llvm_v1i64_ty, llvm_v1i64_ty], [IntrNoMem]>;
def int_aarch64_neon_vsubdu :
  Intrinsic<[llvm_v1i64_ty], [llvm_v1i64_ty, llvm_v1i64_ty], [IntrNoMem]>;

// Scalar Saturating Sub (Signed, Unsigned)
def int_aarch64_neon_vqsubs : Neon_2Arg_Intrinsic;
def int_aarch64_neon_vqsubu : Neon_2Arg_Intrinsic;

// Scalar Shift
// Scalar Shift Left
def int_aarch64_neon_vshlds :
  Intrinsic<[llvm_v1i64_ty], [llvm_v1i64_ty, llvm_v1i64_ty], [IntrNoMem]>;
def int_aarch64_neon_vshldu :
  Intrinsic<[llvm_v1i64_ty], [llvm_v1i64_ty, llvm_v1i64_ty], [IntrNoMem]>;

// Scalar Saturating Shift Left
def int_aarch64_neon_vqshls : Neon_2Arg_Intrinsic;
def int_aarch64_neon_vqshlu : Neon_2Arg_Intrinsic;

// Scalar Shift Rouding Left
def int_aarch64_neon_vrshlds :
  Intrinsic<[llvm_v1i64_ty], [llvm_v1i64_ty, llvm_v1i64_ty], [IntrNoMem]>;
def int_aarch64_neon_vrshldu :
  Intrinsic<[llvm_v1i64_ty], [llvm_v1i64_ty, llvm_v1i64_ty], [IntrNoMem]>;

// Scalar Saturating Rounding Shift Left
def int_aarch64_neon_vqrshls : Neon_2Arg_Intrinsic;
def int_aarch64_neon_vqrshlu : Neon_2Arg_Intrinsic;

// Scalar Reduce Pairwise Add.
def int_aarch64_neon_vpadd :
  Intrinsic<[llvm_v1i64_ty], [llvm_v2i64_ty],[IntrNoMem]>;
def int_aarch64_neon_vpfadd :
  Intrinsic<[llvm_v1f32_ty], [llvm_v2f32_ty], [IntrNoMem]>;
def int_aarch64_neon_vpfaddq :
  Intrinsic<[llvm_v1f64_ty], [llvm_v2f64_ty], [IntrNoMem]>;

// Scalar Reduce Pairwise Floating Point Max/Min.
def int_aarch64_neon_vpmax :
  Intrinsic<[llvm_v1f32_ty], [llvm_v2f32_ty], [IntrNoMem]>;
def int_aarch64_neon_vpmaxq :
  Intrinsic<[llvm_v1f64_ty], [llvm_v2f64_ty], [IntrNoMem]>;
def int_aarch64_neon_vpmin :
  Intrinsic<[llvm_v1f32_ty], [llvm_v2f32_ty], [IntrNoMem]>;
def int_aarch64_neon_vpminq :
  Intrinsic<[llvm_v1f64_ty], [llvm_v2f64_ty], [IntrNoMem]>;

// Scalar Reduce Pairwise Floating Point Maxnm/Minnm.
def int_aarch64_neon_vpfmaxnm :
  Intrinsic<[llvm_v1f32_ty], [llvm_v2f32_ty], [IntrNoMem]>;
def int_aarch64_neon_vpfmaxnmq :
  Intrinsic<[llvm_v1f64_ty], [llvm_v2f64_ty], [IntrNoMem]>;
def int_aarch64_neon_vpfminnm :
  Intrinsic<[llvm_v1f32_ty], [llvm_v2f32_ty], [IntrNoMem]>;
def int_aarch64_neon_vpfminnmq :
  Intrinsic<[llvm_v1f64_ty], [llvm_v2f64_ty], [IntrNoMem]>;
}
