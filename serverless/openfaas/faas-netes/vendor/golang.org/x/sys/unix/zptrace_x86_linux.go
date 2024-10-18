// Code generated by linux/mkall.go generatePtracePair("386", "amd64"). DO NOT EDIT.

//go:build linux && (386 || amd64)
// +build linux
// +build 386 amd64

package unix

import "unsafe"

// PtraceRegs386 is the registers used by 386 binaries.
type PtraceRegs386 struct {
	Ebx      int32
	Ecx      int32
	Edx      int32
	Esi      int32
	Edi      int32
	Ebp      int32
	Eax      int32
	Xds      int32
	Xes      int32
	Xfs      int32
	Xgs      int32
	Orig_eax int32
	Eip      int32
	Xcs      int32
	Eflags   int32
	Esp      int32
	Xss      int32
}

// PtraceGetRegs386 fetches the registers used by 386 binaries.
func PtraceGetRegs386(pid int, regsout *PtraceRegs386) error {
	return ptracePtr(PTRACE_GETREGS, pid, 0, unsafe.Pointer(regsout))
}

// PtraceSetRegs386 sets the registers used by 386 binaries.
func PtraceSetRegs386(pid int, regs *PtraceRegs386) error {
	return ptracePtr(PTRACE_SETREGS, pid, 0, unsafe.Pointer(regs))
}

// PtraceRegsAmd64 is the registers used by amd64 binaries.
type PtraceRegsAmd64 struct {
	R15      uint64
	R14      uint64
	R13      uint64
	R12      uint64
	Rbp      uint64
	Rbx      uint64
	R11      uint64
	R10      uint64
	R9       uint64
	R8       uint64
	Rax      uint64
	Rcx      uint64
	Rdx      uint64
	Rsi      uint64
	Rdi      uint64
	Orig_rax uint64
	Rip      uint64
	Cs       uint64
	Eflags   uint64
	Rsp      uint64
	Ss       uint64
	Fs_base  uint64
	Gs_base  uint64
	Ds       uint64
	Es       uint64
	Fs       uint64
	Gs       uint64
}

// PtraceGetRegsAmd64 fetches the registers used by amd64 binaries.
func PtraceGetRegsAmd64(pid int, regsout *PtraceRegsAmd64) error {
	return ptracePtr(PTRACE_GETREGS, pid, 0, unsafe.Pointer(regsout))
}

// PtraceSetRegsAmd64 sets the registers used by amd64 binaries.
func PtraceSetRegsAmd64(pid int, regs *PtraceRegsAmd64) error {
	return ptracePtr(PTRACE_SETREGS, pid, 0, unsafe.Pointer(regs))
}
